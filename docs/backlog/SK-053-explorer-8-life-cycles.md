# SK-053 · Explorer #8 "Lớn lên" (Life cycles, 6 bài), thay 5 bài Oak của `new-life`

Trạng thái: review (19/11, PM nghiệm thu, chờ Duy review và commit; xem "Nghiệm thu PM 19/11" và "Còn mở cho Duy" ở cuối) · Ngày: 2026-11-18 · Phụ trách: dev (danh mục, test đếm) · content-editor (soạn) · designer (ảnh, nhãn icon) · ios-dev (khoá thẻ, test đếm; **chờ SK-052 xong**) · phiên chính chạy lệnh · Tester: tester
Nguồn: Duy 18/11 (chốt chủ đề vòng đời, bốn chặng, cách nói về cái chết, ba nhóm con vật, danh sách và thứ tự 6 bài; bỏ Oak L1 thành bài riêng; chế độ auto, chốt theo khuyến nghị PM); [docs/syllabus-review-2026-11-18.md](../syllabus-review-2026-11-18.md) mục 2 (nguyên tắc N) và mục 4.1 (#8); [docs/oak/new-life.md](../oak/new-life.md) (ý chính, misconception từng lesson); `content/syllabus.json` (key `new-life`, Explorer #10); `packages/content-schema/scripts/lib/syllabus.mjs` (luật `extension`, luật mỗi slug Oak một bài); `content/TEMPLATE.md`; `content/rules.json` (`explorer.authoring`); SK-051 (khuôn gần nhất)

> **Chốt 18/11.** Duy chốt nội dung và 6 bài. Các quyết định danh mục, misconception, hình dưới đây PM chốt theo chế độ auto; Duy xem lại khi review. Phần còn lại của lộ trình 18/11 (bỏ vật liệu, *Em khoẻ mạnh*, ba chủ đề Trái Đất mới) **vẫn chờ Duy chốt**; ticket này chỉ làm #8. *(Sửa 19/11: Duy chốt phần Explorer theo cách (a); B1 "bỏ hết" đã chốt từ 18/11. Danh mục đổi ở [SK-057](SK-057-explorer-catalog-earth-sky.md), chủ đề này thành #8.)*

## Mục tiêu

Bé Explorer 5–7 tuổi thấy vật sống nào cũng đi qua bốn chặng sinh ra, lớn lên, có con, già đi; nhận ra ba cách con vật bắt đầu cuộc đời (đẻ con, nở từ trứng, đổi hình dạng), thấy cây cũng có vòng đời, và biết con vật nào, kể cả người, cũng cần thức ăn, nước và không khí để lớn lên.

## Phạm vi / Ngoài phạm vi

### Phạm vi

- **Danh mục** (`content/syllabus.json`):
  - Giữ key `new-life`, `number: 10`, `source` giữ nguyên (`kind: oak`, `unit_slug: new-life`, `year: 2`, `unit_index: 3`), `strand: plants_animals`, `level: 2`. Đổi `title` thành **"Life cycles" · "Lớn lên"**. Lý do giữ key và giữ số 10: "Quyết định đã ghi" mục 1, 2.
  - Thay 5 bài cũ bằng 6 bài ở bảng dưới (tên EN/VI đúng từng chữ). Bài 1, 2, 4, 6 `statutory: true`. Bài 3, 5 `oak_lessons: []`, `statutory: false`, `extension: true` (lý do bài 3: "Quyết định đã ghi" mục 3).
  - Số đếm: Explorer 11 chủ đề / 71 → **72** bài; cả app 44 chủ đề / 382 → **383** bài; 34 unit Oak không đổi.
- **Chủ đề** `content/explorer/lon-len/`: `_topic.md` và 6 bài. Tên bài là tên danh mục; content-editor không tự đổi.

  | # | Bài (EN · VI) | "I can…" (EN · VI) | `oak_lessons` | `stage` | Misconception (câu 6) |
  | --- | --- | --- | --- | --- | --- |
  | 1 | Living things have life cycles · Vật sống nào cũng có vòng đời | I can name the stages of a life cycle. · Em kể được các chặng của vòng đời. | `animal-life-cycles` (Oak L3) | `opener` | `life_cycle_two_stages` |
  | 2 | Animals that give birth · Con vật đẻ con | I can tell how baby animals and people grow up. · Em kể được con non và em bé lớn lên thế nào. | `young-animals`, `growing-up` (Oak L1, L2) | `core` | `grown_ups_never_babies` |
  | 3 | Animals that lay eggs · Con vật đẻ trứng | I can put the life cycle of a hen in order. · Em xếp được vòng đời của con gà. | — (`extension: true`; ý lấy từ Oak L3) | `core` | `egg_hatches_adult` |
  | 4 | Animals that change shape · Con vật đổi hình dạng | I can tell how a frog and a butterfly change. · Em kể được con ếch, con bướm đổi hình dạng ra sao. | `changes-in-animal-life-cycles` (Oak L4) | `core` | `young_look_like_parents` |
  | 5 | The life cycle of a plant · Vòng đời của cây | I can put the life cycle of a plant in order. · Em xếp được vòng đời của cây. | — (`extension: true`, bài mới) | `apply` | `seeds_not_from_plants` |
  | 6 | What animals need to grow · Muốn lớn lên, con vật cần gì? | I can say what all animals need to grow. · Em biết con vật nào cũng cần thức ăn, nước và không khí. | `the-basic-needs-of-animals` (Oak L5) | `review` | `animals_need_different_things` |

- File chọn ảnh `content/images/explorer/lon-len/*.json`. Giữ icon `new-life.svg`; sửa nhãn ở hai file thiết kế.
- Phiên chính chạy `validate`, `ids`, `images fetch`, `tts`, `build`, `check-pack`; chạy thử một bài trên iPhone 16.

### Bảng soạn

**`_topic.md`:**
- `age_group: explorer`, `order: 10` (khớp danh mục; xem "Quyết định đã ghi" mục 2), `strand: plants_animals`, `level: 2`.
- `difficulty`: content-editor chấm theo `syllabus-progression.md` mục 3 và ghi lý do. Điểm cũ của *Sự sống mới* là 2-2-1-2-1 (Mức 2). Nếu ra Mức khác 2, ghi lý do và báo dev sửa `level` cùng lượt ghi id.
- `prerequisites: [goi-ten-va-nhom-dong-vat, sinh-vat-song-o-dau, cay-quanh-em]` (nhóm con vật, đẻ trứng, bú sữa; vật sống lớn lên; hạt, hoa, quả).
- `is_free: false`, `sensitive: false` (xem "Quyết định đã ghi" mục 7), `ai_draft: true`, `oak_unit_ref: new-life`.
- Câu hỏi lớn: "How do living things grow and change?" · "Vật sống lớn lên và thay đổi thế nào?".
- Thẻ thưởng: bộ mới `set: life_cycles` (ios-dev thêm khoá `collectible.set.life_cycles` "Life cycle cards" · "Thẻ vòng đời").
- Mục Nguồn ghi câu Duy 18/11 ("sinh lão bệnh tử", bỏ "bệnh"; ba nhóm con vật; cái chết nói nhẹ nhàng) và slug Oak từng bài. Mục "Lệch so với sườn" ghi:
  - Oak L1 *Young animals* không thành bài riêng (Duy bỏ 18/11): ý "con giống mẹ" vào bài 2, ý "con không giống mẹ" vào bài 4; slug gắn ở bài 2;
  - bài 2 gộp L1, L2; ví dụ người lấy từ L3;
  - bài 1 và bài 3 cùng lấy ý từ L3; slug chỉ gắn bài 1, bài 3 là bài mở rộng (validator buộc mỗi slug một bài);
  - L4 bỏ phần "ghi lại bằng ảnh, nhật ký, theo dõi nhiều ngày";
  - thêm bài 5 vòng đời cây (không có trong unit Oak);
  - đổi thứ tự: ý chung (L3) lên đầu.

**Bốn chặng và cách nói** (áp dụng mọi bài):
- Bốn chặng trong chữ bé nghe: **sinh ra · lớn lên · có con · già đi** ("born · grow · have young · grow old"). Chặng 3 nói "có con" (con vật), "ra hạt" (cây); không dùng "sinh sản", "reproduce", "offspring" trong chữ bé nghe (dòng `>` và ghi chú thì được).
- "Chết" ("die"): chỉ nói ở bài 1 và bài 5, gắn với cây hoặc "vật sống" nói chung, câu nối liền với "con non, hạt mới lại bắt đầu một vòng mới". Không nói con người, ông bà, thú cưng chết. Không câu hỏi nào có đáp án là cái chết của con vật.
- Không nói con vật nào cũng có con: dùng "con vật lớn lên rồi có con", không dùng "every animal has babies", "con nào cũng đẻ" (có con vật không có con).
- Vòng đời là một vòng: hình Học có thể là vòng tròn; câu `order_sequence` luôn 3 thẻ, đi theo một đoạn thẳng bắt đầu từ chặng sinh ra (trứng, hạt, con mới sinh), không bắt đầu giữa vòng.

| Bài | Ý chính (EN · VI) | Misconception: câu sai · câu sửa · nguồn | Vật, cảnh trong bài | Ảnh mới chính (từ khoá EN) | Dùng lại |
| --- | --- | --- | --- | --- | --- |
| 1 · Vật sống nào cũng có vòng đời | 1. Living things are born and grow. · Vật sống sinh ra rồi lớn lên.<br>2. They have young, then grow old. · Lớn rồi có con, rồi già đi.<br>3. The young start a new life cycle. · Con non lại bắt đầu một vòng mới. | "Animals are only babies or grown-ups." · "Con vật chỉ có hai lúc: lúc nhỏ và lúc lớn." → "Animals are born, grow, have young, grow old." · "Con vật sinh ra, lớn lên, có con, rồi già đi." Nguồn: Oak L3 *Animal life cycles* (misconception "chỉ có hai chặng"). Phương án khác `animals_stay_young` | Một con chó qua bốn chặng: chó con mới sinh, chó con chạy chơi, chó mẹ với đàn con, chó già mõm bạc. Một cây qua bốn chặng (giới thiệu, bài 5 dạy kỹ). Chặng cuối với cây: cây già, lá vàng rụng | `newborn puppies` · `puppy playing` · `mother dog with puppies` · `old dog grey muzzle` · `old tree fallen leaves` | Lá rụng, khúc gỗ của *Sinh vật sống ở đâu?* bài 3 (`dead`); lá vàng mùa thu của *Thời tiết và các mùa* bài 3 (content-editor tìm key) |
| 2 · Con vật đẻ con | 1. Kittens and piglets are born from mum. · Mèo con, lợn con do mẹ đẻ ra.<br>2. Babies drink milk and grow up. · Con non bú sữa rồi lớn lên.<br>3. People grow up, too. · Người cũng lớn lên như vậy. | "Grown-ups were never babies." · "Người lớn chưa bao giờ là em bé." → "Every grown-up was a baby once." · "Người lớn nào cũng từng là em bé." Nguồn: Oak L3 (ví dụ người: em bé → trẻ em → người lớn → người già), L2 *Growing up*. Phương án khác `young_same_colour_as_mum` (Oak L1: con nào cũng giống hệt mẹ) | Mèo, chó, trâu, lợn: mẹ và con. Mèo con đổi dần thành mèo lớn; một đàn mèo con có con giống mẹ, có con khác màu mẹ (ý L1). Người: em bé → trẻ em → người lớn → ông bà | `piglets nursing sow` · `water buffalo calf with mother` · `litter of kittens different colours` · `kitten to adult cat` · chuỗi người (xem "Quyết định đã ghi" mục 8) | Mèo mẹ cho con bú `explore_milk`, nghé, mèo con của *Gọi tên và nhóm động vật* bài 1, 2; chó của bài 1 chủ đề này |
| 3 · Con vật đẻ trứng | 1. Hens, ducks, turtles and fish lay eggs. · Gà, vịt, rùa, cá đẻ trứng.<br>2. A chick hatches from an egg. · Gà con nở ra từ quả trứng.<br>3. The chick grows into a hen. · Gà con lớn thành gà mái, lại đẻ trứng. | "A big hen hatches out of an egg." · "Từ quả trứng nở ra ngay con gà mái to." → "A small chick hatches from an egg." · "Từ quả trứng nở ra một chú gà con bé xíu." Nguồn: PM (ý vòng đời gà của Oak L3). Phương án khác `only_birds_lay_eggs` (đã dạy một phần ở *Gọi tên và nhóm động vật* bài 3, 4 nên để phương án phụ) | Ổ trứng gà, gà con đang chui ra khỏi vỏ, gà con lông tơ, gà mái; vịt mẹ dẫn đàn vịt con; rùa biển con bò ra biển; trứng cá, cá con | `chick hatching from egg` · `fluffy chicks` · `hen with chicks` · `duck with ducklings` · `sea turtle hatchlings beach` · `fish eggs` · `fish fry` | Ổ trứng gà `explore_eggs`, trứng rùa trong cát của *Gọi tên và nhóm động vật* bài 3 |
| 4 · Con vật đổi hình dạng | 1. Some babies look like their parents. · Có con non giống bố mẹ.<br>2. A tadpole grows into a frog. · Nòng nọc lớn lên thành con ếch.<br>3. A caterpillar becomes a butterfly. · Con sâu này lớn lên thành con bướm. | "A baby animal always looks like its parents." · "Con non nào cũng giống bố mẹ." → "A tadpole does not look like a frog." · "Nòng nọc không giống con ếch." Nguồn: Oak L2 *Growing up* (misconception: con non là bản thu nhỏ của bố mẹ; ví dụ sâu/bướm, nòng nọc/ếch). Phương án khác `caterpillar_is_a_worm` | Ếch: trứng → nòng nọc → ếch con còn đuôi → ếch. Bướm cải trắng: trứng → sâu → nhộng → bướm (cùng một loài ở mọi hình). So với bài 2, 3: mèo con, gà con giống mẹ hơn | `frog tadpole legs` · `froglet with tail` · `Pieris rapae eggs` · `Pieris rapae chrysalis` · `cabbage white butterfly` | Trứng ếch, nòng nọc, ếch của *Gọi tên và nhóm động vật* bài 4 (q4); sâu bướm cải trắng của *Chuỗi thức ăn* bài 2 (và thẻ thưởng con bướm nếu có) |
| 5 · Vòng đời của cây | 1. A seed grows into a young plant. · Hạt mọc thành cây con.<br>2. The plant flowers and makes seeds. · Cây ra hoa, kết quả có hạt.<br>3. Old plants die, seeds grow new ones. · Cây già rồi chết, hạt mọc thành cây mới. | "Seeds do not come from plants." · "Hạt không phải do cây làm ra." → "Seeds grow inside the fruit of a plant." · "Hạt nằm trong quả của cây." Nguồn: PM (Oak *Growing plants* L1 starter quiz: hạt từ cây). Phương án khác `trees_live_forever` | Một cây đi trọn vòng: cây đậu (gợi ý: hạt đậu → cây đậu con → hoa đậu → quả đậu có hạt → cây đậu khô cuối vụ). Thêm: cà chua bổ đôi thấy hạt; cây to già, lá vàng rụng | `bean plant flowers` · `bean pods seeds` · `dry bean plants end of season` · `tomato cut in half seeds` · `old tree` | Hạt đậu nảy mầm, cây con (*Cây quanh em* bài 1); nụ → hoa → quả (bài 4); hạt (bài 5) |
| 6 · Muốn lớn lên, con vật cần gì? | 1. Animals need food, water and air. · Con vật cần thức ăn, nước và không khí.<br>2. They eat different food. · Mỗi con ăn một món khác nhau.<br>3. People need the same things, too. · Người cũng cần những thứ đó. | "Each animal needs different things to live." · "Mỗi con vật cần những thứ khác nhau để sống." → "All animals need food, water and air." · "Con vật nào cũng cần thức ăn, nước và không khí." Nguồn: Oak L5 *The basic needs of animals*. Phương án khác `animals_need_no_air` | Trâu ăn cỏ, mèo ăn cá, gà mổ thóc: món khác nhau, cùng cần ăn. Con vật uống nước. Thở: chó thở hổn hển, bé thổi bong bóng. Bài `review`: Khởi động ôn trộn bài 1–5 | `dog drinking water` · `chicken pecking grain` · `dog panting` · `child blowing bubbles` (không rõ mặt) | Trâu ăn cỏ, mèo, gà của *Chuỗi thức ăn* bài 1, *Gọi tên và nhóm động vật* bài 6 (content-editor tìm key) |

**Từ vựng gợi ý** (content-editor chốt, mỗi bài 4–5 từ, 2–3 `core`):
- bài 1: life_cycle, born · grow, old;
- bài 2: baby, adult · kitten, piglet;
- bài 3: egg, hatch · chick, duckling;
- bài 4: tadpole, caterpillar, butterfly · chrysalis;
- bài 5: seedling · (từ chặng cây);
- bài 6: air, need · breathe.

Từ đã là `term_keys` ở chủ đề khác (grep 18/11): `seed` (#7 bài 1), `fruit` (#7 bài 5), `milk` (#1 bài 2), `food` (#3 bài 1), `water` (#7 bài 2), `dead`, `alive` (#2 bài 2, 3), `change` (#5 bài 6). Dùng lại thì thêm dòng `>` ghi trùng có chủ ý. Grep lại `^term_keys:` trước khi chốt (SK-051 đang soạn song song).

**Câu `order_sequence` gợi ý** (3 thẻ, đúng một thứ tự):
- bài 1: chó con mới sinh → chó con lớn → chó già;
- bài 2: em bé → trẻ em → người lớn (không xếp ông bà ở thẻ cuối với ý "sau đó là chết");
- bài 3: trứng → gà con → gà mái. **Khác** `goi-ten-va-nhom-dong-vat/03` q4 (trứng, gà con, gà mái): đổi sang vịt (trứng vịt → vịt con → vịt lớn) hoặc rùa, hoặc ghi rõ dòng `>` vì sao lặp;
- bài 4: sâu → nhộng → bướm. Không lặp `goi-ten-va-nhom-dong-vat/04` q4 (trứng ếch → nòng nọc → ếch);
- bài 5: hạt → cây con → cây ra hoa (hoặc hoa → quả → hạt).

**Khởi động** (mọi câu có `recall_from`):
- bài 1: một câu ôn *Sinh vật sống ở đâu?* bài 1 hoặc 2 (vật sống lớn lên);
- bài 2: một câu ôn *Gọi tên và nhóm động vật* bài 2 (con non bú sữa);
- bài 3: một câu ôn *Gọi tên và nhóm động vật* bài 3 (chim đẻ trứng);
- bài 4: một câu ôn *Gọi tên và nhóm động vật* bài 4 hoặc *Chuỗi thức ăn* bài 2 (sâu ăn lá cải);
- bài 5: một câu ôn *Cây quanh em* bài 1 hoặc 4;
- bài 6: ôn trộn bài 1–5, cộng một câu ôn chủ đề cách khoảng một tháng.

**Ranh giới với bài đã soạn** (mỗi ý chỉ dạy một lần trong nhóm, nguyên tắc N4):
- *Gọi tên và nhóm động vật* bài 2 đã dạy "con non của động vật có vú bú sữa mẹ", "trâu đẻ con, không đẻ trứng"; bài 3 "chim đẻ trứng, phần lớn bò sát cũng vậy", rùa đẻ trứng trong cát, cá sấu đẻ trứng; bài 4 cá, ếch đẻ trứng trong nước, chuỗi trứng ếch → nòng nọc → ếch. Bài 2–4 ở đây nhắc lại (Khởi động, một câu Học), phần mới là **lớn lên qua các chặng** và **vòng quay lại**; không dùng lại các câu hỏi đó.
- *Chuỗi thức ăn* bài 1 đã dạy "con vật cần thức ăn để sống và lớn lên"; *Sinh vật sống ở đâu?* bài 3 "vật sống cần nước"; *Cây quanh em* bài 2 cây cần gì. Bài 6 thêm **không khí** và **nhu cầu giống nhau dù món ăn khác nhau**; không dạy lại nơi sống, chuỗi thức ăn, nhu cầu của cây. Gắn với `all_animals_eat_same` (#1 bài 6): món khác nhau, nhu cầu giống nhau; không dùng lại key đó.
- *Cây quanh em* bài 1 dừng ở hạt → cây con, bài 4 ở nụ → hoa → quả. Bài 5 nối hai đoạn đó thành một vòng và thêm chặng già đi; không dạy lại bộ phận cây.
- *Chuỗi thức ăn* bài 2 có sâu bướm cải trắng ăn lá cải. Bài 4 dùng **đúng loài đó** cho cả bốn hình (trứng, sâu, nhộng, bướm) và nói "con sâu này", vì nhiều loài sâu thành bướm đêm (dòng `[CẦN KIỂM]` ở `chuoi-thuc-an/02:600`).
- Cá: *Gọi tên và nhóm động vật* bài 4 nói "cá cần nước để thở". Bài 6 không lấy cá làm câu hỏi về không khí; nếu nhắc, chỉ một câu khớp ý đó.

### Ngoài phạm vi

- Giao phối, thụ tinh, mang thai, cảnh sinh nở; thụ phấn, hạt phát tán (để dành Discoverer, Scientist *Sinh sản ở động vật*, *Cây sống thế nào?*).
- Bệnh tật, cái chết của người, của thú cưng; xác con vật; giết mổ (lợn, gà ở chợ, món ăn từ con vật trong bài).
- Trứng ăn ở nhà có nở được không; trứng lộn (hột vịt lộn); ấp trứng bằng máy.
- Quan sát, ghi lại vòng đời nhiều ngày, nuôi nòng nọc, nuôi sâu (Oak L4 phần ghi lại; bỏ như SK-051 bỏ các bài trồng cây).
- Con vật ngoại lệ: thú đẻ trứng (thú mỏ vịt), cá đẻ con (cá bảy màu), con vật sinh sản không cần đôi; tuổi thọ, số năm sống.
- Mọi thay đổi khác của lộ trình 18/11 (bỏ *Vật liệu quanh em*, *Vật liệu dùng làm gì?*, *Em khoẻ mạnh*; thêm ba chủ đề Trái Đất và bầu trời; Discoverer, Scientist), chờ Duy chốt cả bản rà. *(19/11: phần Explorer Duy chốt, làm ở SK-057; Discoverer, Scientist vẫn chờ.)*
- Dạng câu mới, màn app mới.

## Tiêu chí nghiệm thu

### Bước 0 · danh mục (dev)
- [x] `content/syllabus.json`:
  - Explorer #10 key `new-life`, `title` "Life cycles" · "Lớn lên", `source` giữ nguyên, `strand: plants_animals`, `level: 2`;
  - đúng 6 bài, thứ tự, tên EN/VI, `oak_lessons`, `statutory` như bảng "Phạm vi"; bài 3, 5 `extension: true`;
  - năm slug Oak của unit đều có mặt, mỗi slug một bài; #1–#9, #11 không đổi; `topic_id`, `lesson_id` các chủ đề đã soạn còn nguyên; `syllabus_version` giữ như SK-051;
  - đếm máy: Explorer 11 chủ đề / 72 bài; cả app 44 / 383.

  Kiểm bằng:
  - `validate content`: 0 lỗi, dòng tổng "3 nhóm, 44 chủ đề, 383 bài";
  - `tools/content-cli/test/syllabus.test.ts` dòng 95, 101, 109 và chú thích `src/markdown/syllabus.ts:51`, ví dụ ở `tools/content-cli/README.md`: 382 → 383;
  - `packages/content-schema/test/syllabus.test.mjs` dòng 302–314: Explorer `["explorer", 11, 72]`, tổng 383, chú thích SK-053;
  - `npm --prefix tools/content-cli test`, `npm --prefix packages/content-schema test` xanh.
- [x] Không đổi luật validator. Không đụng các file của phiên khác ở "Phụ thuộc".

> **Ghi chú dev 18/11 (Bước 0 xong):**
> - `content/syllabus.json`: chỉ khối `new-life` đổi (đổi `title`, thay `lessons` bằng 6 bài đúng bảng "Phạm vi"; bài 3, 5 `oak_lessons: []`, `statutory: false`, `extension: true`). Ghi bằng `json.dumps(ensure_ascii=False, indent=2) + '\n'`; trước khi sửa đã kiểm file round-trip khớp từng byte, nên #1–#9, #11, `syllabus_version`, mọi `topic_id`/`lesson_id` giữ nguyên. Khối cũ không có `topic_id`/`lesson_id` nào (chưa soạn), không mất id. 6 bài mới chưa có `lesson_id`; phiên chính gắn sau `ids`.
> - Test đếm, chú thích: `tools/content-cli/test/syllabus.test.ts` (dòng 95, 101, 109), `tools/content-cli/src/markdown/syllabus.ts:51`, `tools/content-cli/README.md:348`: 382 → 383. `packages/content-schema/test/syllabus.test.mjs`: Explorer `["explorer", 11, 72]`, tổng 383, chú thích SK-053. `packages/content-schema/README.md` không ghi số đếm nào, không sửa.
> - Kết quả: `npm --prefix packages/content-schema test` 163/163 pass; `npm --prefix tools/content-cli test` 399/399 pass; `validate content` exit 0, 0 lỗi, 0 cảnh báo `syllabus_*`, dòng tổng "3 nhóm, 44 chủ đề, 383 bài; 86 bài có lesson_id" (lúc chạy `content/explorer/lon-len/` chưa có).
> - Không đụng `apps/ios`, `image-slots.json`, `aspect.test.ts`, `content/images/…`, luật validator. `content/.build/syllabus-vi*.tsv` để nguyên.

### content-editor
- [x] `_topic.md` đúng frontmatter và các mục như "Bảng soạn"; đủ các mục như `cay-quanh-em/_topic.md`: Nguồn, Tên gọi, Quy ước hình, Hình dùng chung, Đúng/Sai, Khởi động, Chơi, Thẻ thưởng, An toàn, Ranh giới, Lệch so với sườn, Còn mở. *(Đạt: tester rà chữ lượt 1, sổ sách `_topic.md` A9 lượt 1 và lượt 2. `difficulty` chấm 11 điểm, lệch `level: 2`: đưa vào "Còn mở cho Duy".)*
- [x] Đúng 6 bài, đúng thứ tự và `stage`; tên bài EN/VI khớp `content/syllabus.json` từng chữ. *(Đạt: tester lượt 1, mục "Đã kiểm bằng máy", danh mục.)*
- [x] Mỗi bài theo luật Explorer *(đạt: tester lượt 1; DOK `1·1·1·2·2·2`, một misconception ở q6, sáu key mới không trùng 46 key cũ; Khởi động 2–3 câu có `recall_from`)*:
  - Khởi động 2–3 câu DOK 1, chỉ `single_choice`, `true_false`, câu nào cũng có `recall_from`;
  - Quiz 6 câu, DOK 1·1·1·2·2·2;
  - đúng một câu misconception ở câu 6, key ở bảng "Phạm vi" (hoặc phương án khác ở "Bảng soạn", ghi lý do trong `_topic.md`); mỗi key dùng một lần; không trùng key của các chủ đề Explorer đã soạn (47 key lúc PM đếm 18/11, grep `^misconception:` trong `content/explorer/`), đặc biệt `all_animals_eat_same`, `people_not_animals`, `humans_not_animals`, `trees_not_from_seeds`;
  - chỉ `single_choice` (2–3 lựa chọn), `true_false`, `order_sequence` (3 thẻ); mỗi bài ít nhất hai dạng;
  - mỗi câu EN tối đa 8 từ; `true_false` là câu khẳng định, không `labels`.
- [x] Câu 6 ưu tiên `true_false` đáp án Sai; `explanation_correct` là câu sửa, đứng một mình được. Các câu `true_false` khác cân Đúng/Sai trong chủ đề; có bảng Đúng/Sai ở `_topic.md`. *(Đạt: 27 câu `true_false`, 12 Đúng / 15 Sai, bỏ q6 thì 12/9; khớp bảng `_topic.md`.)*
- [x] Khởi động và `order_sequence` theo "Bảng soạn"; bài 3, bài 4 không lặp câu `order_sequence` của *Gọi tên và nhóm động vật* bài 3, 4 (hoặc có dòng `>` giải thích). *(Đạt: bài 3 q4 là vịt, bài 4 q4 là sâu → nhộng → bướm.)*
- [x] Cách nói về vòng đời theo "Bốn chặng và cách nói". *(Đạt: tester lượt 1 grep 0 kết quả trong chữ bé nghe; "die"/"chết" đúng ba chỗ, cả ba gắn với cây.)* Grep chữ bé nghe (EN và VI):
  - 0 kết quả "offspring", "reproduc", "sinh sản", "mate", "giao phối", "thụ tinh", "fertili", "pregnan", "mang thai", "pollen", "pollinat", "thụ phấn";
  - "die", "dead", "chết" chỉ có ở bài 1, 5 và chỉ gắn với cây hoặc "vật sống"; 0 kết quả gắn với người, ông bà, chó, mèo, thú cưng; 0 kết quả "kill", "giết", "xác";
  - 0 kết quả "every animal has babies", "con nào cũng đẻ", "con vật nào cũng có con".
- [x] Bài 2: nói "em bé uống sữa" cho người (không phán xét bú mẹ hay bú bình); không giả định bé có đủ bố mẹ (dùng "người lớn", "mẹ" của con vật, "ông bà" chung). *(Đạt: `_topic.md` mục Gia đình; ví dụ từ `adult` đã bỏ "cô giáo" theo tester N5.)*
- [x] Bài 3: cá chỉ nói "nhiều loài cá đẻ trứng" hoặc nêu tên loài đẻ trứng; 0 kết quả "cá bảy màu", "guppy", "trứng lộn", "balut". *(Đạt: tester lượt 1 grep. C1, câu VI q5 "Con non nào cũng…", đã sửa thành "Còn con non nào nở ra từ trứng nữa?")*
- [x] Bài 4: dùng "nhộng" · "chrysalis"; 0 kết quả "kén", "cocoon" (kén là của tằm, bướm đêm). Câu về sâu nói "con sâu này", không "con sâu nào cũng thành bướm". *(Đạt; N2 sửa thành "This butterfly lays eggs on cabbage.")*
- [x] Bài 5: không dùng chuối, dứa làm ví dụ "quả có hạt"; không giải thích thụ phấn ("hoa thành quả" là đủ). *(Đạt: tester lượt 1.)*
- [x] Từ vựng 4–5 từ mỗi bài, 2–3 `core`, khớp `word_list.term_keys`; từ trùng chủ đề khác có dòng `>`. *(Đạt: validate 0 lỗi; tester lượt 1.)*
- [x] SK-044: mọi lựa chọn sai có `feedback` một câu, tối đa 8 từ EN, nói về chính vật bé chọn; `true_false` có `feedback_true` hoặc `feedback_false` đúng phía. *(Đạt: c14, `feedback` 11 từ của `q5_mango`, đã rút còn 7 từ ở content-editor lượt 6.)*
- [x] SK-047: `hint`, `feedback`, giải thích không nhắc vị trí thẻ; `hint` không gần như nói đáp án. *(Đạt: N4, gợi ý bài 4 q4, đã đổi sang tả thẻ nhộng.)*
- [x] An toàn: không câu nào rủ bé bắt, sờ sâu (sâu róm gây ngứa), ếch, nòng nọc, trứng chim ngoài tự nhiên; có lời rửa tay sau khi chạm con vật (một lần trong chủ đề). *(Đạt: bài 2 ô Kittens "wash your hands after petting them"; bài 4 ô Caterpillar "look, but do not touch it".)*
- [x] Mọi sự thật chưa chắc có dòng `> [CẦN KIỂM]` ngay dưới; danh sách chép vào "Câu hỏi còn mở" của ticket. *(Đạt: 35 dòng trong sáu bài cộng 3 dòng ở `_topic.md`; validate báo 7 cảnh báo `[CẦN KIỂM]`. Tester lượt 1 tóm tắt từng nhóm ý ở mục "Các dòng `[CẦN KIỂM]`"; ticket không chép lại nguyên văn, danh sách đầy đủ lấy bằng grep `\[CẦN KIỂM\]` trong `content/explorer/lon-len/`. Thêm dòng cho công dụng thở hổn hển (N1) ở `06:172`.)*
- [x] "Ghi chú cho hoạ sĩ" mỗi bài liệt kê ảnh mới, ảnh dùng lại, ảnh khó. *(Đạt: designer dựng 207/207 chỗ có hình từ các ghi chú này.)*
- [x] Sửa ghi chú cũ *(đạt: tester lượt 1, tám ghi chú cũ đã đổi sang *Lớn lên*; chỉ còn ở `content/.build/syllabus-vi*.tsv`, để nguyên như SK-051)* (dòng `>`, mục Ghi chú, Ranh giới; **không** phải chữ bé nghe) đang trỏ tới *Sự sống mới* thành *Lớn lên* (Explorer #10 trong danh mục): `goi-ten-va-nhom-dong-vat/_topic.md:385`, `03-chim-va-bo-sat.md:445`; `noi-song-tren-trai-dat/02-nam-cuc.md:23, 613`, `_topic.md:715`; `chuoi-thuc-an/02-chuoi-thuc-an-la-gi.md:600`; `cay-quanh-em/_topic.md:430, 433` (ghi: vòng đời cây ở mức **thấy** nằm ở *Lớn lên* bài 5; Discoverer giữ phần vì sao). Không chạy lại `tts`.

### designer
- [x] Mọi chỗ có hình (câu hỏi, lựa chọn, thẻ `order_sequence`, món Chơi, ô Học, từ, thẻ thưởng) có mục trong file chọn ảnh; 0 chỗ trống, 0 key trùng. *(Đạt: tester lượt 4, 207 chỗ ↔ 207 mục, 0 thiếu/thừa/trùng, 0 `same_as` hai chặng.)*
- [x] Ảnh nguồn ngoài chỉ CC0, PD, PDM hoặc CC BY có ghi công; 0 BY-SA, NC, ND hay không rõ giấy phép; đã mở trang gốc kiểm. `images fetch content/images/explorer/lon-len` 0 lỗi, 0 cảnh báo tỉ lệ. *(Đạt: 63 ảnh nguồn ngoài, 0 BY-SA/NC/ND, 0 CC BY thiếu tác giả; fetch lượt cuối 90 ảnh, 0 lỗi, 0 "Ảnh lệch khung". Còn: ảnh Flickr in "Kiểm tay", người duyệt mở lại trang trước khi phát hành; xem "Còn mở cho Duy".)*
- [x] Không xác con vật, cảnh giết mổ, cảnh sinh nở, máu, nhau thai, trứng có phôi; không em bé trần; người không nhận ra mặt; không chữ, logo, nhãn hiệu. *(Đạt: tester A10 lượt 1, xem tận mắt; c1 vệt đỏ đã cắt. Còn hai chỗ để Duy liếc: c12, c15. Vòng cổ có nhãn ở ô Học bài 6 (c2) giữ, không đọc được chữ.)*
- [x] Mỗi chuỗi một loài: bốn hình bướm cùng là bướm cải trắng (*Pieris rapae* hoặc loài content-editor ghi); ba hình ếch cùng một nhóm ếch; chuỗi gà, chuỗi cây đậu nhất quán. Loài trong ảnh khớp trang gốc; không khớp thì báo content-editor. *(Đạt có ghi nhận: bướm đúng một loài; chuỗi ếch nhiều loài nhưng đều là ếch, không cóc; chuỗi vịt khác giống (c3, đã đỡ bằng ảnh vịt mái nâu), PM chấp nhận.)*
- [x] Hình tự vẽ chỉ trong "Quyết định đã ghi" mục 8; hình vòng đời dạng vòng tròn là hình ghép từ ảnh chụp và mũi tên, không chữ. *(Đạt: 4 hình vẽ (chuỗi người), 3 hình ghép không chữ, không số.)*
- [x] Icon: giữ `design/icons/topics/new-life.svg` (tổ chim, trứng, chim non; hợp tên mới). Sửa nhãn "Sự sống mới" → "Lớn lên" ở canvas `design/play-ui/project/Topic-Icons.dc.html` (dòng 322) và `design/play-ui/journey-roadmap-spec.md` mục 8 (dòng 182); thêm tên EN "Life cycles" nếu bảng có cột EN. Không đổi key, không vẽ icon mới. *(Đạt: designer 19/11, mục "Icon".)*

### ios-dev (sau khi dev đổi danh mục **và** phiên SK-052 xong việc trong `apps/ios`)
- [x] Thêm khoá `collectible.set.life_cycles` "Life cycle cards" · "Thẻ vòng đời" vào `ScienceKids/Resources/Localizable.xcstrings`. *(Đạt: PM grep 19/11, khoá có ở dòng 1324.)*
- [x] Sửa test ghi cứng số bài *(đạt: `SyllabusTests.swift:28` `[72, 155, 156]`, `JourneyTests.swift:37` 383, cả hai ghi chú SK-053; `PlayTrayPackTests.swift` cập nhật theo gói 19/11, 92 kệ)*:
  - `Packages/SKKit/Tests/ContentModelTests/SyllabusTests.swift:28` `[71, 155, 156]` → `[72, 155, 156]`, chú thích SK-053;
  - `Packages/SKKit/Tests/ContentKitTests/JourneyTests.swift:37` 382 → 383;
  - số chủ đề, `oakYear`, `stopRange`, 44 icon **giữ nguyên**;
  - grep lại `382`, `71` trong `apps/ios` sau khi sửa.
- [x] `ContentModelTests`, `ContentKitTests`, `ScienceKidsTests` xanh trên simulator iPhone 16, một máy, một lần (không iPhone 16 Pro). Hai test fail đã ghi ở SK-051 (`PlayTrayPackTests`, `KeyPointPicturesTests`) không tính cho ticket này, nhưng ghi lại kết quả. *(Đạt 19/11: 418/418 unit test xanh trên iPhone 16 với gói 05:22, kể cả `PlayTrayPackTests` và `KeyPointPicturesTests` (bảng 52 dòng). Gói đổi sau đó chỉ ở ảnh và một câu `feedback`; tester chạy lại vector `KeyPointPictures.match` trên gói 06:07, khớp 52/52, nên không chạy lại simulator.)*
- [x] Chạy thử: bản đồ Explorer vẫn 5 chặng; Chặng 5 có #9–#11, #10 tên "Lớn lên" · "Life cycles", đủ 6 bài; icon không đổi. *(Đạt phần máy: `JourneySegmentTests.swift:27` `stopRange` `[0..<1, 1..<3, 3..<5, 5..<8, 8..<11]` xanh trong 418 test; chạy thử bài 1, 4, 6 trên iPhone 16 đạt. Lần chạy thử không báo riêng ảnh chụp màn bản đồ; Duy nhìn lại khi review nếu cần.)*

### tester
- [x] Danh mục và test đếm: 44 / 383; Explorer 11 / 72; `oakYear` Explorer `[1, 2, 2, nil, nil, 1, 1, 1, 2, 2, 2]`; 5 chặng, `stopRange` `[0..<1, 1..<3, 3..<5, 5..<8, 8..<11]`; năm slug Oak `new-life` mỗi slug một bài. *(Đạt: tester lượt 1; test content-cli 401/401, content-schema 163/163; `validate` dòng tổng 44 chủ đề, 383 bài.)*
- [x] Rà chữ 6 bài theo khuôn SK-041, SK-046, SK-048, SK-049, SK-051: 0 mục chặn; mục "nên sửa" đã sửa hoặc có quyết định của PM. Chú ý riêng: cách nói về cái chết, chặng "có con", ranh giới với *Gọi tên và nhóm động vật* bài 2–4. *(Đạt: lượt 1 có 2 chặn (C1, C2) và 6 nên sửa; C1, C2, N1–N5 đã sửa trong chữ, N6 thành câu hỏi tên gọi EN cho người chuyên môn. Lượt 4: 0 lỗi chặn.)*
- [x] Đọc mọi dòng `[CẦN KIỂM]` ở mức hợp lý với trẻ 5–7 tuổi (không thay người chuyên môn). *(Đạt: tester lượt 1.)*
- [x] Rà ảnh: kiểm máy file chọn ảnh, xem tận mắt mẫu, đặc biệt chuỗi một loài và ảnh "già đi". *(Đạt: bốn lượt rà ảnh; B1–B7 và c1–c15 đóng hoặc có quyết định; còn c11, đã tách thành SK-054.)*

### phiên chính
- [x] `validate content/explorer/lon-len` 0 lỗi. Chạy `ids` theo thứ tự `_topic.md`, rồi bài 1 tới bài 6; ghi `topic_id`, `lesson_id` vào `content/syllabus.json`. *(Đạt: 0 lỗi, 7 cảnh báo `[CẦN KIỂM]`; tester lượt 1 thấy `topic_id`/`lesson_id` trong danh mục khớp `id:` trong file.)*
- [x] `images fetch` 0 lỗi; `tts` EN và VI (ghi số clip VI bị đánh dấu chờ Duy nghe; nghe thử "nòng nọc", "nhộng", "nghé", "vòng đời"); `build`; `check-pack` OK. *(Đạt: fetch 0 lỗi; gói `content/.build/pack` build lại sau lần sửa cuối, `check-pack` OK, 15 chủ đề, 1722 ảnh. **Chưa ghi** số clip VI bị đánh dấu; phiên chính bổ sung khi Duy nghe.)*
- [x] Chơi trọn một bài Khởi động → Học → Chơi → Quiz → Tổng kết → Thưởng trên simulator iPhone 16, một máy, một lần. *(Đạt: chạy thử bài 1, 4, 6 trên iPhone 16.)*

### pm (đóng ticket)
- [ ] Người chuyên môn đọc hết các dòng `[CẦN KIỂM]` trước khi phát hành; ghi người đọc và ngày. *(Chưa đạt: chưa có người chuyên môn. Không chặn chuyển `review`; chặn phát hành. Xem "Còn mở cho Duy" mục 1.)*
- [x] Tài liệu ở "Việc kéo theo" và `docs/backlog/README.md` khớp `content/syllabus.json` và các test đếm. *(Đạt 19/11: xem "Nghiệm thu PM 19/11".)*

## Rà chữ (tester)

> Lượt 1, 19/11/2026. Phạm vi: **chữ** của `_topic.md` và sáu bài trong `content/explorer/lon-len/`. Chưa kiểm: ảnh (chưa có `content/images/explorer/lon-len/`), TTS, app, test đếm trên simulator.

### Đã kiểm bằng máy — đạt

- Danh mục: khối `new-life` trong `content/syllabus.json` khớp từng chữ bảng "Phạm vi" (title EN/VI, 6 bài, `oak_lessons`, `statutory`, bài 3 và 5 `extension: true`); `topic_id`/`lesson_id` khớp `id:` trong file. Năm slug Oak của unit đều có mặt, **mỗi slug đúng một bài**, và không slug Oak nào trong cả `syllabus.json` bị trùng. Explorer 11 chủ đề / 72 bài (8+7+4+8+6+6+7+7+6+6+7); `oakYear` Explorer `[1, 2, 2, None, None, 1, 1, 1, 2, 2, 2]`.
- Sáu bài: DOK quiz đều `1·1·1·2·2·2`, câu 1 DOK 1, đúng **một** câu `misconception` và luôn ở q6, format đủ (bài 1–5 ba format, bài 6 hai format).
- Khởi động: bài 1–5 hai câu, bài 6 ba câu; mọi câu DOK 1, chỉ `single_choice`/`true_false`, **câu nào cũng có `recall_from.lesson`** và bài đích đều có thật.
- SK-044/SK-047: 0 lựa chọn sai thiếu `feedback`; 0 lựa chọn đúng thừa `feedback`; mọi câu Khởi động và Quiz có `hint` và có hình; mọi lựa chọn, mọi thẻ `order_sequence`, mọi món Chơi có hình; `true_false` nào cũng có `feedback` đúng phía (`feedback_true` khi đáp án Sai, `feedback_false` khi đáp án Đúng), 0 câu có `labels`.
- Đúng/Sai: 27 câu `true_false`, 12 Đúng / 15 Sai; bỏ sáu câu q6 thì 12/9; bài nào cũng có cả hai — khớp đúng bảng ở `_topic.md`.
- Sáu key misconception mới: không trùng nhau, không trùng 46 key Explorer đã có, mỗi key dùng một lần.
- **Hình dùng lại:** 100% brief `Dùng lại hình …` trỏ tới một key **có thật** và là **hình gốc** — 0 chỗ trỏ qua hai chặng (kiểm máy toàn bộ `content/`). Hình Discoverer (`khung-long`, `ho-hap`) đều ghi rõ "chép mục" ở `_topic.md`; `tray_stomach` không có "Từ khoá tìm ảnh" là **đúng** vì hình gốc là `[hình vẽ]`, và *Cơ thể của em* bài 3 đã dùng y hệt cách này.
- Grep chữ bé nghe: 0 kết quả "offspring", "reproduc", "sinh sản", "mate", "giao phối", "thụ tinh", "fertili", "pregnan", "mang thai", "pollen", "pollinat", "thụ phấn", "kill", "giết", "xác", "cá bảy màu", "guppy", "trứng lộn", "balut", "kén", "cocoon" (mọi kết quả đều nằm ở dòng `>` hoặc mục Ghi chú).
- **Cách nói về cái chết:** "die"/"chết" đúng **ba chỗ** — bài 1 ô `explore_plants_too` ví dụ ba, bài 5 ý chính ba, bài 5 ô `explore_dry` câu chính. Cả ba gắn với **cây** và câu liền sau luôn là "hạt lại mọc thành cây mới". 0 chỗ nói người, ông bà, thú cưng hay con vật chết; 0 câu hỏi có đáp án là cái chết.
- `.en` không có dấu tiếng Việt; chữ bé nghe không có chữ số; câu EN ≤ 8 từ (validate đã xanh, đếm theo từng câu).
- Ranh giới: bài 3 q4 là **vịt** (trứng vịt → vịt con → vịt lớn), khác câu gà của *Gọi tên và nhóm động vật* bài 3; bài 4 q4 là **sâu → nhộng → bướm**, khác câu ếch của bài 4 chủ đề đó. Tám ghi chú cũ trỏ *Sự sống mới* đã đổi sang *Lớn lên* (chỉ còn ở `content/.build/syllabus-vi*.tsv`, để nguyên như SK-051).

### Lỗi chặn (2)

**C1 · Bài 3 q5: câu hỏi tiếng Việt nói một điều sai, ngược chính bài 2.**
`03-con-vat-de-trung.md:436` `prompt.vi: Con non nào cũng bắt đầu từ quả trứng?`
EN đúng ý ("Which baby starts in an egg, too?"), nhưng VI "Con non nào **cũng** bắt đầu từ quả trứng" đọc lên là một lời khẳng định *mọi con non đều nở từ trứng* — sai, và ngược đúng điều bài 2 vừa dạy. Trớ trêu là hai lựa chọn sai của chính câu này là **lợn con và mèo con** (do mẹ đẻ ra). Bé nghe bằng tai (chế độ đọc) sẽ hiểu đây là câu Đúng/Sai với đáp án "không phải".
Tái hiện: mở bài 3, nghe câu q5 bằng VI.
Mong đợi: câu hỏi VI hỏi "còn con nào nữa nở từ trứng".
Thực tế: câu VI khẳng định mọi con non nở từ trứng.
Đề xuất: `Còn con non nào nở ra từ trứng nữa?` (giữ nguyên EN, lựa chọn, giải thích).

**C2 · Bài 1 q5 và ô `explore_plants_too`: dạy dấu hiệu sai "lá vàng rụng = cây già", mâu thuẫn với chủ đề #5 đã học.**
`01-vat-song-nao-cung-co-vong-doi.md:455–466` — q5 "Which plant is old?" · "Cây nào đã già?"; `hint` "Em nhìn kỹ **lá cây** nhé."; `explanation_correct` "Old trees drop many leaves." · "**Cây già rụng nhiều lá.**"; đáp án là ảnh `explore_plants_too` (cây to rụng lá vàng).
Lá vàng rụng là dấu hiệu **mùa**, không phải tuổi cây. Bé đã học đúng điều đó ở *Thời tiết và các mùa* (#5, trước chủ đề này) bài 3: lá vàng = mùa thu. Ở đây app **chấm đúng** cho một suy luận sai và dạy ngược bài cũ. Content-editor đã tự ngờ ở dòng `[CẦN KIỂM]` `01:187` ("ảnh cây rụng lá mùa khô hay mùa đông không có nghĩa cây sắp chết").
Tái hiện: bài 1 → ô Học "Plants, too" → quiz q5.
Mong đợi: dấu hiệu "già" của cây là thứ phân biệt được với mùa.
Thực tế: dấu hiệu duy nhất bé được chỉ là lá vàng rụng.
Đề xuất (sửa nhỏ, không đổi ảnh): chuyển dấu hiệu sang **gốc to sần, cành khô** — đúng như brief ảnh đã dặn. `hint` → "Em nhìn thân cây và gốc cây nhé."; `explanation_correct` → "Old trees have a thick, rough trunk." · "Cây già có thân to, gốc sần."; `alt` thêm chi tiết gốc. Hoặc đổi q5 sang chặng khác của cây (hạt/cây con/cây ra quả) và để ý "cây cũng già đi" ở ô Học.

### Nên sửa (6)

**N1 · Bài 6 q2 — nói sai công dụng của thở hổn hển.**
`06-muon-lon-len-con-vat-can-gi.md:368–369` `feedback_false`: "This dog pants to breathe in more air." · "Chú chó thở hổn hển để hít thêm không khí."
Chó thở hổn hển chủ yếu để **hạ nhiệt**, không phải để lấy thêm khí. Dòng `[CẦN KIỂM]` `06:171` chỉ ghi "chó thở hổn hển sau khi chạy", không ghi mục đích — tức chỗ này chưa được đánh dấu.
Đề xuất: "This dog breathes fast after running." · "Chú chó này chạy xong nên thở nhanh." (Ô Học `explore_air` ví dụ một đã trung tính, giữ nguyên.)

**N2 · Bài 4 q3 — câu nói chung cho mọi loài bướm.**
`04-con-vat-doi-hinh-dang.md:387–388` (và `explanation_wrong` `04:397–398`): "A butterfly lays eggs on cabbage leaves." · "Bướm đẻ trứng trên lá cải."
Mỗi loài bướm một cây chủ; câu khái quát là sai. Cả chủ đề đã thống nhất nói "con sâu này" · "this caterpillar" (`_topic.md` Lỗi hay gặp 22) nhưng câu về bướm lại khái quát.
Đề xuất: "This butterfly lays eggs on cabbage." · "Con bướm này đẻ trứng trên lá cải."; `explanation_wrong` sửa theo.

**N3 · Bài 3 ý chính ba — tách hai câu làm mất ý "vòng".**
`03-con-vat-de-trung.md:32–33` và ô `explore_grow` `03:153–154`: "The chick grows up. Hens lay eggs." · "Gà con lớn lên. Gà mái lại đẻ trứng."
Content-editor tách câu để tránh "gà con nào cũng thành gà mái" — đúng mối lo, nhưng hai câu rời nhau làm mất chính ý vòng đời của bài (lớn lên **rồi** lại đẻ trứng), nhất là khi chỉ nghe.
Đề xuất: "A grown hen lays eggs again." · "Gà mái lớn lại đẻ trứng." (vẫn không nói gà con nào cũng thành gà mái; ví dụ ba ô Grow up đã nói "có gà con lớn lên thành gà trống").

**N4 · Bài 4 q4 — `hint` nhắc vị trí thẻ.**
`04-con-vat-doi-hinh-dang.md:415–416`: "Wings come at the very end." · "Đôi cánh có ở chặng cuối cùng."
Trái SK-047 ("`hint` không nhắc vị trí thẻ") và lệch khuôn bốn câu `order_sequence` kia (bài 1 "Chó già có lông bạc", bài 2 "Người lớn là người cao nhất", bài 3 "Vịt lớn là to nhất", bài 5 "Cây phải lớn rồi mới ra hoa" — đều tả thẻ, không tả chỗ).
Đề xuất: "A chrysalis stays still on a stem." · "Cái nhộng nằm yên trên thân cây."

**N5 · Bài 2 từ `adult` — ví dụ giả định bé đi học, và bỏ mất nghĩa thứ hai.**
`02-con-vat-de-con.md:543–544` "Your teacher is an adult." · "Cô giáo của em là người lớn." (content-editor đã ngờ ở `[CẦN KIỂM]` `02:549`). `term.vi` là "người lớn, **con vật đã lớn**" nhưng ví dụ chỉ nói người.
Đề xuất một công đôi việc: "An adult cat is big and strong." · "Mèo đã lớn thì to và khoẻ." — bỏ giả định đi học, lại dạy nghĩa thứ hai của từ.

**N6 · "born from mum" — tiếng Anh không tự nhiên.**
`02:331` "Which baby was born from its mum?", và quy ước ở `_topic.md:175`. Người bản ngữ nói "born **to** its mum". Vì là quy ước cả chủ đề, **không sửa lẻ**; thêm vào danh sách "Tên gọi EN" cho người chuyên môn chốt một lượt.

### Nhỏ (5)

1. `01:503` q6 `prompt.vi` "Con vật chỉ có hai lúc: lúc nhỏ và lúc lớn." — dấu hai chấm trong câu đọc cho bé 5–7 (cả Explorer chỉ còn một chỗ nữa, là lệnh kệ Chơi *Chuỗi thức ăn*). Cân nhắc "Con vật chỉ có lúc nhỏ và lúc lớn thôi."
2. `03:394` q4 `prompt.en` "Start with the duck **egg**" (số ít) nhưng thẻ `q4_egg` là "duck eggs" / "Duck eggs in a nest" (nhiều quả).
3. `05:388` q3 `prompt.vi` "Cây đậu già mãi mãi vẫn xanh tươi." — trật tự chữ gượng; "Cây đậu già vẫn xanh tươi mãi mãi." tự nhiên hơn khi đọc.
4. Giãn cách Khởi động: bài 2–5 chỉ có mốc "hôm trước" và mốc rất xa (#1, #7); thiếu mốc "khoảng một tuần". Đúng bảng ticket nên không tính lỗi; nếu muốn đủ ba mốc thì bài 4 hoặc bài 5 đổi một câu sang ôn bài 1 hoặc bài 2 của chính chủ đề (SK-051 làm vậy ở bài 6, 7).
5. "Nhộng" trong tiếng Việt đời thường hay được hiểu là **nhộng tằm** (món ăn). Từ vẫn đúng; đề nghị khi `tts` nghe thử clip VI và khi chọn ảnh lấy nhộng bướm thật rõ để bé không liên tưởng sang nhộng tằm.

### Các dòng `[CẦN KIỂM]` — đọc ở mức hợp lý với trẻ 5–7 (không thay người chuyên môn)

35 dòng trong sáu bài, cộng 3 dòng ở `_topic.md`. Đọc thấy **hợp lý, không cần sửa**: chó con mới sinh mắt nhắm tai đóng ~2 tuần; chó già mõm bạc, ngủ nhiều; lợn nái 8–12 con/lứa, trâu một nghé; lứa mèo con khác màu mẹ; mọi loài chim đẻ trứng; rùa biển đẻ trứng trong cát, con tự bò ra biển; gà con tự mổ vỏ, lông ướt rồi khô; vịt con bơi sớm, không bú, lông có lớp dầu; chuỗi ếch (chân sau → chân trước → ếch con còn đuôi, đuôi tiêu dần); "nhộng"/"chrysalis" đúng cho bướm, "kén"/"cocoon" là của tằm và bướm đêm; bướm cải trắng đẻ trứng trên cây họ cải; bướm nếm bằng chân; giun đất không đổi hình dạng; hoa đậu xanh vàng nhạt; quả đậu là quả, cà chua có hạt trong quả, xoài một hạt to; cây đậu sống một vụ; voi hút nước vào vòi rồi đưa vào miệng.
**Hai chỗ cần người chuyên môn để mắt:** (a) `01:187` cây già — đã thành lỗi chặn C2 ở trên; (b) `06:171` "con vật nào cũng cần không khí" với cá: cách xử lý hiện tại ổn (ô Air chỉ nói "cá thở trong nước bằng mang", không câu hỏi nào hỏi cá về không khí), giữ nguyên.
Một chỗ **chưa được đánh dấu mà nên có**: công dụng của thở hổn hển (N1).

### Ý kiến tester cho 8 chỗ "Còn mở" ở `_topic.md`

1. **`difficulty` 11 điểm (Mức 3) lệch `level: 2`.** Cách chấm hợp lý (B = 3 đúng: bài nào cũng cần nền của #1, #2, #7). Nhưng `level` của Explorer trong danh mục hiện là `1, 3, 3, 3, 2, 1, 1, 2, 2, 2, 1` — đã không theo quy tắc "Mức không giảm" từ trước, nên đây là chỗ lệch **tài liệu**, không chặn phát hành. Đề nghị PM: đổi `level` thành 3 kèm một dòng ghi chú, hoặc giữ 2 và ghi rõ lý do; đừng để `_topic.md` và `syllabus.json` nói hai điều khác nhau.
2. **Câu `correction` bài 1 "Animals are born, grow, have young, grow old."** → **giữ nguyên**. Đó là tên bốn chặng, không phải lời khẳng định "con nào cũng có con"; bỏ chặng ba khỏi câu sửa sẽ làm hỏng chính câu q6 (quan niệm sai là "chỉ có hai chặng"). Chữ bé nghe ở ô Học đã nói "can have puppies" là đủ phòng.
3. **Sáu mục tiêu rút gọn, ba chỗ lệch chữ ý chính** → đồng ý, ý giữ nguyên, trừ ý chính ba bài 3 (xem N3). "I know…" ở bài 6 không phải lỗi: Explorer đã có ba mục tiêu khác mở đầu bằng "I know" (*Cây quanh em* bài 1, *Cơ thể của em* bài 5, *Thời tiết và các mùa* bài 5).
4. **Bài 1 có năm ô Học** → **giữ năm ô**. Gộp ô Grow old với ô Plants, too sẽ đặt câu "old plants die" ngay cạnh ảnh chó già — đúng điều SK-053 cấm. Không luật nào giới hạn bốn ô.
5. **Ảnh khó (cá con, ếch con còn đuôi, trứng bướm)** → phương án thay đã ghi sẵn ở dòng `>` của từng món, đủ rõ cho designer; không chặn phần chữ.
6. **Bài 1 q5 đáp án là ảnh hôm nay giữa hai ảnh quen** → **chấp nhận, không cần thêm lựa chọn**: bé đã gặp ảnh đó ở ô Học và kệ Chơi **trước** câu hỏi, đúng cách tester đã chốt cho *Cây quanh em* bài 6 q5 (ghi chú "tester B2" trong file đó). Vấn đề thật của q5 không nằm ở hình mà ở dấu hiệu "lá vàng" — xem C2.
7. **Bài 6 w3 tính mốc "khoảng một tháng"** → không vấn đề: cả hai cách tính (có hay không có hai chủ đề vật liệu) đều nằm trong `warmup.month` 21–45 ngày của `content/rules.json`.
8. **Tên gọi EN** → ý kiến để người chuyên môn chốt nhanh: "life cycle" giữ (đúng từ Oak Y2, có hình ghép đỡ nghĩa); "chrysalis" giữ (đúng cho bướm, phân biệt với cocoon); "young frog" thay "froglet" giữ; "seedling" giữ (bài đã bắc cầu từ "young plant" của *Cây quanh em*); "adult" ở từ vựng + "grown-up" ở câu hỏi giữ (Oak dùng "adult"). Hai chỗ nên hỏi: **"have young" hay "have babies"** (với bé ESL 5–7, "babies" dễ hơn; hai cách cùng mức rủi ro về tính khái quát) và **"Cabbage white" hay "Small white"** (tên chuẩn của *Pieris rapae* là "small white"; "cabbage white" dùng chung cho cả *P. brassicae*) — chốt sau khi designer ghi đúng loài trong ảnh, vì tên thẻ phải khớp ảnh. Thêm "born from mum" (N6) vào danh sách này.

### Kết luận lượt 1

Không đạt tiêu chí "0 mục chặn": **2 lỗi chặn (C1, C2)**, 6 mục nên sửa, 5 mục nhỏ. Phần khung (DOK, misconception, format, feedback, hint, hình, cách nói về cái chết, chặng "có con", ranh giới với *Gọi tên và nhóm động vật* bài 2–4 và *Cây quanh em* bài 1, 4, danh mục) **đạt hết**. Sửa xong C1, C2 và N1–N4 thì rà lại chỉ cần đọc sáu chỗ đó.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi

### Phụ thuộc
- dev đổi danh mục trước khi phiên chính chạy `validate`, `ids` lần đầu (`_topic.md` `order: 10` và 6 bài phải khớp danh mục). content-editor, designer làm song song được.
- **ios-dev chờ SK-052:** một phiên khác đang sửa lỗi app trong `apps/ios` (SK-052). ios-dev chỉ bắt đầu khi phiên đó xong và cây làm việc `apps/ios` sạch phần của nó; không sửa chung file.
- SK-051 (*Cây quanh em*) đang review: bài 5 nối với *Cây quanh em* bài 1, 4; content-editor đọc bản hiện tại, sửa ghi chú `cay-quanh-em/_topic.md` chỉ ở hai dòng nêu trên.
- Cây làm việc có thay đổi chưa commit của phiên khác (`tools/content-cli/image-slots.json`, `test/aspect.test.ts`, các file `content/images/explorer/…`, SK-043). dev, designer không đụng các file đó, trừ chỗ ghi trong ticket này.
- SK-040, SK-044, SK-047 (app chạy bài Explorer, phản hồi, xáo lựa chọn, Tổng kết): đã có.
- Mạng tới Commons, Openverse (từng trả 429: giãn nhịp, một tiến trình).

### Quyết định đã ghi

**Duy 18/11:**
- Chủ đề dạy vòng đời của vật sống, cả con vật lẫn cây. Tên "Lớn lên" · "Life cycles".
- Bốn chặng: sinh ra → lớn lên → sinh sản → già đi và chết. Duy nêu "sinh lão bệnh tử"; bỏ "bệnh" vì không phải chặng của vòng đời.
- Phần "chết" nói nhẹ nhàng: hình cây già, lá rụng; không ảnh xác con vật.
- Ba nhóm con vật: đẻ con, đẻ trứng, đổi hình dạng.
- Sáu bài và thứ tự như bảng "Phạm vi"; Oak L1 *Young animals* không thành bài riêng, ý chính gộp vào bài 2, 4 (**lệch Oak**, ghi ở `_topic.md` và `syllabus-lessons.md`).
- Chế độ auto: chốt theo khuyến nghị PM, không hỏi thêm.

**PM 18/11, theo chế độ auto (Duy đổi được khi review):**

1. **Giữ key `new-life`, chỉ đổi tên.**
   - Luật `syllabus_key` buộc chủ đề Oak có key bằng `unit_slug`; đổi key thì phải đổi `source` sang `kind: new` (key `new-…`), mất slug Oak từng bài.
   - Giữ `source.year: 2` để bản đồ vẫn 5 chặng (app chia chặng theo năm Oak liền nhau, `JourneyProgress.swift:165–173`); #9–#11 đều Y2.
   - Giữ icon `new-life.svg` và imageset `Topic-new-life` trong app: không vẽ, không import lại.
2. **Giữ số #10 trong danh mục; lộ trình `syllabus.md` ghi #8.**
   - Danh mục còn #8 *Vật liệu quanh em* (Y1), #9 *Vật liệu dùng làm gì?* (Y2); bỏ hai chủ đề này còn chờ Duy chốt cả bản rà 18/11.
   - Nếu chuyển `new-life` lên #8 bây giờ, năm Oak thành `… 1, 1, 2, 1, 2, 2` và bản đồ tách 7 chặng.
   - Khi Duy chốt bỏ vật liệu, `new-life` tự thành #8 (năm Oak `… 1, 1, 2, 2`, vẫn 5 chặng); lúc đó sửa `_topic.md` `order: 8` và test đếm trong ticket của đợt đó.
3. **Bài 3 là bài mở rộng (`extension: true`), không gắn slug Oak.**
   - Duy ghi bài 1 và bài 3 cùng nguồn Oak L3. Validator buộc mỗi slug Oak một bài (`syllabus_duplicate`). Slug `animal-life-cycles` gắn bài 1 vì bài 1 khớp mục tiêu và misconception của L3; bài 3 (nhóm con vật đẻ trứng) là cách chia riêng của Duy, Oak không có lesson này.
   - Kết quả: năm slug Oak đều có chỗ, mỗi slug một bài, không đổi luật nào.
   - Phương án khác: (b) nới luật cho một slug ở hai bài (sửa validator, test, README như SK-051 đã làm với `extension`); (c) chuyển `growing-up` sang bài 3, bài 2 chỉ giữ `young-animals` (trái nguồn Duy ghi cho bài 2).
4. **Tên bài EN** do PM đặt, ngắn cho thẻ bản đồ (≤ 6 từ); tên VI đúng câu Duy chốt. "I can…" viết lại theo ý chính, không chép Oak (Oak L4 "record the life cycle" không còn đúng phạm vi).
5. **Stage:** bài 1 `opener` (ý chung), bài 2–4 `core`, bài 5 `apply` (áp ý vòng đời sang cây), bài 6 `review` (ôn trộn bài 1–5 ở Khởi động, thêm ý nhu cầu).
6. **Misconception:** sáu key PM đề xuất. Bài 1, 4, 6 lấy thẳng misconception Oak L3, L2, L5. Bài 2 dùng ví dụ người của L3 (`grown_ups_never_babies`) thay vì misconception L1 để không chồng với bài 4. Bài 3 (`egg_hatches_adult`) và bài 5 (`seeds_not_from_plants`) do PM đặt vì misconception "chỉ chim mới đẻ trứng" đã gần như dạy ở *Gọi tên và nhóm động vật* bài 3, 4, còn "cây cũng có vòng đời" là ý chính bài 1. content-editor được đổi sang phương án khác, có lý do.
7. **`sensitive: false`.** Cờ `sensitive` dành cho nội dung dậy thì (`technical-plan.md`, đoạn về cờ `sensitive`; PRD mục 11), bật lên thì app ẩn chủ đề tới khi phụ huynh mở. Cái chết ở đây chỉ nói chung, gắn với cây, theo cách Duy chốt; không cần ẩn.
8. **Hình tự vẽ (PM đồng ý trước, theo khuôn SK-049 quyết định 5, SK-051 quyết định 10):** designer được tự vẽ, chỉ khi không có ảnh PD/CC0/CC BY hợp:
   - chuỗi người em bé → trẻ em → người lớn → ông bà (bài 2), vì ảnh người thật khó vừa không rõ mặt vừa cùng một kiểu; vẽ thì vẽ đủ cả bộ bốn hình (không để thẻ đúng là hình vẽ duy nhất giữa ảnh chụp);
   - một chặng khó tìm ảnh trong chuỗi một loài (trứng bướm cải trắng, ếch con còn đuôi), nếu ảnh có thì không vẽ.
   Hình gần thực tế, không chữ; `changes: ["drawn"]`, credit "Science Kids". Hình vòng tròn ở ô Học là hình ghép (`composed`) từ ảnh chụp và mũi tên.
9. **Thẻ thưởng `set: life_cycles`** mới; không dùng chung `animals` (bài 5 là cây) hay `plants`.
10. **Chặng 3 nói "có con"**, không "sinh sản": từ Hán Việt khó với trẻ 5–7 tuổi, và EN "reproduce", "offspring" vượt mức Explorer. Ý Duy (bốn chặng) giữ nguyên.
11. **`level: 2` giữ như danh mục**; content-editor chấm `difficulty`, lệch thì báo.

### Câu hỏi còn mở

**Cho Duy khi review (không chặn):**
- Quyết định 3: bài 3 làm bài mở rộng không slug Oak; hay Duy muốn nới luật để bài 1 và bài 3 cùng ghi `animal-life-cycles`?
- Quyết định 2: danh mục để #10 tới khi Duy chốt bỏ hai chủ đề vật liệu; đồng ý?

**Cho người chuyên môn** (PM viết trước khi soạn; content-editor bổ sung):
- **Bài 1:** chó con mới sinh nhắm mắt; chó già mõm bạc; "vật sống nào cũng có vòng đời" đúng với cây, con vật ở mức trẻ 5–7 tuổi.
- **Bài 2:** lợn, trâu, mèo, chó đẻ con và cho con bú; một lứa mèo con có thể khác màu mèo mẹ; chuỗi em bé → trẻ em → người lớn → người già.
- **Bài 3:** gà con tự mổ vỏ chui ra; vịt con nở ra biết bơi, đi theo mẹ; rùa biển con tự bò ra biển, không có mẹ chăm; nhiều loài cá đẻ trứng (cá chép, cá rô), cá con nở ra rất nhỏ.
- **Bài 4:** ếch: trứng → nòng nọc → nòng nọc mọc chân → ếch con còn đuôi → ếch; bướm cải trắng: trứng → sâu → nhộng → bướm, gọi "nhộng" đúng với bướm (kén là của tằm, bướm đêm); EN "chrysalis".
- **Bài 5:** cây đậu: hạt → cây con → hoa → quả đậu có hạt → cây khô cuối vụ; quả đậu là quả; cà chua có hạt trong quả; cây to sống rất lâu nhưng cũng già đi.
- **Bài 6:** con vật nào cũng cần không khí; cá lấy không khí trong nước (khớp "cá cần nước để thở" ở #1 bài 4).
- **Tên gọi EN:** "life cycle" cho trẻ 5–7 tuổi; "have young" hay "have babies"; "chrysalis" hay "pupa"; "froglet".

### Việc kéo theo

**Số đếm** (`content/syllabus.json`, đếm 18/11 sau SK-051):

| | Chủ đề | Bài |
| --- | --- | --- |
| Explorer hiện tại | 11 | 71 |
| #10 `new-life`: 5 bài Oak → 6 bài | 0 | +1 |
| **Explorer sau khi đổi** | **11** (9 unit Oak, 2 mới) | **72** |
| Discoverer | 17 | 155 |
| Scientist | 16 | 156 |
| **Cả app sau khi đổi** | **44** (34 unit Oak, 10 mới) | **383** |

Chặng bản đồ Explorer không đổi: 5 chặng, `stopRange` `[0..<1, 1..<3, 3..<5, 5..<8, 8..<11]`; icon 44.

- **dev:** `content/syllabus.json` (khối `new-life` ở dòng 847–919 lúc PM đọc 18/11; đọc lại trước khi sửa); test đếm và chú thích như Bước 0. `content/.build/syllabus-vi*.tsv`: không có script, để nguyên (như SK-051).
- **content-editor:** soạn `_topic.md` và 6 bài theo "Phạm vi", "Bảng soạn", [docs/oak/new-life.md](../oak/new-life.md); sửa ghi chú cũ như tiêu chí.
- **designer:** ảnh theo "Bảng soạn"; nhãn icon ở hai file thiết kế.
- **ios-dev:** khoá thẻ, hai test đếm; chờ SK-052.
- **tester:** danh mục, test đếm, rà chữ, rà ảnh.
- **pm** (lượt 2, sau khi dev đổi danh mục):
  - `syllabus.md`: mục 0 số đếm 44 / 383, Explorer 11 / 72 (đã ghi dòng 18/11, đổi "khi dev đổi" thành đã đổi); mục 2 bảng đối chiếu nếu cần; mục 3 cột Trạng thái;
  - `syllabus-lessons.md` mục 11 *Sự sống mới*: viết lại 6 bài EN/VI, slug Oak, chỗ lệch Oak (L1 gộp, bài 3 và 5 mở rộng);
  - `syllabus-progression.md` dòng 90, 123, 132, 203, 425: đổi tên *Sự sống mới* → *Lớn lên*, số bài 6;
  - `prd.md`, `technical-plan.md`: dòng hiện trạng số đếm (cùng lượt với SK-051 lượt 2), không viết lại dòng lịch sử có ngày;
  - `docs/backlog/README.md`: đổi trạng thái theo ticket.

## Ghi chú designer (19/11)

**Đã làm:**
- Sáu file chọn ảnh `content/images/explorer/lon-len/{vat-song-nao-cung-co-vong-doi,con-vat-de-con,con-vat-de-trung,con-vat-doi-hinh-dang,vong-doi-cua-cay,muon-lon-len-con-vat-can-gi}.json`: **207/207 chỗ có hình** (35 · 37 · 34 · 35 · 36 · 30), 0 chỗ trống. Dựng từ `images search` (207 hình) cộng tìm tay trên Commons, Openverse. Đối chiếu key `.md` (đọc lại bản hiện tại qua `checkMarkdown` + `imageRefs` của content-cli) với file chọn ảnh: 0 thiếu, 0 thừa, 0 trùng.
- **Ảnh mới: 25** (24 ảnh gốc của chủ đề + ảnh trứng bướm làm phần hình ghép). Bài 1: 5 · bài 2: 3 · bài 3: 5 · bài 4: 4 + trứng bướm · bài 5: 4 · bài 6: 3. Giấy phép: **CC0 8, Public domain 3, CC BY 14** (2.0: 9, 2.5: 1, 3.0: 2, 4.0: 2; ghi công đủ, `title` CC BY giữ như nguồn). 0 BY-SA/NC/ND. Mỗi ảnh kiểm giấy phép qua Commons API (cùng hàm `commonsCredit` của content-cli), xem `Restrictions` (trống cả 25), xem ảnh: không mặt người, không chữ, không logo. `Pierisrapae2.jpg` (trứng) trang gốc đa giấy phép, dùng CC BY 2.5.
- **Loài khớp trang gốc:** bướm cải trắng *Pieris rapae* cả bốn chặng (trứng: "Eier des Kleinen Kohlweißlings auf einem Kohlblatt", Category:Pieris rapae eggs; sâu: ảnh cũ *Chuỗi thức ăn* bài 2; nhộng: Judy Gallagher, "Cabbage White - Pieris rapae chrysalis"; bướm: "20220702 Pieris rapae 01"); đậu xanh *Vigna radiata* cho hoa (iNaturalist, CC0) và quả (Judgefloro, CC0); nòng nọc mọc chân *Lithobates onca*; rùa biển con *Caretta caretta*; cá con là cá hồi vân *Oncorhynchus mykiss* (đẻ trứng).
- **Dùng lại:** mọi `same_as` trỏ thẳng về mục gốc (sang bài khác một bước). 10 hình của Discoverer chép đủ mục (`w3_cat`, `w3_hen`, `q6` khủng long đồ chơi, `w1_buffalo`, `q4_frog`, `tray_sparrow`, `w1_water`, `w1` gió trên ruộng lúa, `w1_stone`, `tray_stomach`). Chỉ tạo mục cắt khung riêng khi khung lệch quá ×2,1 (thẻ 5:2 từ ảnh vuông, ví dụ `q1_old_dog`, `q5_old_tree` cắt vào thân sần); dưới mức đó app tự lấp khung ở giữa nên không cần mục riêng.
- **Hình tự vẽ (quyết định 8): 4 hình, 7 file** ở `content/images/own/lon-len/`: `people-four-ages.jpg` (`explore_humans`), `person-baby.jpg`, `person-child.jpg`, `person-adult.jpg` (ba thẻ q4), cộng bản khung `person-adult.4x3.jpg` (q6), `person-baby.2x1.jpg`, `person-adult.2x1.jpg` (thẻ từ). Giấy cắt vẽ nghiêng, không nét mặt (chỉ đầu, tai, mũi dạng khối), không nét viền, nền kem, sàn giấy lõm, bóng nướng sẵn; em bé mặc bộ liền thân màu kem đậm, bạn nhỏ áo vàng hoè quần chàm, người lớn áo gỉ đồng, người già tóc bạc lưng còng chống gậy. Q4 cả ba thẻ là hình vẽ; kệ Chơi bài 2 toàn ảnh chụp. **Không vẽ** ếch con còn đuôi và trứng bướm: đã có ảnh hợp lệ ("Fully-formed Tadpole", Semuasiji, CC BY 4.0; "Pierisrapae2", Tom Wess, CC BY 2.5).
- **Hình ghép: 3** ở `content/images/composed/lon-len/`, theo khuôn `chuoi-thuc-an` `explore_chain` (ảnh tròn viền giấy sáng trên nền giấy điệp, mũi tên giấy cắt màu chàm, bóng nướng sẵn, không chữ, không số):
  - `vat-song-nao-cung-co-vong-doi.vocab.life_cycle.jpg` (2:1): chó con mới sinh → chó con → chó mẹ với đàn con → chó già, mũi tên cong phía trên từ chó mẹ về chó con mới sinh;
  - `con-vat-doi-hinh-dang.learn.explore.explore_frog.jpg` (vuông): năm ảnh xếp vòng theo chiều kim đồng hồ, trứng ếch ở đỉnh;
  - `con-vat-doi-hinh-dang.learn.explore.explore_butterfly.jpg` (vuông): bốn ảnh xếp vòng, trứng ở đỉnh.
  Vòng tròn đặt trong khoảng giữa 87–937 px để không bị cắt ở khung dọc trang Học.
- **Icon:** giữ `new-life.svg`. `design/play-ui/project/Topic-Icons.dc.html` nhãn "10 · Lớn lên"; `design/play-ui/journey-roadmap-spec.md` mục 8 dòng #10 "Lớn lên (Life cycles; từ SK-053, tên cũ *Sự sống mới*)". Không đổi key, không vẽ icon mới.
- **Kết quả lệnh:** `node tools/content-cli/src/cli.ts images fetch content/images/explorer/lon-len`: **6 file chọn ảnh · 73 ảnh khác nhau · 0 lỗi · hình tự vẽ 8 (7 của chủ đề + `tray_stomach` chép từ Discoverer) · hình ghép 3, 0 chờ ghép**; 0 dòng "Ảnh lệch khung", 0 dòng "Chưa kiểm tỉ lệ". Chưa chạy `build`, `validate` (phiên chính chạy).

**Chỗ lệch brief, cần content-editor hoặc PM xem** (đổi chữ là việc của content-editor; ảnh đã chọn giữ nguyên tới khi có quyết định):
1. **Wikimedia chặn tải bản gốc nhỏ (HTTP 429 lặp lại ở `upload.wikimedia.org`)**: `images fetch` tải thẳng bản gốc khi ảnh rộng ≤ 1280 px, và các lượt này bị 429 liên tục (như SK-051 mục 11). Bốn ảnh tốt nhất phải đổi sang ảnh > 1280 px: mèo tam thể với đàn con nhiều màu, vịt con trên cỏ, chó ta vàng với đàn con, bàn tay bạn nhỏ thổi bong bóng. Đề xuất cho dev: với ảnh Commons nhỏ, tải bản thumbnail cỡ chuẩn (vd 960 px) thay vì bản gốc.
2. **`explore_kittens` bài 2** (ô Kittens, món `tray_litter`, từ `kitten`): ảnh mới "Suckling kittens" (CC0) là mèo mẹ vằn xám với ba mèo con **đen** đang bú trên cỏ: có con khác màu mẹ, nhưng các con cùng màu nhau. `alt` "A cat with kittens of many colours" lệch. Đề xuất `alt` "A cat with her kittens on the grass" · "Mèo mẹ và đàn mèo con trên cỏ"; ví dụ "some have a different colour from mum" vẫn đúng.
3. **`explore_ducklings` bài 3** (Học, kệ, q1, q3, q4, từ `duckling`; bài 4 w2): "Duckling chicks (Unsplash)" (CC0), đàn vịt con (vịt xiêm) lông vàng đầu nâu chụp gần trong hộp, **không có cỏ**. `alt` gốc đúng; `alt` riêng bài 4 w2 "Fluffy yellow babies on the grass" lệch → đề xuất "Fluffy yellow babies" · "Những con non lông vàng".
4. **`tray_chrysalis` bài 4** (kệ, q4, phần ghép, từ `chrysalis`): nhộng *Pieris rapae* **màu nâu nhạt nằm trên mặt lá** (brief cho phép nâu nhạt; ảnh nhộng xanh trên Commons đều BY-SA, ảnh nhộng xanh CC BY 2.0 duy nhất thì bám trên giấy bạc). `alt` "A green chrysalis on a stem" lệch → đề xuất "A chrysalis on a leaf" · "Cái nhộng nằm trên lá". Trang Flickr đã mở 19/11: CC BY 2.0.
5. **`explore_dry` bài 5** (Học, q3; bài 6 w1): **đậu tương** (*Glycine max*, USDA, PD) cuối vụ, hàng cây khô nâu vàng còn quả, không phải đậu xanh. Ảnh ruộng đậu xanh cuối vụ hợp giấy phép (Judgefloro, CC0) còn quá xanh, câu q3 "Old bean plants stay green forever" (Sai) và bài 6 w1 sẽ nước đôi. `alt` "Dry, yellow bean plants" dùng được; nếu content-editor muốn nói rõ loài thì ghi "cây đậu" chung, không "đậu xanh".
6. **`explore_young` bài 1** (Học, q6, thẻ `dog_card`, phần ghép `life_cycle`): chó mẹ chăn cừu lông **trắng nâu** cho bốn chó con đã mở mắt bú trên đồng cỏ (CC BY 2.0). Ba ảnh chó kia màu vàng; brief chỉ ghi "nên cùng màu". Ở góc trên trái có một chiếc xe rất nhỏ, mờ, không đọc được chữ.
7. **`explore_you` bài 6** (Học, q5): bong bóng xà phòng to bay trên phố, **không có bạn nhỏ** (ảnh trẻ thổi bong bóng hợp giấy phép đều lộ mặt). `alt` "Soap bubbles floating in the air" khớp; câu chính ô "người cũng vậy" phải tự đủ nghĩa không cần người trong ảnh.
8. **`explore_plants_too` bài 1** (theo brief mới 19/11): cây đa rất to ở Việt Nam ("Cây da", CC BY 3.0), thân sần nhiều rễ phụ bện, tán còn lá; cắt bỏ hàng rào, biển và người ở chân cây. Cành khô không rõ.
9. **Chuỗi ếch không cùng một loài**: trứng (Phần Lan, *Rana*), nòng nọc (ảnh cũ), nòng nọc mọc chân *Lithobates onca*, ếch con còn đuôi (trang gốc ghi Unidentified Anura, Indonesia, chụp nền trắng), ếch *Hoplobatrachus rugulosus*. Đều là ếch, không có cóc. Nòng nọc mọc chân: chân sau nhỏ, nhìn kỹ mới thấy (chưa tìm được ảnh hợp giấy phép thấy chân rõ hơn).
10. **`explore_hatch` bài 3**: gà con ướt đang chui ra khỏi vỏ giữa nhiều trứng và gà con vừa nở (lò ấp; ảnh của Otwarte Klatki, CC BY 2.0). Không máu, không lộ phôi.
11. **`tray_fry` bài 3**: cá hồi vân con trong bể ương (PD), không phải cá chép (không có ảnh cá chép con hợp giấy phép).
12. **Hoa đậu xanh** (`explore_flowers`, Openverse/iNaturalist, Agnes Trekker, CC0): `fetch` in "Kiểm tay"; trang iNaturalist dựng bằng JavaScript nên chưa mở xác nhận CC0 bằng lệnh được, cần một người mở `https://www.inaturalist.org/photos/152113094` trước khi phát hành.

Script vẽ, ghép và dựng file ở scratchpad của phiên (`sk053/draw/people.mjs`, `sk053/comp/compose.mjs`, `sk053/run053.py`), không nằm trong repo.

## Ghi chú content-editor (19/11, alt theo ảnh)

Sửa `alt` cho khớp ảnh thật, không đổi key hình. Bài 1: `alt.vi` của `explore_plants_too` (3 chỗ) bỏ "có cành khô", gợi ý q5 bỏ "cành cây" (`alt.en` giữ, không thêm "old" vì ảnh là đáp án q5). Bài 2: `explore_kittens` (3 chỗ) → "A cat with her kittens on the grass" · "Mèo mẹ và đàn mèo con trên cỏ". Bài 4: `alt` của w2 bỏ "on the grass"; `tray_chrysalis` (3 chỗ) → "A chrysalis on a leaf" · "Cái nhộng nằm trên lá", câu ví dụ từ `chrysalis` "on a leaf"; `tray_tadpole_legs` (2 chỗ) → "A tadpole with tiny back legs" · "Nòng nọc mới nhú hai chân sau". Bài 6: thêm ví dụ bốn ô `explore_you` "your breath can blow bubbles" · "hơi thở của em thổi được bong bóng". Bài 3, bài 5 và chó mẹ bài 1: đã rà, chữ cho bé không phải sửa, chỉ thêm ghi chú. `_topic.md` cập nhật theo. Validate 19/11: 0 lỗi, 7 cảnh báo ([CẦN KIỂM]).

**Quyết định phiên chính (theo PM, chế độ auto):** nhận ảnh gà nở trong lò ấp (`explore_hatch`): chữ cho bé không nói ai ấp, ảnh không máu, không lộ phôi; tester xem lại khi rà ảnh. Câu ví dụ `duckling` "The ducklings swim after their mum." giữ (không sai, chỉ không tả ảnh). Mèo con đang bú (`explore_kittens`) cạnh `explore_milk`: tester xem hai ảnh có giống nhau quá không.

## Rà ảnh (tester 19/11)

> Phạm vi: phần **ảnh** của sáu bài và `_topic.md`; sáu file chọn ảnh `content/images/explorer/lon-len/*.json`; bảy file `content/images/own/lon-len/`; ba file `content/images/composed/lon-len/`; gói đã build `content/.build/pack`. Xem tận mắt **24 ảnh mới + 7 file hình tự vẽ + 3 hình ghép**, cộng các ảnh dùng lại ở những chỗ có nghi vấn. Không rà lại chữ (lượt 1 ở mục trên). Không sửa `content/`, không sửa ảnh, không chạy `build`, `tts`, không mở simulator.
>
> **Tổng kết: chặn/nên sửa 5 (B1–B5) · nhỏ 10 (c1–c10).**

Lệnh và script đã chạy (chỉ đọc):

- `node tools/content-cli/src/cli.ts images fetch content/images/explorer/lon-len` → **6 file chọn ảnh · 73 ảnh khác nhau · 0 tải mới · 73 đã có · 0 lỗi · hình tự vẽ 8 · hình ghép 3 · 0 chờ ghép**; **0 dòng "Ảnh lệch khung", 0 dòng "Chưa kiểm tỉ lệ"** (trùng kết quả designer).
- Script tester ở scratchpad phiên (`node --experimental-strip-types`, `python3 -I`; không phải test sản phẩm): `keys.ts` (gọi thẳng `checkMarkdown` + `imageRefs` của content-cli, lấy key, `alt`, `brief` thật của 107 tài liệu trong `content/`), `an.py`/`an2.py` (key `.md` ↔ file chọn ảnh, chuỗi `same_as`, giấy phép), `an3.py` (tiền lệ kiểu hình toàn repo), `an4.py` (ảnh "lần đầu bé nhìn thấy"), `an5.py` (`alt`, brief ↔ kiểu hình thật), `an6.py` (bảng câu hỏi + ảnh), `map.py` (ref → đúng file cache theo `file_url` **cộng** `crop`), `bbox.mjs` (đo khung nội dung của hình ghép bằng `sharp`).

### A. Đã kiểm — đạt

- **A1 · Key:** `.md` **207** chỗ có hình (35 · 37 · 34 · 35 · 36 · 30) ↔ file chọn ảnh 207 mục: **0 thiếu, 0 thừa, 0 key trùng**. 7/7 file `own/lon-len/` và 3/3 file `composed/lon-len/` đều được dùng, **0 file thừa**.
- **A2 · Chuỗi `same_as`:** 207/207 ref giải được tới một mục có ảnh thật; **0 mục `same_as` trỏ vào một mục cũng là `same_as`** (trong bài, sang bài khác, sang chủ đề khác, kể cả phần của hình ghép). Mọi brief "Dùng lại hình `<key>`" trỏ tới một key **có thật**, và **0 chỗ** trỏ tới một brief vốn cũng là "Dùng lại" — đúng Quy ước hình 12.
- **A3 · Giấy phép:** 61 ảnh chụp nguồn ngoài nằm dưới 207 chỗ (kể cả ảnh mượn và từng phần hình ghép): **CC0 1.0 23 · CC BY 2.0 19 · CC BY 3.0 9 · Public domain 6 · CC BY 4.0 4 · CC BY 2.5 2**. **0 BY-SA, 0 NC, 0 ND, 0 mục không rõ giấy phép, 0 mục CC BY thiếu `author` hay `license_url`.** `index.json` có `verified.via` cho cả 61 ảnh, `notes` trống. Trong **gói đã build** (manifest 19/11 03:05, **sau** lần sửa `.md` cuối 02:04): chủ đề có 207 `Image` → 82 asset khác nhau, **0 asset thiếu trong manifest, 0 file thiếu trong `assets/`, 0 giấy phép cấm, 0 CC BY thiếu tác giả**; hình tự vẽ và hình ghép ghi `Science Kids`.
- **A4 · `alt`:** 207/207 có `alt.en` và `alt.vi`, **0 chỗ trống**; 0 dấu tiếng Việt trong `alt.en`; 0 chữ số trong `alt`. Hai chỗ `alt` riêng (bài 3 w2 nghé, bài 4 w2 vịt con) đúng danh sách `_topic.md`; ba chỗ content-editor sửa 19/11 (`explore_kittens`, `tray_chrysalis`, `tray_tadpole_legs`) đã khớp ảnh thật. Chỉ một `alt.en` dài hơn tám từ (`explore_humans`, 9 từ) — không có luật nào cấm.
- **A5 · Một câu, một kệ một loại hình (Quy ước 4):** quét **mọi** câu Khởi động, Quiz và cả sáu kệ Chơi: **0 chỗ trộn ảnh chụp với hình vẽ trong các lựa chọn / thẻ xếp / món Chơi**. Chỗ duy nhất "lệch" là bài 2 q4 (hình câu là ảnh chụp hàng rào tre, ba thẻ là hình vẽ) — **không phải lỗi**: quét toàn repo có 30+ câu cùng dạng (vd `co-the-cua-em/nam-giac-quan-cua-em` q1, q3, q4, q5; `cay-quanh-em/cay-moc-len-tu-hat` q4), và app Explorer **ẩn hình câu hỏi khi mọi thẻ đều có hình** (`image-slots.json` `hide_question_image_with_picture_choices: true`).
- **A6 · Đáp án đúng không là ảnh mới duy nhất:** dựng lại thứ tự bé gặp ảnh (8 chủ đề Explorer theo `order`, trong bài theo Khởi động → Học → Chơi → Quiz → Từ → Thưởng) rồi xét từng câu trước khi đánh dấu: trong *Lớn lên* **0 câu** có đúng một ảnh lần đầu mà ảnh đó là đáp án đúng. (Sáu câu dạng này còn ở các chủ đề cũ, không thuộc ticket.)
- **A7 · Kiểu hình trong brief:** 0 brief `[hình vẽ]` mà hình thật là ảnh chụp, 0 brief `[ảnh]` mà hình thật là hình vẽ; ba hình ghép đều có nhãn `[sơ đồ ghép ảnh]` (nhãn hợp lệ theo `slots.ts:204`).
- **A8 · Quy ước hình 8, 9 khớp bài:** hình câu `single_choice`, `order_sequence` đều là hàng rào tre (22 chỗ); hình sáu câu q6 đúng danh sách `_topic.md` (chó mẹ · người lớn · ổ trứng · con ếch · hạt đậu · con mèo); bài 4 w2 không đặt gà con cạnh vịt con; bài 6 không có ảnh cá trên kệ và trong q4.
- **A9 · Sổ sách `_topic.md`:** đếm máy đúng **24 ảnh mới + 1 ảnh phần ghép (trứng bướm) · 4 hình tự vẽ (7 file) · 3 hình ghép**, khớp mục "Ảnh mới". Bảng "Hình gốc mới", "Hình của chủ đề khác", "`alt` riêng" khớp file thật. `title` ghi công khác tên file Commons ở 13 mục, nhưng chỉ ở ảnh CC0/PD, còn hai mục CC BY chỉ bỏ số id Flickr (`Chicken Posing (209225885)` → `Chicken Posing`) — đúng nếp cũ (199/787 mục của các chủ đề khác cũng vậy).
- **A10 · Nhìn tận mắt 24 ảnh mới:** 0 mặt người nhận ra được, 0 em bé trần, 0 xác con vật, 0 cảnh giết mổ, 0 cảnh sinh nở, 0 nhau thai, 0 trứng vỡ lòng đỏ, 0 trứng có phôi, 0 tay người cầm sâu/ếch/nòng nọc, 0 chữ đọc được, 0 logo lớn. Hai chỗ nhỏ phải nhìn kỹ mới thấy: c1, c2 dưới đây.
- **A11 · Bốn điểm ticket hỏi, phần đạt:** chuỗi bướm bốn hình **đúng một loài** *Pieris rapae*, đọc rõ (trứng vàng trên lá cải → sâu xanh → nhộng nâu trên lá → bướm trắng chấm đen); hình ghép **không có chữ, không có số**, mũi tên đúng chiều, vòng khép kín; `explore_kittens` **không giống** `explore_milk` của *Gọi tên và nhóm động vật* bài 2 (mèo vằn xám trên cỏ ↔ mèo trắng vàng trên chiếu đỏ), và `explore_milk` **không xuất hiện** chỗ nào trong *Lớn lên*, nên không có chuyện hai ảnh đứng cạnh nhau; cây đa `q5_old_tree` ở khung thẻ 5:2 cắt đúng vào thân bện rễ phụ, **đọc rõ "thân to, gốc sần"**, khớp gợi ý và lời giải đã sửa theo C2.

### B. Chặn / nên sửa (5)

**B1 · Bài 5 `explore_dry`: ảnh không có lá vàng, chỉ có lá *xanh*; ba chỗ chữ đều bám vào "lá vàng".**
- File: `content/images/explorer/lon-len/vong-doi-cua-cay.json` khoá `learn.explore.explore_dry` ("Mike Starkey Soybean Harvest", USDAgov, PD) · dùng ở `05-vong-doi-cua-cay.md:171` (ô Grow old), `:376` (q3) và `06-muon-lon-len-con-vat-can-gi.md` w1.
- Vì sao: xem ảnh gốc 1023×1024 và phóng to vùng giữa — cả khung là **thân và quả đậu tương khô màu xám nâu, gần như không còn lá**; những chiếc lá duy nhất nhìn thấy (giữa khung, và mầm dưới gốc) **màu xanh**, thêm một lá vàng rất nhỏ. Trong khi đó: ví dụ một ô Grow old "the leaves turn yellow and dry" · "lá vàng úa, khô dần"; **gợi ý q3 "Look at the colour of the leaves." · "Em nhìn màu lá nhé."**; `explanation_correct` q3 "Old bean plants turn yellow and dry."; bài 6 w1 "Old bean plants turn dry and yellow." (Đúng). `alt` "Dry, yellow bean plants" · "Cây đậu khô vàng" cũng không tả đúng ảnh (không vàng, không có lá).
- Hệ quả: bé được bảo nhìn màu lá, nhìn vào thì thấy lá **xanh** — đúng điều câu q3 nói là sai. Cùng loại lỗi với C2 lượt 1 (dấu hiệu chỉ cho bé không có trong ảnh, và cái có trong ảnh thì cãi lại đáp án). VoiceOver đọc "Cây đậu khô vàng" cho một ảnh xám nâu.
- Đề xuất, chọn một: (a) **designer** đổi ảnh sang ruộng đậu (hay đậu tương) cuối vụ **còn lá vàng úa trên thân**; hoặc (b) giữ ảnh, **content-editor** đổi dấu hiệu sang thứ ảnh có thật — ví dụ một "the stems and pods turn dry and brown" · "thân và quả khô lại, ngả nâu", gợi ý q3 "Em nhìn thân cây và quả đậu nhé.", `explanation_correct` "Old bean plants turn dry and brown.", bài 6 w1 sửa theo, `alt` → "Dry brown bean plants" · "Cây đậu khô màu nâu". Câu q3 (`prompt` "stay green forever") vẫn đúng với cả hai cách.

**B2 · Bài 1 q5: lựa chọn sai `q5_mango` nước đôi, và `alt` của đáp án đúng đọc thẳng lời giải.**
- File: `01-vat-song-nao-cung-co-vong-doi.md:455–500`; ảnh `q5.q5_mango` (dùng lại `cay-quanh-em/cay-moc-len-tu-hat` `explore_big_tree`), `q5.q5_old_tree` (cắt 5:2 từ "Cây da").
- Vì sao (1): "Which plant is old?" · "Cây nào đã già?" — lựa chọn sai là **một cây xoài cổ thụ**. Cây xoài to đang ra quả **cũng là một cây già**; thứ duy nhất làm nó "không già" là khung cắt 5:2 chỉ lấy **tán lá, không thấy thân**. Trái luật "ảnh đáp án sai không nước đôi" (`_topic.md` Quy ước 6 của *Cây quanh em*, nhắc lại ở SK-053).
- Vì sao (2): gợi ý là "Look closely at the trunks." · "Em nhìn kỹ thân cây nhé." nhưng **chỉ một thẻ có thân cây** (đáp án đúng); hai thẻ kia là cây non chụp gần và tán xoài. Bé không so được độ to, chỉ cần chọn "cái có thân". Thêm nữa `alt` đáp án đúng "A big tree with a thick, rough trunk" · "Cây to, thân to và sần sùi" **trùng gần nguyên văn** `explanation_correct` "Old trees have a thick, rough trunk." · "Cây già có thân to, gốc sần." → chế độ đọc/VoiceOver nghe là biết đáp án.
- Đề xuất: **designer** đổi `q5_mango` sang một mục cắt khác của cùng ảnh xoài **thấy thân cây thon**, hoặc sang một cây rõ ràng chưa già (cây con trong chậu, hàng cây mới trồng); **content-editor** đổi `alt` của `q5_old_tree` sang câu tả hình mà không trùng lời giải, vd "A tree with many hanging roots" · "Cây có nhiều rễ phụ buông xuống" (ảnh có rễ phụ thật). Nếu PM muốn giữ cây xoài, thêm vào `feedback` câu phân biệt tuổi, không chỉ "khoẻ, đang có quả".

**B3 · Bài 4 ô `explore_frog`: vòng 2 và vòng 3 trông như nhau, nên vòng đời ếch đọc thành bốn chặng.**
- File: `content/images/composed/lon-len/con-vat-doi-hinh-dang.learn.explore.explore_frog.jpg`; phần thứ ba của vòng là `tray_tadpole_legs` ("Tadpole with legs", CC BY 2.0) · `04-con-vat-doi-hinh-dang.md:140` (brief hình ghép), `:288` (món Chơi), `:527` (thẻ từ `tadpole`).
- Vì sao: xem ảnh gốc 512×513 và phóng to 4,5× — **hai chân sau chỉ là một vệt vàng mờ, cùng màu với rong nền, lệch nét**. Ở ô tròn của hình ghép (đường kính ~210 px trên 1024) và ở món Chơi (110×116 pt) **không thể nhìn ra chân**. Kết quả: vòng 2 (đàn nòng nọc) và vòng 3 (một con nòng nọc) chỉ khác nhau ở số lượng, không ở "mọc chân" — ý chính của ô.
- `_topic.md:203` đã ghi nhận ("phải nhìn kỹ mới thấy") và không câu hỏi nào bắt bé nhìn ra chân, nên **không sai chữ**; nhưng hình ghép là chỗ duy nhất bài dạy "nòng nọc mọc chân" bằng mắt.
- Đề xuất: **designer** cắt sát hơn vào vùng đuôi–chân cho mục dùng trong hình ghép (một mục `crop` riêng, như `q1_old_dog`), hoặc tìm ảnh nòng nọc chân sau rõ hơn, hoặc (quyết định 8 đã cho phép) **vẽ** chặng này. Nếu giữ nguyên: bỏ vòng 3 khỏi hình ghép, còn bốn vòng, và giữ món Chơi.

**B4 · Bài 3 `explore_hatch`: ảnh là một khay trứng lò ấp với bốn gà con, `alt` nói một con.**
- File: `con-vat-de-trung.json` `learn.explore.explore_hatch` ("Newly-hatched chickens", Otwarte Klatki, CC BY 2.0) · `03-con-vat-de-trung.md:131–147` (ô Hatch), `:356` (q2), từ `hatch`.
- Vì sao: brief xin "**một** chú gà con đang chui ra từ quả trứng đã nứt… chụp gần trên rơm hay nền trơn". Ảnh thật là **hàng chục quả trứng xếp kín khung** với bốn gà con, một con ướt đang chui ra ở mép trái — tức là khay máy ấp, đúng thứ ticket để ở "Ngoài phạm vi" ("ấp trứng bằng máy"). `alt` "A chick coming out of its shell" · "Gà con đang chui ra khỏi vỏ trứng" (số ít) dùng ở **3 chỗ** không tả đúng ảnh. Gợi ý q2 "Look at the shell and the beak." · "Em nhìn vỏ trứng và cái mỏ nhé." khó theo: mỏ của con đang nở bị khuất, phần thấy rõ là da hồng ướt.
- Đã kiểm phần an toàn: **không máu, không phôi, không trứng vỡ lòng đỏ** — quyết định phiên chính về mặt này đứng vững. Dựng thử khung câu 4:3 ở cỡ hiển thị thật (348 pt) thì con gà đang nở **có đọc ra được**.
- Đề xuất (rẻ nhất, không đổi ảnh): **designer** thêm `crop` cắt vào góc trên trái (con gà đang nở + quả trứng nứt + một con khô bên cạnh), để khung còn 1–2 con; như vậy `alt` số ít đúng và gợi ý theo được. Nếu Duy không muốn cảnh lò ấp thì đổi ảnh. Giữ nguyên cũng được nhưng phải sửa `alt` thành "A chick coming out of its shell among many eggs" (dài) hoặc "Chicks and eggs" — kém hơn.

**B5 · Thẻ từ: 12/24 thẻ dùng ảnh vuông trong khung 2:1, mất một nửa ảnh, không có mục cắt riêng.**
- File: cả sáu file chọn ảnh; các khoá `vocab.grow`, `vocab.old`, `vocab.kitten`, `vocab.piglet`, `vocab.egg`, `vocab.hatch`, `vocab.tadpole`, `vocab.butterfly`, `vocab.seedling`, `vocab.bean`, `vocab.breathe`, `vocab.drink`.
- Vì sao: Explorer `vocab` là khung **2:1** (`tools/content-cli/image-slots.json`, `age_groups.explorer.ratios.vocab`), và chính ghi chú trong file đó cảnh báo: "ảnh vuông trong khung 2:1 lệch ×2, **vẫn dưới `max_factor` 2,2 nên fetch/build không cảnh báo**; thẻ từ ảnh vuông phải kiểm tay". App cắt lấp khung (`PictureFit.mode` → `.fill` khi tỉ lệ ≤ 2,2), tức **bỏ nửa trên và nửa dưới ảnh**. Luật cắt khung riêng mà designer tự đặt ("chỉ tạo mục cắt khung riêng khi lệch quá ×2,1") để lọt đúng ca này. Đối chiếu: các chủ đề Explorer khác chỉ có **3/147** thẻ từ dùng ảnh vuông, tức nếp chung là làm mục cắt 2:1.
- Dựng thử dải giữa cho hai ca rủi ro nhất (`vocab.seedling` cây con thẳng đứng, `vocab.grow` chó con) thì **vẫn đọc được** — nên đây là lỗi sổ sách hơn là lỗi hỏng màn hình, nhưng 12 thẻ không ai nhìn trước.
- Đề xuất: **designer** thêm mục cắt 2:1 cho 12 khoá trên (như đã làm cho `person-baby.2x1`, `person-adult.2x1`, `vocab.life_cycle`), hoặc xem từng thẻ một và ghi vào `_topic.md` rằng đã kiểm tay. Đề nghị cho **dev**: hạ `max_factor` riêng cho khe `vocab` (vd 1,6) để `images fetch` tự báo.

### c. Nhỏ (10)

- **c1.** `explore_born` (`vat-song-nao-cung-co-vong-doi.json`, dùng 7 chỗ): trên bụng chó mẹ, ngay cạnh đầu chú chó con phía trên, có **một vệt đỏ au trông như chỗ trầy** (rõ khi phóng to; ở cỡ hiển thị 420 px chỉ là vệt nâu đỏ nhỏ). Quy ước 6 cấm "con vật bị thương, máu". Khung vuông ô Học và thẻ `order_sequence` giữ vệt này; khung 5:2 và 2:1 cắt mất. Đề xuất: thêm `crop` bỏ dải trên ~12% cho mục gốc; không chặn.
- **c2.** `explore_air` (`muon-lon-len-con-vat-can-gi.json`): vòng cổ chó có **nhãn hiệu đỏ–trắng trên khoá** và **thẻ tên có chữ khắc**; không đọc được ở cỡ thật nhưng vẫn là "vòng cổ có chữ" mà Quy ước 6 cấm. `explore_grow` cũng có thẻ xương (trơn, không chữ) và `q4_duck` có **vòng chân**. Chỉ nêu.
- **c3.** Chuỗi vịt bài 3 q4 không cùng loài: `q4_ducklings` là **vịt xiêm** con (vàng nâu, chụp trong hộp), `q4_duck` là **vịt Laufente** xám đốm đứng thẳng (ảnh dùng lại của *Gọi tên và nhóm động vật*), `q4_egg` là trứng vịt trên sỏi. Tiêu chí designer ghi "chuỗi gà… nhất quán"; chuỗi này đã đổi sang vịt nên luật áp theo. Bé 5–7 khó thấy vịt lớn là "con non kia lớn lên". Đề xuất: tìm một ảnh vịt nhà nâu/vàng, hoặc ghi nhận lệch vào `_topic.md`.
- **c4.** `tray_froglet` ("Fully-formed Tadpole", CC BY 4.0): ảnh **chụp từ dưới bụng trên nền trắng studio**, bốn chân xoè. Đúng nội dung (ếch con còn đuôi) nhưng lạc kiểu với bốn ảnh ếch còn lại (đều ngoài tự nhiên) — ở hình ghép, vòng thứ tư trắng tinh giữa bốn vòng màu nước. Brief cũng xin "ngồi trên lá hay mép nước". Chỉ nêu.
- **c5.** Kệ Chơi bài 2: ba trong bảy món là ảnh **mẹ + con** nhưng thuộc nhóm con non — `tray_litter` (mèo mẹ vằn xám chiếm nửa khung, nhóm "Mèo con"), `tray_calf_milk` (trâu mẹ đang gặm cỏ, nghé khuất phía sau, nhóm "Nghé"), `tray_piglets` (lợn nái hồng to, nhóm "Lợn con"). Kệ Explorer **chỉ hiện ảnh, không hiện chữ** (`PlayStep.swift:174` "three columns of big pictures, no word"), nên bé phải nhận ra con non bằng mắt. Hai nhóm đầu có món thứ hai rõ ràng nên vẫn chơi được; **"Lợn con" chỉ có một món**. Đề xuất: cắt khung `tray_piglets` sát vào ba con lợn con.
- **c6.** `explore_kittens`: ba mèo con **cùng màu đen**, khác màu mẹ. Ví dụ hai ô Kittens "some have a different colour from mum" · "có con khác màu lông mèo mẹ" đúng nhưng mất nửa ý Oak L1 ("có con giống mẹ, có con không"). Thêm nữa đây là ảnh **bú** thứ ba liên tiếp trong trang Học bài 2 (`explore_piglets` bú, `explore_calf` bú, `explore_kittens` bú) trong khi brief xin "không cần cảnh đang bú" để phân biệt. Chỉ nêu; designer đã ghi ở mục 2.
- **c7.** `alt` lựa chọn đúng trùng chữ câu hỏi (Quy ước 8): bài 2 w2 "Which **dog** is old?" ↔ `w2_old` "A **dog** with a grey face" (hai lựa chọn kia là "Tiny puppies…"); bài 3 q5 "Which **baby** starts in an egg, too?" ↔ `q5_turtles` "**Baby** turtles on the sand". Cả hai đều yếu (chữ phân biệt thật là "old", "egg") nhưng trong chế độ nghe vẫn là một gợi ý thừa. Đề xuất `alt` riêng: "A grey-faced pet on a porch"; "Little turtles on the sand".
- **c8.** Hai hình ghép vuông ở trang Học: đo khung nội dung được `explore_frog` x 93–934, `explore_butterfly` x 86–942 (trên 1024). Khung Học Explorer là khung **dọc** (`ExplorerLearnStep.swift:229`, rộng ≈ nội dung − 5 − 16, cao tối đa `pagePictureMax` 380 − 16), app cắt lấp khung vì tỉ lệ dưới 2,2 → trên iPhone 16 cắt ≈ 75 px mỗi bên, **còn dư ~7 px so với mép vòng tròn của hình bướm**. Đủ nhưng sát. Máy hẹp hơn hoặc khung thấp hơn (khi phần chữ dài) sẽ cắt vào vòng tròn. **Chưa kiểm trên máy** (xem D).
- **c9.** `explore_calf`: nghé **đang bú nhưng đầu khuất hẳn** sau chân sau trâu mẹ, còn trâu mẹ thì **đang cúi gặm cỏ**; ở khung vuông ô Học, ảnh dễ đọc thành "con trâu ăn cỏ" (đúng cảnh bài 6 dạy) hơn là "nghé bú sữa" — nhất là vì ô này là chỗ duy nhất dạy "con non bú sữa rồi lớn lên". Cũng có một **sợi dây thép căng ngang khung** (brief xin "không dây thừng nổi bật"). Đề xuất: cắt bỏ phần đầu trâu mẹ, lấy vùng nghé + bụng trâu.
- **c10.** Nhỏ hơn nữa, chỉ ghi: `explore_you` là bong bóng xà phòng trên **phố kiểu châu Âu**, không có bạn nhỏ (designer đã ghi, Quy ước 11 "bối cảnh Việt Nam khi có ảnh hợp lệ"); `tray_fry` là **bể ương dày đặc cá, nền tối**, khó đọc ra "cá con" ở ô 110 px; `explore_flowers` có **hai, ba con kiến** trên chùm hoa; `tray_tomato` và `tray_froglet` là ảnh nền trắng studio đứng cạnh ảnh ngoài trời trên cùng kệ (không trái luật nào, vì đều là ảnh chụp).

### D. Chưa kiểm

- **Không mở trang gốc trên Commons / Openverse / Flickr / iNaturalist trong lượt này** (không gọi mạng ra ngoài): giấy phép, tên tác giả và loài đọc từ file chọn ảnh, `content/.images/index.json` (`verified.via`, `verified.at` 18/11) và manifest gói — tin theo lượt kiểm của designer. Riêng `explore_flowers` (iNaturalist, CC0): `verified.via` ghi "Openverse API (detail)" với đúng tác giả "Agnes Trekker", tức **đã có một lượt xác nhận bằng máy**; yêu cầu "một người mở trang" của designer (mục 12) vẫn còn mở — đề nghị PM giao cho Duy khi review.
- **Không mở simulator** (Duy chốt 29/10: 1 máy, 1 lượt; phiên chính đã chạy một bài). Do đó: khung cắt thật của hình ghép ở trang Học (c8), 12 thẻ từ ảnh vuông (B5), và ô Chơi 110×116 (B3, c5, c10) **mới chỉ tính bằng số đo trong code và ảnh dựng lại**, chưa nhìn trên máy. Đề nghị: khi ios-dev hoặc phiên chính chạy bài tiếp theo trên iPhone 16, chụp màn trang Học bài 4 và trang Từ mới bài 3 rồi dán vào ticket.
- Chưa xem tận mắt hết **58 ảnh dùng lại** của các chủ đề khác; đã xem những ảnh đứng trong các câu và chỗ có nghi vấn (hàng rào tre, mèo con, nghé, gà con, gà mái, vịt lớn, trâu, chim sẻ, ếch, cây xoài, cây non, hạt đậu, cây đậu con, dạ dày).
- Không chạy lại `validate`, `build`, `tts`, `check-pack` (phiên chính đã chạy; gói build 03:05 19/11, sau lần sửa nội dung cuối 02:04 — đã đối chiếu dấu thời gian).

### Trả lời các câu hỏi riêng của ticket

1. **`explore_hatch` (gà nở trong lò ấp):** an toàn (không máu, không phôi) nhưng **không khớp brief và `alt`** — xem B4; đề nghị cắt khung thay vì đổi ảnh.
2. **`explore_kittens` có giống `explore_milk` quá không:** **không**. Khác loài mèo, khác nền (cỏ ↔ chiếu đỏ), khác màu; và `explore_milk` không xuất hiện ở bất kỳ chỗ nào trong *Lớn lên*. Vấn đề thật của ảnh này nhỏ hơn và nằm ở c6.
3. **`explore_dry` là đậu tương:** chuyện loài **không phải vấn đề** (chữ nói "cây đậu" chung, đậu tương vẫn là cây đậu). Vấn đề là **màu lá** — xem B1.
4. **Nòng nọc mọc chân nhìn ra không:** **không** — xem B3. **Hình ghép có bị cắt ở khung dọc trang Học không:** trên iPhone 16 tính ra là **không**, nhưng chỉ dư ~7 px ảnh; xem c8 và D.
5. **Cây đa có rõ là "cây già" không:** so với cây non thì **rõ** (thẻ 5:2 cắt vào thân bện rễ, khớp gợi ý mới); so với **cây xoài** thì **không** — xem B2.

### Ai cần sửa gì

- **designer:** B1(a) hoặc hỗ trợ B1(b) · B2 (mục cắt `q5_mango`) · B3 (cắt hoặc đổi `tray_tadpole_legs`) · B4 (cắt `explore_hatch`) · B5 (12 mục cắt 2:1) · c1, c5, c9 (cắt khung) · c3 (ảnh vịt lớn).
- **content-editor:** B1(b) nếu PM chọn giữ ảnh (ví dụ ô Grow old, gợi ý + lời giải q3, bài 6 w1, `alt` ba chỗ) · B2 (`alt` của `q5_old_tree`, `feedback` `q5_mango`) · B4 (`alt` nếu không cắt khung) · c7 (hai `alt` riêng) · c6 (một ví dụ ô Kittens, nếu muốn).
- **dev:** B5, đề nghị thêm ngưỡng riêng cho khe `vocab` trong `tools/content-cli/image-slots.json` (và/hoặc cờ `--max-factor` cho `images fetch`) để lần sau máy báo giúp.
- **PM:** chốt B1 (a hay b), B2 (đổi ảnh hay nới luật nước đôi), B4 (có nhận cảnh lò ấp không), và giao cho Duy mở `https://www.inaturalist.org/photos/152113094` xác nhận CC0 trước khi phát hành.

## Quyết định sau rà ảnh (phiên chính 19/11, chế độ auto theo PM)

- **B1:** chọn (b), giữ ảnh đậu tương. Dấu hiệu "già" của cây đậu đổi thành "thân và quả khô lại, ngả nâu" ở cả 4 chỗ (ô Grow old, gợi ý q3, `explanation_correct` q3, bài 6 w1) và `alt` `explore_dry` (content-editor).
- **B2:** thay lựa chọn sai `q5_mango` bằng ảnh **cây non thân mảnh, thấy rõ thân** (giữ key, designer chọn ảnh, cắt khung 5:2 thấy thân); content-editor sửa `alt` lựa chọn đó và `alt` `q5_old_tree` để không lặp lời giải.
- **B3:** designer tìm ảnh nòng nọc mọc chân thấy chân rõ (CC0/PD/CC BY); không có thì cắt sát vào chân sau. Không đổi sang hình vẽ (giữ một kiểu ảnh trong chuỗi ghép và trên kệ).
- **B4:** nhận cảnh lò ấp; designer cắt khung vào một gà con đang chui khỏi vỏ để `alt` số ít đúng.
- **B5:** designer thêm mục cắt khung 2:1 cho 12 thẻ từ dùng ảnh vuông. Dev thêm ngưỡng riêng cho khe `vocab` trong `image-slots.json` để máy tự báo.
- **c-mục:** làm theo phân việc của tester. Thêm cho designer: ảnh ếch ở thẻ Tổng kết trang 2 bài 4 (khung 120 px cao) bị cắt mất đầu ếch, cần mục cắt hoặc chỉnh tâm.
- **Hoa đậu xanh iNaturalist:** phiên chính mở trang xác nhận giấy phép.
- **Hoa đậu xanh (`explore_flowers`) — đã xác nhận 19/11:** trang ảnh bị Cloudflare chặn khi mở bằng trình duyệt tự động; xác nhận qua API công khai `api.inaturalist.org/v1/observations?taxon_name=Vigna radiata&photo_license=cc0`: ảnh 152113094 thuộc quan sát https://www.inaturalist.org/observations/91916644, `license_code` = `cc0`, attribution "no rights reserved".

## Ghi chú designer (19/11, lượt 2)

Sửa ảnh theo "Rà ảnh (tester 19/11)" và "Quyết định sau rà ảnh". Chỉ đổi sáu file chọn ảnh `content/images/explorer/lon-len/*.json` và hai hình ghép `content/images/composed/lon-len/con-vat-doi-hinh-dang.learn.explore.explore_{frog,butterfly}.jpg`. Không đổi key nào trong `.md`; không sửa `content/explorer/**`, `apps/ios`.

**Ảnh mới (3), cả ba đã mở trang gốc 19/11:**

| Key | Ảnh | Nguồn · giấy phép | Tả ngắn (cho `alt`) |
| --- | --- | --- | --- |
| `q5.q5_mango` · bài 1 | "young mango tree mangifera indica…", mauro halpern | Flickr qua Openverse · CC BY 2.0 | Cây xoài non trên bãi cỏ công viên, thân mảnh thấy rõ từ gốc tới chỗ chia cành, lá non đỏ nâu; hai cây chuối non phía trái, góc tường nhà phía phải; không chữ, không người. Khung 5:2 cắt từ dưới tán tới gần gốc. |
| `q4.q4_duck` · bài 3 | "Mallard Duck", Oneterry AKA Terry Kearney | Flickr qua Openverse · CC0 1.0 | Vịt mái lông nâu đốm, mỏ vàng cam, chân cam, đang bước trên bờ ao; vài con vịt bơi mờ phía sau. Thay vịt Laufente xám (c3). |
| `tray.tray_tadpole_legs` · bài 4 | "Tadpole - Flickr - GregTheBusker", Greg Schechter | Wikimedia Commons (từ Flickr), ảnh gốc 3072×2304 · CC BY 2.0 | Nòng nọc to chụp từ trên xuống trong suối nông, nền đá vàng và nước xanh thẫm; hai chân sau có bàn chân thấy rõ ở gốc đuôi. Không ghi loài. Thay ảnh cũ chân mờ (B3). |

Ảnh cũ không còn dùng trong *Lớn lên*: "Tadpole with legs" (Monkeystyle3000); vịt Laufente và cây xoài to vẫn ở chủ đề gốc của chúng. Sổ ảnh mới của chủ đề: **26 ảnh mới + trứng bướm** (thêm cây xoài non, vịt mái nâu); giấy phép **CC0 9, PD 3, CC BY 15** (2.0: 10).

**Mục cắt khung (chép đủ mục kèm `crop`, không qua `same_as`):**
- **B2** `q5.q5_mango`: ảnh mới ở trên, khung 5:2.
- **B3** `tray.tray_tadpole_legs` khung vuông vào thân và chân sau; `vocab.tadpole` mục riêng 2:1. Hình ghép `explore_frog` ghép lại với ảnh mới (phần thứ ba cắt sát thân và chân; phần ếch lớn cắt vào đầu ếch nhìn thẳng).
- **B4** `explore_hatch` (bài 3) cắt vuông vào một gà con ướt đang chui khỏi vỏ nứt (thấy mỏ, lông ướt, nửa vỏ trên); `q2` mục riêng 4:3 cùng cảnh; `vocab.hatch` mục riêng 2:1 (mép phải còn lộ đầu một gà con khác, không tránh được ở khung 2:1).
- **B5** 12 thẻ từ có mục 2:1 riêng: `vocab.grow`, `vocab.old` (bài 1) · `vocab.kitten`, `vocab.piglet` (bài 2) · `vocab.egg`, `vocab.hatch` (bài 3) · `vocab.tadpole`, `vocab.butterfly` (bài 4) · `vocab.seedling`, `vocab.bean` (bài 5) · `vocab.breathe`, `vocab.drink` (bài 6). `vocab.egg`, `vocab.seedling`, `vocab.bean` chép mục gốc của chủ đề khác kèm khung. `vocab.grow`, `vocab.butterfly` lấy rộng hơn khung vuông cũ để con vật trọn trong khung; `vocab.breathe` để vòng cổ có chữ (c2) gần như ra ngoài khung.
- **c1** `explore_born`: cắt bỏ dải trên 12%, mất vệt đỏ trên bụng chó mẹ; chó con trên cùng còn đầu và thân (mất bàn chân sau).
- **c5** `tray.tray_piglets` bài 2: mục riêng khung vuông sát bốn lợn con đang bú. Bài 3 `tray_piglets` (nhóm "mẹ đẻ con") giữ ảnh có lợn mẹ.
- **c9** `explore_calf`: cắt bỏ đầu trâu mẹ đang gặm cỏ, còn nghé và nửa sau trâu mẹ, đọc ra "nghé bú". Áp cho mọi chỗ dùng (ô Học, kệ, q2 bài 2, `explore_like` bài 4); sợi dây thép vẫn còn ở nửa dưới khung.
- **c3** `q4.q4_duck`: ảnh vịt mái nâu ở trên (vịt trời *Anas platyrhynchos*, tổ tiên vịt nhà). Chuỗi trứng vịt → vịt con lông vàng đầu nâu → vịt lớn lông nâu đọc liền hơn; vẫn không cùng một giống.
- **c8** hai hình ghép vuông ghép lại với vòng tròn kéo vào: khung nội dung (kể cả bóng) `explore_frog` x 123–904, y 112–865; `explore_butterfly` x 125–903. So với mức cắt ~75 px mỗi bên ở trang Học iPhone 16 (số tester), còn dư khoảng 48 px (trước là 7–18 px). Script ghép: scratchpad phiên `sk053/comp/compose_v2.mjs`.
- **Thêm (thẻ Tổng kết trang 2 bài 4):** ảnh là hình câu misconception `q6` (con ếch). Mục `q6` thêm `crop` vào đầu ếch (khung khoảng 2,1:1): khung 120 cao, rộng gần hết màn (~2,85:1, iPad rộng hơn) lấy dải giữa vẫn đủ hai mắt và miệng; khung câu 4:3 lấy giữa vẫn thấy cả đầu. `w1` (cùng ảnh) giữ nguyên.

**Kết quả lệnh:** `node tools/content-cli/src/cli.ts images fetch content/images/explorer/lon-len` (lượt cuối 19/11): **6 file chọn ảnh · 89 ảnh khác nhau · 0 tải mới · 89 đã có · 0 lỗi · hình tự vẽ 8 · hình ghép 3, 0 chờ ghép**; **0 dòng "Ảnh lệch khung", 0 dòng "Chưa kiểm tỉ lệ"** với ngưỡng thẻ từ 1,6 mới của dev (12 thẻ từ ảnh vuông không còn). Các lượt trước: 19 ảnh tải mới; `q6` bị HTTP 429 ở `upload.wikimedia.org` ba lượt liền (ảnh gốc 1024 px, tải thẳng bản gốc), lượt thứ tư sau khoảng 25 phút thì qua. Tác giả ảnh nòng nọc ghi đúng chuỗi Commons "Greg Schechter from San Francisco, USA" (theo nếp các mục Flickr qua Commons khác) để hết cảnh báo lệch tác giả. Phụ: ảnh ếch `w1`/`q6` trên Flickr gốc hiện ghi BY-NC-SA 2.0; bản trên Commons được FlickreviewR duyệt CC BY 2.0 lúc tải lên (giấy phép CC không rút lại được), nên vẫn dùng bản Commons như Discoverer; không dùng link Flickr.

**Cần content-editor sửa chữ (ảnh đã đổi, key giữ):**
1. Bài 1 `q5_mango`: ảnh giờ là cây xoài **non**, không có quả. `label` "mango tree" · "cây xoài" nên thành "young mango tree" · "cây xoài non"; `feedback` "This mango tree is strong and has fruit." sai với ảnh, đề xuất "This young mango tree has a thin trunk. It is still growing." · "Cây xoài non này thân còn mảnh, đang lớn."; `alt` đề xuất "A young mango tree on the grass" · "Cây xoài non trên bãi cỏ"; brief bỏ "Dùng lại hình `explore_big_tree`", thành ảnh mới của bài. Cộng phần `alt` `q5_old_tree` đã có trong quyết định B2.
2. Bài 3 `q4_duck`: `alt` "A duck standing on the grass" · "Con vịt đứng trên bãi cỏ" lệch (ảnh là bờ ao, nền cát), đề xuất "A brown duck by the pond" · "Con vịt lông nâu bên bờ ao"; brief bỏ "Dùng lại hình `w1_duck`…", thành ảnh mới của bài.
3. Bài 4 `tray_tadpole_legs`: `alt` "A tadpole with tiny back legs" · "Nòng nọc mới nhú hai chân sau" vẫn đúng; `_topic.md` dòng bảng ảnh bỏ "(chân nhỏ, nhìn kỹ mới thấy)", ghi nguồn mới.
4. `_topic.md`: mục "Ảnh mới" (26 + trứng bướm, thêm `q5_mango`, `q4_duck`), bảng hình dùng chung (hai key trên không còn mượn chủ đề khác), ghi lệch c3 đã xử lý. Các `alt` khác (`explore_hatch` số ít, `explore_calf`, `tray_piglets`, `q6`) khớp ảnh mới cắt, không phải sửa.

**Còn mở:** hai ảnh Flickr mới (`q5_mango`, `q4_duck`) `fetch` in "Kiểm tay"; designer đã mở hai trang Flickr 19/11 (mango ghi CC BY 2.0, vịt ghi CC0 1.0), người duyệt mở lại trước khi phát hành theo nếp cũ. Chưa xem trên máy (không mở simulator); khung cắt ở trên là ước tính bằng ảnh dựng lại theo số đo của tester.

## Ghi chú content-editor (19/11, lượt 2)

Sửa chữ theo rà ảnh và quyết định sau rà ảnh, không đổi key. B1: dấu hiệu "già" của cây đậu thành "thân và quả khô lại, ngả nâu" ở ô Grow old bài 5 (ví dụ một), q3 bài 5 (`hint`, `explanation_correct`, `feedback_true`), bài 6 w1 (`prompt`, `hint`); `alt` `explore_dry` → "Dry, brown bean plants" · "Cây đậu khô, ngả nâu". B2: `q5_mango` `label` "young mango tree" · "cây xoài non", `feedback` "This young mango tree has a thin trunk. It is still growing." · "Cây xoài non này thân còn mảnh, đang lớn.", `alt` "A mango tree on the grass" · "Cây xoài trên bãi cỏ"; `alt` riêng `q5_old_tree` "A big tree with many roots" · "Cây to, nhiều rễ" và `q5_young` "Small green plants in the soil" · "Những cây nhỏ mọc trên đất" (ba `alt` q5 không có chữ young/old/non/già). c3: `q4_duck` `alt` "A brown duck by the pond" · "Con vịt lông nâu bên bờ ao". c6: ví dụ hai ô Kittens "some kittens have mum's colour, some do not" · "có mèo con giống màu mẹ, có con thì khác". c7: `alt` riêng bài 2 w2 `w2_old` "A pet with a grey face" · "Con vật có mõm bạc", bài 3 q5 `q5_turtles` "Little turtles on the sand". `_topic.md` cập nhật.

**Phát hiện (ngoài phạm vi SK-053, cả repo):** trên thẻ lựa chọn Explorer, VoiceOver đọc `label` chứ không đọc `alt` (`apps/ios/Packages/SKKit/Sources/LessonPlayer/Views/ExplorerQuestionStep.swift` khoảng dòng 165, 173), nên `label` như "old tree", "old dog" lộ đáp án với người dùng VoiceOver trước khi chọn. Cần PM + ios-dev quyết (ví dụ đọc "lựa chọn một, hai, ba" tới khi trả lời). Sổ sách: brief `duck_card` ghi dùng lại `w1_duck` (con-vat-nuoi-trong-nha) nhưng file chọn ảnh trỏ `tray.tray_duck` (ca-va-luong-cu) — designer xem lại cho khớp.

## Rà ảnh (tester 19/11, lượt 2)

> Phạm vi: kiểm lại **B1–B5, c1–c10** của lượt 1 sau "Ghi chú designer (19/11, lượt 2)" và "Ghi chú content-editor (19/11, lượt 2)"; xem mắt các ảnh mới và các khung cắt mới; cộng việc **test vector `KeyPointPicturesTests.table`**. Không mở simulator. Không sửa `content/`, không sửa ảnh. File test đã sửa: `apps/ios/Packages/SKKit/Tests/LessonPlayerTests/QuizWaveOneTests.swift`.
>
> **Kết quả: B1–B5 đóng hết; 8/10 mục c đóng hoặc đã xử lý; 1 mục c sửa đi sai hướng (c6); 2 lỗi mới từ việc rà test vector (B6, B7); 3 mục nhỏ mới (c11–c13). Không còn lỗi chặn về ảnh.**

### A. Kiểm lại bằng máy — đạt

- Gói `content/.build/pack`: manifest **04:58 19/11**, sau lần sửa cuối (`_topic.md` 04:53, file ảnh 04:21, hình ghép 04:19–04:20). Chủ đề có **207 `Image` → 98 asset khác nhau**, 0 asset thiếu trong manifest, 0 file thiếu trong `assets/`, **0 giấy phép cấm, 0 CC BY thiếu tác giả, 0 `alt` trống**. Gói dùng **đúng hai hình ghép mới** (`explore_frog` `c189f657…`, `explore_butterfly` `2090497c…`), không còn bản cũ.
- `validate content/explorer/lon-len`: **0 lỗi**, 7 cảnh báo `[CẦN KIỂM]` (đúng như content-editor ghi).
- Key: 207 chỗ `.md` ↔ 207 mục file chọn ảnh, 0 thiếu/thừa/trùng. Chuỗi `same_as`: 0 mục trỏ vào mục cũng là `same_as`. Giấy phép 63 ảnh nguồn ngoài: **CC0 24 · CC BY 2.0 20 · CC BY 3.0 9 · PD 6 · CC BY 4.0 4 · CC BY 2.5 2**, 0 BY-SA/NC/ND, 0 thiếu `author`/`license_url`.
- Luật "một câu, một kệ một loại hình": vẫn **0 chỗ trộn** trong lựa chọn/thẻ/món. Luật "đáp án đúng không là ảnh mới duy nhất": vẫn **0 câu** trong chủ đề.
- Đếm ảnh mới: máy đếm **26 ảnh chụp nguồn chỉ có ở *Lớn lên*** — khớp con số 26 của `_topic.md` và của designer.

### B. Kiểm lại B1–B5

- **B1 · đóng.** Ảnh `explore_dry` giữ nguyên; chữ đổi đúng bốn chỗ cộng `alt` và `feedback_true`: ô Grow old ví dụ một "the stems and pods dry and turn brown" · "thân và quả khô lại, ngả nâu"; q3 `hint` "Look at the stems and the pods." · "Em nhìn thân cây và quả đậu nhé.", `explanation_correct` "Old bean plants dry and turn brown.", `feedback_true` "dry and brown"; bài 6 w1 `prompt` + `hint` theo; `alt` "Dry, brown bean plants" · "Cây đậu khô, ngả nâu"; `brief` tả lại đúng ảnh. Đối chiếu với ảnh: khung đúng là thân + quả khô ngả nâu, gần như không còn lá — chữ và hình giờ nói cùng một điều. 0 chỗ còn chữ "lá vàng" gắn với ảnh này.
- **B2 · đóng.** `q5_mango` là ảnh mới (cây xoài **non**, Flickr/Openverse CC BY 2.0): khung 5:2 thấy **thân mảnh suốt từ gốc tới chỗ chia cành**, lá non đỏ nâu; đặt cạnh thân cây đa bện rễ thì "thân to ↔ thân mảnh" đọc được ngay, hết nước đôi. Đã soi góc trên trái: vật màu xanh là mái che / tường thấp, **không có chữ, không có người**. Ba `alt` của q5 không còn chữ young/old/non/già và `alt` đáp án đúng ("A big tree with many roots") không còn lặp lời giải. `label` "young mango tree" · "cây xoài non" và `feedback` mới khớp ảnh. **Nhưng xem c11**: trên thẻ lựa chọn, VoiceOver đọc `label`, không đọc `alt`.
- **B3 · đóng.** `tray_tadpole_legs` là ảnh mới (Greg Schechter, CC BY 2.0): nòng nọc chụp từ trên xuống, **hai chân sau có bàn chân và ngón thấy rõ** ở gốc đuôi, nét và tương phản tốt. Trong hình ghép `explore_frog` mới, vòng 3 giờ khác hẳn vòng 2 (thân to + chân) — vòng đời năm chặng đọc ra năm chặng.
- **B4 · đóng.** `explore_hatch` có mục cắt vuông mới vào **một** chú gà con đang chui khỏi vỏ, thấy nửa vỏ trên và vỏ dưới nứt; `q2` có mục 4:3 cùng cảnh, `vocab.hatch` mục 2:1. `alt` số ít giờ tả đúng ảnh; gợi ý q2 "nhìn vỏ trứng và cái mỏ" theo được. Xem c12 về cỡ hiển thị.
- **B5 · đóng.** Đếm máy 24 thẻ từ của chủ đề: **12 thẻ trước là ảnh vuông nay đều đúng 2:1** (lệch ×1,00). 6 thẻ còn lại lệch ×1,18–×1,50 (ảnh 4:3 hay 3:2 trong khung 2:1) — đúng mức các chủ đề Explorer khác và dưới ngưỡng 1,6 dev mới đặt, không phải sửa. Dựng thử `vocab.breathe`: vòng cổ có nhãn hiệu đã ra ngoài khung.

### B6 · Lỗi mới · Bài 6, thẻ Tổng kết: ý chính 1 (con vật) lấy ảnh "Người", ý chính 3 (người) lấy ảnh "Không khí"

- File: `content/explorer/lon-len/06-muon-lon-len-con-vat-can-gi.md` (ý chính + bốn ô Học); engine `apps/ios/Packages/SKKit/Sources/LessonPlayer/LessonRecap.swift:118` `KeyPointPictures.match`.
- Vì sao: ô Học 4 "People, too · People need food, water and air, too." lặp **đúng bốn chữ** của ý chính 1 "Animals need food, water and air." (need, food, water, air → điểm 4), cao hơn điểm của ô 1 *Food* (animal, food → 2), nên ý chính 1 **chiếm ô 4**. Đến lượt ý chính 3 "People need the same things, too." thì ô *People* đã bị lấy, nó nhận ô còn lại là ô 3 *Air*.
- Hệ quả trên màn Tổng kết (Màn 1): dòng "Con vật cần thức ăn, nước và không khí" đứng cạnh ảnh **bong bóng xà phòng trên phố** (`explore_you`), còn dòng "Người cũng cần những thứ đó" đứng cạnh ảnh **chú chó thở hổn hển** (`explore_air`). Hai dòng đổi ảnh cho nhau — bé nhìn thấy ngược.
- Đề xuất (chọn một, rẻ nhất trước): (a) **content-editor** đổi câu ô Học 4 để không lặp cả bốn chữ, vd "People need them, too." · "Người cũng cần những thứ đó." — khi đó ý chính 1 giữ ô 1 *Food* và ý chính 3 lấy ô 4 *People*; (b) hoặc đổi ý chính 3 cho giống ô 4 hơn (thêm "food, water and air"), nhưng (a) đơn giản hơn; (c) **ios-dev/PM**: sửa luật ghép (vd ưu tiên j = i khi điểm hơn kém dưới một ngưỡng) — đổi engine thì phải chạy lại cả 52 dòng vector.
- Trạng thái test: **không** đưa dòng này vào `KeyPointPicturesTests.table`, nên `designerTableOnThePack` sẽ fail đúng ở bài này tới khi sửa (xem mục "Test vector" dưới).

### B7 · Lỗi mới · Bài 1, thẻ Tổng kết: ý chính 3 ("con non bắt đầu vòng mới") lấy ảnh **cây đa già**

- File: `content/explorer/lon-len/01-vat-song-nao-cung-co-vong-doi.md` (ý chính 3 + năm ô Học).
- Vì sao: ý chính 3 "The young start a new life cycle." chia hai chữ "life", "cycle" với ô 5 "Plants, too · Plants have a life cycle, too." (điểm 2) nên chiếm ô 5. Ô 3 *Have young* ("A grown dog can have puppies.", ảnh chó mẹ với đàn con) **không được dùng** — đó mới là ảnh đúng cho "con non".
- Hệ quả: dòng "Con non lại bắt đầu một vòng mới" đứng cạnh ảnh cây đa to già. (Ý chính 2 "Lớn rồi có con, rồi già đi" lấy ô 4 *Grow old* — chấp nhận được, vế sau của câu.)
- Đề xuất: **content-editor** bỏ chữ "life cycle" khỏi câu ô 5 (vd "Plants grow old, too." · "Cây cũng già đi.") hoặc thêm chữ của ô 3 vào ý chính 3 (vd "New puppies start the cycle again." · "Chó con lại bắt đầu vòng mới."). Cách hai còn làm ý chính 3 bám vào chính ví dụ con chó của bài.
- Trạng thái test: như B6, cố ý để ngoài bảng.

### c. Kiểm lại c1–c10 và mục nhỏ mới

| | Trạng thái |
| --- | --- |
| **c1** vệt đỏ trên bụng chó mẹ | **đóng** — cắt bỏ dải trên 12%; soi lại chỉ còn ánh hồng rất nhạt ở sát mép trên, ở cỡ hiển thị đọc như bóng. |
| **c2** vòng cổ có nhãn hiệu `explore_air` | **một phần** — thẻ từ `vocab.breathe` cắt hết vòng cổ, nhưng ô Học và hình câu q2 **vẫn còn** nhãn hiệu đỏ–trắng và thẻ khắc chữ (không đọc được). Giữ như cũ cũng được; nếu muốn hết thì cắt `explore_air` và `q2` như đã làm cho thẻ từ. |
| **c3** chuỗi vịt khác loài | **đỡ, chưa hết** — `q4_duck` là vịt mái lông nâu bên bờ ao (CC0), đọc liền hơn với vịt con lông vàng đầu nâu. Vẫn là vịt trời, không cùng giống với vịt xiêm con; designer đã ghi nhận. Một chân vịt bị **nhoè chuyển động** (vệt cam mờ), nhìn kỹ hơi lạ. Chấp nhận. |
| **c4** `tray_froglet` nền trắng studio | **giữ nguyên** — vòng 4 của hình ghép vẫn là ảnh nền trắng giữa bốn vòng ảnh thiên nhiên. Không trái luật nào (đều là ảnh chụp); chỉ nêu lại. |
| **c5** kệ Chơi bài 2, món "mẹ + con" | **đóng phần quan trọng** — `tray_piglets` bài 2 có mục cắt mới sát bốn lợn con, lợn mẹ chỉ còn một mảng ở mép phải; món duy nhất của nhóm "Lợn con" giờ đọc ra lợn con. (Bốn con vẫn quay lưng, không thấy mặt — chấp nhận.) `tray_litter` và `tray_calf_milk` giữ nguyên, nhưng hai nhóm đó đều có món thứ hai rõ ràng. |
| **c6** `explore_kittens` ba mèo con cùng màu | **sửa sai hướng, xem c13.** |
| **c7** `alt` lựa chọn đúng trùng chữ câu hỏi | **sửa rồi nhưng không tới được người dùng, xem c11.** |
| **c8** hình ghép bị cắt ở khung Học | **đóng** — đo lại khung nội dung: `explore_frog` x 124–902, `explore_butterfly` x 125–901 (trước là 93–934 và 86–942). So với mức cắt ≈ 75 px mỗi bên ở trang Học iPhone 16, còn dư ≈ 49 px thay vì 7–18 px. Vẫn **chưa nhìn trên máy**. |
| **c9** `explore_calf` cảnh bú không rõ | **đỡ** — cắt bỏ đầu trâu mẹ đang gặm cỏ, còn nghé rúc vào bụng trâu; không còn đọc nhầm thành "trâu ăn cỏ". Đầu nghé vẫn khuất và sợi dây thép vẫn còn ở nửa dưới; về ảnh thì khó hơn nữa. |
| **c10** `explore_you`, `tray_fry`, kiến trên hoa đậu, nền trắng studio | **giữ nguyên**, đúng như đã ghi "chỉ nêu". Giấy phép hoa đậu xanh đã được phiên chính xác nhận qua API iNaturalist (`license_code` = `cc0`) — mục này **đóng**. |

**c11 (mới) · `alt` không phải chỗ sửa: thẻ lựa chọn Explorer đọc `label`.** Đã kiểm code: `ExplorerQuestionStep.swift` dựng thẻ bằng `ContentPicture(asset:…, accessibilityLabel: nil)` rồi gắn `.accessibilityLabel(Text(verbatim: mode.sentence(option.label)))` — tức **`alt` của ảnh lựa chọn không bao giờ được đọc**, VoiceOver đọc `label`. Nên ba `alt` riêng mới (`q5_old_tree`, `w2_old`, `q5_turtles`) hiện **không đổi gì** với người dùng VoiceOver, còn `label` thì vẫn lộ: bài 1 q5 "old tree" · "cây già" cho câu "Which plant is old?"; bài 2 w2 "old dog" cho "Which dog is old?"; bài 3 q5 "baby sea turtles" cho "Which baby starts in an egg, too?". Đây là chuyện cả repo (content-editor đã nêu ở lượt 2) chứ không riêng SK-053, nhưng nên ghi rõ: **c7 và nửa sau của B2 chưa thật sự đóng**. Quyết định thuộc PM + ios-dev; `alt` mới vẫn đáng giữ (ô Học, hình câu, thẻ từ có đọc `alt`).

**c12 (mới) · `explore_hatch` sau khi cắt sát: da hồng ướt của gà con chiếm giữa khung.** Cắt một con là đúng (B4 đóng), nhưng ở khung vuông ô Học, chỗ sáng nhất giữa ảnh là **mảng da hồng ướt và cái mỏ** của gà con. Không máu, không phôi, vẫn trong luật; chỉ là bây giờ nhìn gần hơn lượt 1. Đề nghị Duy liếc qua khi review; nếu thấy mạnh quá thì nới khung ra một chút để thấy thêm lông tơ khô.

**c13 (mới) · Ví dụ hai ô Kittens sửa đi xa ảnh hơn trước.** `02-con-vat-de-con.md:176` đổi từ "some have a different colour from mum" · "có con khác màu lông mèo mẹ" thành **"some kittens have mum's colour, some do not" · "có mèo con giống màu mẹ, có con thì khác"**. Phóng to ảnh: mèo mẹ là **vằn xám bạc**; ba mèo con đều **sẫm màu** (một con vằn sẫm, hai con gần như đen). Vế "có mèo con giống màu mẹ" **không thấy trong ảnh** — câu cũ ("có con khác màu mẹ") mới là câu ảnh chứng minh được. Đề xuất: quay lại câu cũ, hoặc "mèo con có thể sẫm màu hơn mẹ" · "kittens can be darker than mum".

### Test vector `KeyPointPicturesTests.table` (việc 2)

**Đã làm.** `apps/ios/Packages/SKKit/Tests/LessonPlayerTests/QuizWaveOneTests.swift`:

- Viết lại `KeyPointPictures.match` (`LessonRecap.swift:118`) bằng Python và chạy trên **chính gói** mà test đọc (`content/.build/pack`, 92 bài). Tự kiểm: bản viết lại **sinh đúng cả 34 dòng cũ, không lệch một giá trị nào**, nên các dòng mới là hành vi thật của engine chứ không phải đoán.
- Gói hiện tại có **52 bài** lệch khỏi 1-2-3 (bảng cũ 34). 18 bài mới: *Nơi sống trên Trái Đất* 4, *Thời tiết và các mùa* 3, *Cơ thể của em* 3, *Cây quanh em* 3, *Lớn lên* 5. **Không dòng cũ nào đổi giá trị, không dòng cũ nào biến mất.**
- Đọc từng bài một (ý chính ↔ nhãn và câu của ô Học được chọn): **16 bài hợp lý → thêm vào bảng**; **2 bài app chọn sai → không thêm** (B6, B7 ở trên), kèm hằng mới `wrongMatches` và chú thích giải thích vì sao từng bài sai.
- `#expect(moved == Self.table.count)` đổi thành `#expect(moved == Self.table.count + Self.wrongMatches.count)`: phép đếm vẫn bắt được bài lệch mới, còn hai bài sai thì chỉ fail ở đúng dòng `#expect` của chúng, có tên bài trong thông báo.
- Hai bài "yếu nhưng không sai" có chú thích ngay trong bảng: `co-the-cua-em/nhin-ngui-va-nghe` (ý 1 kể mắt, mũi, tai mà lấy ô *Smell* vì chia hai chữ; ý 3 là câu an toàn, không ô nào minh hoạ) và `cay-quanh-em/hoa-nhieu-mau-nhieu-hinh` (ý 3 "đừng ngắt hoa" không có ô riêng, nhận ô thừa).
- **Chưa chạy test** (không mở simulator, theo luật 1 máy 1 lượt). `swiftc -parse` file đã sửa: **0 lỗi cú pháp**. Dự kiến khi ios-dev chạy: `designerTableOnThePack` fail **đúng hai lần**, ở `lon-len/muon-lon-len-con-vat-can-gi` và `lon-len/vat-song-nao-cung-co-vong-doi`; mọi bài khác và phép đếm phải xanh. Nếu fail ở chỗ khác thì gói lúc chạy khác gói lúc tester đọc (manifest 04:58 19/11).

### Chưa kiểm (lượt 2)

- Không mở simulator: khung cắt thật của hình ghép ở trang Học (c8), thẻ Tổng kết Màn 1 (B6, B7), thẻ Tổng kết Màn 2 với ảnh ếch cắt vào đầu, 12 thẻ từ 2:1 mới, ô Chơi 110 px — tất cả mới tính bằng số đo trong code và ảnh dựng lại.
- Không mở lại trang gốc Commons/Openverse/Flickr: ba ảnh mới của lượt 2 tin theo lượt kiểm của designer và `verified` trong `content/.images/index.json`. Hai ảnh Flickr (`q5_mango` CC BY 2.0, `q4_duck` CC0) `fetch` in "Kiểm tay" — **người duyệt mở lại trước khi phát hành** (designer đã ghi).
- Không chạy lại `tts`, `build`, `check-pack` (phiên chính đã chạy; gói 04:58 sau lần sửa cuối 04:53).

## Ghi chú content-editor (19/11, lượt 3)

B6, bài 6 ô People, too: câu chính "People need food, water and air, too." · "Người cũng cần thức ăn, nước và không khí." → "People need the same things, too." · "Người cũng cần những thứ như con vật."; tính theo `KeyPointPictures.match`, ý chính 1 → ô Water, ý chính 2 → ô Food, ý chính 3 → ô People, too. B7, bài 1 ô Plants, too: câu chính "Plants have a life cycle, too." · "Cây cũng có vòng đời." → "Big trees get old, too." · "Cây to cũng già đi.", thêm ví dụ bốn "plants have a life cycle, too" · "cây cũng có vòng đời"; tính ra ý chính 1 → ô Born, ý chính 2 → ô Grow old, ý chính 3 → ô Have young. c13, bài 2 ô Kittens: ví dụ hai quay lại "some have a different colour from mum" · "có con khác màu lông mèo mẹ".

## Rà ảnh (tester 19/11, lượt 3)

Chạy lại script `KeyPointPictures.match` trên gói mới (manifest **05:22 19/11**, sau lần sửa cuối 05:20). **B6, B7, c13 đóng; bảng test vector đủ 52 dòng, không còn `wrongMatches`.**

- **B7 · bài 1 `[1, 4, 3]`** — ý 1 "Living things are born and grow." → ô 1 *Born* (chó con mới sinh); ý 2 "They have young, then grow old." → ô 4 *Grow old* (chó già, khớp vế sau của câu); ý 3 "The young start a new life cycle." → **ô 3 *Have young*** (chó mẹ với đàn con). Hết chuyện dòng "con non" đứng cạnh cây đa già; ô *Plants, too* ("Big trees get old, too.") không còn hút ý 3 vì đã bỏ chữ "life cycle" khỏi câu chính.
- **B6 · bài 6 `[2, 1, 4]`** — ý 1 "Animals need food, water and air." → ô 2 *Water* (chó uống nước: một trong ba nhu cầu, đúng là ảnh con vật); ý 2 "They eat different food." → ô 1 *Food*; ý 3 "People need the same things, too." → **ô 4 *People, too***. Hết chuyện hai dòng đổi ảnh cho nhau. Cả hai bài khớp đúng con số content-editor tính trước.
- **c13 đóng** — `02-con-vat-de-con.md:176` trở lại "some have a different colour from mum" · "có con khác màu lông mèo mẹ", đúng thứ ảnh cho thấy (mèo mẹ vằn xám bạc, ba mèo con sẫm màu). Nhỏ: dòng `>` ở `02:184` vẫn chép lại lần đổi của lượt 2 như đang có hiệu lực; content-editor nên thêm một câu "lượt 3 quay lại câu cũ" cho khỏi hiểu nhầm.
- **Không dòng nào khác đổi:** gói vẫn có đúng **52 bài** lệch khỏi 1-2-3; 50 dòng cũ giữ nguyên giá trị, 0 dòng mất, 0 bài lệch nằm ngoài bảng.
- **File test:** `apps/ios/Packages/SKKit/Tests/LessonPlayerTests/QuizWaveOneTests.swift` — hai bài chuyển vào `table` (nay **52 dòng**), bỏ hẳn hằng `wrongMatches`, trả `#expect(moved == Self.table.count)` về như cũ, sửa chú thích đầu bảng. `swiftc -parse`: **0 lỗi**. **Chưa chạy test** (không mở simulator): dự kiến `designerTableOnThePack` **xanh hoàn toàn**; fail chỗ nào nghĩa là gói lúc chạy khác gói tester đọc (manifest 05:22 19/11).

## Ghi chú designer (19/11, lượt 3)

Hai chỗ ios-dev thấy khi chạy thử. Chỉ đổi `content/images/explorer/lon-len/muon-lon-len-con-vat-can-gi.json` và `vat-song-nao-cung-co-vong-doi.json`; key giữ nguyên.

| Key | Ảnh mới | Nguồn · giấy phép | Tả ngắn (cho `alt`) |
| --- | --- | --- | --- |
| `tray.tray_wind` (vuông) + `vocab.air` (mục riêng 2:1) · bài 6 | "Kite", Conal Gallagher | Flickr qua Openverse · CC BY 2.0 (đã mở trang 19/11) | Một chiếc diều tam giác nhiều màu (xanh dương, vàng chanh, cam, đen) bay giữa trời mây trắng xám; đuôi sọc vàng đen và hai dải ruy băng tím, đỏ bay theo gió. Không cỏ, không cây, không người, không chữ. |
| `q5.q5_mango` (5:2) · bài 1 | "Sannomaru Square The sakura Jōnai Chūō-ku Fukuoka 20260629 153636", Hirho | Wikimedia Commons, ảnh gốc 6144×6144 · CC BY 4.0 | Cây anh đào non mới trồng giữa bãi cỏ công viên: thân mảnh, thẳng, có cọc gỗ chống ở gốc; tán lá xanh thưa phía trên (khung cắt nửa dưới tán); nền là đồi cây xanh thẫm và trời xanh. Không người, không chữ. |

- **Bài 6:** ảnh ruộng lúa rạp gió không còn dùng trong *Lớn lên*; ở chủ đề khác giữ nguyên. Diều là thứ bé biết là "gió thổi mới bay", không lẫn với cỏ của nhóm Food. Bỏ ống gió (bé 5–7 ít biết) và cờ cá chép (giống cá; bài 6 không để hình cá trên kệ).
- **Bài 1 `q5_mango`: không cắt được như yêu cầu, nên đổi ảnh.** Trong ảnh cây xoài non lượt 2, cây chuối thứ hai mọc sát ngay trái thân xoài, lá chuối che đúng tầng chạc cây. Khung 5:2 nào bỏ được cả hai cây chuối thì thân xoài nằm sát mép trái, phần còn lại chỉ là bãi cỏ, không còn tán (đã dựng thử ba khung). Ảnh mới là một cây non khác, **không phải cây xoài**.
- **Kết quả lệnh:** `node tools/content-cli/src/cli.ts images fetch content/images/explorer/lon-len`: **6 file chọn ảnh · 90 ảnh khác nhau · 3 tải mới · 87 đã có · 0 lỗi · hình tự vẽ 8 · hình ghép 3, 0 chờ ghép**; **0 dòng "Ảnh lệch khung", 0 dòng "Chưa kiểm tỉ lệ"**. `fetch` in "Kiểm tay" cho ảnh diều (Flickr); trang Flickr đã mở 19/11, ghi CC BY 2.0.
- **Cần content-editor sửa chữ:**
  - Bài 6 `tray_wind` và từ `air`: `alt` "Wind blowing over a rice field" · "Gió thổi trên cánh đồng lúa" → đề xuất "A kite flying in the wind" · "Chiếc diều bay trong gió"; brief bỏ "Dùng lại hình `w1` ở bài `ho-hap/vi-sao-ta-phai-tho`".
  - Bài 1 `q5_mango`: `label` "mango tree" · "cây xoài" → đề xuất "young tree" · "cây non mới trồng" (tránh trùng nhãn "young plants" · "cây non" của `q5_young`); `feedback` → "This young tree has a thin trunk. It is still growing." · "Cây non này thân còn mảnh, đang lớn."; `alt` → "A young tree with a thin trunk" · "Cây non thân mảnh"; brief thành ảnh mới.
  - Đếm lại `_topic.md` "Ảnh mới": cây anh đào non thay cây xoài non, diều là ảnh mới (ruộng lúa cũ mượn chủ đề khác), nên **27 ảnh mới cộng trứng bướm**; giấy phép **CC0 9, PD 3, CC BY 16** (2.0: 10, 4.0: thêm 1). Bảng hình dùng chung: `tray_wind`, `vocab.air` không còn mượn `ho-hap`.

## Ghi chú content-editor (19/11, lượt 4) và quyết định

Bài 6 `tray_wind` và từ `air`: `alt` → "A kite flying in the wind" · "Chiếc diều bay trong gió" (tạm, xem quyết định dưới). Bài 1 `q5_mango` (key giữ): ảnh cây anh đào non có cọc chống; `label` "young tree" · "cây non mới trồng", `feedback` "This young tree has a thin trunk. It is still growing." · "Cây non này thân còn mảnh, đang lớn.", `alt` "A tree with a thin trunk" · "Cây thân mảnh". Bài 2: dòng `>` lượt 2 ở ô Kittens ghi rõ là lịch sử. `_topic.md`: 27 ảnh mới cộng trứng bướm.

**Quyết định phiên chính (auto, theo PM):** diều là đồ chơi, trùng nhóm bẫy "Toys" của kệ bài 6 (kệ chỉ hiện ảnh, diều là món Air duy nhất). Giữ nhóm bẫy, đổi ảnh `tray_wind`/`vocab.air` sang quần áo phơi bay trong gió (dự phòng: cánh buồm căng gió). Content-editor sửa `alt` theo ảnh mới.

## Ghi chú designer (19/11, lượt 4)

Diều (lượt 3) trùng nhóm bẫy "Toys" trên kệ bài 6, nên bỏ ảnh diều. Theo phiên chính, `tray.tray_wind` (khung vuông) và `vocab.air` (mục riêng 2:1) đổi sang ảnh đồ phơi bay trong gió. Chỉ sửa `content/images/explorer/lon-len/muon-lon-len-con-vat-can-gi.json`; key giữ nguyên.

| Key | Ảnh mới | Nguồn · giấy phép | Tả ngắn (cho `alt`) |
| --- | --- | --- | --- |
| `tray.tray_wind` + `vocab.air` · bài 6 | "Tunisia 10-12 - 212 - Atlas Mountains & Mides Canyon", mckaysavage (McKay Savage) | Flickr qua Openverse · CC BY 2.0 (đã mở trang 19/11) | Một dây phơi đầy khăn vải nhiều màu (đỏ, tím, xanh lá, xanh dương, trắng, vàng, cam) bay lệch theo gió dưới trời xanh có mây; dải cam bên phải tung ngang. Không người, không chữ, không đồ chơi. Đáy khung là dải đất khô với vài bụi cỏ nhỏ (không chiếm khung). Khung vuông lấy nửa phải dây phơi; thẻ từ lấy cả dây. |

- Ảnh là khăn vải chứ không phải áo quần: ảnh quần áo phơi hợp giấy phép tìm được hoặc gần như đứng yên, hoặc có người và chữ ở nền ("Wind Color"). Chưa phải dùng tới cánh buồm.
- **Kết quả lệnh:** `node tools/content-cli/src/cli.ts images fetch content/images/explorer/lon-len`: **6 file chọn ảnh · 90 ảnh khác nhau · 2 tải mới · 88 đã có · 0 lỗi · hình tự vẽ 8 · hình ghép 3, 0 chờ ghép**; **0 dòng "Ảnh lệch khung", 0 dòng "Chưa kiểm tỉ lệ"**. `fetch` in "Kiểm tay" cho ảnh Flickr; trang đã mở 19/11, ghi CC BY 2.0.
- **Content-editor:** `alt` của `tray_wind` và từ `air` đề xuất "Cloths blowing on a washing line" · "Khăn vải phơi bay phấp phới trên dây" (thay đề xuất "diều" ở lượt 3); brief thành ảnh mới của bài. Số ảnh mới của chủ đề không đổi so với lượt 3 (27 cộng trứng bướm; CC0 9, PD 3, CC BY 16).

## Ghi chú content-editor (19/11, lượt 5)

Bài 6 `tray_wind` và từ `air`: `alt` "A kite flying in the wind" · "Chiếc diều bay trong gió" → "Cloths blowing on a washing line" · "Khăn vải phơi bay phấp phới trên dây"; brief, dòng `>` (giữ nhóm bẫy Toys, đổi ảnh), ghi chú hoạ sĩ và `_topic.md` sửa theo. Không đổi chữ bé nghe.

## Rà ảnh (tester 19/11, lượt 4)

Kiểm hai chỗ đổi của designer lượt 3, lượt 4 và chữ content-editor lượt 4, 5, trên gói mới (manifest **06:07 19/11**, sau lần sửa cuối 06:05). **Không còn lỗi chặn.** Một mục nhỏ mới (c14), một mục để ý (c15); c11 (VoiceOver đọc `label`) vẫn mở như cũ.

**1 · Bài 1 `q5_mango` (cây anh đào non có cọc chống, CC BY 4.0) — đạt, và tốt hơn lượt 2.**
- Khung 5:2 thấy **thân mảnh, thẳng, suốt từ gốc** cộng cọc gỗ chống — dấu hiệu "mới trồng" rõ. Soi vùng dưới: vật vàng là cột gỗ nhỏ, **0 chữ, 0 người, 0 nhãn hiệu**.
- Câu q5 vẫn **đúng một đáp án "đã già"**: cây con tí hon trên đất / thân cây đa bện rễ phụ / cây non thân mảnh có cọc. Lại còn khá hơn lượt 2: giờ **hai thẻ cùng có thân cây**, nên gợi ý "Em nhìn kỹ thân cây nhé" thật sự bắt bé so thân to ↔ thân mảnh, không còn chọn bằng cách loại trừ.
- `alt` ba lựa chọn: "Small green plants in the soil" / "A big tree with many roots" / "A tree with a thin trunk" — **0 chữ young, old, non, già; `alt` đáp án đúng không lặp lời giải** ("thân to, gốc sần"). Quét máy cả chủ đề: 0 `alt` của lựa chọn đúng trùng chữ câu hỏi.
- `label` "young tree" · "cây non mới trồng" và `feedback` khớp ảnh (không còn nhắc xoài); brief, dòng `>`, `_topic.md` đã ghi key `q5_mango` không còn nghĩa "xoài".

**2 · Bài 6 `tray_wind` + `vocab.air` (khăn vải phơi bay trong gió, CC BY 2.0) — đạt.**
- Kệ Chơi bài 6 sáu món: Thức ăn (cỏ tươi, nải chuối) · Nước (cốc nước) · **Không khí (khăn phơi)** · bẫy Đồ chơi (ô tô đồ chơi, bóng cao su). Khăn phơi **không lẫn** với hai món thức ăn (không ăn được), không lẫn với cốc nước, và **không còn là đồ chơi** như ảnh diều của lượt 3 — quyết định đổi ảnh là đúng. Nó cũng là món duy nhất còn lại sau khi bé xếp Food và Water, nên kệ chơi được dù "khăn bay = không khí" vẫn là một bước suy luận.
- Ảnh: khăn bay lệch hẳn một bên, có kẹp phơi và dây — đọc ra gió. **0 người, 0 chữ, 0 nhãn hiệu**; góc dưới phải có một mái lều chợ mờ (soi kỹ: không có người, không có chữ).
- Thẻ từ `air`: có **mục cắt 2:1 riêng** (960×480, lệch ×1,00), lấy cả dây phơi — đọc rõ hơn cả ô vuông.

**Máy (gói 06:07):** `validate content/explorer/lon-len` **0 lỗi**, 7 cảnh báo `[CẦN KIỂM]`. 207 chỗ có hình ↔ 207 mục file chọn ảnh, 0 thiếu/thừa/trùng; 0 `same_as` trỏ vào `same_as`. Giấy phép 63 ảnh nguồn ngoài: **0 BY-SA/NC/ND, 0 CC BY thiếu `author`/`license_url`**. Gói: 207 `Image` → **99 asset**, 0 thiếu manifest, 0 thiếu file, 0 giấy phép cấm, 0 CC BY thiếu tác giả. Luật cùng kiểu hình và luật "đáp án đúng không là ảnh mới duy nhất": vẫn sạch.

**Test vector:** chạy lại `KeyPointPictures.match` trên gói mới — vẫn **52 bài lệch**, bảng 52 dòng trong `QuizWaveOneTests.swift` **khớp từng dòng** (0 dòng khác giá trị, 0 thiếu, 0 thừa). Đổi ảnh không đụng chữ ô Học, đúng như dự đoán. Không sửa file test lượt này.

**c14 (mới, nhỏ) · `feedback` của `q5_mango` dài 11 từ EN.** `01-vat-song-nao-cung-co-vong-doi.md` option `q5_mango`: "This young tree has a thin trunk. It is still growing." — **11 từ, hai câu**. Mọi `feedback` khác của chủ đề đều ≤ 8 từ (đếm máy: cao nhất kế tiếp là 8). Trái tiêu chí "`feedback` một câu, tối đa 8 từ EN" (SK-044) dù validator không chặn. Đề xuất: "This young tree is still growing." (6 từ) · giữ "Cây non này còn đang lớn."

**c15 (để ý, không chặn) · nền của `q5_mango` là một mảng cây lớn.** Sau lưng cây non là đồi cây xanh thẫm rậm; ở thẻ 5:2 bé có thể nhìn mảng xanh đó như "một cây to". Cây non và cọc chống vẫn là chủ thể giữa khung và là chỗ duy nhất thấy thân, nên không đổi đáp án; chỉ ghi để Duy liếc khi review.

**Vẫn mở (không phải việc của lượt này):** c11 — thẻ lựa chọn Explorer đọc `label` chứ không đọc `alt`, nên ở q5 bài 1 VoiceOver vẫn nghe "old tree" · "cây già" giữa hai nhãn "young". Chờ PM + ios-dev, phạm vi cả repo.

## Ghi chú content-editor (19/11, lượt 6) · c14

`q5_mango` `feedback` "This young tree has a thin trunk. It is still growing." · "Cây non này thân còn mảnh, đang lớn." → "This young tree has a thin trunk." · "Cây non này thân còn mảnh." (một câu, 7 từ EN; không dùng "still growing" vì `q5_young` cạnh đó đã dùng).

## Nghiệm thu PM 19/11

**Kết quả cuối** (phiên chính báo 19/11):
- `validate content/explorer/lon-len`: 0 lỗi, 7 cảnh báo `[CẦN KIỂM]`.
- Gói `content/.build/pack` build lại sau lần sửa cuối; `check-pack` OK, 15 chủ đề, 1722 ảnh.
- Test: content-cli 401/401, content-schema 163/163.
- App iOS: 418/418 unit test xanh trên iPhone 16 với gói 05:22. Sau đó gói chỉ đổi ảnh `tray_wind`/`vocab.air` và một câu `feedback` (c14); tester chạy lại vector `KeyPointPictures` trên gói mới, khớp 52/52.
- Chạy thử bài 1, 4, 6 trên iPhone 16: đạt.
- Tester lượt 4: 0 lỗi chặn.

**Tiêu chí:** đạt hết, trừ một tiêu chí của pm: người chuyên môn chưa đọc các dòng `[CẦN KIỂM]`. Tiêu chí này chặn phát hành, không chặn `review`. Hai chỗ đạt nhưng còn thiếu sổ sách:
- chưa ghi số clip VI bị đánh dấu chờ Duy nghe;
- lần chạy thử không có ảnh chụp màn bản đồ; số chặng đã kiểm bằng `JourneySegmentTests`.

**Tài liệu đã sửa 19/11** (theo "Việc kéo theo", mục pm):
- `syllabus.md`: mục 0 (số đếm 383 đã vào danh mục), mục 3 (dòng #8: "Xong, chờ Duy review"; dòng tổng: số bài đã soạn).
- `syllabus-lessons.md`: mục 11 viết lại theo 6 bài của *Lớn lên*; thêm ghi chú 19/11 ở đầu file.
- `syllabus-progression.md`: dòng 90, 123, 132, 203, 425 thêm tên mới *Lớn lên* (bảng 5.1 là bản 26/10, đã hết hiệu lực; chỉ thêm tên, không đổi điểm).
- `prd.md`, `technical-plan.md`: dòng số đếm hiện hành thành 44 chủ đề, 383 bài, gộp cả lượt SK-051 (390 → 382) và SK-053 (382 → 383); giữ nguyên các dòng lịch sử có ngày.
- `docs/backlog/README.md`: SK-053 chuyển `review`; thêm SK-054, SK-055, SK-056.

## Còn mở cho Duy

Không mục nào chặn chuyển `review`. Mục 1 và mục 8 phải xong trước khi phát hành.

1. **`[CẦN KIỂM]` chuyên môn.** Có 35 dòng trong sáu bài và 3 dòng ở `_topic.md`; tester lượt 1 tóm tắt ở mục "Các dòng `[CẦN KIỂM]`". Cần một người chuyên môn (sinh học hoặc giáo viên tiểu học) đọc hết, rồi ghi người đọc và ngày vào ticket. Ba chỗ nên xem kỹ:
   - dấu hiệu "cây già" (đã đổi sang "thân to, gốc sần", tester C2);
   - "con vật nào cũng cần không khí" đặt cạnh cá thở bằng mang;
   - chó thở hổn hển: chữ chỉ tả "thở nhanh", không nói để làm gì.
2. **Tên gọi EN cần người chuyên môn chốt** (`_topic.md:452`). PM đề xuất giữ "life cycle", "chrysalis" (không dùng "pupa"), "young frog", "seedling", "adult" ở từ vựng và "grown-up" ở câu hỏi. Ba chỗ còn phải chọn:
   - **"have young" hay "have babies"** (`01:29`, `01:519`, `01:536`, `_topic.md:38`). PM đề xuất giữ "have young": đúng chữ Oak, clip đã thu. Đổi sang "babies" thì phải sửa 4 chỗ và chạy lại `tts`.
   - **Tên thẻ thưởng "Cabbage white" hay "Small white"** (`04:573`). Ảnh là *Pieris rapae*, tên chuẩn là "small white". PM đề xuất đổi sang "Small white" nếu người chuyên môn đồng ý; chỉ sửa một thẻ.
   - Cách nói thay "born from mum" (hiện là "a pig mum gives birth to piglets", "born, not hatched"). PM đề xuất giữ.
3. **Bài 3 và bài 5 là bài mở rộng** (`extension: true`, không gắn slug Oak; quyết định 3). Hai phương án khác: nới luật validator cho bài 1 và bài 3 cùng ghi `animal-life-cycles`; hoặc chuyển `growing-up` sang bài 3. PM đề xuất giữ như hiện tại: không đổi luật, năm slug Oak vẫn đủ.
4. ~~**Danh mục ghi #10, lộ trình `syllabus.md` ghi #8**~~ **Đóng 19/11: Duy chốt cách (a) và xác nhận B1 "bỏ hết" đã chốt từ 18/11.** Đổi danh mục (bỏ ba chủ đề, thêm ba chủ đề Trái Đất và bầu trời, *Lớn lên* thành #8, `order: 8`) làm ở [SK-057](SK-057-explorer-catalog-earth-sky.md); `syllabus.md` mục 8 đã sửa. Ghi chép cũ (quyết định 2). Chủ đề tự thành #8 khi bỏ hai chủ đề vật liệu khỏi danh mục. Có một chỗ hai tài liệu nói khác nhau, Duy xác nhận giúp:
   - `docs/syllabus-review-2026-11-18.md` mục 6, câu B1, ghi "Duy chốt 18/11: bỏ hết" (vật liệu, sức khoẻ…);
   - ticket này và `syllabus.md` mục 8 coi việc bỏ vật liệu và *Em khoẻ mạnh* là còn chờ chốt.

   PM đề xuất: nếu B1 đã chốt, gộp việc đổi danh mục (bỏ `everyday-materials`, `uses-of-everyday-materials`, `healthy-me`; thêm ba chủ đề Trái Đất và bầu trời) vào ticket mở chủ đề #9. Lúc đó sửa `order: 8` và các test đếm cùng một lượt.
5. **`difficulty` 11 điểm (Mức 3) lệch `level: 2`** (`_topic.md:124`, `:464`). *(19/11: SK-057 giữ `level: 2` theo phương án (a) dưới; Duy chọn (b) thì sửa ở SK-057.)* Mức trong danh mục chỉ để tham khảo, và Explorer vốn không tăng dần Mức (`1, 3, 3, 3, 2, 1, 1, 2, 2, 2, 1`). Hai phương án: (a) giữ `level: 2` và ghi lý do (mỗi bài tự nhắc lại phần nền ở Khởi động và ô Học); (b) đổi thành 3. PM đề xuất (a) ngay bây giờ, xét lại cùng lượt đổi danh mục ở mục 4. Chọn (b) thì dev sửa `content/syllabus.json` và tester chạy lại test đếm.
6. **Hai ảnh để Duy liếc khi review:**
   - **c12**, `explore_hatch` bài 3: gà con ướt cắt sát, mảng da hồng ở giữa khung. Không máu, không phôi. Nếu thấy mạnh quá thì nới khung cho thấy thêm lông tơ khô.
   - **c15**, `q5_mango` bài 1 q5: phía sau cây non là đồi cây xanh thẫm, có thể nhìn thành "một cây to". Đáp án không đổi.
7. **Nghe clip VI.** Nghe thử "nòng nọc", "nhộng", "nghé", "vòng đời", "mõm bạc", "thở hổn hển". Riêng "nhộng" dễ bị nghe thành nhộng tằm (món ăn). Phiên chính chưa ghi số clip VI bị đánh dấu.
8. **Người duyệt mở lại trang gốc của ảnh in "Kiểm tay" trước khi phát hành.** Designer đã mở các trang này ngày 19/11.
   - Vịt `q4_duck` bài 3: Flickr, CC0 1.0, "Mallard Duck" (Terry Kearney).
   - Không khí `tray_wind` và `vocab.air` bài 6: Flickr, CC BY 2.0, khăn phơi của McKay Savage.
   - Cây `q5_mango` bài 1: ảnh hiện tại **không phải Flickr** mà là Commons, CC BY 4.0, cây anh đào non của Hirho (designer lượt 3). Ảnh xoài non trên Flickr đã bỏ, nhưng vẫn nên mở trang Commons để chắc.
   - Trong chủ đề còn hai ảnh Flickr khác đã mở ở lượt trước: nhộng `tray_chrysalis` (Judy Gallagher, CC BY 2.0) và khủng long đồ chơi `tray_dinosaur`, chép từ Discoverer.

## Việc theo sau (không làm trong SK-053)

- **[SK-054](SK-054-explorer-choice-voiceover-label.md)** (PM + ios-dev): trên thẻ lựa chọn Explorer, VoiceOver đọc `label` nên lộ đáp án (c11). Phạm vi cả repo.
- **[SK-055](SK-055-vocab-card-crops.md)** (designer): ngưỡng `max_factors.vocab` 1,6 làm lộ ra 27 thẻ từ dùng ảnh vuông ở *Nơi sống trên Trái Đất* (25) và *Chuỗi thức ăn* (2), cộng vài thẻ từ Discoverer lệch khung. Cần thêm mục cắt riêng.
- **[SK-056](SK-056-images-fetch-commons-small-thumb.md)** (dev): `images fetch` tải bản thumbnail cỡ chuẩn cho ảnh Commons nhỏ, để tránh lỗi 429.
