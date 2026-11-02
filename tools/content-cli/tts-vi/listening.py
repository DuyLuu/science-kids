"""Blind listening-test samples for SK-023, following content/tts-vi/listening-set.md part C1.

    uv run python listening.py --set ../../../content/tts-vi/listening-set.md \
        --out <listening dir> --key <key dir outside the listening dir>

Per configuration (one VieNeu voice, default speed): 85 clips = 60 items (raw "Chữ gốc"),
22 normalized "n" clips (from "Bản đọc mong đợi", hyphens -> spaces, Southern "lẻ"/"ngàn"),
3 old-style-diacritics "c" clips. A03 is split at the blank as in SK-014 decision 6.
Every clip is levelled to the same loudness, encoded like the app clips (AAC mono 64 kbps),
and its m4a times are zeroed.

Listening dir (blind, no voice / engine / model names anywhere):
  index.html                     listening page: one row per clip, configurations side by side
  X/X-A01.m4a, X/X-A22n.m4a ...  clips, one folder per configuration letter
  joined/X-cau.m4a|.txt          part A of a configuration, 0.7 s gaps, timestamps (SK-023)
  joined/X-tu.m4a|.txt           part B
  joined/X-vong1.m4a|.txt        round 1 (8 sentences + 8 words, same items for everyone)
  playlists/playlist-A01.m3u     one clip id across configurations, order shuffled per id
  playlists/playlist-all.m3u     every clip id in order, configurations shuffled per id
  items.json                     what was read
Key dir (open only after scoring): key.md, key.json, metrics.jsonl, summary.json
"""
from __future__ import annotations

import argparse
import html
import json
import random
import re
import secrets
import subprocess
import sys
import time
import unicodedata
from pathlib import Path

import vieneu_vi

GAP_S = 0.7              # between clips in the joined files (as review-01, SK-014)
BLANK_PAUSE_S = 0.8      # A03: pause at the blank (listening-set C1.5, SK-014 decision 6)
TARGET_DBFS = -20.0      # loudness: RMS of the speech part (20 ms windows above PAUSE_DB)
PEAK_CAP_DBFS = -1.0
PAUSE_DB = -45.0
MAX_PAUSE_S = 0.8
END_DB = -30.0           # last 40 ms louder than this: clip may end mid-sound
LETTERS = ["X", "Y", "Z", "W", "V", "U", "Q", "P"]  # C1.7 lists X..U for six; Q, P added for eight

# listening-set.md C1.3 and C1.4
NORMALIZED_IDS = ["A06", "A17", "A18", "A19", "A20", "A21", "A22", "A23", "A24", "A25", "A26", "A27", "A28",
                  "B05", "B23", "B24", "B25", "B26", "B27", "B28", "B29", "B30"]
OLD_DIACRITICS = {"B09": "khỏe mạnh", "B21": "hóa học", "B22": "thủy tinh"}
SOUTHERN_WORDS = {"linh": "lẻ", "nghìn": "ngàn"}
# Round 1 (SK-023, more than three configurations): 8 sentences + 8 words, same for everyone.
ROUND1 = ["A01", "A04", "A05", "A07", "A11", "A13", "A15", "A30",
          "B05", "B09", "B10", "B12", "B16", "B18", "B19", "B20"]
KIND_LABEL = {"cau": "Phần A · Câu", "tu": "Phần B · Từ đơn và cụm ngắn"}


# ── items ────────────────────────────────────────────────────────────────────
def parse_set(path: Path, region: str) -> list[dict]:
    """Rows `| A01 | chữ gốc | bản đọc mong đợi | nguồn | điểm cần nghe |` of parts A and B."""
    text = unicodedata.normalize("NFC", path.read_text(encoding="utf-8"))
    base = []
    for line in text.splitlines():
        m = re.match(r"^\|\s*([AB]\d{2})\s*\|(.*)\|\s*$", line)
        if not m:
            continue
        cells = [c.strip() for c in m.group(2).split("|")]
        if len(cells) != 4:
            continue  # the C5 scoring grid also starts with "| A01 |" but has 6 empty cells
        code, (original, expected, source, note) = m.group(1), cells
        expected = original if expected == "giống chữ gốc" else expected
        base.append({"code": code, "original": original, "expected": expected, "source": source, "note": note})
    codes = [b["code"] for b in base]
    want = [f"A{i:02d}" for i in range(1, 31)] + [f"B{i:02d}" for i in range(1, 31)]
    if codes != want:
        sys.exit(f"{path}: expected A01..A30, B01..B30 in order, got {len(codes)} rows")

    items = []
    for b in base:
        kind = "cau" if b["code"].startswith("A") else "tu"
        common = {"code": b["code"], "kind": kind, "expected": b["expected"], "note": b["note"],
                  "round1": b["code"] in ROUND1}
        items.append({**common, "id": b["code"], "variant": "thô", "text": b["original"]})
        if b["code"] in NORMALIZED_IDS:
            n = re.sub(r"(?<=\w)-(?=\w)", " ", b["expected"])
            if region == "Nam":
                n = re.sub(r"\b(" + "|".join(SOUTHERN_WORDS) + r")\b", lambda m: SOUTHERN_WORDS[m.group(1)], n)
            items.append({**common, "id": b["code"] + "n", "variant": "chuẩn hoá", "text": n, "round1": False})
        if b["code"] in OLD_DIACRITICS:
            items.append({**common, "id": b["code"] + "c", "variant": "dấu cũ", "text": OLD_DIACRITICS[b["code"]],
                          "round1": False})
    return items


# ── audio helpers ────────────────────────────────────────────────────────────
def _windows_db(wav, sr: int):
    import numpy as np

    win = int(0.02 * sr)
    k = len(wav) // win
    rms = np.sqrt((wav[: k * win].reshape(k, win) ** 2).mean(1)) if k else np.zeros(0)
    return 20 * np.log10(rms + 1e-9), rms


def level(wav):
    """Scale so the speech part sits at TARGET_DBFS RMS, never above PEAK_CAP_DBFS peak."""
    import numpy as np

    db, rms = _windows_db(wav, vieneu_vi.SAMPLE_RATE)
    active = rms[db > PAUSE_DB]
    if active.size == 0:
        return wav, {"gain_db": 0.0, "peak_limited": False}
    gain = 10 ** (TARGET_DBFS / 20) / float(np.sqrt((active ** 2).mean()))
    peak = float(np.abs(wav).max())
    limited = peak * gain > 10 ** (PEAK_CAP_DBFS / 20)
    if limited:
        gain = 10 ** (PEAK_CAP_DBFS / 20) / peak
    return (wav * gain).astype(np.float32), {"gain_db": round(20 * np.log10(gain), 2), "peak_limited": bool(limited)}


def pauses(wav) -> dict:
    import numpy as np

    db, _ = _windows_db(wav, vieneu_vi.SAMPLE_RATE)
    loud = np.flatnonzero(db > PAUSE_DB)
    longest = run = 0
    if loud.size:
        for quiet in db[loud[0]: loud[-1] + 1] <= PAUSE_DB:
            run = run + 1 if quiet else 0
            longest = max(longest, run)
    return {"max_pause_s": round(longest * 0.02, 2),
            "noise_floor_db": round(float(np.percentile(db, 5)), 1) if db.size else None,
            "end_db": round(float(db[-2:].max()), 1) if db.size >= 2 else None}  # last 40 ms


def synth_item(tts, item: dict, voice: str):
    """Model output for one item (A03: two parts joined at the blank). Returns (wav, gen metrics)."""
    import numpy as np

    if "{1}" not in item["text"]:
        return vieneu_vi.generate(tts, item["text"], voice)
    before, after = (s.strip() for s in item["text"].split("{1}", 1))
    first = before.rstrip(",") + "…"
    w1, g1 = vieneu_vi.generate(tts, first, voice)
    w2, g2 = vieneu_vi.generate(tts, after, voice)
    _, trail = vieneu_vi._edge_silence(w1)
    lead, _ = vieneu_vi._edge_silence(w2)
    pad = max(0.0, BLANK_PAUSE_S - trail - lead)
    wav = np.concatenate([w1, np.zeros(int(pad * vieneu_vi.SAMPLE_RATE), np.float32), w2])
    return wav, {"seed": [g1["seed"], g2["seed"]], "gen_s": round(g1["gen_s"] + g2["gen_s"], 3),
                 "babble_retry_log": g1["babble_retry_log"] + g2["babble_retry_log"],
                 "blank_pause_s": round(trail + pad + lead, 3), "parts": [first, after]}


def _syllables(text: str) -> int:
    return len(re.findall(r"[^\W\d_]+|\d+", text))


def flags_for(r: dict) -> list[str]:
    blank = BLANK_PAUSE_S if "{1}" in r["text"] else 0.0
    speech = r["duration_s"] - r["lead_silence_s"] - r["trail_silence_s"]
    syl = max(1, _syllables(r["text"].replace("{1}", "")))
    f = []
    if r["duration_s"] < 0.3:
        f.append("ngắn dưới 0,3 s")
    if r["peak"] < 0.01:
        f.append("chỉ có khoảng lặng")
    if speech > 0.45 * syl + 0.6 + blank:
        f.append(f"dài bất thường: {speech:.2f} s tiếng cho {syl} tiếng chữ")
    if speech < 0.09 * syl:
        f.append(f"ngắn bất thường: {speech:.2f} s tiếng cho {syl} tiếng chữ")
    if r["lead_silence_s"] < 0.005:
        f.append("có tiếng ngay từ 0 ms: nghe kỹ âm đầu")
    if r["max_pause_s"] > MAX_PAUSE_S + blank:
        f.append(f"ngắt giữa câu dài {r['max_pause_s']:.2f} s")
    if r.get("end_db") is not None and r["end_db"] > END_DB:
        f.append(f"40 ms cuối vẫn còn tiếng ({r['end_db']:.0f} dB): nghe xem có bị cắt cụt hay có tiếng lạ ở cuối")
    if r["peak_limited"]:
        f.append("không đủ to vì chạm trần đỉnh")
    if r["babble_retry_log"]:
        f.append("engine tự sinh lại vì nghi đọc thừa")
    return f


def _decode_pcm(m4a: Path):
    import soundfile as sf

    tmp = m4a.with_name(f".{m4a.stem}.dec.wav")
    subprocess.run(["afconvert", "-f", "WAVE", "-d", "LEI16", str(m4a), str(tmp)], check=True)
    pcm, sr = sf.read(str(tmp), dtype="float32")
    tmp.unlink()
    return pcm, sr


def _afinfo(m4a: Path) -> dict:
    out = subprocess.run(["afinfo", str(m4a)], check=True, capture_output=True, text=True).stdout
    fmt = re.search(r"Data format:\s+(\d+) ch,\s+(\d+) Hz, (\w+)", out)
    return {"channels": int(fmt.group(1)), "rate": int(fmt.group(2)), "codec": fmt.group(3),
            "bitrate": int(re.search(r"bit rate: (\d+)", out).group(1))}


def join(out: Path, letter: str, name: str, title: str, items: list[dict]) -> None:
    """Decode each clip with afconvert (exact length), join with GAP_S, encode once (SK-014 decision 9)."""
    import numpy as np

    pieces, lines, t = [], [], 0.0
    gap = np.zeros(int(GAP_S * vieneu_vi.SAMPLE_RATE), dtype=np.float32)
    for n, it in enumerate(items):
        pcm, sr = _decode_pcm(out / letter / f"{letter}-{it['id']}.m4a")
        if n:
            pieces.append(gap)
            t += GAP_S
        lines.append(f"{t:7.2f}s  {it['id']:<5} {it['text']}")
        pieces.append(pcm)
        t += len(pcm) / sr
    (out / "joined").mkdir(exist_ok=True)
    vieneu_vi.encode_m4a(np.concatenate(pieces), out / "joined" / f"{letter}-{name}.m4a")
    (out / "joined" / f"{letter}-{name}.txt").write_text(
        f"Cấu hình {letter} · {title} · {len(items)} clip · cách nhau {GAP_S} s · tổng {t:.2f} s\n"
        + "\n".join(lines) + "\n", encoding="utf-8")


# ── page ─────────────────────────────────────────────────────────────────────
PAGE = """<!doctype html>
<html lang="vi"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Nghe thử giọng Việt</title>
<style>
:root{--bg:#faf7f0;--fg:#2b2620;--muted:#6f675c;--line:#e4ddcf;--card:#fff;--accent:#b4441f;--accent-fg:#fff;--on:#2f6b4f}
@media (prefers-color-scheme:dark){:root{--bg:#1d1b18;--fg:#efe9df;--muted:#a59c8f;--line:#3a352e;--card:#26231f;--accent:#e0784f;--accent-fg:#1d1b18;--on:#6cc39b}}
body{margin:0;background:var(--bg);color:var(--fg);font:15px/1.45 -apple-system,system-ui,"Segoe UI",sans-serif}
main{max-width:1400px;margin:0 auto;padding:20px 16px 60px}
h1{font-size:22px;margin:0 0 4px}.sub{color:var(--muted);margin:0 0 12px;max-width:900px}
.tools{display:flex;gap:8px;flex-wrap:wrap;align-items:center;margin:0 0 14px}
button{font:inherit;border:0;border-radius:8px;padding:6px 10px;background:var(--line);color:var(--fg);cursor:pointer}
button.play{background:var(--accent);color:var(--accent-fg);min-width:48px}
button.play.on{background:var(--on)}
button.rowplay{white-space:nowrap}
label{color:var(--muted)}
.wrap{overflow-x:auto}
table{border-collapse:collapse;width:100%;background:var(--card)}
th,td{border-bottom:1px solid var(--line);padding:8px;text-align:left;vertical-align:top}
th{position:sticky;top:0;background:var(--card);font-size:13px;color:var(--muted);z-index:1}
td.id{font-weight:600;white-space:nowrap}td.text{min-width:300px}
.tag{display:inline-block;font-size:12px;font-weight:500;color:var(--muted);border:1px solid var(--line);border-radius:6px;padding:0 5px;margin-left:4px}
.exp,.note{display:block;color:var(--muted);font-size:13px;margin-top:2px}
.exp b{color:var(--fg);font-weight:500}
td.v{text-align:center;white-space:nowrap}
select{font:inherit;margin-top:4px;background:var(--card);color:var(--fg);border:1px solid var(--line);border-radius:6px}
tr.kind td{background:var(--bg);font-weight:600;padding-top:18px}
tfoot td{font-weight:600}
body.r1 tr[data-r1="0"]{display:none}
.full{margin:18px 0 0;color:var(--muted);font-size:13px}
.full a{color:inherit}
</style></head><body><main>
<h1>Nghe thử giọng Việt</h1>
<p class="sub">__N_VARIANTS__ cấu hình ẩn tên (__CODES__), __N_ITEMS__ clip mỗi cấu hình (60 mục, bản chuẩn hoá <span class="tag">n</span>, bản dấu cũ <span class="tag">c</span>). Âm lượng mọi clip đã cân về cùng một mức. Bấm ▶ để nghe; "▶ lần lượt" phát cả hàng theo thứ tự xáo riêng cho từng mục. Phím 1–__N_VARIANTS__ phát cột tương ứng ở dòng đang chọn, ↑/↓ đổi dòng, phím cách để dừng. Điểm nhanh 1–5 (tuỳ chọn) chỉ lưu trên trình duyệt này; phiếu chính thức là phiếu C4, C5 trong <code>listening-set.md</code>. Chưa nộp phiếu thì đừng mở thư mục khoá.</p>
<div class="tools"><button id="stop">■ Dừng</button><label><input type="checkbox" id="r1"> Chỉ hiện vòng 1 (8 câu + 8 từ)</label><button id="csv">Tải điểm (CSV)</button><button id="clear">Xoá điểm</button></div>
<div class="wrap"><table><thead><tr><th>Mã</th><th>Chữ đưa vào engine · bản đọc mong đợi · điểm cần nghe</th><th>Cả hàng</th>__HEAD__</tr></thead>
<tbody>__ROWS__</tbody><tfoot><tr><td></td><td>Điểm nhanh trung bình (số mục đã chấm)</td><td></td>__FOOT__</tr></tfoot></table></div>
<p class="full">File ghép theo cấu hình (cách nhau __GAP__ s, mốc giây trong file .txt cùng tên): __FULL__</p>
</main><script>
const CODES=__CODES_JSON__, KEY="sk-listen-"+__STAMP__;
let audio=null, btn=null, row=0, queue=[];
function stop(){queue=[]; if(audio){audio.pause();audio=null} if(btn){btn.classList.remove("on");btn=null}}
function play(b){const same=btn===b; stop(); if(same) return; btn=b; b.classList.add("on");
  audio=new Audio(b.dataset.src); audio.onended=()=>{b.classList.remove("on"); btn=null; audio=null; next()}; audio.play()}
function next(){const b=queue.shift(); if(b){const q=queue; play(b); queue=q}}
const rows=()=>[...document.querySelectorAll("tr[data-row]")].filter(r=>r.offsetParent!==null);
function mark(){rows().forEach((r,i)=>r.style.outline=i===row?"2px solid var(--accent)":"")}
function select(tr){row=rows().indexOf(tr); mark()}
document.querySelectorAll("button.play").forEach(b=>b.onclick=()=>{select(b.closest("tr")); play(b)});
document.querySelectorAll("button.rowplay").forEach(b=>b.onclick=()=>{const tr=b.closest("tr"); select(tr); stop();
  queue=tr.dataset.order.split(",").map(c=>tr.querySelector('button.play[data-c="'+c+'"]')); next()});
document.getElementById("stop").onclick=stop;
document.getElementById("r1").onchange=e=>{document.body.classList.toggle("r1",e.target.checked); row=0; mark()};
document.addEventListener("keydown",e=>{if(e.target.tagName==="SELECT"||e.target.tagName==="INPUT")return; const rs=rows();
  if(e.key==="ArrowDown"){row=Math.min(rs.length-1,row+1);mark();rs[row].scrollIntoView({block:"nearest"});e.preventDefault()}
  else if(e.key==="ArrowUp"){row=Math.max(0,row-1);mark();rs[row].scrollIntoView({block:"nearest"});e.preventDefault()}
  else if(/^[1-9]$/.test(e.key)){const b=rs[row]&&rs[row].querySelectorAll("button.play")[+e.key-1]; if(b){play(b)}}
  else if(e.key===" "){stop();e.preventDefault()}});
function load(){try{return JSON.parse(localStorage.getItem(KEY)||"{}")}catch(e){return {}}}
function save(s){try{localStorage.setItem(KEY,JSON.stringify(s))}catch(e){}}
function averages(){const s=load(); CODES.forEach(c=>{const v=Object.entries(s).filter(([k])=>k.startsWith(c+"|")).map(([,x])=>+x);
  document.getElementById("avg-"+c).textContent=v.length?(v.reduce((a,b)=>a+b,0)/v.length).toFixed(2)+" ("+v.length+")":"–"})}
document.querySelectorAll("select.score").forEach(sel=>{const s=load(); sel.value=s[sel.dataset.k]||"";
  sel.onchange=()=>{const s=load(); if(sel.value) s[sel.dataset.k]=sel.value; else delete s[sel.dataset.k]; save(s); averages()}});
document.getElementById("clear").onclick=()=>{if(confirm("Xoá mọi điểm nhanh trên trình duyệt này?")){save({}); document.querySelectorAll("select.score").forEach(s=>s.value=""); averages()}};
document.getElementById("csv").onclick=()=>{const s=load(); let out="cau_hinh,ma,diem\\n";
  Object.entries(s).forEach(([k,v])=>{const [c,i]=k.split("|"); out+=c+","+i+","+v+"\\n"});
  const a=document.createElement("a"); a.href=URL.createObjectURL(new Blob([out],{type:"text/csv"})); a.download="diem-nhanh-nghe-thu.csv"; a.click()};
mark(); averages();
</script></body></html>
"""


def write_page(out: Path, letters: list[str], items: list[dict], orders: dict, stamp: str) -> None:
    head = "".join(f"<th>{c}</th>" for c in letters)
    foot = "".join(f'<td class="v" id="avg-{c}">–</td>' for c in letters)
    opts = '<option value="">–</option>' + "".join(f'<option value="{i}">{i}</option>' for i in range(1, 6))
    rows, n, last_kind = [], 0, None
    for it in items:
        if it["kind"] != last_kind:
            rows.append(f'<tr class="kind" data-r1="1"><td colspan="{3 + len(letters)}">{KIND_LABEL[it["kind"]]}</td></tr>')
            last_kind = it["kind"]
        tag = {"chuẩn hoá": ' <span class="tag">n · chuẩn hoá</span>',
               "dấu cũ": ' <span class="tag">c · dấu cũ</span>'}.get(it["variant"], "")
        extra = ""
        if it["variant"] == "thô" and it["expected"] != it["text"]:
            extra += f'<span class="exp">Bản đọc mong đợi: <b>{html.escape(it["expected"])}</b></span>'
        if it["variant"] == "thô":
            extra += f'<span class="note">{html.escape(it["note"])}</span>'
        cells = "".join(
            f'<td class="v"><button class="play" data-c="{c}" data-src="{c}/{c}-{it["id"]}.m4a">▶ {c}</button><br>'
            f'<select class="score" data-k="{c}|{it["id"]}" aria-label="Điểm {c} {it["id"]}">{opts}</select></td>'
            for c in letters)
        rows.append(f'<tr data-row="{n}" data-r1="{int(it["round1"])}" data-order="{",".join(orders[it["id"]])}">'
                    f'<td class="id">{it["id"]}</td><td class="text">{html.escape(it["text"])}{tag}{extra}</td>'
                    f'<td><button class="rowplay">▶ lần lượt</button></td>{cells}</tr>')
        n += 1
    full = " · ".join(f'<a href="joined/{c}-{k}.m4a">{c}-{k}</a>' for c in letters for k in ("cau", "tu", "vong1"))
    page = (PAGE.replace("__HEAD__", head).replace("__FOOT__", foot).replace("__ROWS__", "\n".join(rows))
            .replace("__N_VARIANTS__", str(len(letters))).replace("__CODES__", ", ".join(letters))
            .replace("__N_ITEMS__", str(len(items))).replace("__GAP__", str(GAP_S).replace(".", ","))
            .replace("__FULL__", full).replace("__CODES_JSON__", json.dumps(letters))
            .replace("__STAMP__", json.dumps(stamp)))
    (out / "index.html").write_text(page, encoding="utf-8")


def write_playlists(out: Path, letters: list[str], items: list[dict], orders: dict) -> None:
    pl = out / "playlists"
    pl.mkdir(exist_ok=True)
    every = ["#EXTM3U"]
    for it in items:
        lines = ["#EXTM3U"]
        for c in orders[it["id"]]:
            entry = [f"#EXTINF:-1,Cấu hình {c} – {it['id']}", f"../{c}/{c}-{it['id']}.m4a"]
            lines += entry
            every += entry
        (pl / f"playlist-{it['id']}.m3u").write_text("\n".join(lines) + "\n", encoding="utf-8")
    (pl / "playlist-all.m3u").write_text("\n".join(every) + "\n", encoding="utf-8")


# ── main ─────────────────────────────────────────────────────────────────────
def main(argv=None) -> int:
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--set", required=True, help="content/tts-vi/listening-set.md")
    p.add_argument("--out", required=True, help="listening dir (blind)")
    p.add_argument("--key", required=True, help="key dir, must be outside --out")
    p.add_argument("--region", default="Nam", choices=["Bắc", "Trung", "Nam", "all"])
    p.add_argument("--gender", choices=["male", "female"])
    p.add_argument("--force", action="store_true", help="re-synthesize clips that already exist")
    args = p.parse_args(argv)

    vieneu_vi._setup_env(offline=True)
    out, keydir = Path(args.out).resolve(), Path(args.key).resolve()
    if keydir == out or out in keydir.parents:
        sys.exit("--key must be outside --out (listening-set C1.8)")
    out.mkdir(parents=True, exist_ok=True)
    keydir.mkdir(parents=True, exist_ok=True)

    items = parse_set(Path(args.set), args.region)
    voices = [v for v in vieneu_vi.voice_table()
              if (args.region == "all" or v["region"] == args.region) and (not args.gender or v["gender"] == args.gender)]
    if len(voices) > len(LETTERS):
        sys.exit(f"{len(voices)} voices but only {len(LETTERS)} letters")

    key_path = keydir / "key.json"
    if key_path.exists():  # keep letters stable when re-running into the same folders
        key = json.loads(key_path.read_text("utf-8"))
        if sorted(k["voice"] for k in key["variants"]) != sorted(v["name"] for v in voices):
            sys.exit(f"{key_path} lists other voices; use new --out/--key folders")
    else:
        rng = secrets.SystemRandom()
        order = voices[:]
        rng.shuffle(order)
        letters = LETTERS[: len(order)]
        key = {"created": time.strftime("%Y-%m-%d %H:%M"), "set": str(Path(args.set).resolve()),
               "engine": f"vieneu {vieneu_vi.VIENEU_VERSION} · VieNeu-TTS v3 Turbo ONNX {vieneu_vi.PRECISION} (CPU)",
               "model_revisions": vieneu_vi.PINS, "speed": "mặc định (v3 Turbo không có tham số tốc độ)",
               "seed": "sha256(giọng + xuống dòng + chữ), 4 byte đầu, big-endian",
               "level": f"RMS phần có tiếng {TARGET_DBFS} dBFS, đỉnh tối đa {PEAK_CAP_DBFS} dBFS",
               "variants": [{"code": c, "voice": v["name"], "region": v["region"], "gender": v["gender"],
                             "style": v["style"], "description": v["description"]} for c, v in zip(letters, order)],
               "orders_seed": rng.randrange(2 ** 32)}
        key_path.write_text(json.dumps(key, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        md = ["# Bảng khoá nghe thử SK-023 (chỉ mở sau khi cả hai người đã nộp phiếu)", "",
              f"Sinh ngày {key['created']} · {key['engine']}", "",
              "- Model: " + ", ".join(f"`{r}` @ `{s[:12]}`" for r, s in vieneu_vi.PINS.items()),
              f"- Tốc độ: {key['speed']}", f"- Seed: {key['seed']}", f"- Âm lượng: {key['level']}", "",
              "| Cấu hình | Giọng | Miền | Giới | Phong cách (theo SDK) |", "| --- | --- | --- | --- | --- |"]
        md += [f"| {v['code']} | {v['voice']} | {v['region']} | {'nam' if v['gender'] == 'male' else 'nữ'} | {v['style']} |"
               for v in key["variants"]]
        (keydir / "key.md").write_text("\n".join(md) + "\n", encoding="utf-8")
    letters = [v["code"] for v in key["variants"]]
    orng = random.Random(key["orders_seed"])
    orders = {it["id"]: orng.sample(letters, len(letters)) for it in items}
    (out / "items.json").write_text(json.dumps(
        [{k: it[k] for k in ("id", "code", "variant", "kind", "text", "expected", "round1")} for it in items],
        ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

    tts, load_s = vieneu_vi.load_tts()
    print(f"model loaded in {load_s:.1f} s · {len(letters)} configurations x {len(items)} clips", file=sys.stderr)
    metrics_path = keydir / "metrics.jsonl"
    old = {}
    if metrics_path.exists():
        for line in metrics_path.read_text("utf-8").splitlines():
            r = json.loads(line)
            old[(r["code_letter"], r["id"])] = r
    results, new, t_all = [], 0, time.perf_counter()
    for v in key["variants"]:
        for it in items:
            clip = out / v["code"] / f"{v['code']}-{it['id']}.m4a"
            prev = old.get((v["code"], it["id"]))
            if clip.exists() and prev and prev["text"] == it["text"] and not args.force:
                prev.update(pauses(_decode_pcm(clip)[0]))  # re-check with the current rules
                prev["flags"] = flags_for(prev)
                results.append(prev)
                continue
            wav, gen = synth_item(tts, it, v["voice"])
            raw = vieneu_vi.wav_metrics(wav)
            wav, lv = level(wav)
            vieneu_vi.encode_m4a(wav, clip)
            r = {"code_letter": v["code"], "voice": v["voice"], "id": it["id"], "text": it["text"], **raw, **gen, **lv,
                 **pauses(wav), "rtf": round(gen["gen_s"] / raw["duration_s"], 3) if raw["duration_s"] else None,
                 "afinfo": _afinfo(clip)}
            r["flags"] = flags_for(r)
            results.append(r)
            new += 1
            print(f"{v['code']} {it['id']:<5} {r['duration_s']:5.2f}s audio {r['gen_s']:5.2f}s gen  {'; '.join(r['flags'])}",
                  file=sys.stderr)
    wall = time.perf_counter() - t_all
    metrics_path.write_text("".join(json.dumps(r, ensure_ascii=False) + "\n" for r in results), encoding="utf-8")

    by_id = {it["id"]: it for it in items}
    for c in letters:
        join(out, c, "cau", "Phần A, câu", [it for it in items if it["kind"] == "cau"])
        join(out, c, "tu", "Phần B, từ đơn và cụm ngắn", [it for it in items if it["kind"] == "tu"])
        join(out, c, "vong1", "Vòng 1, 8 câu + 8 từ", [by_id[i] for i in ROUND1])
    write_playlists(out, letters, items, orders)
    write_page(out, letters, items, orders, out.name)

    audio = sum(r["duration_s"] for r in results)
    gen = sum(r["gen_s"] for r in results)
    summary = {
        "configurations": len(letters), "clips_per_configuration": len(items), "clips": len(results),
        "new_this_run": new, "load_s": round(load_s, 2), "wall_s_this_run": round(wall, 1),
        "audio_s": round(audio, 1), "gen_s": round(gen, 1), "rtf": round(gen / audio, 3) if audio else None,
        "peak_rss_mb_this_run": round(vieneu_vi.peak_rss_mb(), 1), "ort_threads": tts.engine.ort_intra_op_threads,
        "flagged": [{"code_letter": r["code_letter"], "id": r["id"], "flags": r["flags"]} for r in results if r["flags"]],
    }
    (keydir / "summary.json").write_text(json.dumps(summary, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({k: v for k, v in summary.items() if k != "flagged"}, ensure_ascii=False, indent=2))
    print(f"flagged clips: {len(summary['flagged'])} (details in {keydir / 'summary.json'})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
