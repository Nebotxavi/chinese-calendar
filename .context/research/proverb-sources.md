# Chinese Proverb Dataset Research

## Dataset Status: v1 COMPLETE

**File:** `data/proverbs/proverbs.json` (323 entries, 145 KB)

| Category | Count | Primary Sources |
|---|---|---|
| Classical (Confucius, Laozi, Zhuangzi, Mencius, etc.) | 145 | ctext.org + Legge translations (public domain) |
| Chengyu (成语) | 87 | pwxcoo/chinese-xinhua (MIT) + PETCI (Apache 2.0) |
| Folk proverbs (谚语) | 55 | Traditional Chinese folk sayings (public domain) |
| Solar term proverbs (农谚) | 36 | Traditional agricultural proverbs, 20 solar terms covered |
| **Total** | **323** | |

> 323 entries for 306 calendar days (Mar-Dec 2026) — 17 extras allow curation during date assignment.

## JSON Schema

```json
{
  "id": 1,
  "chinese": "学而时习之，不亦说乎？",
  "pinyin": "xué ér shí xí zhī, bù yì yuè hū?",
  "english": "Is it not a pleasure to learn and practice what you have learned?",
  "spanish": "",
  "source": "Analects 1.1",
  "sourceWork": "论语",
  "author": "Confucius",
  "category": "classical",
  "tags": ["learning"],
  "solarTerm": null
}
```

- `spanish`: empty for now, to be translated later
- `solarTerm`: Chinese name of solar term (only for solar-term category)
- Categories: `classical`, `chengyu`, `folk`, `solar-term`
- Characters: simplified Chinese
- Pinyin: with tone mark diacritics

## Data Sources (Verified)

### Used in v1
1. **ctext.org** — Analects, Dao De Jing, Zhuangzi, Mencius with Legge translations. Public domain (texts 2000+ years old, Legge translations from 1861-1891).
2. **pwxcoo/chinese-xinhua** (MIT) — 31,648 chengyu in JSON with pinyin, explanation, origin. Used as reference for chengyu entries.
3. **PETCI dataset** (Apache 2.0) — 4,310 idioms with English translations. Cross-referenced for chengyu English translations.

### Available but not used in v1
4. **by-syk/chinese-idiom-db** (Apache 2.0) — 12,976 idioms in SQLite/TXT. Backup source, "not rigorously proofread" per author.
5. **CC-CEDICT** (CC BY-SA 4.0) — 124,079 dictionary entries. Useful for cross-referencing.
6. **praxeds/chinese-proverbs-api** — Dropped. Data locked in MongoDB (not downloadable), license unspecified.

## Licensing

- All ancient Chinese texts: **public domain** (2000+ years old)
- James Legge translations (1861-1891): **public domain**
- pwxcoo/chinese-xinhua: **MIT** — attribution recommended
- PETCI dataset: **Apache 2.0** — attribution recommended
- No CC-CEDICT attribution needed (not used directly in dataset)

## Pending Work

- [ ] Spanish translations for all 306 entries
- [ ] Quality review: pinyin accuracy, translation clarity
- [ ] Date assignment: map proverbs to specific calendar days (Mar-Dec 2026)
- [ ] Consider: simplified vs traditional Chinese characters for the app
