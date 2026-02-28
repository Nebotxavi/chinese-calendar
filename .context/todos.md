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

- [ ] **Define UX direction** — Visual identity and design principles
  - Direction decided: tradition revisited through modern minimalism (see `.context/decisions/ux-direction.md`)
  - Pending: art research, visual references, color palette, typography, spacing grid, design spec

---

## Pending

- [ ] **Art research / design spec** — Collect visual references, define color palette, typography system, spacing grid, component design
  - Lead: designer agent + product-owner (cultural accuracy)
  - Output: design spec document with concrete values (hex colors, font names, spacing units)

- [x] **Proverb dataset curation** — 306 entries curated in `data/proverbs/proverbs.json`
  - Sources: `.context/research/proverb-sources.md`
  - Categories: classical (145), chengyu (70), folk (55), solar-term (36)
  - Format: JSON with chinese, pinyin, english, spanish, source, category, tags fields
  - Pending: Spanish translation, quality review, date assignment

- [ ] **Spanish translations** — Translate all 306 proverb entries to Spanish
  - File: `data/proverbs/proverbs.json` (fill `spanish` field)

- [ ] **Proverb quality review** — Review translation clarity and content meaning
  - Flag entries that may make zero sense to a modern reader
  - Ensure proverbs work as standalone daily calendar content

- [ ] **Proverb date assignment** — Map 306 proverbs to specific calendar days (March–December 2026)
  - Solar term proverbs assigned near their solar term dates
  - Balance categories across the calendar

- [ ] **Activity translation mapping** — Chinese → Spanish for ~50-80 auspicious/inauspicious activity terms
  - Source: `lunar` library output (e.g., 理发 → Corte de pelo, 嫁娶 → Matrimonio)
  - One-time effort, static mapping

- [ ] **Flutter state management choice** — Decide state management approach (Riverpod, Bloc, Provider, etc.)
  - Research needed: best fit for a single-screen, data-driven app

- [ ] **Flutter project setup** — Scaffold project with folder structure, dependencies, linting
  - Dependencies: `lunar`, `google_mobile_ads`, `in_app_purchase`
  - Architecture: domain / data / presentation layers
  - Configure linting, analysis_options.yaml
