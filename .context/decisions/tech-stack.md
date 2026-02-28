# Tech Stack Decision

**Date:** 2026-02-28

## Mobile: Flutter (Dart)
**Chosen over:** React Native + Expo, Kotlin Native

**Reasons:**
- First-party Google AdMob support (`google_mobile_ads`)
- Pixel-perfect custom UI via Skia/Impeller — critical for traditional Chinese aesthetics
- Confident path to iOS (same codebase)
- Scalable architecture as features grow

**Tradeoffs accepted:**
- Dart instead of TypeScript (moderate learning curve)
- `lunar` Dart port instead of direct `lunar-typescript` sharing (same author, same API, low risk)
- No code sharing between backend (TS) and mobile (Dart)

## Backend: Node.js + TypeScript + Express
Locked from the start by user preference.

## Data Engine
- Mobile: `lunar` (pub.dev, MIT, by 6tail) — Dart port
- Backend: `lunar-typescript` (npm, MIT, by 6tail) — TypeScript version
- Both maintained by same author, same feature set, same algorithmic rules

## Key Libraries
| Component | Package | Source |
|---|---|---|
| Ads | `google_mobile_ads` | Google (first-party) |
| IAP | `in_app_purchase` | Flutter team |
| Animations | Flutter built-in (`AnimatedWidget`, `AnimationController`) | Flutter SDK |
| Fonts | Custom `.ttf` via `pubspec.yaml` | Flutter SDK |
| Almanac data | `lunar` | 6tail (pub.dev) |
