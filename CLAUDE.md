# Chinese Feng Shui Calendar App

## What
A tear-off calendar app for your digital home, inspired by the traditional Chinese Feng Shui Huangli (黄历) almanac. A modern, minimalist take on the centuries-old wall calendar ritual.

Each day displays:
- Auspicious activities (宜) and things to avoid (忌)
- Lunar date, Heavenly Stems & Earthly Branches, element of the day
- Solar terms (二十四节气) with day count
- A daily Chinese wisdom proverb

Focus: fun daily read with strong aesthetics — NOT a complex Feng Shui reference tool.

## Target Audience
- Spanish-speaking users (Latin America + Spain)
- Language: Spanish + Chinese characters (Chinese kept for aesthetics and authenticity)

## Platform
- Android app (v1)
- iOS and home screen widget deferred

## MVP Scope (v1)
- Single daily calendar view with day navigation (prev/next/today)
- Content coverage: March–December 2026
- One fixed proverb per day (fixed per day, never changes within the year)
- Monetization: bottom banner ad + "remove ads" IAP (~$1.99)
- No user accounts, no login

### Out of scope
Widget, iOS, BaZi calculator, personalized readings, zodiac compatibility, hourly fortunes, auspicious date picker, push notifications, subscriptions.

## Tech Stack

### Mobile
- Flutter (Dart) — chosen for first-party Google AdMob support, pixel-perfect custom UI, and confident iOS path
- `google_mobile_ads` — AdMob banner ads (first-party Google package)
- `in_app_purchase` — "remove ads" IAP
- `lunar` (pub.dev, MIT, by 6tail) — Dart port of the Huangli data engine, computes all almanac data algorithmically

### Backend
- Not needed for v1 — all data computed on-device or bundled as assets
- Future: Node.js + TypeScript + Express (when dynamic content or user features are needed)

### Data (bundled in app)
- Almanac: computed locally by `lunar` Dart package
- Proverbs: JSON asset (~306 entries) from open-source sources (chinese-xinhua, ctext.org, CC-CEDICT)
- Activity translations: static Dart map, Chinese → Spanish (~50-80 terms)

## Design Direction
Traditional Chinese aesthetics revisited through modern minimalism. Inspired by how modern China promotes its ancient traditions while being an ultra-modern, high-tech society — tradition and modernity coexisting naturally.

- Traditional elements (Chinese characters, seals, decorative borders) present but refined
- Clean layout with generous whitespace — cleaner than traditional almanacs, not radically minimal
- Calligraphic accents for character, clean sans-serif for readability
- Should feel like a beautifully designed physical object, not a data utility

## Backend Architecture

Clean Architecture with four layers. Dependencies flow inward only.

### Layer Structure
```
src/
├── domain/          # Entities, enums, value objects (no external dependencies)
├── services/        # Cross-cutting business logic + abstractions/interfaces
├── usecases/        # Application-specific orchestration logic
└── infrastructure/  # Controllers, repositories, adapters, API definitions
```

### Key Rules

1. **Dependency Injection**: Use Awilix. Never import usecases, services, or repositories directly.
   ```typescript
   // CORRECT
   export default ({ calendarService, proverbRepository }: Dependencies) => { ... }

   // WRONG — direct import
   import calendarService from '../../services/calendar/calendar.service';
   ```

2. **Domain Logic in Entities**: Business logic belongs in Entity/Value Object methods, not in usecases. Usecases only orchestrate.

3. **Error Handling**: Use custom `AppError` with predefined response objects (code, statusCode, message). Never throw raw errors. Use `http-status-codes` package — never hardcode status codes.

4. **RESTful API Standards**:
   - Plural nouns: `/api/v1/calendars/{date}`, not `/calendar/{date}`
   - Hyphens in URLs: `/solar-terms/`, not `/solar_terms/`
   - Correct HTTP verbs
   - URL path versioning: `/api/v1/resource`

5. **Repository Pattern**: Data access through repository interfaces defined in `services/abstractions/`. Implementations in `infrastructure/repositories/`.

### Naming Conventions

| Type | Convention | Example |
|------|-----------|---------|
| Files | camelCase + dots | `calendar.service.ts`, `proverb.controller.ts` |
| Classes/Interfaces/Enums | PascalCase | `CalendarDay`, `ProverbRepository` |
| Variables/Functions | camelCase | `getDayData()`, `isAuspicious` |
| Booleans | `is/has/can/should` prefix | `isSolarTermDay` |
| Constants | UPPER_CASE | `MAX_DATE_RANGE` |

### Types
- `interface` for contracts and object shapes that might be extended
- `type` for unions, intersections, and mapped types
- No `any` types (strict mode)
- Explicit return types on public functions

### Testing
- **Primary**: `tests/usecases/` — most tests here
- **Secondary**: `tests/services/` — only for complex business logic
- **Tertiary**: `tests/units/domain/` — only for complex entity methods
- Mock **only** repositories and adapters (never mock services or usecases)
- Use entity builders for test data
- Use stubs for mocking
- Pattern: `mockReset().mockResolvedValueOnce()`

### Lint Rules
- No trailing commas in function parameters
- Always use braces after if/else/for/while
- Modern syntax: const/let, arrow functions, destructuring
- async/await over raw promises
- Optional chaining (`?.`) and nullish coalescing (`??`)

## Flutter Architecture

Follow Flutter's recommended architecture (similar to Clean Architecture):
- **Domain layer**: Entities and business logic
- **Data layer**: Repositories and data sources
- **Presentation layer**: Widgets, state management
- Use `lunar` (Dart) package as the calendar data engine
- State management approach TBD

## Status
- MVP scope defined
- Tech stack defined
- Data sources identified
- Design direction set (art research and design spec pending)
- Backend architecture guidelines defined
- Next: project setup
