---
name: reporting
description: >
  Build client-facing marketing reports as clean, self-contained HTML (or a live
  Cowork artifact when data should refresh on open) — never a raw markdown dump
  in chat. Use whenever the user wants a report, digest, dashboard, recap, or
  "send the client an update": weekly/monthly performance, campaign recaps,
  audit write-ups, KPI snapshots. Owns the templates, layout, and charting
  conventions that commands and scheduled automations both call so output stays
  identical regardless of who or what triggers it.
---

# Reporting

Produce reporting surfaces that a non-technical client can read at a glance.
Default output is **HTML**, not markdown and not inline chat text.

## Always consult the shared layer first

Before producing any report you MUST read and obey:
- `../_shared/localization.md` — **output is Romanian by default** (ro-RO, lei,
  decimal comma); use the report-label glossary verbatim (Cheltuieli
  publicitare, Venituri, Comenzi, Cele mai vândute, Ce s-a schimbat, etc.).
- `../_shared/output-structure.md` — the canonical path the report must be filed
  to, plus the `INDEX.html` you must update.

These override any defaults below. Never write a report to an ad-hoc path or in
English unless the user explicitly asks for English.

## Choosing the surface

- **Static HTML file** (default) — point-in-time reports the client will save,
  forward, or archive (weekly digest, campaign recap, audit). Self-contained:
  inline CSS, no external assets except Chart.js from CDN if a chart is needed.
- **Live Cowork artifact** — when the client will re-open the same view and want
  fresh numbers each time (an always-on performance dashboard). Use
  `create_artifact` and pull data via the attached connectors on load.
- **Inline chat** — only for a one-line answer to a one-line question.

## Standard structure (every report)

1. Header: client name, report type, date range, and the single headline number.
2. KPI row: 3–5 cards (Spend, Revenue, ROAS, CPA, Orders) with WoW/MoM delta and
   up/down color (green = good for that metric, accounting for inverse metrics
   like CPA where lower is better).
3. Trend chart (Chart.js) for the primary metric.
4. Breakdown table: by channel and by product/edition.
5. "What changed & what we're doing" — 2–4 plain-language bullets. This is the
   part the client actually reads; lead with the action, not the data.
6. Footer: data sources + generated timestamp.

## Conventions

- Currency and locale follow `context.md` (e.g. lei / ro-RO). Format numbers
  with thousands separators; round ROAS to 1 decimal, money to whole units.
- Never show a metric without its comparison period.
- Anomalies (CPA spike, ROAS below target, budget overpace) get a colored flag
  and a one-line cause hypothesis — not just the number.
- Respect `context.md` targets; if no target is set, state that and use the
  trailing-4-week average as the baseline.
- Reconcile ad-platform revenue against Shopify revenue via the
  `ecommerce-analytics` skill before reporting ROAS — platform numbers overstate.

## Workflow

1. Read `context.md` for client, currency, targets, channels.
2. Pull data from attached connectors (Windsor.ai/Supermetrics for ads, Shopify
   for revenue, Klaviyo for email). State clearly if a source is missing.
3. Compute metrics + deltas; reconcile ROAS.
4. Render with the structure above (Romanian labels). File the `.html` to the
   canonical path from `output-structure.md` (e.g.
   `reports/<AAAA>/weekly/<AAAA>-Wss_<client>_raport-saptamanal.html`) and update
   `reports/INDEX.html`. Or create a live artifact when numbers should refresh.
5. Present the file. Keep the chat summary to the headline + top action only.

## Templates

Romanian, self-contained HTML in `assets/` — fill the `{{placeholders}}`:
`raport-saptamanal.html` (weekly), `raport-lunar.html` (monthly),
`audit.html` (SEO/CRO), and `INDEX.html` (the per-client report index). Inline
CSS; Chart.js from CDN where a chart is needed. Copy the template, substitute
values (ro-RO formatting, lei), and file to the canonical path.
