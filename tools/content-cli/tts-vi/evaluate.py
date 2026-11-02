"""Machine scoring of Vietnamese TTS clips (SK-023; reusable as SK-024's self-check).

Nobody on the agent team can listen, so this measures what can be measured:
  1. intelligibility: Whisper large-v3-turbo transcript vs the expected reading
     (syllable error rate, tone errors, CER with and without diacritics);
  2. technical defects: cut endings, missing lead silence, long pauses, engine retries,
     noise floor, level and rate stability;
  3. speaking rate (syllables per second);
  4. intonation: F0 spread in semitones per sentence, rise at the end of questions.

    UV_PROJECT_ENVIRONMENT=.venv-eval uv sync --only-group eval
    HF_HUB_OFFLINE=1 UV_PROJECT_ENVIRONMENT=.venv-eval uv run --only-group eval python evaluate.py \
        --set ../../../content/tts-vi/listening-set.md --clips <listening dir> \
        --metrics <key dir>/metrics.jsonl --out <eval dir>

The ASR model is read from the local Hugging Face cache (no download, no initial_prompt).
Clips of one configuration are packed into ~26 s windows (same items in every window for
every configuration, 1 s of silence between clips) because Whisper hallucinates on isolated
one-word clips; words are mapped back to clips by their timestamps.
This script never reads voice names: it works on configuration letters only.
"""
from __future__ import annotations

import argparse
import csv
import json
import math
import os
import re
import subprocess
import sys
import time
import unicodedata
from pathlib import Path

import numpy as np
import soundfile as sf

from listening import parse_set

ASR_SNAPSHOT = Path.home() / ".cache/huggingface/hub/models--mobiuslabsgmbh--faster-whisper-large-v3-turbo" \
    / "snapshots/0a363e9161cbc7ed1431c9597a8ceaf0c4f78fcf"
SR = 16_000
WINDOW_S = 26.0
GAP_S = 1.0

# ── item groups (by code, following the "Nguồn" column of listening-set.md) ──
GROUP_A = [f"A{i:02d}" for i in range(1, 18)]                              # lesson 1 sentences: what ships
GROUP_B = [f"B{i:02d}" for i in range(1, 23) if i != 5] + ["B09c", "B21c", "B22c"]   # Vietnamese words, short phrases
GROUP_D = ["A29", "A30"]                                                   # other plain Vietnamese sentences
# everything else (A18-A28, B05, B23-B30, every "n" clip) is group C: numbers, units, loanwords,
# names, formulas. Several readings are acceptable there, so it is reported but not weighted.
QUESTIONS = ["A01", "A04", "A09", "A10", "A11", "A13", "A29"]

WEIGHTS = {"accuracy": 0.50, "technical": 0.20, "speed": 0.15, "prosody": 0.15}
ACC_WEIGHTS = {"a": 0.60, "b": 0.30, "d": 0.10}

# Elimination rules: machine stand-ins for listening-set C6 (human scores), set before looking at results.
ELIM = {
    "E1_tone_ab": 0.08,      # C6 criterion 1: tone errors (hỏi = ngã) on groups a+b above 8 % of syllables
    "E2_ser_b": 0.25,        # C6 criterion 3: syllable error rate on words (group b) above 25 %
    "E3_ser_numbers_n": 0.20,  # C6 criterion 2b: error rate on normalized number/unit clips above 20 %
    "E4_r_items": 3,         # C6 "lỗi R ở hơn ba mục": more than 3 clips that end mid-sound
}
NUMBER_N = ["A18n", "A19n", "A20n", "A21n", "A22n", "A23n", "B29n", "B30n"]


def group_of(cid: str) -> str:
    if cid in GROUP_A:
        return "a"
    if cid in GROUP_B:
        return "b"
    if cid in GROUP_D:
        return "d"
    return "c"


# ── text normalization ───────────────────────────────────────────────────────
DIG = ["không", "một", "hai", "ba", "bốn", "năm", "sáu", "bảy", "tám", "chín"]


def _two(n: int, inner: bool) -> list[str]:
    t, u = divmod(n, 10)
    if t == 0:
        return (["linh", DIG[u]] if u else []) if inner else [DIG[u]]
    w = ["mười"] if t == 1 else [DIG[t], "mươi"]
    if u == 0:
        return w
    if u == 1 and t > 1:
        return w + ["mốt"]
    if u == 5:
        return w + ["lăm"]
    return w + [DIG[u]]


def _three(n: int, inner: bool) -> list[str]:
    h, r = divmod(n, 100)
    if h == 0 and not inner:
        return _two(r, False)
    return [DIG[h], "trăm"] + (_two(r, True) if r else [])


def vi_number(n: int) -> str:
    if n < 1000:
        return " ".join(_three(n, False))
    th, r = divmod(n, 1000)
    w = _three(th, False) + ["nghìn"]
    if r:
        w += _three(r, True) if r >= 100 else ["không", "trăm"] + _two(r, True)
    return " ".join(w)


# Loanwords and names: the expected reading spells them syllable by syllable, the ASR usually writes
# the foreign spelling. Both sides collapse to one token so either spelling counts as the same word.
ALIASES = [
    (r"\bvi ta min\b", "vitamin"), (r"\bô xi\b|\bôxi\b|\boxi\b|\bô xy\b", "oxy"), (r"\bprô tê in\b", "protein"),
    (r"\bcác bô hi đrát\b|\bcacbohydrat\b|\bcarbohydrat\b", "carbohydrate"), (r"\bsác lơ\b", "charles"),
    (r"\bđác uyn\b|\bđác-uyn\b", "darwin"), (r"\bga la pa gốt\b|\bgalápagos\b|\bga la pa gos\b", "galapagos"),
    (r"\bai dắc\b", "isaac"), (r"\bniu tơn\b", "newton"), (r"\bxê ô hai\b|\bco 2\b", "co2"),
    (r"\bhát hai ô\b|\bh 2 o\b", "h2o"),
]


def prenormalize(text: str) -> str:
    """Lowercase NFC text with numbers, units and symbols written out as Vietnamese words."""
    s = unicodedata.normalize("NFC", text).lower()
    s = re.sub(r"\[[^\]]*\]", " ", s)                     # "[ngừng gần một giây]" in A03's expected reading
    s = s.translate(str.maketrans("₀₁₂₃₄₅₆₇₈₉", "0123456789"))
    s = re.sub(r"\bh\s*2\s*o\b", " hát hai ô ", s)       # formulas before numbers, so "2" is not a number
    s = re.sub(r"\bco\s*2\b", " xê ô hai ", s)
    s = re.sub(r"\btp\.?\s*hcm\b|\btphcm\b", "thành phố hồ chí minh", s)
    s = re.sub(r"(\d)\s*°\s*c\b", r"\1 độ xê", s)
    s = re.sub(r"°\s*c\b", " độ xê", s)
    s = re.sub(r"\bđộ c\b", "độ xê", s)
    s = re.sub(r"(\d)\s*%", r"\1 phần trăm", s)
    s = re.sub(r"(\d)\s*cm\b", r"\1 xăng ti mét", s)
    s = re.sub(r"(\d)\s*ml\b", r"\1 mi li lít", s)
    s = re.sub(r"(\d)\s*kg\b", r"\1 ki lô gam", s)
    s = re.sub(r"(\d)\s*[–—-]\s*(\d)", r"\1 đến \2", s)
    s = re.sub(r"\bthứ 1\b", "thứ nhất", s)
    s = re.sub(r"\bthứ 4\b", "thứ tư", s)
    s = re.sub(r"(\d)\s*/\s*4\b", r"\1 phần tư", s)
    s = re.sub(r"(\d)\s*/\s*(\d)", r"\1 phần \2", s)
    s = re.sub(r"\b(\d{1,3})\.(\d{3})\b", r"\1\2", s)    # 1.000 -> 1000
    s = re.sub(r"\b(\d+)[,.](\d+)\b", r"\1 phẩy \2", s)   # 2,5 -> 2 phẩy 5
    s = re.sub(r"\d+", lambda m: f" {vi_number(int(m.group()))} ", s)
    s = re.sub(r"(?<=\w)-(?=\w)", " ", s)
    s = re.sub(r"[^\w\s]", " ", s)
    s = re.sub(r"\s+", " ", s).strip()
    for pat, rep in ALIASES:
        s = re.sub(pat, rep, s)
    return s


TONE_MARKS = {"́": 1, "̀": 2, "̉": 3, "̃": 4, "̣": 5}  # sắc huyền hỏi ngã nặng
VOWELS = "aăâeêioôơuưy"


def syllable(tok: str) -> tuple[str, int]:
    tone, base = 0, []
    for ch in unicodedata.normalize("NFD", tok):
        if ch in TONE_MARKS:
            tone = TONE_MARKS[ch]
        else:
            base.append(ch)
    return unicodedata.normalize("NFC", "".join(base)), tone


def southern(syl: tuple[str, int]) -> tuple[str, int]:
    """Collapse contrasts a Southern reading is allowed to merge (listening-set C2, SK-023 decision 6):
    hỏi = ngã, tr = ch, s = x, d = gi = v, final n = ng = nh, final t = c = ch; plus "tư" = "bốn",
    "lẻ" = "linh", "ngàn" = "nghìn" in numbers."""
    base, tone = {("tư", 0): ("bôn", 1), ("le", 3): ("linh", 0), ("ngan", 2): ("nghin", 2)}.get(syl, syl)
    tone = 3 if tone == 4 else tone
    if base == "gi":
        base = "di"
    base = re.sub(r"^tr", "ch", base)
    base = re.sub(r"^s", "x", base)
    base = re.sub(r"^gi(?=[" + VOWELS + "])", "d", base)
    base = re.sub(r"^v", "d", base)
    base = re.sub(r"(?<=[" + VOWELS + r"])(ng|nh)$", "n", base)
    base = re.sub(r"(?<=[" + VOWELS + r"])(ch|c)$", "t", base)
    return base, tone


def tokens(text: str) -> list[str]:
    return prenormalize(text).split()


# ── alignment ────────────────────────────────────────────────────────────────
def align(ref: list, hyp: list, tone_half: bool = False):
    """Levenshtein over syllables. Returns (edits, tone_only_substitutions, ops).
    With tone_half, a substitution with the same base but another tone costs 0.5 (so alignment
    prefers it) and is counted as a tone error."""
    n, m = len(ref), len(hyp)
    d = [[0.0] * (m + 1) for _ in range(n + 1)]
    for i in range(1, n + 1):
        d[i][0] = i
    for j in range(1, m + 1):
        d[0][j] = j

    def sub(a, b):
        if a == b:
            return 0.0
        if tone_half and a[0] == b[0]:
            return 0.5
        return 1.0

    for i in range(1, n + 1):
        for j in range(1, m + 1):
            d[i][j] = min(d[i - 1][j] + 1, d[i][j - 1] + 1, d[i - 1][j - 1] + sub(ref[i - 1], hyp[j - 1]))
    i, j, ops, edits, tone = n, m, [], 0, 0
    while i > 0 or j > 0:
        if i > 0 and j > 0 and math.isclose(d[i][j], d[i - 1][j - 1] + sub(ref[i - 1], hyp[j - 1])):
            c = sub(ref[i - 1], hyp[j - 1])
            if c:
                edits += 1
                tone += c == 0.5
            ops.append(("tone" if c == 0.5 else "sub" if c else "ok", ref[i - 1], hyp[j - 1]))
            i, j = i - 1, j - 1
        elif i > 0 and math.isclose(d[i][j], d[i - 1][j] + 1):
            edits += 1
            ops.append(("del", ref[i - 1], None))
            i -= 1
        else:
            edits += 1
            ops.append(("ins", None, hyp[j - 1]))
            j -= 1
    return edits, tone, ops[::-1]


def _lev(a: str, b: str) -> int:
    prev = list(range(len(b) + 1))
    for i, ca in enumerate(a, 1):
        cur = [i]
        for j, cb in enumerate(b, 1):
            cur.append(min(prev[j] + 1, cur[j - 1] + 1, prev[j - 1] + (ca != cb)))
        prev = cur
    return prev[-1]


def _strip_marks(s: str) -> str:
    s = unicodedata.normalize("NFD", s.replace("đ", "d"))
    return "".join(c for c in s if unicodedata.category(c) != "Mn")


def score_text(ref: str, hyp: str) -> dict:
    rt, ht = tokens(ref), tokens(hyp)
    rs, hs = [syllable(t) for t in rt], [syllable(t) for t in ht]
    strict_edits, _, _ = align(rs, hs)
    rss, hss = [southern(x) for x in rs], [southern(x) for x in hs]
    tol_edits, tone_err, ops = align(rss, hss, tone_half=True)
    # CER on canonical strings (tone moved to the end of each syllable, so "khoẻ" = "khỏe"), spaces removed
    canon = lambda syls: "".join(f"{b}{t}" for b, t in syls)
    rc, hc = canon(rs), canon(hs)
    rplain, hplain = _strip_marks("".join(b for b, _ in rs)), _strip_marks("".join(b for b, _ in hs))
    first = next((o for o, a, _ in ops if a is not None), "ok")   # first op that consumes a reference syllable
    return {
        "ref_norm": " ".join(rt), "hyp_norm": " ".join(ht), "ref_syllables": len(rs), "hyp_syllables": len(hs),
        "first_syllable_wrong": first != "ok",
        "strict_errors": strict_edits, "tolerant_errors": tol_edits, "tone_errors": tone_err,
        "cer": _lev(rc, hc) / max(1, len(rc)), "cer_plain": _lev(rplain, hplain) / max(1, len(rplain)),
        "ops": [[o, "".join(map(str, a)) if a else None, "".join(map(str, b)) if b else None]
                for o, a, b in ops if o != "ok"],
    }


# ── audio ────────────────────────────────────────────────────────────────────
def load16(m4a: Path, tmpdir: Path) -> np.ndarray:
    tmp = tmpdir / f".{m4a.stem}.16k.wav"
    subprocess.run(["afconvert", "-f", "WAVE", "-d", "LEI16@16000", "-c", "1", str(m4a), str(tmp)], check=True)
    x, sr = sf.read(str(tmp), dtype="float32")
    tmp.unlink()
    assert sr == SR
    return x


def f0_stats(x: np.ndarray) -> dict | None:
    import librosa

    f0, voiced, _ = librosa.pyin(x, fmin=65, fmax=450, sr=SR, frame_length=1024, hop_length=160)
    f0 = f0[voiced & np.isfinite(f0)]
    if f0.size < 20:
        return None
    st = 12 * np.log2(f0 / np.median(f0))
    st = st[np.abs(st) < 12]                           # drop octave jumps
    tail = st[int(len(st) * 0.8):]
    return {"f0_median_hz": float(np.median(f0)), "f0_sd_st": float(np.std(st)),
            "f0_range_st": float(np.percentile(st, 95) - np.percentile(st, 5)),
            "end_rise_st": float(np.mean(tail) - np.mean(st))}


# ── ASR ──────────────────────────────────────────────────────────────────────
def windows_for(items: list[dict], max_dur: dict) -> list[list[str]]:
    """Fixed groups of clip ids (same for every configuration): raw items, then n, then c."""
    order = [it["id"] for it in items if it["variant"] == "thô"] + \
            [it["id"] for it in items if it["variant"] != "thô"]
    groups, cur, t = [], [], 0.0
    for cid in order:
        need = max_dur[cid] + (GAP_S if cur else 0)
        if cur and t + need > WINDOW_S:
            groups.append(cur)
            cur, t = [], 0.0
            need = max_dur[cid]
        cur.append(cid)
        t += need
    if cur:
        groups.append(cur)
    return groups


# Whisper's stock hallucinations (YouTube outros). None of these words occur in the listening set.
HALLUCINATION = re.compile(r"subscribe|đăng ký|ủng hộ kênh|video|theo dõi|hẹn gặp lại|ghiền mì gõ|la la school|"
                           r"cảm ơn các bạn", re.I)
LEAD_PAD_S = 0.5


def _transcribe_once(model, audio: dict, group: list[str]):
    gap = np.zeros(int(GAP_S * SR), dtype=np.float32)
    pieces, spans, t = [np.zeros(int(LEAD_PAD_S * SR), dtype=np.float32)], [], LEAD_PAD_S
    for n, cid in enumerate(group):
        if n:
            pieces.append(gap)
            t += GAP_S
        spans.append((cid, t, t + len(audio[cid]) / SR))
        pieces.append(audio[cid])
        t += len(audio[cid]) / SR
    if len(group) == 1:
        pieces.append(np.zeros(int(LEAD_PAD_S * SR), dtype=np.float32))
    segs, _ = model.transcribe(np.concatenate(pieces), language="vi", beam_size=5, word_timestamps=True,
                               condition_on_previous_text=False, vad_filter=False)
    segs = list(segs)
    if any(HALLUCINATION.search(s.text) for s in segs):
        return None
    out = {cid: {"words": [], "probs": []} for cid in group}
    bounds = [(spans[k][1] + spans[k - 1][2]) / 2 if k else -1e9 for k in range(len(spans))]
    for seg in segs:
        for w in seg.words or []:
            mid = (w.start + w.end) / 2
            k = max(i for i, b in enumerate(bounds) if mid >= b)
            out[spans[k][0]]["words"].append(w.word)
            out[spans[k][0]]["probs"].append(w.probability)
    return {cid: {"hyp": "".join(v["words"]).strip(), "word_prob": float(np.mean(v["probs"])) if v["probs"] else 0.0}
            for cid, v in out.items()}


def transcribe(model, audio: dict, group: list[str], depth: int = 0) -> dict:
    """One window: 0.5 s lead silence, clips joined with GAP_S of silence, words mapped back to clips
    by timestamp. A window that comes back as a stock hallucination is split in two and retried,
    down to single clips; a single clip that still hallucinates is recorded as an ASR failure."""
    res = _transcribe_once(model, audio, group)
    if res is not None:
        for v in res.values():
            v["asr_retries"] = depth
            v["asr_failed"] = False
        return res
    if len(group) == 1:
        return {group[0]: {"hyp": "", "word_prob": 0.0, "asr_retries": depth, "asr_failed": True}}
    half = len(group) // 2
    return {**transcribe(model, audio, group[:half], depth + 1), **transcribe(model, audio, group[half:], depth + 1)}


def realign(groups: list[list[str]], ref: dict, asr_c: dict) -> dict:
    """Whisper word timestamps can be off by half a second, so a word near a gap may land in the
    neighbouring clip ("hóa học thủy | tinh"). Align the whole window (all hyp words, in order)
    against all reference syllables of the window and give each hyp word to the clip of the
    reference syllable it aligns with; insertions go with the preceding reference syllable."""
    out = {}
    for g in groups:
        rtok, owner = [], []
        for k, cid in enumerate(g):
            t = tokens(ref[cid])
            rtok += t
            owner += [k] * len(t)
        htok = [t for cid in g for t in tokens(asr_c[cid]["hyp"])]
        if not rtok:
            continue
        rs = [southern(syllable(t)) for t in rtok]
        hs = [southern(syllable(t)) for t in htok]
        _, _, ops = align(rs, hs, tone_half=True)
        parts = [[] for _ in g]
        ri, hi, cur = 0, 0, 0
        for op, _, _ in ops:
            if op == "del":
                cur = owner[ri]
                ri += 1
            elif op == "ins":
                parts[cur].append(htok[hi])
                hi += 1
            else:
                cur = owner[ri]
                parts[cur].append(htok[hi])
                ri += 1
                hi += 1
        for k, cid in enumerate(g):
            out[cid] = " ".join(parts[k])
    return out


# ── scoring ──────────────────────────────────────────────────────────────────
def piecewise_speed(r: float) -> float:
    if 3.0 <= r <= 3.8:
        return 1.0
    if r > 3.8:
        return max(0.0, 1.0 - 0.5 * (r - 3.8) / 0.4) if r <= 4.2 else max(0.0, 0.5 - 0.5 * (r - 4.2) / 0.4)
    return max(0.0, 1.0 - 0.5 * (3.0 - r) / 0.4) if r >= 2.6 else max(0.0, 0.5 - 0.5 * (2.6 - r) / 0.4)


def clip01(x: float) -> float:
    return float(min(1.0, max(0.0, x)))


def total(parts: dict, weights: dict) -> float:
    return sum(parts[k] * w for k, w in weights.items()) / sum(weights.values())


def main(argv=None) -> int:
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--set", required=True)
    p.add_argument("--clips", required=True, help="listening dir with one folder per configuration letter")
    p.add_argument("--metrics", required=True, help="metrics.jsonl written by listening.py")
    p.add_argument("--out", required=True)
    p.add_argument("--threads", type=int, default=8)
    args = p.parse_args(argv)
    os.environ.setdefault("HF_HUB_OFFLINE", "1")

    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)
    clips_dir = Path(args.clips)
    items = parse_set(Path(args.set), "Nam")
    ids = [it["id"] for it in items]
    ref = {it["id"]: (it["text"] if it["variant"] != "thô" else it["expected"]) for it in items}
    letters = sorted(d.name for d in clips_dir.iterdir() if d.is_dir() and re.fullmatch(r"[A-Z]", d.name))
    # metrics.jsonl also holds voice names: keep only the measured fields
    keep = ("code_letter", "id", "duration_s", "lead_silence_s", "trail_silence_s", "max_pause_s", "noise_floor_db",
            "end_db", "gain_db", "peak_limited", "babble_retry_log")
    met = {}
    for line in Path(args.metrics).read_text("utf-8").splitlines():
        r = json.loads(line)
        met[(r["code_letter"], r["id"])] = {k: r.get(k) for k in keep}

    # 1. ASR (cached)
    asr_path = out / "transcripts.json"
    asr = json.loads(asr_path.read_text("utf-8")) if asr_path.exists() else {}
    tmpdir = out / ".tmp"
    tmpdir.mkdir(exist_ok=True)
    audio = {c: {cid: load16(clips_dir / c / f"{c}-{cid}.m4a", tmpdir) for cid in ids} for c in letters}
    max_dur = {cid: max(len(audio[c][cid]) / SR for c in letters) for cid in ids}
    groups = windows_for(items, max_dur)
    todo = [c for c in letters if c not in asr]
    if todo:
        from faster_whisper import WhisperModel

        t0 = time.perf_counter()
        model = WhisperModel(str(ASR_SNAPSHOT), device="cpu", compute_type="float32", cpu_threads=args.threads)
        print(f"ASR model loaded in {time.perf_counter() - t0:.1f} s · {len(groups)} windows per configuration",
              file=sys.stderr)
        for c in todo:
            t0, res = time.perf_counter(), {}
            for g in groups:
                res.update(transcribe(model, audio[c], g))
            asr[c] = res
            asr_path.write_text(json.dumps(asr, ensure_ascii=False, indent=1) + "\n", encoding="utf-8")
            print(f"{c}: {time.perf_counter() - t0:.0f} s", file=sys.stderr)

    # 2. per clip (words re-split between neighbouring clips by alignment, not only by timestamp)
    hyp = {c: realign(groups, ref, asr[c]) for c in letters}
    rows = []
    for c in letters:
        for it in items:
            cid = it["id"]
            s = score_text(ref[cid], hyp[c][cid])
            m = met[(c, cid)]
            speech = m["duration_s"] - m["lead_silence_s"] - m["trail_silence_s"]
            rows.append({"config": c, "id": cid, "group": group_of(cid), "variant": it["variant"], "ref": ref[cid],
                         "hyp": hyp[c][cid], "hyp_by_timestamp": asr[c][cid]["hyp"],
                         "word_prob": round(asr[c][cid]["word_prob"], 3),
                         "asr_failed": asr[c][cid].get("asr_failed", False), "asr_retries": asr[c][cid].get("asr_retries", 0),
                         **s,
                         "syl_per_s": round(len(tokens_syllables(it)) / speech, 3) if speech > 0 else None,
                         **{k: m[k] for k in keep if k not in ("code_letter", "id")},
                         "retry": bool(m["babble_retry_log"]), "cut_end": (m["end_db"] or -99) > -30.0,
                         "no_lead": m["lead_silence_s"] < 0.005})
    # F0 on raw part-A sentences
    for r in rows:
        if r["id"].startswith("A") and r["variant"] == "thô" and r["id"] != "A03":
            f = f0_stats(audio[r["config"]][r["id"]])
            r.update({k: round(v, 3) for k, v in (f or {}).items()})

    # 3. per configuration
    voices = {}
    for c in letters:
        R = [r for r in rows if r["config"] == c]

        def rate(sel, key="tolerant_errors"):
            sel = list(sel)
            return sum(r[key] for r in sel) / max(1, sum(r["ref_syllables"] for r in sel))

        by = {g: [r for r in R if r["group"] == g] for g in "abcd"}
        ser = {g: rate(by[g]) for g in "abcd"}
        acc_score = sum(ACC_WEIGHTS[g] * clip01(1 - ser[g] / 0.5) for g in ACC_WEIGHTS)
        sentences = [r for r in R if r["id"].startswith("A") and r["variant"] == "thô" and r["id"] != "A03"
                     and r["group"] in "ad"]
        speeds = np.array([r["syl_per_s"] for r in sentences])
        f0sd = np.array([r["f0_sd_st"] for r in sentences if "f0_sd_st" in r])
        q = [r["end_rise_st"] for r in sentences if r["id"] in QUESTIONS and "end_rise_st" in r]
        st_ = [r["end_rise_st"] for r in sentences if r["id"] not in QUESTIONS and "end_rise_st" in r]
        q_rise = float(np.mean(q) - np.mean(st_)) if q and st_ else 0.0
        cut, retry = sum(r["cut_end"] for r in R), sum(r["retry"] for r in R)
        pause = sum((r["max_pause_s"] or 0) > 0.8 and r["id"] != "A03" for r in R)
        nolead = sum(r["no_lead"] for r in R)
        defects = 1.0 * cut + 0.5 * retry + 0.5 * pause + 0.25 * nolead
        noise = float(np.median([r["noise_floor_db"] for r in R]))
        level_sd = float(np.std([r["gain_db"] for r in R]))
        rate_cv = float(np.std(speeds) / np.mean(speeds))
        tech = (0.6 * clip01(1 - defects / (0.2 * len(R))) + 0.2 * clip01((-noise - 50) / 30)
                + 0.2 * (0.5 * clip01(1 - level_sd / 4) + 0.5 * clip01(1 - rate_cv / 0.3)))
        speed_med = float(np.median(speeds))
        prosody = 0.7 * clip01((float(np.median(f0sd)) - 2.0) / 3.0) + 0.3 * clip01(q_rise / 2.0)
        parts = {"accuracy": acc_score, "technical": tech, "speed": piecewise_speed(speed_med), "prosody": prosody}
        numbers_n = [r for r in R if r["id"] in NUMBER_N]
        voices[c] = {
            "ser_a": ser["a"], "ser_b": ser["b"], "ser_c": ser["c"], "ser_d": ser["d"],
            "ser_strict_a": rate(by["a"], "strict_errors"), "ser_strict_b": rate(by["b"], "strict_errors"),
            "tone_err_a": rate(by["a"], "tone_errors"), "tone_err_b": rate(by["b"], "tone_errors"),
            "tone_err_ab": rate(by["a"] + by["b"], "tone_errors"),
            "cer_a": float(np.mean([r["cer"] for r in by["a"]])), "cer_plain_a": float(np.mean([r["cer_plain"] for r in by["a"]])),
            "cer_b": float(np.mean([r["cer"] for r in by["b"]])), "cer_plain_b": float(np.mean([r["cer_plain"] for r in by["b"]])),
            "ser_numbers_n": rate(numbers_n), "word_prob_a": float(np.mean([r["word_prob"] for r in by["a"]])),
            "asr_failed": sum(r["asr_failed"] for r in R), "asr_window_retries": sum(r["asr_retries"] > 0 for r in R),
            "first_syllable_wrong": sum(r["first_syllable_wrong"] for r in R) / len(R),
            "cut_end": cut, "retry": retry, "long_pause": pause, "no_lead": nolead, "noise_floor_db": noise,
            "level_sd_db": level_sd, "rate_cv": rate_cv, "syl_per_s": speed_med,
            "syl_per_s_p10": float(np.percentile(speeds, 10)), "syl_per_s_p90": float(np.percentile(speeds, 90)),
            "f0_sd_st": float(np.median(f0sd)), "question_rise_st": q_rise,
            "f0_median_hz": float(np.median([r["f0_median_hz"] for r in sentences if "f0_median_hz" in r])),
            **{f"score_{k}": v for k, v in parts.items()}, "score": total(parts, WEIGHTS),
        }

    # 4. elimination (a rule that removes every configuration is systemic and is not applied)
    rules = {
        "E1_tone_ab": lambda v: v["tone_err_ab"] > ELIM["E1_tone_ab"],
        "E2_ser_b": lambda v: v["ser_b"] > ELIM["E2_ser_b"],
        "E3_ser_numbers_n": lambda v: v["ser_numbers_n"] > ELIM["E3_ser_numbers_n"],
        "E4_r_items": lambda v: v["cut_end"] > ELIM["E4_r_items"],
    }
    applied = {}
    for name, f in rules.items():
        hit = [c for c in letters if f(voices[c])]
        applied[name] = {"hit": hit, "applied": len(hit) < len(letters)}
    for c in letters:
        voices[c]["eliminated_by"] = [n for n, a in applied.items() if a["applied"] and c in a["hit"]]
    ranking = sorted(letters, key=lambda c: (bool(voices[c]["eliminated_by"]), -voices[c]["score"]))

    # 5. robustness: move each weight by +-10 points, rescale the others
    robust = []
    for k in WEIGHTS:
        for delta in (+0.10, -0.10):
            w = dict(WEIGHTS)
            w[k] = max(0.0, w[k] + delta)
            rest = sum(v for kk, v in WEIGHTS.items() if kk != k)
            for kk in w:
                if kk != k:
                    w[kk] = WEIGHTS[kk] * (1 - w[k]) / rest
            order = sorted(letters, key=lambda c: (bool(voices[c]["eliminated_by"]),
                                                   -total({p: voices[c][f"score_{p}"] for p in WEIGHTS}, w)))
            robust.append({"weight": k, "delta": delta, "weights": {kk: round(v, 3) for kk, v in w.items()},
                           "top3": order[:3]})

    # 6. items every configuration gets wrong (fix the text or the normalizer, not the voice)
    common = []
    for cid in ids:
        rs_ = [r for r in rows if r["id"] == cid]
        wrong = [r for r in rs_ if r["tolerant_errors"] > 0]
        if len(wrong) >= len(letters) - 1:
            common.append({"id": cid, "wrong_in": len(wrong), "ref": ref[cid],
                           "hyps": {r["config"]: r["hyp"] for r in rs_}})

    # 7. write
    with open(out / "clips.csv", "w", newline="", encoding="utf-8") as f:
        cols = [k for k in rows[0] if k not in ("ops", "babble_retry_log")] + ["f0_sd_st", "end_rise_st", "ops"]
        cols = list(dict.fromkeys(cols))
        w = csv.DictWriter(f, fieldnames=cols, extrasaction="ignore")
        w.writeheader()
        for r in rows:
            w.writerow({**r, "ops": json.dumps(r["ops"], ensure_ascii=False)})
    with open(out / "configs.csv", "w", newline="", encoding="utf-8") as f:
        cols = ["rank", "config"] + list(next(iter(voices.values())).keys())
        w = csv.DictWriter(f, fieldnames=cols)
        w.writeheader()
        for i, c in enumerate(ranking, 1):
            w.writerow({"rank": i, "config": c, **{k: (round(v, 4) if isinstance(v, float) else v) for k, v in voices[c].items()}})
    result = {"weights": WEIGHTS, "accuracy_weights": ACC_WEIGHTS, "elimination": {"thresholds": ELIM, "result": applied},
              "ranking": ranking, "configs": voices, "robustness": robust, "common_errors": common,
              "asr": {"model": "mobiuslabsgmbh/faster-whisper-large-v3-turbo", "snapshot": ASR_SNAPSHOT.name,
                      "compute_type": "float32", "language": "vi", "beam_size": 5, "initial_prompt": None,
                      "window_s": WINDOW_S, "gap_s": GAP_S, "windows_per_config": len(groups)}}
    (out / "result.json").write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    tmpdir.rmdir()
    for i, c in enumerate(ranking, 1):
        v = voices[c]
        print(f"{i}. {c} score {v['score']:.3f} | acc {v['score_accuracy']:.2f} tech {v['score_technical']:.2f} "
              f"speed {v['score_speed']:.2f} pros {v['score_prosody']:.2f} | SER a {v['ser_a']:.3f} b {v['ser_b']:.3f} "
              f"tone ab {v['tone_err_ab']:.3f} | {v['syl_per_s']:.2f} syl/s | elim {v['eliminated_by']}")
    return 0


def tokens_syllables(item: dict) -> list[str]:
    """Spoken syllables of the expected reading (loanwords counted by their transliteration)."""
    text = item["text"] if item["variant"] != "thô" else item["expected"]
    s = unicodedata.normalize("NFC", text).lower()
    s = re.sub(r"\[[^\]]*\]", " ", s)
    s = re.sub(r"(?<=\w)-(?=\w)", " ", s)
    return re.findall(r"[^\W\d_]+", s)


# ── self-check of freshly generated clips (SK-024, called by content-cli tts --lang vi) ──
CHECK_FLAGS = {
    "asr": "máy nghe ra sai chữ hoặc sai thanh (đã bỏ qua nét giọng Nam)",
    "cut_end": "40 ms cuối còn tiếng: có thể cụt cuối",
    "no_lead": "không có khoảng lặng đầu: có thể mất âm đầu",
    "long_pause": "ngắt giữa câu dài hơn 0,8 s",
    "engine_retry": "engine phải tự sinh lại vì nghi đọc thừa",
    "too_short": "ngắn dưới 0,3 s",
    "silent": "chỉ có khoảng lặng",
}
BADNESS = {"asr": 2.0, "cut_end": 1.5, "engine_retry": 1.0, "long_pause": 1.0, "no_lead": 0.5, "too_short": 3.0, "silent": 5.0}


def tech_metrics(x: np.ndarray, blank: bool) -> dict:
    loud = np.flatnonzero(np.abs(x) > 0.01)
    lead = loud[0] / SR if loud.size else len(x) / SR
    trail = (len(x) - 1 - loud[-1]) / SR if loud.size else 0.0
    db = 20 * np.log10(np.sqrt((x[: len(x) // 320 * 320].reshape(-1, 320) ** 2).mean(1)) + 1e-9)  # 20 ms windows
    louder = np.flatnonzero(db > PAUSE_DB_CHECK)
    longest = run = 0
    if louder.size:
        for quiet in db[louder[0]: louder[-1] + 1] <= PAUSE_DB_CHECK:
            run = run + 1 if quiet else 0
            longest = max(longest, run)
    return {"duration_s": round(len(x) / SR, 3), "lead_silence_s": round(lead, 3), "trail_silence_s": round(trail, 3),
            "max_pause_s": round(longest * 0.02, 2), "end_db": round(float(db[-2:].max()), 1) if db.size >= 2 else -120.0,
            "peak": round(float(np.abs(x).max()) if x.size else 0.0, 4), "blank": blank}


PAUSE_DB_CHECK = -45.0


def check_flags(m: dict, s: dict, retry: bool, cut_end_raw: bool = False) -> list[str]:
    """cut_end_raw: the engine output (before content-cli fixed the silence) ended inside a sound."""
    f = []
    if s["tolerant_errors"] > 0:
        f.append("asr")
    if m["end_db"] > -30.0 or cut_end_raw:
        f.append("cut_end")
    if m["lead_silence_s"] < 0.005:
        f.append("no_lead")
    if m["max_pause_s"] > 0.8 + (0.8 if m["blank"] else 0.0):
        f.append("long_pause")
    if retry:
        f.append("engine_retry")
    if m["duration_s"] < 0.3:
        f.append("too_short")
    if m["peak"] < 0.01:
        f.append("silent")
    return f


def run_check(argv) -> int:
    """jobs.jsonl: {"id", "m4a", "ref" (text the engine read), "retry" (bool), "blank" (bool)} per line,
    in reading order. results.jsonl: the same ids with ASR text, errors, measurements, flags, badness."""
    p = argparse.ArgumentParser(prog="evaluate.py check")
    p.add_argument("--jobs", required=True)
    p.add_argument("--results", required=True)
    p.add_argument("--threads", type=int, default=8)
    p.add_argument("--passes", type=int, default=2, help="ASR passes with different neighbours (default 2)")
    args = p.parse_args(argv)
    os.environ.setdefault("HF_HUB_OFFLINE", "1")
    jobs = [json.loads(line) for line in Path(args.jobs).read_text("utf-8").splitlines() if line.strip()]
    tmpdir = Path(args.results).parent / f".check-{os.getpid()}"
    tmpdir.mkdir(parents=True, exist_ok=True)
    try:
        audio = {j["id"]: load16(Path(j["m4a"]), tmpdir) for j in jobs}
    finally:
        tmpdir.rmdir()
    ref = {j["id"]: j["ref"] for j in jobs}

    def pack(order: list[str]) -> list[list[str]]:
        groups, cur, t = [], [], 0.0
        for cid in order:
            d = len(audio[cid]) / SR + (GAP_S if cur else 0)
            if cur and t + d > WINDOW_S:
                groups.append(cur)
                cur, t = [], 0.0
                d = len(audio[cid]) / SR
            cur.append(cid)
            t += d
        if cur:
            groups.append(cur)
        return groups

    from faster_whisper import WhisperModel

    t0 = time.perf_counter()
    model = WhisperModel(str(ASR_SNAPSHOT), device="cpu", compute_type="float32", cpu_threads=args.threads)
    ids = [j["id"] for j in jobs]
    # Pass 1 in reading order, pass 2 in reverse: every clip is heard with other neighbours, so a
    # Whisper slip that depends on context ("Kẹo" heard as "keo" once) shows up as a disagreement.
    passes, windows = [], 0
    for k in range(args.passes):
        groups = pack(ids if k % 2 == 0 else ids[::-1])
        windows += len(groups)
        asr = {}
        for g in groups:
            asr.update(transcribe(model, audio, g))
        passes.append((realign(groups, ref, asr), asr))
    with open(args.results, "w", encoding="utf-8") as out:
        for j in jobs:
            scores = [score_text(j["ref"], hyp[j["id"]]) for hyp, _ in passes]
            m = tech_metrics(audio[j["id"]], bool(j.get("blank")))
            errors = sum(s["tolerant_errors"] for s in scores)
            flags = check_flags(m, {"tolerant_errors": errors}, bool(j.get("retry")), bool(j.get("cut_end_raw")))
            out.write(json.dumps({"id": j["id"], "hyp": [hyp[j["id"]] for hyp, _ in passes],
                                  "asr_failed": any(asr[j["id"]].get("asr_failed", False) for _, asr in passes),
                                  "tolerant_errors": errors, "tone_errors": sum(s["tone_errors"] for s in scores),
                                  "passes_with_errors": sum(s["tolerant_errors"] > 0 for s in scores),
                                  "ref_syllables": scores[0]["ref_syllables"], "ops": [s["ops"] for s in scores], **m,
                                  "flags": flags,
                                  "badness": round(sum(BADNESS[f] for f in flags if f != "asr") + BADNESS["asr"] * errors / 2, 2)},
                                 ensure_ascii=False) + "\n")
    print(f"self-check: {len(jobs)} clip × {args.passes} lượt ASR, {windows} cửa sổ, {time.perf_counter() - t0:.0f} s",
          file=sys.stderr)
    return 0


if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] == "check":
        sys.exit(run_check(sys.argv[2:]))
    sys.exit(main())
