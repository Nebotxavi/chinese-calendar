# Plan: Create Initial Planning To-Do List

## Context
The project is at the very beginning — no code, no tech stack chosen, no scope defined. Before any implementation, the team of agents needs to work with the user to make foundational decisions. The user has deep domain knowledge and wants to actively participate in discussions, not just review outcomes. All research and discussions should be documented for future reference.

## What to Create

### 1. `.context/todos.md` — Planning checklist

A simple checklist for the project's first decisions.

#### Workflow (same for each topic)
1. **Research phase** — Relevant agents investigate independently, writing findings to `.context/research/`
2. **Roundtable discussion** — Agents present findings and discuss with the user. Back-and-forth until alignment.
3. **Capture decisions** — Record outcomes in `.context/decisions/`

#### To-Do Items

- [ ] **Define MVP scope** — What's in v1, what's deferred
  - Research: product-owner (Huangli features, cultural must-haves), designer (competitor UX)
  - Discussion: What daily view features matter most? What can wait?

- [ ] **Competitive analysis** — Existing Huangli/calendar apps landscape
  - Research: marketing (market size, competitors, gaps), designer (UX patterns)
  - Discussion: Positioning, differentiation, target audience

- [ ] **Choose tech stack** — Framework, backend, data sources
  - Research: architect (backend options, data architecture), frontend (React Native vs Flutter trade-offs)
  - Discussion: Trade-offs, user preferences, what fits the project's needs

- [ ] **Define UX direction** — Visual identity and design principles
  - Research: designer (aesthetic references, accessibility), product-owner (cultural accuracy)
  - Discussion: Traditional vs modern balance, key design principles

- [ ] **Update CLAUDE.md** — Consolidate all decisions as the project's source of truth

### 2. `.gitignore` — Add `.context/` to gitignore

The `.context/` directory contains planning artifacts, research notes, and discussion transcripts that should not be committed to the repo.

### 3. Documentation structure in `.context/`

Create the directory structure for agent research and decision records:
- `.context/research/` — Agent findings (competitive analysis, tech options, etc.)
- `.context/decisions/` — Final decisions from each discussion
- `.context/todos.md` — The planning checklist

Agents will be instructed to write their research and discussion summaries to these directories as they work, so there's a human-readable record of everything.

## Files to Create/Modify
- `.context/todos.md` (new)
- `.gitignore` (new — add `.context/`)

## Verification
- `.context/todos.md` exists with all planning items
- `.gitignore` includes `.context/`
- `.context/research/` and `.context/decisions/` directories are ready
