# marketing-skills (v0.2.0)

Full marketing toolkit for client work, shipped as one globally-installable
plugin. Everything runs through a single front-door command.

## Layers
- **`/mk`** — the only command users need. Describe the task in Romanian; the
  `marketing-router` agent routes to the right skill/command/connector.
- **`/help`** — capability map with paste-ready Romanian prompts + connector status.
- **23 skills** — the marketing toolkit (ads, cro, seo, copywriting, emails,
  social, image, research, competitors, marketing-plan, …) plus two new ones:
  `reporting` (HTML, Romanian) and `ecommerce-analytics` (true ROAS / LTV / stock).
- **commands** — `onboard-client`, `setup-automations`, `ad-check`,
  `weekly-report`, `creative-batch`, `audit`, `campaign`.
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
Then in any client folder: `/mk init` to scaffold the output tree, or
`/mk onboardează un client nou` for full onboarding.
