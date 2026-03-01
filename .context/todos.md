# Project To-Do List

## Completed

- [x] **Define MVP scope** — What's in v1, what's deferred
- [x] **Competitive analysis** — No Spanish-language Huangli app exists
- [x] **Choose tech stack** — Flutter + `lunar` by 6tail, backend deferred
- [x] **Define backend architecture** — Clean Architecture in CLAUDE.md
- [x] **Update CLAUDE.md** — Consolidated as project source of truth
- [x] **Define UX direction** — "New Chinese Luxury", design spec + 10 prototypes explored
- [x] **Art research / design spec** — Colors, fonts, spacing, components defined
- [x] **Proverb dataset curation** — 306 entries (classical, chengyu, folk, solar-term)
- [x] **Spanish translations** — All 306+ proverbs translated to neutral Spanish
- [x] **Proverb date assignment** — Mapped to March–December 2026 calendar days
- [x] **Fix yi/ji activity colors** — 宜 jade green, 忌 grey
- [x] **Activity translation mapping** — 90 Chinese → Spanish activity terms implemented
- [x] **Flutter state management** — Riverpod chosen and fully configured
- [x] **Flutter project setup** — Clean architecture, dependencies, linting
- [x] **Custom fonts** — 6 font families set up (NotoSerifSC, NotoSansSC, MaShanZheng, ZhiMangXing, CormorantGaramond, Inter)
- [x] **Monthly motif images** — 10 JPEGs (month_03–12), ~10-25KB each
- [x] **Calendar screen UI** — Full MVP layout with navigation, lunar info, activities, proverbs, decorations
- [x] **Proverb loading & caching** — Date-based lookup with fallback via repository

---

## In Progress

- [ ] **AdMob banner integration** — Add `google_mobile_ads`, initialize SDK, replace ad placeholder with real banner
  - Being worked on in another session
  - All steps ready except those requiring app to be live in Play Store

---

## Pending — Pre-Launch Polish

- [ ] **Optimize font/image sizes** — Reduce APK weight
  - Chinese fonts are ~15MB total — subset to only used characters
  - Review image compression, consider WebP format
  - Goal: lightweight APK for fast downloads

- [ ] **Improve monthly motif display** — Current image renders too small
  - Increase visual prominence in the layout
  - May need larger source images or layout adjustments

---

## Pending — Google Play Store Deployment

- [ ] **Create Google Play Developer account** — One-time $25 fee at [play.google.com/console](https://play.google.com/console)
- [ ] **Generate release keystore** — Create signing key for production builds (`keytool`)
- [ ] **Configure Gradle signing** — Set up `key.properties` and `build.gradle` for release builds
- [ ] **Set app identity** — Finalize `applicationId`, version name/code in `build.gradle`
- [ ] **Create app icon** — Adaptive icon following Android guidelines (foreground + background layers)
- [ ] **Build release AAB** — `flutter build appbundle --release`
- [ ] **Create Play Store listing** — Title, short/full description, screenshots, feature graphic
  - Screenshots: phone mockups for at least 1 device size
  - Feature graphic: 1024x500 banner
  - Category: Lifestyle or Tools
- [ ] **Write privacy policy** — Required by Google Play (even for no-login apps, because of AdMob)
  - Host on a simple webpage (GitHub Pages, or S3 with your AWS credits)
- [ ] **Content rating questionnaire** — Fill out in Play Console (IARC rating)
- [ ] **Set pricing & distribution** — Free + in-app purchases, select countries
- [ ] **Submit for review** — Upload AAB, typically 1-3 days for first app
- [ ] **Configure AdMob production ads** — After app is live, switch from test to production ad unit IDs

---

## Future (Post-Launch)

- [ ] **In-app purchase (remove ads)** — `in_app_purchase` package, ~$1.99 IAP
- [ ] **Proverb quality review** — Flag unclear proverbs, ensure standalone daily value
- [ ] **Calendar skins** — Visual themes, stored on-device
- [ ] **Daily chengyu notifications** — Push notification reminder
- [ ] **iOS release** — Apple Developer account ($99/year), App Store submission
- [ ] **Font subsetting automation** — Integrate into build pipeline
