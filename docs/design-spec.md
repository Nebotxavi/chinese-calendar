# Design Specification — New Chinese Luxury

**Date:** 2026-02-28
**Status:** Draft — based on prototype `11-luxury-with-motifs.html`
**Direction:** New Chinese Luxury (tradition revisited through premium modern Chinese aesthetics)

---

## Design Direction

The "New Chinese Luxury" direction draws from the Guochao (国潮) movement and brands like Florasis/Hua Xizi: traditional Chinese cultural motifs rendered with premium craftsmanship and restrained elegance. Not folk art kitsch, not radical minimalism — a refined middle ground that feels unmistakably Chinese while being modern and shareable.

---

## Color Palette

### Frame / Background
| Token | Hex | Usage |
|-------|-----|-------|
| `--bg` | `#3D1C11` | Phone frame / app background (dark mahogany) |
| `--bg-light` | `#4A2818` | Gradient end for frame |

### Card Surface
| Token | Hex | Usage |
|-------|-----|-------|
| `--card-bg` | `#FAF3E0` | Main card background (warm cream) |
| `--card-warm` | `#F0E5CC` | Deeper warm areas, secondary surfaces |

### Accent Colors
| Token | Hex | Usage |
|-------|-----|-------|
| `--cinnabar` | `#A52422` | Primary accent — day number, solar term, proverb |
| `--cinnabar-soft` | `rgba(165,36,34,0.06)` | Subtle cinnabar tint for backgrounds |
| `--gold` | `#C5A55A` | Ornamental elements — dividers, corners, borders, nav |
| `--gold-rich` | `#B8860B` | Year/month labels, badge text |
| `--gold-light` | `rgba(197,165,90,0.15)` | Badge backgrounds, card border |
| `--jade-green` | `#4A7050` | **Auspicious (宜) marker and text** (TODO: integrate) |
| `--jade-green-light` | `rgba(74,112,80,0.08)` | Auspicious section subtle background |

### Text Colors
| Token | Hex | Usage |
|-------|-----|-------|
| `--ink` | `#2C1810` | Primary text (darkest) |
| `--ink-medium` | `#5D4037` | Secondary text |
| `--ink-light` | `#9E8E82` | Tertiary text, captions, Spanish translations |

### Border / Ornamental
| Token | Hex | Usage |
|-------|-----|-------|
| `--border-gold` | `rgba(197,165,90,0.3)` | Content section border |

---

## Typography

### Font Stack

| Voice | Font | Source | Usage |
|-------|------|--------|-------|
| **Calligraphic display** | Ma Shan Zheng | Google Fonts | Solar term name (惊蛰), proverb Chinese |
| **Running script accent** | Zhi Mang Xing | Google Fonts | Yi/Ji markers (宜/忌) |
| **Chinese body** | Noto Sans SC (300–500) | Google Fonts | Activity text, day-of-week Chinese, badges |
| **Chinese display** | Noto Serif SC (600–900) | Google Fonts | Day number, lunar date |
| **Latin display** | Cormorant Garamond (400–700, italic) | Google Fonts | Tagline, day-of-week Spanish, solar term translation, proverb translation, nav labels |
| **Latin body** | Inter (300–600) | Google Fonts | Activity translations, ad placeholder, small labels |

### Type Scale

| Element | Font | Weight | Size | Color |
|---------|------|--------|------|-------|
| Day number | Noto Serif SC | 900 | 90px | `--cinnabar` |
| Solar term (Chinese) | Ma Shan Zheng | regular | 26px | `--cinnabar` |
| Yi marker (宜) | Zhi Mang Xing | regular | 24px | `--jade-green` (TODO) |
| Ji marker (忌) | Zhi Mang Xing | regular | 24px | `--ink-light` |
| Proverb (Chinese) | Ma Shan Zheng | regular | 20px | `--cinnabar` |
| Year/month label | Cormorant Garamond | 600 | 15px | `--gold-rich` |
| Day of week (Spanish) | Cormorant Garamond | 600 | 15px | `--ink` |
| Lunar date | Noto Serif SC | 600 | 14px | `--ink` |
| Day of week (Chinese) | Noto Sans SC | 300 | 12px | `--ink-light` |
| Activity (Chinese) | Noto Sans SC | 400 | 12px | `--ink` |
| Solar term (Spanish) | Cormorant Garamond italic | 400 | 12px | `--ink-light` |
| Proverb (Spanish) | Cormorant Garamond italic | 400 | 12px | `--ink-light` |
| Activity (Spanish) | Inter | 400 | 10px | `--ink-light` |
| Badge text | Noto Sans SC | 400 | 10px | `--gold-rich` |

### Key Typography Rules
- Chinese body text: **never bold** — use regular (400) or light (300) for readability
- Calligraphic fonts (Ma Shan Zheng, Zhi Mang Xing) for display elements only, never for body text
- Two typographic voices: serif/calligraphic for cultural content, sans-serif for functional UI
- Spanish text always uses Latin typefaces (Cormorant Garamond, Inter), never Chinese fonts

---

## Spacing

### Base Unit
`4px` base grid. All spacing values are multiples of 4.

### Component Spacing

| Area | Padding/Margin |
|------|----------------|
| Phone frame padding | 24px top/bottom, 16px sides |
| Card border-radius | 12px |
| Content section margin (from card edge) | 14px sides |
| Content section padding | 14px top/bottom, 16px sides |
| Content section border-radius | 6px |
| Date header padding | 14px sides, 14px top, 8px bottom |
| Navigation padding | 16px sides, 16px top, 18px bottom |
| Between elements inside content | 12–14px vertical |
| Badge padding | 3px vertical, 10px horizontal |
| Badge gap | 8px |
| Activity columns gap | 14px |

---

## Components

### Date Header
- Three-column layout: year+motif | day number | month+motif
- Side columns: 72px wide, vertically stacked (label + motif image)
- Day number: centered, cinnabar, 90px Noto Serif SC black
- Motif images: 60px (year), 54px (month), low opacity (0.25–0.3), sepia filter

### Content Section
- Gold border (1.5px solid, 0.3 opacity)
- Gold L-shaped corner ornaments (14px, 0.35 opacity)
- Subtle top-to-transparent white gradient overlay

### Gold Divider
- Centered, 130px wide
- Two gradient lines with a rotated diamond (5px) in the center
- Gold color, 0.5 opacity on diamond

### Badges
- Horizontal row, centered
- Gold border, gold-light background, gold-rich text
- 3px border-radius

### Activities (Yi / Ji)
- Two equal columns separated by a gold gradient vertical divider
- Yi (宜 auspicious): jade green marker (TODO: currently cinnabar, needs change)
- Ji (忌 inauspicious): ink-light grey marker
- Chinese activities in Noto Sans SC 400, Spanish translations below in Inter 10px

### Proverb
- Separated from activities by gold border-top
- Chinese in Ma Shan Zheng 20px cinnabar
- Spanish in Cormorant Garamond italic 12px ink-light

### Navigation
- Three buttons: prev (‹), today ("Hoy"), next (›)
- Gold border, transparent background, gold text
- Hover: gold fill, cream text
- Nav buttons: 34px square, 4px border-radius
- Today button: wider padding (6px × 24px), Cormorant Garamond 600

### Ad Placeholder
- Dashed gold border (0.25 opacity)
- 12px top margin from card
- 6px border-radius

---

## Motifs

### Year Motif (left side)
- Zodiac animal illustration — changes yearly
- 2026: Horse (马) — calligraphic paper-cut style, cinnabar red on cream
- Fixed for the entire year
- 60×60px, opacity 0.3, sepia filter for warmth

### Month Motif (right side)
- Seasonal/botanical illustration — changes monthly
- Style: line art in circle frame, cinnabar on cream (matching the horse style)
- 54×54px, opacity 0.25, sepia filter
- TODO: source high-quality monthly illustrations (current lotus placeholder is low quality)

### Monthly Motif Calendar (from art research)
| Month | Motif | Solar Terms |
|-------|-------|-------------|
| March | Peach blossom 桃花 | Awakening of Insects, Spring Equinox |
| April | Peony 牡丹 | Pure Brightness, Grain Rain |
| May | Pomegranate 石榴 | Start of Summer, Grain Buds |
| June | Lotus 莲花 | Grain in Ear, Summer Solstice |
| July | Fan/Cicada | Minor Heat, Major Heat |
| August | Wild goose 鸿雁 | Start of Autumn, End of Heat |
| September | Osmanthus 桂花 + Moon | White Dew, Autumn Equinox |
| October | Chrysanthemum 菊花 | Cold Dew, Frost Descent |
| November | Camellia 山茶 | Start of Winter, Minor Snow |
| December | Plum blossom 梅花 | Major Snow, Winter Solstice |

---

## Open Items / TODOs

- [ ] **Yi/Ji color update** — Change auspicious (宜) from cinnabar to jade green (`#4A7050`); keep inauspicious (忌) in grey
- [ ] **Monthly motif illustrations** — Source or commission 10 high-quality monthly motif images matching the horse's paper-cut/line-art style
- [ ] **Font licensing audit** — Verify all Google Fonts are suitable for mobile app distribution
- [ ] **Dark mode variant** — Consider if/how the palette adapts (lower priority)
- [ ] **Flutter implementation** — Translate this spec into Flutter widgets, theme data, and asset pipeline
