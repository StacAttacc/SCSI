# SCSI Landing Page — Architecture Document

**Services Conseils Sensaroli Inc.**

## Overview

A static Angular SPA serving as the main entry point for SCSI's web presence. No backend. Links out to separate, independently-deployed projects.

---

## Stack

| Layer     | Technology                  |
|-----------|-----------------------------|
| Frontend  | Angular (latest, standalone)|
| Styling   | Tailwind CSS + DaisyUI      |
| Backend   | None                        |
| Hosting   | TBD                         |

---

## Project Structure

```
src/
├── app/
│   ├── core/               # Singleton services (e.g. SEO, analytics)
│   ├── shared/             # Reusable components, pipes, directives
│   ├── features/           # One folder per page/section
│   │   └── home/
│   └── app.routes.ts       # All route definitions in one place
└── assets/                 # Static files: images, icons, fonts
```

### Rules

- **`core/`** — services injected once at the app level. Never import `core` from `shared` or `features`.
- **`shared/`** — stateless, reusable UI pieces only. No business logic.
- **`features/`** — one folder per route/section. Self-contained. Can import from `shared` and `core`, never from other features.
- Components stay small: if a template exceeds ~100 lines, split it.

---

## Styling

- **Tailwind CSS** for utility classes and layout
- **DaisyUI** for UI components (buttons, cards, navbar, etc.)
- Design tokens (colors, fonts, spacing) live in `tailwind.config.js` under `theme.extend`
- No custom global CSS unless Tailwind/DaisyUI cannot cover the use case

---

## Linking to Other Projects

External projects are plain hyperlinks — no iframe, no shared state, no shared auth.

| Project | URL |
|---------|-----|
| TBD     | `https://placeholder.com` |

Links open in a new tab (`target="_blank" rel="noopener"`).

---

## Coding Conventions

- **Components**: standalone only — no NgModules
- **State**: prefer Angular signals over RxJS for local UI state
- **No unused imports**: keep bundles light — remove anything not in use
- **No commented-out code**: delete it, git history is the backup
- **Naming**: `kebab-case` for files, `PascalCase` for classes, `camelCase` for variables

---

## What Stays Out of This Repo

- Authentication
- API calls or HTTP clients
- Any backend or server-side logic
