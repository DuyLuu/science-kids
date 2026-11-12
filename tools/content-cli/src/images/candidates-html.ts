// candidates.html of `images search`: one row per Image (key, alt, brief, queries), up to 6
// candidates with hotlinked thumbnail, licence, author and a link to the source page. Picking a
// radio button per row builds the selection file JSON at the bottom (merged with the choices
// already in the file), ready to copy into content/images/…/<lesson>.json. Self-contained page:
// inline CSS and script, no library; only the thumbnails come from the sources.
// A composed brief (dev 10/11) gets one row with a candidate grid per part to find and a tick box
// per reused picture; "Hình ghép" builds { "composed": { "file", "parts" }, "title" } from them.
// A "[hình vẽ]" brief (dev 10/11) gets "Hình tự vẽ", which writes { "own": { "file", "method" }, "title" }.
import type { CandidateOut, CandidatesFile, ImageOut } from "./search.ts";
import type { Entry } from "./selection.ts";

const esc = (text: string) => text.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;");
/** JSON inside <script type="application/json">: no "</script>" or "<!--" can close it. */
const scriptJson = (value: unknown) => JSON.stringify(value).replace(/</g, "\\u003c").replace(/>/g, "\\u003e").replace(/&/g, "\\u0026");

function licenseClass(license: string): string {
  return license.startsWith("CC BY") ? "by" : "free";
}

function currentLine(current: Entry | undefined): string {
  if (!current) return "";
  if ("composed" in current) return `<p class="current">Đang chọn: hình ghép <code>${esc(current.composed.file)}</code> từ ${current.composed.parts.length} ảnh · ${esc(current.title)}</p>`;
  if ("own" in current) return `<p class="current">Đang chọn: hình tự vẽ <code>${esc(current.own.file)}</code> · ${esc(current.title)}</p>`;
  if ("same_as" in current) return `<p class="current">Đang chọn: dùng lại ảnh của <code>${esc(current.lesson ? `${current.lesson} ${current.same_as}` : current.same_as)}</code></p>`;
  return `<p class="current">Đang chọn: <a href="${esc(current.source_url)}" target="_blank" rel="noopener">${esc(current.title)}</a> · ${esc(current.author)} · ${esc(current.license)} · ${esc(current.source)}</p>`;
}

function row(image: ImageOut, index: number): string {
  const name = `pick-${index}`;
  const head = `<header><h3><code>${esc(image.key)}</code> ${esc(image.alt.vi)} <small>${esc(image.alt.en)}</small></h3>
${image.brief ? `<p class="brief">${esc(image.brief)}</p>` : ""}
${image.queries.length > 0 && !image.composed ? `<p class="queries">Tìm: ${image.queries.map((query) => `<span>${esc(query)}</span>`).join(" ")}${image.query_from === "alt" ? " <em>(từ alt.en: brief chưa có từ khoá)</em>" : ""}</p>` : ""}
${currentLine(image.current)}
${image.notes.length > 0 ? `<p class="notes">${image.notes.map(esc).join("<br>")}</p>` : ""}</header>`;
  // A reuse row with nothing chosen yet starts on "same_as"; every other row on "keep".
  const reuseFirst = image.reuse_of !== undefined && !image.current;
  const keep = `<label class="keep"><input type="radio" name="${name}" value="keep"${reuseFirst ? "" : " checked"}> ${image.current ? "Giữ lựa chọn cũ" : "Chưa chọn"}</label>`;
  if (image.reuse_of !== undefined) {
    return `<section class="item" data-index="${index}">${head}
<div class="choices">${keep}<label class="keep"><input type="radio" name="${name}" value="same_as"${reuseFirst ? " checked" : ""}> Dùng lại ảnh của <code>${esc(image.reuse_of)}</code></label></div></section>`;
  }
  if (image.composed) return composedRow(image, index, head, name);
  if (image.own) {
    return `<section class="item" data-index="${index}">${head}
<p class="composed-file">Hình tự vẽ: designer vẽ theo brief, xuất JPEG (cạnh dài ≤ 1024 px, sRGB, không metadata) vào <code>${esc(image.own.own.file)}</code>, rồi chọn dòng dưới; tên ở màn Nguồn hình: <i>${esc(image.own.title)}</i>.</p>
<div class="choices">${keep}<label class="keep"><input type="radio" name="${name}" value="own"> Hình tự vẽ (đã có file)</label></div></section>`;
  }
  const cards = cardsOf(image.candidates, name, "");
  const rejected = Object.entries(image.rejected);
  return `<section class="item" data-index="${index}">${head}
<div class="choices">${keep}</div>
<div class="grid">${cards || `<p class="empty">Không có ứng viên hợp giấy phép. Sửa "Từ khoá tìm ảnh (EN)" trong brief rồi chạy lại search với --key ${esc(image.key)}.</p>`}</div>
${rejected.length > 0 ? `<p class="rejected">Đã loại: ${rejected.map(([reason, n]) => `${esc(reason)} (${n})`).join(" · ")}</p>` : ""}
</section>`;
}

/** Composed brief: "keep" or "composed" for the row; under it a tick per reused picture and a grid per part to find. */
function composedRow(image: ImageOut, index: number, head: string, name: string): string {
  const composed = image.composed!;
  const reuses = composed.reuses
    .map((reuse, r) => `<label class="keep"><input type="checkbox" data-part="reuse" data-reuse="${r}" checked> Dùng lại ảnh của <code>${esc(reuse.of)}</code></label>`)
    .join("");
  const searches = composed.searches
    .map((part, j) => {
      const partName = `${name}-part-${j}`;
      const rejected = Object.entries(part.rejected);
      return `<h4>Ảnh cần tìm ${j + 1}${part.name ? `: ${esc(part.name)}` : ""} <small>${part.queries.map((query) => `<span>${esc(query)}</span>`).join(" ")}</small></h4>
${part.notes.length > 0 ? `<p class="notes">${part.notes.map(esc).join("<br>")}</p>` : ""}
<div class="choices"><label class="keep"><input type="radio" name="${partName}" value="none" data-part="search" checked> Không lấy</label></div>
<div class="grid">${cardsOf(part.candidates, partName, ' data-part="search"') || `<p class="empty">Không có ứng viên hợp giấy phép cho phần này.</p>`}</div>
${rejected.length > 0 ? `<p class="rejected">Đã loại: ${rejected.map(([reason, n]) => `${esc(reason)} (${n})`).join(" · ")}</p>` : ""}`;
    })
    .join("\n");
  return `<section class="item" data-index="${index}">${head}
<p class="composed-file">Hình ghép: designer ghép từ các ảnh đánh dấu dưới đây (sau <code>images fetch</code> chúng nằm ở <code>content/.images/</code>), lưu vào <code>${esc(composed.file)}</code>; tên ở màn Nguồn hình: <i>${esc(composed.title)}</i>.</p>
<div class="choices"><label class="keep"><input type="radio" name="${name}" value="keep" checked> ${image.current ? "Giữ lựa chọn cũ" : "Chưa chọn"}</label><label class="keep"><input type="radio" name="${name}" value="composed"> Hình ghép từ các ảnh đánh dấu</label></div>
${reuses ? `<div class="choices">${reuses}</div>` : ""}
${searches}
</section>`;
}

function cardsOf(candidates: CandidateOut[], name: string, extra: string): string {
  return candidates
    .map(
      (candidate, i) => `<label class="card">
<input type="radio" name="${name}" value="${i}"${extra}>
<img loading="lazy" referrerpolicy="no-referrer" src="${esc(candidate.thumb_url)}" data-full="${esc(candidate.file_url)}" alt="${esc(candidate.title)}" onerror="if(this.dataset.full&&this.src!==this.dataset.full){this.src=this.dataset.full}">
<span class="lic ${licenseClass(candidate.license)}">${esc(candidate.license)}</span>
<span class="meta"><b>${esc(candidate.title)}</b><br>${esc(candidate.author)} · ${esc(candidate.source)}${candidate.width && candidate.height ? ` · ${candidate.width}×${candidate.height}` : ""}<br><a href="${esc(candidate.source_url)}" target="_blank" rel="noopener">Trang gốc</a> · <span class="q">${esc(candidate.query)}</span></span>
</label>`,
    )
    .join("\n");
}

export function renderCandidatesHtml(file: CandidatesFile, current: Record<string, Entry>): string {
  const data = {
    selection_file: file.selection_file,
    current,
    images: file.images.map((image) => ({
      key: image.key,
      reuse: image.reuse_entry ?? null,
      own: image.own ?? null,
      picks: image.candidates.map((candidate) => candidate.selection),
      composed: image.composed
        ? { file: image.composed.file, title: image.composed.title, reuses: image.composed.reuses.map((reuse) => reuse.part), searches: image.composed.searches.map((part) => part.candidates.map((candidate) => candidate.selection)) }
        : null,
    })),
  };
  return `<!doctype html>
<html lang="vi"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Ứng viên ảnh · ${esc(file.lesson.slug)}</title>
<style>
:root { --bg: #f4ecd9; --paper: #fffaf0; --ink: #221d18; --muted: #6b6257; --line: #e3d8bf; --free: #3f7a33; --by: #b07a12; --accent: #a93a27; }
@media (prefers-color-scheme: dark) { :root { --bg: #1d1a16; --paper: #2a2621; --ink: #f1e9da; --muted: #b6aa98; --line: #3d372f; } }
* { box-sizing: border-box; }
body { margin: 0; background: var(--bg); color: var(--ink); font: 15px/1.5 -apple-system, system-ui, "Segoe UI", sans-serif; }
main { max-width: 1200px; margin: 0 auto; padding: 20px 16px 360px; }
h1 { font-size: 22px; margin: 0 0 4px; } .lead { color: var(--muted); margin: 0 0 12px; }
.item { background: var(--paper); border-radius: 12px; padding: 14px 16px; margin: 14px 0; }
.item h3 { margin: 0 0 4px; font-size: 17px; } .item h3 small { color: var(--muted); font-weight: 400; }
.brief, .queries, .notes, .current, .rejected { margin: 2px 0; font-size: 13px; } .brief, .rejected { color: var(--muted); }
.queries span { background: var(--bg); border-radius: 6px; padding: 0 6px; margin-right: 4px; }
.notes { color: var(--accent); } .current { font-weight: 600; }
.choices { margin: 6px 0; display: flex; gap: 16px; flex-wrap: wrap; font-size: 14px; }
.grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(180px, 1fr)); gap: 10px; }
.card { display: flex; flex-direction: column; gap: 4px; border: 2px solid transparent; border-radius: 10px; padding: 6px; cursor: pointer; }
.card:has(input:checked) { border-color: var(--accent); }
.card input { position: absolute; opacity: 0; }
.card img { width: 100%; aspect-ratio: 4 / 3; object-fit: cover; border-radius: 8px; background: var(--line); }
.lic { align-self: flex-start; color: #fff; border-radius: 6px; padding: 0 6px; font-size: 12px; font-weight: 600; }
.lic.free { background: var(--free); } .lic.by { background: var(--by); }
.meta { font-size: 12px; color: var(--muted); overflow-wrap: anywhere; } .meta b { color: var(--ink); font-weight: 600; }
.empty { color: var(--muted); font-size: 13px; }
.item h4 { margin: 10px 0 2px; font-size: 14px; } .item h4 small { color: var(--muted); font-weight: 400; }
.item h4 span { background: var(--bg); border-radius: 6px; padding: 0 6px; margin-right: 4px; }
.composed-file { margin: 4px 0; font-size: 13px; }
.panel { position: fixed; left: 0; right: 0; bottom: 0; background: var(--paper); border-top: 1px solid var(--line); padding: 10px 16px; }
.panel .bar { max-width: 1200px; margin: 0 auto; display: flex; gap: 10px; align-items: center; flex-wrap: wrap; font-size: 13px; }
.panel textarea { display: block; width: 100%; max-width: 1200px; margin: 8px auto 0; height: 220px; font: 12px/1.4 ui-monospace, Menlo, monospace; background: var(--bg); color: var(--ink); border: 1px solid var(--line); border-radius: 8px; padding: 8px; }
button { font: inherit; padding: 4px 12px; border-radius: 8px; border: 1px solid var(--line); background: var(--bg); color: var(--ink); cursor: pointer; }
code { font-size: 0.95em; }
</style></head><body><main>
<h1>Ứng viên ảnh: ${esc(file.lesson.title.vi)} <small>(${esc(file.lesson.title.en)})</small></h1>
<p class="lead">${esc(file.lesson.file)} · ${file.images.length} hình · nguồn ${esc(file.sources.join(", "))} · chỉ CC0, public domain, PDM, CC BY · tạo lúc ${esc(file.generated_at)}.
Ảnh hiện thẳng từ nguồn, chưa tải về. Trước khi chọn, mở <b>Trang gốc</b>: giấy phép đúng như ghi, không có mặt người nhận ra được (nhất là trẻ em), không logo, nhãn hiệu, huy hiệu cơ quan.
Tên ảnh hiện ở màn "Nguồn hình": ảnh CC0, public domain, PDM được sửa <code>title</code> cho trung tính (vd tên nước ngoài của Biển Đông); ảnh CC BY phải giữ tên gốc (fetch kiểm), nên ảnh biển, đảo ưu tiên CC0/PD.</p>
${file.images.map(row).join("\n")}
</main>
<div class="panel"><div class="bar"><b>File chọn ảnh:</b> <code>${esc(file.selection_file)}</code> <button type="button" id="copy">Chép JSON</button> <span id="status"></span></div>
<textarea id="out" spellcheck="false" readonly></textarea></div>
<script type="application/json" id="data">${scriptJson(data)}</script>
<script>
(() => {
  const data = JSON.parse(document.getElementById("data").textContent);
  const out = document.getElementById("out");
  function build() {
    const images = {};
    const order = data.images.map((image) => image.key);
    for (const [key, entry] of Object.entries(data.current)) if (!order.includes(key)) images[key] = entry;
    data.images.forEach((image, index) => {
      const chosen = document.querySelector('input[name="pick-' + index + '"]:checked');
      const value = chosen ? chosen.value : "keep";
      if (value === "keep") { if (data.current[image.key]) images[image.key] = data.current[image.key]; }
      else if (value === "same_as") images[image.key] = image.reuse;
      else if (value === "own") images[image.key] = image.own;
      else if (value === "composed") {
        const row = document.querySelector('.item[data-index="' + index + '"]');
        const parts = [];
        row.querySelectorAll('input[data-reuse]:checked').forEach((box) => parts.push(image.composed.reuses[Number(box.dataset.reuse)]));
        image.composed.searches.forEach((picks, j) => {
          const part = row.querySelector('input[name="pick-' + index + '-part-' + j + '"]:checked');
          if (part && part.value !== "none") parts.push(picks[Number(part.value)]);
        });
        if (parts.length > 0) images[image.key] = { composed: { file: image.composed.file, parts }, title: image.composed.title };
        else if (data.current[image.key]) images[image.key] = data.current[image.key];
      }
      else images[image.key] = image.picks[Number(value)];
    });
    out.value = JSON.stringify({ images }, null, 2) + "\\n";
  }
  document.addEventListener("change", (event) => {
    // Picking a part of a composed picture chooses "Hình ghép" for its row.
    const part = event.target.closest && event.target.dataset && event.target.dataset.part;
    if (part) {
      const row = event.target.closest(".item");
      const radio = row && row.querySelector('input[value="composed"]');
      if (radio) radio.checked = true;
    }
    build();
  });
  document.getElementById("copy").addEventListener("click", async () => {
    try { await navigator.clipboard.writeText(out.value); document.getElementById("status").textContent = "Đã chép"; }
    catch { out.select(); document.getElementById("status").textContent = "Bấm Cmd+C để chép"; }
  });
  build();
})();
</script>
</body></html>
`;
}
