"""VieNeu-TTS v3 Turbo (ONNX Runtime, CPU) for Science Kids Vietnamese audio.

SK-023 (listening test). Commands, run from this folder with `uv run`:

    uv run python vieneu_vi.py fetch                      # download pinned model files (only network use)
    uv run python vieneu_vi.py voices [--region Nam]      # list preset voices with region / gender
    uv run python vieneu_vi.py synth --voice Adam --text "..." --out clip.m4a
    uv run python vieneu_vi.py batch --jobs jobs.jsonl --results results.jsonl

Every command except `fetch` runs with HF_HUB_OFFLINE=1: model files must already be
in the local cache (`.models/hf`, gitignored), so synthesis never touches the network.

The module is also imported by `listening.py`.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import logging
import os
import resource
import subprocess
import sys
import time
from pathlib import Path

HERE = Path(__file__).resolve().parent
MODEL_CACHE = HERE.parent / ".models" / "vieneu" / "hf"  # tools/content-cli/.models/ (gitignored), next to Kokoro
MODEL_FILES = HERE / "model-files.json"

# Pinned Hugging Face revisions (checked 31/10/2026). Both repos: Apache-2.0.
PINS = {
    "pnnbao-ump/VieNeu-TTS-v3-Turbo": "61b85e3d937fbbacb387714180e8182823512523",  # 2026-09-23
    "OpenMOSS-Team/MOSS-Audio-Tokenizer-Nano-ONNX": "ceff0d0749bfb3fa2d61149794ec6feef0d1e1ae",  # 2026-04-17
}
VIENEU_VERSION = "3.8.3"
PRECISION = "fp32"  # SDK default on CPU (onnx_update/); int8 needs VNNI, not available on Apple Silicon
SAMPLE_RATE = 48_000

# Same AAC settings as the EN pipeline (SK-014 decision 10), sample rate kept at the model's 48 kHz.
AFCONVERT_ARGS = ["-f", "m4af", "-d", "aac", "-c", "1", "-b", "64000", "-s", "0", "-q", "127"]


def _setup_env(offline: bool) -> None:
    """Must run before huggingface_hub is imported (it reads env at import time)."""
    os.environ["HF_HUB_CACHE"] = str(MODEL_CACHE)
    os.environ["HF_HUB_DISABLE_TELEMETRY"] = "1"
    os.environ["HF_HUB_DISABLE_PROGRESS_BARS"] = "1"
    os.environ["GRADIO_ANALYTICS_ENABLED"] = "False"
    if offline:
        os.environ["HF_HUB_OFFLINE"] = "1"


def _install_pins() -> None:
    """Route every hf_hub_download call of the SDK to the pinned revision.

    The SDK calls hf_hub_download(repo, file) without a revision (= latest `main`).
    Unknown repos are refused so nothing unpinned is ever fetched or loaded.
    """
    import huggingface_hub

    original = huggingface_hub.hf_hub_download
    if getattr(original, "_sk_pinned", False):
        return

    def pinned(*args, **kwargs):
        repo_id = kwargs.get("repo_id") or (args[0] if args else None)
        if repo_id not in PINS:
            raise RuntimeError(f"Refusing unpinned Hugging Face repo: {repo_id!r}")
        kwargs["revision"] = PINS[repo_id]
        return original(*args, **kwargs)

    pinned._sk_pinned = True  # type: ignore[attr-defined]
    huggingface_hub.hf_hub_download = pinned
    import vieneu.base  # module-level `from huggingface_hub import hf_hub_download`

    vieneu.base.hf_hub_download = pinned


class _RetryCounter(logging.Handler):
    """Counts the SDK's babble-guard retries (log lines starting with the 🔁 marker)."""

    def __init__(self) -> None:
        super().__init__(level=logging.INFO)
        self.lines: list[str] = []

    def emit(self, record: logging.LogRecord) -> None:
        msg = record.getMessage()
        if "🔁" in msg:
            self.lines.append(msg)


_retry_counter = _RetryCounter()


def load_tts(threads: int = 0):
    """Load VieNeu v3 Turbo on the ONNX/CPU backend. Returns (tts, load_seconds)."""
    _install_pins()
    logging.getLogger("Vieneu.V3Turbo.ONNX").addHandler(_retry_counter)
    logging.getLogger("Vieneu.V3Turbo.ONNX").setLevel(logging.INFO)
    from vieneu import Vieneu

    t0 = time.perf_counter()
    tts = Vieneu(mode="v3turbo", backend="onnx", precision=PRECISION, threads=threads)
    return tts, time.perf_counter() - t0


def voice_table() -> list[dict]:
    """Preset voices of the installed SDK, with region and gender from its voices file."""
    import vieneu

    path = Path(vieneu.__file__).parent / "assets" / "voices_v3_turbo.json"
    data = json.loads(path.read_text(encoding="utf-8"))
    rows = []
    for name, v in data.get("presets", {}).items():
        rows.append({
            "name": name,
            "region": v.get("region", ""),
            "gender": v.get("gender", ""),
            "style": v.get("style", ""),
            "description": v.get("description", ""),
            "aliases": v.get("aliases") or [],
            "default": name == data.get("default_voice"),
        })
    return rows


SEED_SCHEME = "sha256(voice + LF + text [+ LF + '#' + variant if variant > 0])[:4] big-endian -> numpy.random.seed"


def seed_for(text: str, voice: str, variant: int = 0) -> int:
    """Deterministic sampling seed per (voice, text, variant): same machine re-runs give the same clip.
    Variant 0 is the SK-023 listening-test seed; a self-check retry moves to variant 1, 2, ..."""
    material = f"{voice}\n{text}" + (f"\n#{variant}" if variant else "")
    return int.from_bytes(hashlib.sha256(material.encode()).digest()[:4], "big")


def _edge_silence(wav, threshold: float = 0.01) -> tuple[float, float]:
    import numpy as np

    loud = np.flatnonzero(np.abs(wav) > threshold)
    if loud.size == 0:
        return len(wav) / SAMPLE_RATE, 0.0
    return loud[0] / SAMPLE_RATE, (len(wav) - 1 - loud[-1]) / SAMPLE_RATE


def generate(tts, text: str, voice: str, seed: int | None = None):
    """Run the model once. Returns (float32 wav at 48 kHz, metrics)."""
    import numpy as np

    if seed is None:
        seed = seed_for(text, voice)
    np.random.seed(seed)
    before = len(_retry_counter.lines)
    t0 = time.perf_counter()
    wav = tts.infer(text, voice=voice, apply_watermark=False)
    gen_s = time.perf_counter() - t0
    wav = np.asarray(wav, dtype=np.float32).reshape(-1)
    return wav, {"seed": seed, "gen_s": round(gen_s, 3), "babble_retry_log": _retry_counter.lines[before:]}


def wav_metrics(wav) -> dict:
    import numpy as np

    duration_s = len(wav) / SAMPLE_RATE
    lead, trail = _edge_silence(wav)
    return {
        "samples": int(len(wav)),
        "duration_s": round(duration_s, 3),
        "peak": round(float(np.max(np.abs(wav))) if len(wav) else 0.0, 4),
        "lead_silence_s": round(lead, 3),
        "trail_silence_s": round(trail, 3),
    }


def strip_m4a_times(path: Path) -> None:
    """Zero the creation/modification times afconvert writes into mvhd/tkhd/mdhd.

    They are the only non-audio metadata besides the iTunSMPB gapless info (kept: players need it).
    Without them the same PCM always encodes to the same bytes, and nothing reveals when a clip was made.
    """
    import struct

    data = bytearray(path.read_bytes())

    def walk(off: int, end: int) -> None:
        while off + 8 <= end:
            size, typ = struct.unpack(">I4s", data[off:off + 8])
            hdr = 8
            if size == 1:
                size, hdr = struct.unpack(">Q", data[off + 8:off + 16])[0], 16
            elif size == 0:
                size = end - off
            if typ in (b"mvhd", b"tkhd", b"mdhd"):
                body = off + hdr
                n = 8 if data[body] == 1 else 4  # version 1 uses 64-bit times
                data[body + 4:body + 4 + 2 * n] = bytes(2 * n)
            elif typ in (b"moov", b"trak", b"mdia"):
                walk(off + hdr, off + size)
            off += size

    walk(0, len(data))
    path.write_bytes(bytes(data))


def encode_m4a(wav, out_m4a: Path, keep_wav: bool = False) -> None:
    """float wav → 16-bit WAV → AAC m4a with the EN settings (afconvert), times stripped."""
    import soundfile as sf

    out_m4a.parent.mkdir(parents=True, exist_ok=True)
    wav_path = out_m4a.with_name(f".{out_m4a.stem}.wav")
    sf.write(str(wav_path), wav, SAMPLE_RATE, subtype="PCM_16")
    subprocess.run(["afconvert", *AFCONVERT_ARGS, str(wav_path), str(out_m4a)], check=True)
    strip_m4a_times(out_m4a)
    if keep_wav:
        wav_path.rename(out_m4a.with_suffix(".wav"))
    else:
        wav_path.unlink()


def synthesize(tts, text: str, voice: str, out_m4a: Path, keep_wav: bool = False, seed: int | None = None) -> dict:
    """Synthesize one clip → 16-bit WAV → AAC m4a (afconvert). Returns timing and sanity metrics."""
    wav, gen = generate(tts, text, voice, seed)
    encode_m4a(wav, out_m4a, keep_wav)
    m = wav_metrics(wav)
    return {"voice": voice, "text": text, "out": str(out_m4a), "seed": gen["seed"], **m,
            "gen_s": gen["gen_s"], "rtf": round(gen["gen_s"] / m["duration_s"], 3) if m["duration_s"] else None,
            "babble_retry_log": gen["babble_retry_log"]}


def peak_rss_mb() -> float:
    rss = resource.getrusage(resource.RUSAGE_SELF).ru_maxrss
    return rss / (1024 * 1024) if sys.platform == "darwin" else rss / 1024  # macOS: bytes, Linux: KiB


def _sha256(path: Path) -> str:
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for block in iter(lambda: f.read(1 << 20), b""):
            h.update(block)
    return h.hexdigest()


def _cached_files() -> list[dict]:
    """Files of the pinned revisions present in the local cache."""
    rows = []
    for repo, rev in PINS.items():
        snap = MODEL_CACHE / f"models--{repo.replace('/', '--')}" / "snapshots" / rev
        if not snap.is_dir():
            continue
        for p in sorted(snap.rglob("*")):
            if p.is_file():
                rows.append({"repo": repo, "revision": rev, "file": str(p.relative_to(snap)), "path": p})
    return rows


def cmd_fetch(args) -> int:
    """Download what the ONNX/CPU engine needs, at the pinned revisions, then verify sha256."""
    t0 = time.perf_counter()
    tts, _ = load_tts()  # loading = downloading every file the engine opens
    del tts
    files = _cached_files()
    manifest = [{"repo": r["repo"], "revision": r["revision"], "file": r["file"],
                 "size": r["path"].stat().st_size, "sha256": _sha256(r["path"])} for r in files]
    total = sum(m["size"] for m in manifest)
    if MODEL_FILES.exists() and not args.write_manifest:
        expected = {(m["repo"], m["file"]): m for m in json.loads(MODEL_FILES.read_text())["files"]}
        bad = [m for m in manifest if (m["repo"], m["file"]) in expected
               and expected[(m["repo"], m["file"])]["sha256"] != m["sha256"]]
        missing = [k for k in expected if k not in {(m["repo"], m["file"]) for m in manifest}]
        if bad or missing:
            print(f"sha256 mismatch: {[m['file'] for m in bad]} · missing: {missing}", file=sys.stderr)
            return 1
        print(f"OK: {len(manifest)} files match {MODEL_FILES.name}")
    else:
        MODEL_FILES.write_text(json.dumps({"vieneu": VIENEU_VERSION, "precision": PRECISION,
                                           "pins": PINS, "files": manifest}, indent=2) + "\n")
        print(f"Wrote {MODEL_FILES.name}")
    for m in manifest:
        print(f"  {m['size'] / 1e6:9.1f} MB  {m['repo']}/{m['file']}")
    print(f"Total {total / 1e6:.1f} MB in {MODEL_CACHE} · {time.perf_counter() - t0:.1f} s")
    return 0


def cmd_voices(args) -> int:
    rows = voice_table()
    if args.region:
        rows = [r for r in rows if r["region"] == args.region]
    if args.gender:
        rows = [r for r in rows if r["gender"] == args.gender]
    print(json.dumps(rows, ensure_ascii=False, indent=2))
    return 0


def cmd_synth(args) -> int:
    tts, load_s = load_tts(args.threads)
    r = synthesize(tts, args.text, args.voice, Path(args.out), keep_wav=args.keep_wav)
    r["load_s"] = round(load_s, 2)
    r["peak_rss_mb"] = round(peak_rss_mb(), 1)
    r["ort_threads"] = tts.engine.ort_intra_op_threads
    print(json.dumps(r, ensure_ascii=False, indent=2))
    return 0


def cmd_batch(args) -> int:
    """jobs.jsonl: one {"text", "voice", "out"} per line → results.jsonl, one result per line."""
    jobs = [json.loads(l) for l in Path(args.jobs).read_text(encoding="utf-8").splitlines() if l.strip()]
    tts, load_s = load_tts(args.threads)
    print(f"model loaded in {load_s:.1f} s · {len(jobs)} jobs", file=sys.stderr)
    with open(args.results, "w", encoding="utf-8") as f:
        for i, job in enumerate(jobs, 1):
            r = synthesize(tts, job["text"], job["voice"], Path(job["out"]))
            f.write(json.dumps({**job, **r}, ensure_ascii=False) + "\n")
            f.flush()
            print(f"[{i}/{len(jobs)}] {r['duration_s']:.2f}s audio in {r['gen_s']:.2f}s  {job['out']}", file=sys.stderr)
    return 0


def cmd_serve(args) -> int:
    """Line protocol for content-cli (Node): one JSON request per stdin line,
    {"text", "voice", "variant", "out"}; the reply on stdout is one JSON line and the float32
    little-endian PCM (48 kHz mono) is written to `out`. Everything else goes to stderr."""
    import numpy as np

    proto = os.fdopen(os.dup(1), "w", buffering=1, encoding="utf-8")
    os.dup2(2, 1)  # library prints (C or Python) must not reach the protocol stream
    sys.stdout = sys.stderr
    tts, load_s = load_tts(args.threads)
    import onnxruntime
    import sea_g2p  # noqa: F401
    from importlib.metadata import version

    proto.write(json.dumps({"ready": True, "load_s": round(load_s, 2), "sample_rate": SAMPLE_RATE,
                            "versions": {"vieneu": version("vieneu"), "onnxruntime": onnxruntime.__version__,
                                         "sea_g2p": version("sea-g2p"), "numpy": np.__version__},
                            "ort_threads": tts.engine.ort_intra_op_threads}) + "\n")
    for line in sys.stdin:
        if not line.strip():
            continue
        try:
            req = json.loads(line)
            seed = seed_for(req["text"], req["voice"], int(req.get("variant", 0)))
            wav, gen = generate(tts, req["text"], req["voice"], seed)
            Path(req["out"]).write_bytes(np.asarray(wav, dtype="<f4").tobytes())
            proto.write(json.dumps({"ok": True, "samples": int(len(wav)), "sample_rate": SAMPLE_RATE, **gen},
                                   ensure_ascii=False) + "\n")
        except Exception as error:  # report and keep serving
            proto.write(json.dumps({"ok": False, "error": f"{type(error).__name__}: {error}"}, ensure_ascii=False) + "\n")
    return 0


def main(argv: list[str] | None = None) -> int:
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = p.add_subparsers(dest="cmd", required=True)
    f = sub.add_parser("fetch", help="download pinned model files and verify sha256")
    f.add_argument("--write-manifest", action="store_true", help="rewrite model-files.json from the cache")
    v = sub.add_parser("voices", help="list preset voices")
    v.add_argument("--region", choices=["Bắc", "Trung", "Nam"])
    v.add_argument("--gender", choices=["male", "female"])
    s = sub.add_parser("synth", help="synthesize one sentence")
    s.add_argument("--voice", required=True)
    s.add_argument("--text", required=True)
    s.add_argument("--out", required=True, help="output .m4a")
    s.add_argument("--keep-wav", action="store_true")
    s.add_argument("--threads", type=int, default=0)
    b = sub.add_parser("batch", help="synthesize a JSONL list of jobs with one model load")
    b.add_argument("--jobs", required=True)
    b.add_argument("--results", required=True)
    b.add_argument("--threads", type=int, default=0)
    sv = sub.add_parser("serve", help="JSON-lines synthesis server for content-cli (stdin -> stdout)")
    sv.add_argument("--threads", type=int, default=0)
    args = p.parse_args(argv)

    _setup_env(offline=args.cmd != "fetch")
    commands = {"fetch": cmd_fetch, "voices": cmd_voices, "synth": cmd_synth, "batch": cmd_batch, "serve": cmd_serve}
    return commands[args.cmd](args)


if __name__ == "__main__":
    sys.exit(main())
