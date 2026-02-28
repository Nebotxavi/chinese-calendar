# Project To-Do List

## Completed

- [x] **Define MVP scope** — What's in v1, what's deferred
  - Decision: `.context/decisions/mvp-scope.md`

- [x] **Competitive analysis** — Existing Huangli/calendar apps landscape
  - Research: `.context/research/competitive-analysis.md`
  - Key finding: no Spanish-language Huangli app exists — uncontested niche

- [x] **Choose tech stack** — Framework, backend, data sources
  - Decision: `.context/decisions/tech-stack.md`
  - Flutter (mobile) + `lunar` by 6tail (data engine). Backend deferred (not needed for v1).

- [x] **Define backend architecture** — Clean Architecture guidelines
  - Documented in CLAUDE.md (adapted from nova-aurora reference project)

- [x] **Update CLAUDE.md** — Consolidate all decisions as the project's source of truth

---

## In Progress

- [x] **Define UX direction** — Visual identity and design principles
  - Direction: "New Chinese Luxury" — tradition revisited through premium modern Chinese aesthetics
  - Art research complete: `docs/art-direction-research.md`
  - Design spec (draft): `docs/design-spec.md` — based on prototype `11-luxury-with-motifs.html`
  - 10 prototype variations explored (prototypes/02–11), luxury direction chosen
  - Pending: yi/ji color fix, monthly motif sourcing

---

## Pending

- [x] **Art research / design spec** — Collect visual references, define color palette, typography system, spacing grid, component design
  - Art research: `docs/art-direction-research.md` (650 lines — studios, calligraphers, patterns, Guochao movement, seasonal motifs)
  - Design spec: `docs/design-spec.md` (colors, fonts, spacing, components — based on prototype 11)
  - Prototypes: `prototypes/02–11` (10 variations explored)

- [x] **Proverb dataset curation** — 306 entries curated in `data/proverbs/proverbs.json`
  - Sources: `.context/research/proverb-sources.md`
  - Categories: classical (145), chengyu (70), folk (55), solar-term (36)
  - Format: JSON with chinese, pinyin, english, spanish, source, category, tags fields
  - Pending: Spanish translation, quality review, date assignment

- [x] **Spanish translations** — All 323 proverb entries translated to neutral Spanish
  - File: `data/proverbs/proverbs.json` (`spanish` field filled)
  - Also translated: `source`, `author`, `category`, `tags` fields

- [ ] **Proverb quality review** — Review translation clarity and content meaning
  - Flag entries that may make zero sense to a modern reader
  - Ensure proverbs work as standalone daily calendar content

- [x] **Proverb date assignment** — 306 proverbs mapped to calendar days (March–December 2026)
  - Solar term proverbs pinned to exact solar term dates
  - Festival-appropriate proverbs on Qingming, Dragon Boat, Mid-Autumn, Double Ninth
  - Seasonal affinity matching (spring=growth, summer=strength, autumn=reflection, winter=cultivation)
  - Opening: 千里之行始于足下 (Mar 1), Closing: 温故而知新 (Dec 31)
  - 17 extras dropped during curation

- [ ] **Activity translation mapping** — Chinese → Spanish for ~50-80 auspicious/inauspicious activity terms
  - Source: `lunar` library output (e.g., 理发 → Corte de pelo, 嫁娶 → Matrimonio)
  - One-time effort, static mapping

- [ ] **Flutter state management choice** — Decide state management approach (Riverpod, Bloc, Provider, etc.)
  - Research needed: best fit for a single-screen, data-driven app

- [ ] **Flutter project setup** — Scaffold project with folder structure, dependencies, linting
  - Dependencies: `lunar`, `google_mobile_ads`, `in_app_purchase`
  - Architecture: domain / data / presentation layers
  - Configure linting, analysis_options.yaml

- [ ] **Monthly motif illustrations** — Source or commission high-quality images for the right-side monthly motif
  - Current lotus placeholder is poor quality; the horse (year motif) is the quality target
  - Need 10 images (March–December), matching paper-cut / line-art style in cinnabar on cream
  - Options: commission an illustrator, use AI generation, find open-source sets
  - Monthly subjects defined in `docs/design-spec.md` (peach blossom, peony, pomegranate, lotus, etc.)

- [x] **Fix yi/ji activity colors** — Auspicious (宜) now jade green, inauspicious (忌) stays grey
  - 宜 marker changed to `--jade: #4A7050` in prototype 11 and design spec
  - 忌 remains `--ink-light` (#9E8E82)

- [ ] **Custom fonts** — Research and select fonts for the calendar design
  - Calligraphic for Chinese characters, clean sans-serif for readability
  - Not urgent, but high impact on visual quality

- [ ] **Calendar skins** — Different visual themes users can switch between
  - Easy win: stored on-device, no backend needed
  - Consider APK size impact — evaluate on-demand asset loading if too heavy

- [ ] **Daily chengyu notifications** — Remind users to check today's proverb
  - Push notification if user hasn't opened the app
  - Future feature, not urgent at all
