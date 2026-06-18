# marketing-skills (v0.3.0)

Full marketing toolkit for client work, shipped as one globally-installable
plugin. Everything runs through a single front-door command.

## Two-tier workspace
Two kinds of mountable folder, each with its own setup flow:
- **Agency root** — mount for prospecting and creating clients. Holds `agency.md`,
  `agency-brand-voice.md`, `prospects/`, and `clients/`. Set up once with
  **`/setup-agency`**.
- **Client folder** (`clients/<slug>/`) — mount for deep work on one client. Set
  up with **`/onboard-client`**, which can pre-fill from a prospect brief.

Lifecycle: `/setup-agency` → `/lead-intake <url|email>` → (they sign) →
`/onboard-client` → `/mk init` + `/setup-automations`.

## Layers
- **`/mk`** — the only command users need day-to-day. Describe the task in
  Romanian; the `marketing-router` agent routes to the right skill/command/connector.
- **`/setup-agency`** — one-time agency-root setup (interview → `agency.md`,
  voice, `CLAUDE.md`/`AGENTS.md`, skeleton). Files-only.
- **`/lead-intake <url|email>`** — assess an inbound prospect from public data →
  `prospects/<slug>/brief.html` (Lead Assessment Brief, Romanian).
- **`/help`** — capability map with paste-ready Romanian prompts + connector status.
- **25 skills** — the marketing toolkit (ads, cro, seo, copywriting, emails,
  social, image, research, competitors, marketing-plan, …), `reporting` (HTML,
  Romanian), `ecommerce-analytics` (true ROAS / LTV / stock), plus the setup
  skills `agency-interview`, `onboarding-interview`, and `lead-scan`.
- **commands** — `setup-agency`, `lead-intake`, `onboard-client`,
  `setup-automations`, `ad-check`, `weekly-report`, `creative-batch`, `audit`,
  `campaign`.
- **agents** — `marketing-router` (dispatcher).
- **automations/pool.md** — template catalog `/setup-automations` installs as
  scheduled tasks for the user.
- **skills/_shared** — `localization.md` (Romanian-first output rules + glossary)
  and `output-structure.md` (the per-client filing standard). Every
  output-producing skill/command obeys these.

## Cross-cutting rules
- **Output language: Romanian by default** (ro-RO, lei). English only on request.
- **Filing standard:** every artifact lands at a canonical per-client path
  (`reports/<year>/...`, `audits/`, `creative/`, `campaigns/`, `research/`,
  `exports/`), ISO-dated, indexed in `reports/INDEX.html`. No ad-hoc paths.

## Install (global, all client folders)
```
/plugin marketplace add <path-or-git-url>/allsoft-marketplace
/plugin install marketing-skills@allsoft-marketplace
```
Then mount your **agency root** and run `/setup-agency` once. From there:
`/lead-intake <url>` to assess a prospect, `/onboard-client` to convert one, and
inside any client folder `/mk init` to scaffold the output tree or
`/mk onboardează un client nou` for full onboarding.
