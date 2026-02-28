# MVP Scope Decision

**Date:** 2026-02-28

## In Scope (v1)
- Daily tear-off calendar view (single screen)
- Auspicious activities (宜) — Chinese + Spanish
- Things to avoid (忌) — Chinese + Spanish
- Lunar date, Heavenly Stems & Earthly Branches, element of the day
- Solar terms (二十四节气) with day count within term
- One fixed proverb per day — Chinese + Spanish (fixed per day for 2026, never changes)
- Day navigation (prev / next / today)
- Android app only
- Spanish-first, Chinese characters kept for aesthetics and authenticity
- Small ad (likely bottom banner) + "remove ads" IAP — exact approach TBD
- Content coverage: March 1 – December 31, 2026 (~306 days)

## Out of Scope (deferred)
- Home screen widget
- iOS version
- BaZi calculator
- Personalized readings
- Zodiac compatibility
- Hourly fortunes
- Auspicious date picker
- Push notifications
- User accounts / login
- Subscription model

## Data Sources
- **Almanac data**: `lunar-javascript` / `lunar-typescript` (MIT) — computes all calendar data algorithmically
- **Proverbs**: Curated dataset (~306 entries) from open-source sources (chinese-xinhua, ctext.org, CC-CEDICT, etc.)
- **Activity translations**: One-time Chinese → Spanish mapping (~50-80 terms)

## Key Design Principle
Fun daily read with strong aesthetics, NOT a complex Feng Shui reference tool.
