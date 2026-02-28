# Huangli Data Sources Research

Research into APIs, libraries, databases, and algorithms for providing Chinese Feng Shui Huangli (黄历) almanac data programmatically.

Date: 2026-02-28

---

## Table of Contents

1. [Summary of Findings](#summary-of-findings)
2. [Open-Source Libraries (JavaScript/TypeScript)](#open-source-libraries-javascripttypescript)
3. [Open-Source Libraries (Python and Other Languages)](#open-source-libraries-python-and-other-languages)
4. [APIs and Web Services](#apis-and-web-services)
5. [Static Datasets and Databases](#static-datasets-and-databases)
6. [How Auspicious/Inauspicious Data Is Calculated](#how-auspiciousinauspicious-data-is-calculated)
7. [What Must Be Curated vs Computed](#what-must-be-curated-vs-computed)
8. [Chinese Wisdom One-Liners (Proverbs)](#chinese-wisdom-one-liners-proverbs)
9. [Recommendation](#recommendation)

---

## Summary of Findings

The Huangli data our app needs falls into two categories:

- **Computable data**: Lunar dates, Heavenly Stems & Earthly Branches (干支), Five Elements (五行), solar terms (节气), zodiac, and year cycle info are all algorithmically deterministic. Multiple open-source libraries can compute these.
- **Semi-computable / curated data**: Daily auspicious (宜) and inauspicious (忌) activities are derived from a combination of algorithmic rules (Twelve Day Officers, Peng Zu Taboos, deity positions) and traditional reference tables. One library -- `lunar-javascript` -- already encodes these rules and outputs daily yi/ji lists.

The strongest candidate for our core calendar engine is **`lunar-javascript`** (or its TypeScript port `lunar-typescript`) by 6tail. It is the only library that provides the full Huangli feature set including daily auspicious/inauspicious activities, and it has no external dependencies.

---

## Open-Source Libraries (JavaScript/TypeScript)

### 1. lunar-javascript / lunar-typescript (by 6tail) -- RECOMMENDED

- **Repository**: https://github.com/6tail/lunar-javascript
- **TypeScript port**: https://github.com/6tail/lunar-typescript
- **npm**: `lunar-javascript` (v1.7.7) / `lunar-typescript`
- **Stars**: ~1,400
- **License**: MIT
- **Dependencies**: None

**Full feature list:**

| Feature | Supported |
|---|---|
| Gregorian <-> Lunar date conversion | Yes |
| Heavenly Stems & Earthly Branches (干支) for year/month/day/hour | Yes |
| Five Elements / Nayin (纳音) | Yes |
| Chinese Zodiac (生肖) | Yes |
| 24 Solar Terms (二十四节气) | Yes |
| Daily Auspicious Activities (每日宜) | Yes |
| Daily Inauspicious Activities (每日忌) | Yes |
| Peng Zu Taboos (彭祖百忌) | Yes |
| Auspicious/Inauspicious Deities (吉神宜趋 / 凶煞宜忌) | Yes |
| Deity Directions (喜神/福神/财神 方位) | Yes |
| Fetal Deity Position (胎神方位) | Yes |
| Clash & Harm info (冲煞) | Yes |
| Lunar Mansions / Constellations (星宿) | Yes |
| Eight Characters / BaZi (八字) | Yes |
| Twelve Day Officers (建除十二值星) | Yes |
| Twelve Deities (青龙明堂等十二神) | Yes |
| Lucky/Unlucky Day classification (黄道黑道日) | Yes |
| Buddhist Calendar (佛历) | Yes |
| Taoist Calendar (道历) | Yes |
| Festivals and Holidays | Yes |
| Julian Day Number | Yes |
| Zodiac Sign (Western) | Yes |

**Usage example:**
```javascript
const { Solar } = require('lunar-javascript');
const solar = Solar.fromYmd(2026, 2, 28);
const lunar = solar.getLunar();

console.log(lunar.toString());        // Lunar date in Chinese
console.log(lunar.getYearInGanZhi()); // e.g., 丙午年
console.log(lunar.getDayInGanZhi());  // e.g., 戊子日
console.log(lunar.getDayYi());        // Array of auspicious activities
console.log(lunar.getDayJi());        // Array of inauspicious activities
console.log(lunar.getJieQi());        // Current solar term
```

**Assessment**: This is the most complete library available. It covers every data point our app needs except Chinese wisdom proverbs. The library is pure JavaScript with zero dependencies, making it ideal for mobile use. The TypeScript version provides type safety.

---

### 2. tyme4ts (by 6tail) -- Successor / Alternative

- **Repository**: https://github.com/6tail/tyme4ts
- **npm**: `tyme4ts` (v1.4.2)
- **Stars**: ~390
- **License**: MIT
- **Dependencies**: None

**Key differences from lunar-javascript:**
- Described as the "upgraded version of Lunar" with better design and extensibility
- Supports: Gregorian, Lunar, Tibetan calendar, zodiac, stems/branches, solar terms, legal holidays
- Actively maintained (latest release: February 2026)
- Does **NOT** appear to include daily yi/ji (auspicious/inauspicious) activities yet

**Assessment**: Better architecture but missing the critical Huangli yi/ji feature. Monitor this library -- if 6tail adds yi/ji support, it would become the preferred choice. For now, `lunar-javascript` / `lunar-typescript` remains the better option for our use case.

---

### 3. chinese-lunar (by oljc)

- **Repository**: https://github.com/oljc/chinese-lunar
- **npm**: `chinese-lunar`
- **Size**: ~3 KB
- **License**: MIT

**Features**: Lightweight lunar date conversion only. No stems/branches, no solar terms, no yi/ji.

**Assessment**: Too limited for our needs. Only useful if we needed a minimal lunar date converter.

---

### 4. moment-lunar

- **Repository**: https://github.com/Luavis/moment-lunar
- **npm**: `moment-lunar`

**Features**: Moment.js plugin for lunar dates. Korean and Chinese lunar calendar support.

**Assessment**: Depends on moment.js (which is in maintenance mode). Limited feature set. Not recommended.

---

## Open-Source Libraries (Python and Other Languages)

These are relevant if we use a backend service to pre-compute data, or as reference implementations.

### Python: lunar-python (by 6tail)

- **Repository**: https://github.com/6tail/lunar-python
- **pip**: `lunar-python`
- **Features**: Same comprehensive feature set as lunar-javascript (yi/ji, stems/branches, solar terms, etc.)
- **Used by**: The Huangli MCP Server on LobeHub

### Python: LunarCalendar

- **Repository**: https://github.com/wolfhong/LunarCalendar
- **pip**: `LunarCalendar`
- **Features**: Lunar-solar conversion, 24 solar terms, holidays. No yi/ji.

### Go: ChineseCalendarGo

- **Repository**: https://github.com/keepitlight/ChineseCalendarGo
- **Features**: Lunar calendar, stems/branches, solar terms

### Java: Almanac (HuangDayu)

- **Repository**: https://github.com/HuangDayu/Almanac
- **Features**: Comprehensive -- stems/branches, solar terms, moon phases, BaZi, sunrise/sunset

### Python: Almanac_ICS

- **Repository**: https://github.com/ClokMuch/Almanac_ICS
- **Features**: Generates .ics calendar files with Huangli data. Uses external API to fetch JSON data.

---

## APIs and Web Services

### 1. Ultimate Chinese Calendar API (Zyla Labs)

- **URL**: https://zylalabs.com/api-marketplace/data/ultimate+chinese+calendar+api/1307
- **Type**: REST API (JSON)
- **Pricing**: Free trial (50 requests), then ~$0.0003/request
- **Features**: Lunar dates, sexagenary cycle (Gan Zi), zodiac, Chinese zodiac. Output in Chinese (traditional/simplified) and partial English.
- **Limitations**: No yi/ji auspicious/inauspicious activities documented. Pay-per-request model.

### 2. Huangli MCP Server

- **URL**: https://lobehub.com/mcp/yourname-huangli-mcp
- **Type**: MCP (Model Context Protocol) server, runs locally
- **Built on**: `lunar-python` + `fastmcp`
- **Features**: Full Huangli data including yi/ji, stems/branches, deity directions, solar terms, moon phases
- **Runs offline**: Yes

**Assessment**: Not a traditional API, but demonstrates that the `lunar-python` library can power a complete Huangli service. Useful as a reference architecture.

### 3. Astrology API (astrologyapi.com)

- **URL**: https://astrologyapi.com
- **Features**: Chinese zodiac, year forecast. Limited Chinese calendar support.
- **Assessment**: Primarily Indian/Western astrology. Not focused on Huangli.

### 4. FateMaster.ai Chinese Calendar

- **URL**: https://www.fatemaster.ai/en/workspace/huangli
- **Type**: Web tool (no documented API)
- **Features**: Lunar-solar conversion, daily auspicious analysis, Ganzhi, Five Elements, 24 solar terms

---

## Static Datasets and Databases

### 1. Traditional Chinese Calendar Database

- **Repository**: https://github.com/hungtcs/traditional-chinese-calendar-database
- **Format**: JSON files (organized by year), zlib compressed
- **Date range**: 1901-2100
- **Data source**: Hong Kong Observatory
- **License**: MIT
- **Fields per day**: Weekday, Gregorian date, lunar date, zodiac animal, solar term
- **Limitations**: No yi/ji, no stems/branches, no five elements
- **Stars**: 66

**Assessment**: Good as a validation/cross-reference source for lunar dates and solar terms, but incomplete for our full Huangli needs.

### 2. Chinese Almanac Calendar2u

- **URL**: https://chinese-almanac.calendar2u.com/
- **Type**: Website only (no API)
- **Features**: Full Huangli with yi/ji, stems/branches, solar terms

---

## How Auspicious/Inauspicious Data Is Calculated

This is a critical question for our app. The answer is: **it is algorithmic, based on multiple interacting traditional systems**, not arbitrary curation.

### The Core Calculation Systems

#### 1. Twelve Day Officers (建除十二值星 / Jian Chu System)

The primary system for determining daily auspicious/inauspicious nature:

- **12 officers**: Jian (建), Chu (除), Man (满), Ping (平), Ding (定), Zhi (执), Po (破), Wei (危), Cheng (成), Shou (收), Kai (开), Bi (闭)
- **Cycle**: Repeats every 12 days in fixed sequence
- **Algorithm**: The starting day (Jian/Establish) always matches the Earthly Branch of the current lunar month. From there, the sequence follows in order.
- **Classification**:
  - Auspicious days: Chu, Ding, Zhi, Wei, Cheng, Kai
  - Inauspicious days: Jian, Man, Ping, Po, Shou, Bi
- **Each officer has specific associated activities** (e.g., Cheng is best for marriage; Chu is for elimination/renewal)

#### 2. Peng Zu Taboos (彭祖百忌)

A lookup table indexed by the day's Heavenly Stem and Earthly Branch:

- Each of the 10 Heavenly Stems has a specific taboo (e.g., "Jia day: do not open granary")
- Each of the 12 Earthly Branches has a specific taboo (e.g., "Zi hour: do not ask for divination")
- The day's stem-branch pair produces two taboo statements

#### 3. Auspicious and Inauspicious Deities (神煞)

Based on the relationship between the day's stem-branch and the month's stem-branch:

- **Auspicious deities** (吉神宜趋): Heavenly Virtue, Monthly Virtue, etc. -- their presence makes certain activities favorable
- **Inauspicious deities** (凶煞宜忌): Calamity Star, etc. -- their presence makes certain activities unfavorable

#### 4. Nayin Five Elements (纳音五行)

Each stem-branch pair maps to one of 30 Nayin elements (e.g., "Fire in the Mountain" or "Water from the Stream"). This influences the day's elemental character.

#### 5. Day-Month-Year Relationships

Interactions between the stems/branches of the current day, month, and year determine:
- Clashes (冲)
- Harms (害)
- Combinations (合)
- These affect which activities are favorable or unfavorable

### Key Insight

The yi/ji (auspicious/inauspicious activity) lists are **deterministic** -- given the same date, any correct implementation should produce the same results. They are derived from fixed rules applied to the day's astronomical/calendrical position. However, the rules are complex and layered, which is why pre-built libraries like `lunar-javascript` are valuable -- they encode centuries of traditional knowledge.

---

## What Must Be Curated vs Computed

| Data Point | Computed or Curated | Source |
|---|---|---|
| Lunar date (e.g., 正月廿七) | Computed | Astronomical algorithm |
| Heavenly Stems & Earthly Branches (干支) | Computed | Sexagenary cycle algorithm |
| Element of the day | Computed | Nayin lookup table (fixed mapping) |
| Solar terms (二十四节气) | Computed | Sun's ecliptic longitude at 15-degree intervals |
| Day count within solar term | Computed | Days since last solar term start |
| Year cycle info (e.g., 丙午年) | Computed | Sexagenary cycle for years |
| Auspicious activities (宜) | Computed | Twelve Day Officers + deity rules + stem-branch interactions |
| Inauspicious activities (忌) | Computed | Same as above |
| Peng Zu taboos (彭祖百忌) | Computed | Fixed lookup table indexed by stem-branch pair |
| Chinese zodiac animal | Computed | Earthly Branch of the year |
| Clash/harm info (冲煞) | Computed | Stem-branch opposition rules |
| Chinese wisdom proverbs | **Curated** | Requires a hand-curated or sourced dataset |
| Festival/holiday names | Semi-curated | Lunar dates are fixed, but display names need a table |
| Activity translations (Chinese -> English) | **Curated** | Need bilingual mapping table |

---

## Chinese Wisdom One-Liners (Proverbs)

This is the one data point that cannot be computed and must be curated.

### Available Datasets

#### 1. Chinese Idiom Database (by-syk)

- **Repository**: https://github.com/by-syk/chinese-idiom-db
- **Format**: SQLite (.db) and plain text (.txt)
- **Count**: 12,976 four-character idioms (chengyu)
- **Fields**: Name, pinyin, definition, source, example sentence
- **License**: Apache 2.0
- **Note**: Data from unofficial sources, not rigorously verified

#### 2. PETCI - Parallel English Translation of Chinese Idioms

- **Repository**: https://github.com/kenantang/petci
- **Format**: JSON
- **Features**: Chinese idioms with parallel English translations

#### 3. Cheng-Yu-Chinese-idioms

- **Repository**: https://github.com/EmiLithium/Cheng-Yu-Chinese-idioms
- **Format**: Dataframe
- **Features**: Chinese idioms with meanings and translations (growing collection)

#### 4. chinese-idiom-chengyu (npm)

- **Repository**: https://github.com/wenhuangzeng/chinese-idiom-chengyu
- **Type**: npm package with utility functions for Chinese idioms

### Proverb Strategy Recommendation

For our app, we need **short, daily-appropriate wisdom one-liners** -- not just four-character idioms. Recommended approach:

1. **Start with a curated seed dataset** (~365-500 entries) of Chinese proverbs, seasonal sayings, and philosophical quotes
2. **Tag entries by season/solar term** so proverbs can match the time of year
3. **Source from**: Confucius, Laozi, Zhuangzi, common folk proverbs (谚语), and seasonal agricultural sayings related to solar terms
4. **Use existing chengyu databases** as supplemental material
5. **Store as JSON** with fields: `text_zh`, `text_en`, `pinyin`, `source`, `season_tags`

---

## Recommendation

### Primary Architecture

```
lunar-javascript (or lunar-typescript)
        |
        v
  [Calendar Engine]
        |
        +---> Lunar date, stems/branches, elements, solar terms
        +---> Daily yi/ji (auspicious/inauspicious activities)
        +---> Peng Zu taboos, deity positions, clash info
        |
  [Curated Data Layer]
        |
        +---> Chinese wisdom proverbs (JSON dataset)
        +---> Activity name translations (Chinese <-> English)
        +---> UI labels and formatting
```

### Chosen Stack

| Component | Choice | Reason |
|---|---|---|
| Calendar engine | `lunar-javascript` v1.7.7 (MIT) | Only JS library with full yi/ji support; zero dependencies; 1.4k stars |
| Proverb data | Custom curated JSON dataset | No single source covers our needs; start with ~365 entries |
| Chengyu supplement | `chinese-idiom-db` (Apache 2.0) | 12,976 idioms as supplemental content |
| Validation reference | `traditional-chinese-calendar-database` (MIT) | Cross-check lunar dates against Hong Kong Observatory data |
| Future migration | Monitor `tyme4ts` | Better architecture; migrate when yi/ji support is added |

### Key Risks

1. **`lunar-javascript` accuracy**: The yi/ji rules are complex. We should cross-reference output against established Tong Shu sources (e.g., fengshuiweb.co.uk monthly almanacs) for validation.
2. **Localization**: The library outputs data in Chinese. We will need to build a translation layer for English-speaking users.
3. **Library maintenance**: 6tail is a solo developer. The library is stable but we should understand the source code enough to maintain it ourselves if needed.
4. **Proverb curation effort**: Building a quality proverb dataset with proper attribution and bilingual support requires editorial work.

### Open Questions for Engineering

1. Should the calendar engine run client-side (in the app) or server-side (pre-compute and serve via API)?
   - Client-side: simpler architecture, works offline, but increases app bundle size
   - Server-side: smaller app, can update rules without app release, but requires infrastructure
2. Do we need to support date ranges beyond the library's validated range?
3. Should we validate against the Chinese government standard GB/T 33661-2017 for solar term accuracy?
