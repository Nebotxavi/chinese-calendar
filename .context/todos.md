# Project To-Do List

## MUST — Before First Release

- [x] **Brand and name consistency** — Unified to "Huangli, tu calendario lunar" across all touchpoints: AndroidManifest, Play Store listing, Flutter app title, landing page, privacy policy
- [ ] **Replace placeholder app icon** — Provide final design for adaptive icon foreground (108x108dp, 66x66dp safe zone)
- [ ] **AdMob production ads** — Verify ad unit IDs are production-ready (current: `ca-app-pub-6980674466640425/8061143488`)
- [ ] **Build release AAB** — `flutter build appbundle --release`
- [ ] **Create Play Store listing** — Upload text from `docs/play-store-listing.md`, add screenshots + feature graphic
  - Screenshots: phone mockups for at least 1 device size
  - Feature graphic: 1024x500 banner
  - Category: Lifestyle
- [ ] **Content rating questionnaire** — Fill out in Play Console (IARC rating)
- [ ] **Set pricing & distribution** — Free, select countries (Latin America + Spain)
- [ ] **Submit for review** — Upload AAB, typically 1-3 days for first app

---

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
- [x] **Generate release keystore** — PKCS12, 2048-bit RSA, alias `upload`, 10000-day validity
- [x] **Configure Gradle signing** — `key.properties` + `build.gradle.kts` release signing config
- [x] **Set app identity** — `com.fengshui.calendario`, version 1.0.0+1, label "Huangli, tu calendario lunar"
- [x] **Adaptive icon structure** — Placeholder foreground (gold circle on #4D1814). Needs final design
- [x] **Write privacy policy** — `docs/privacy-policy.html` (Spanish, covers AdMob, no-login)
- [x] **Ad environment handling** — `kReleaseMode` check: placeholder in debug, real AdMob in release
- [x] **Draft Play Store listing** — Title, short/full description, tags in `docs/play-store-listing.md`
- [x] **Replace contact email** — Updated to `tanaka_corp@proton.me` in privacy policy
  - Google Play Developer account display email — update manually in Play Console
- [x] **Create Google Play Developer account** — Done
- [x] **Enable GitHub Pages** — Done

---

## NICE TO HAVE — Pre-Launch Polish (not blocking release)

- [ ] **Optimize font/image sizes** — Reduce APK weight
  - Chinese fonts are ~15MB total — subset to only used characters
  - Review image compression, consider WebP format
- [ ] **Improve monthly motif display** — Current image renders too small
  - Increase visual prominence in the layout

---

## Future (Post-Launch)

- [ ] **In-app purchase (remove ads)** — `in_app_purchase` package, ~$1.99 IAP
- [ ] **Proverb quality review** — Flag unclear proverbs, ensure standalone daily value
- [ ] **Calendar skins** — Visual themes, stored on-device
- [ ] **Daily chengyu notifications** — Push notification reminder
- [ ] **iOS release** — Apple Developer account ($99/year), App Store submission
- [ ] **Font subsetting automation** — Integrate into build pipeline
