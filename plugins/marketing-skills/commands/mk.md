---
description: The single front door to the marketing toolkit — describe what you need, in Romanian, and it routes to the right tool.
argument-hint: "<ce ai nevoie> | help | init"
---

# /mk — front door

One command for everything. The user types a request in plain language
(Romanian) and this hands it to the `marketing-router` agent, which picks the
right skill, command, or connector. The user never needs to know the other
commands exist.

## Behavior

1. **Always load context first:** read the current client's `context.md` and
   `brand-voice.md`, and the shared `_shared/localization.md` (output is
   Romanian) and `_shared/output-structure.md` (where files go).
2. Handle these special arguments:
   - `/mk help` → run the `/help` command.
   - `/mk init` → bootstrap the standard output folder tree for the current
     client by running `scripts/bootstrap-client.sh <client-folder>` (creates
     `00_inbox/`, `reports/<year>/{weekly,monthly,campaign}/`, `audits/`,
     `creative/`, `campaigns/`, `research/{competitors,customers}/`, `exports/`
     per `output-structure.md`). Idempotent — safe to re-run. If `context.md`
     has no language set, default it to Romanian.
   - anything else → pass the full request to the `marketing-router` agent.
3. Confirm the chosen route in one Romanian line, then execute.

## Examples

- `/mk raport săptămânal pentru clientul curent` → `/weekly-report`
- `/mk de ce a crescut CPA-ul?` → `ecommerce-analytics` + `ads`
- `/mk fă 10 variante de reclamă pentru ediția Glonț` → `/creative-batch`
- `/mk onboardează un client nou` → `/onboard-client`
- `/mk pornește rapoartele automate` → `/setup-automations`

## Rules
- Output and saved files in Romanian by default (`localization.md`).
- File every artifact via the filing standard (`output-structure.md`).
- One client per workspace; confirm if ambiguous.
