# Mobile Framework Comparison

## Options Evaluated
1. Flutter (Dart)
2. React Native + Expo (TypeScript)
3. Kotlin Native (Jetpack Compose)

## Quick Comparison

| Criterion | Flutter | React Native | Kotlin |
|---|---|---|---|
| `lunar-typescript` integration | Dart port (different codebase) | **Direct use (same package)** | Java port (different codebase) |
| Code sharing with backend | None | **Full (same language + libs)** | None |
| Custom UI / aesthetics | **Best (canvas-native)** | Good (with react-native-skia) | Good |
| Path to iOS | Trivial | Trivial | Hard (rewrite) |
| Widget support | Requires native code | Third-party library | **First-class** |
| APK size | ~8-12 MB | ~12-18 MB | **~6-10 MB** |
| Dev speed (TS team) | Medium (new language) | **Fastest** | Medium (new language) |

## Recommendation: React Native with Expo

### Why
1. **`lunar-typescript` runs directly** — same package on backend and mobile, zero integration cost, no data divergence risk
2. **TypeScript everywhere** — backend, data engine, mobile. One language, no context switching
3. **Expo accelerates** — OTA updates, cloud builds, instant device preview
4. **Custom aesthetics achievable** — `react-native-skia` for canvas-level control if needed
5. **iOS later** — same codebase, trivial to add

### Proposed Stack
- React Native 0.84+ with Expo SDK 55+
- `lunar-typescript` (shared with backend)
- `react-native-google-mobile-ads` (AdMob)
- `react-native-iap` (remove ads purchase)
- `react-native-reanimated` + `react-native-gesture-handler` (animations)
- `@shopify/react-native-skia` (decorative/calligraphic elements if needed)
- `expo-font` with subsetted Chinese calligraphic fonts

### Tradeoffs Accepted
- Larger APK (~12-18 MB vs ~6-10 MB for Kotlin) — mitigated by font subsetting
- Custom UI requires more effort than Flutter — mitigated by react-native-skia and single-screen simplicity
- Widgets need third-party library — acceptable since widgets are deferred
