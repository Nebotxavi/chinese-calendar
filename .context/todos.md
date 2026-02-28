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

- [ ] **Proverb dataset curation** — Curate ~306 Chinese wisdom proverbs (March–December 2026)
  - Sources identified: `.context/research/proverb-sources.md`
  - Mix: Confucius, Laozi, Zhuangzi, chengyu, folk proverbs, solar term sayings
  - Format: JSON with chinese, pinyin, source, category fields
  - Spanish translation handled separately after curation

- [ ] **Activity translation mapping** — Chinese → Spanish for ~50-80 auspicious/inauspicious activity terms
  - Source: `lunar` library output (e.g., 理发 → Corte de pelo, 嫁娶 → Matrimonio)
  - One-time effort, static mapping

- [ ] **Flutter state management choice** — Decide state management approach (Riverpod, Bloc, Provider, etc.)
  - Research needed: best fit for a single-screen, data-driven app

- [ ] **Flutter project setup** — Scaffold project with folder structure, dependencies, linting
  - Dependencies: `lunar`, `google_mobile_ads`, `in_app_purchase`
  - Architecture: domain / data / presentation layers
  - Configure linting, analysis_options.yaml
