# Chinese Proverb Dataset Research

## Best Data Sources

### Tier 1 (structured, openly licensed)
1. **pwxcoo/chinese-xinhua** (MIT) — 31,648 chengyu in JSON with pinyin, explanation, origin. Chinese only.
2. **praxeds/chinese-proverbs-api** — Chinese + pinyin + English. Exact count TBD. License unspecified.
3. **by-syk/chinese-idiom-db** (Apache 2.0) — 12,976 idioms in SQLite/TXT. Chinese only.
4. **PETCI dataset** — 4,310 idioms with 29,936 English translations.
5. **CC-CEDICT** (CC BY-SA 4.0) — 124,079 entries, Chinese-English dictionary for cross-referencing.
6. **ctext.org** — Full texts of Analects, Dao De Jing, Zhuangzi with Legge translations (public domain).

### Solar Term Proverbs
Yes, specific proverbs exist for each of the 24 solar terms (agricultural proverbs / 农谚). Plan 2-4 per solar term.

## Curation Plan (~306 entries, March–December 2026)

| Category | Count | Source |
|---|---|---|
| Confucius (论语) | ~60 | ctext.org + Legge translations |
| Laozi (道德经) | ~50 | ctext.org (81 chapters) |
| Zhuangzi | ~25 | ctext.org |
| Chengyu (成语) | ~70 | chinese-xinhua + PETCI |
| Folk proverbs (谚语) | ~50 | chinese-proverbs-api + Wikiquote |
| Solar term proverbs (农谚) | ~36 | Academic sources |
| Mencius & other classical | ~15 | ctext.org |
| **Total** | **~306** | |

## JSON Schema
```json
{
  "id": 1,
  "chinese": "学而不思则罔，思而不学则殆",
  "pinyin": "xue er bu si ze wang, si er bu xue ze dai",
  "english": "Learning without thought is labor lost; thought without learning is perilous.",
  "source": "Confucius, Analects 2.15",
  "category": "philosophical",
  "tags": ["learning", "wisdom"],
  "solarTerm": null,
  "assignedDate": "2026-03-15"
}
```

## Licensing
- All ancient Chinese texts are public domain (2000+ years old)
- James Legge translations (1891) are public domain
- Modern translations may be copyrighted — use public domain translations or create our own
- Required attributions: CC-CEDICT (CC BY-SA 4.0), chinese-xinhua (MIT)
