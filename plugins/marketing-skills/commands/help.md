---
description: Show what the marketing toolkit can do, grouped by goal, with ready-to-paste Romanian prompts.
---

# /help

Print a capability map in **Romanian**, grouped by job-to-be-done, each line with
a ready-to-paste `/mk ...` example. Then show which connectors are attached vs
missing, and end with 4–6 clickable prompt suggestions for the most common tasks.

## Output template (render in Romanian)

**Ce pot face pentru tine** (everything runs through `/mk`):

- **Achiziție plătită (Meta / Google / TikTok)**
  - `/mk verifică performanța reclamelor de ieri`
  - `/mk de ce scade ROAS-ul?`
- **Rapoarte**
  - `/mk raport săptămânal pentru clientul curent`
  - `/mk raport lunar cu LTV și cele mai vândute produse`
- **Creație & social**
  - `/mk 10 variante de reclamă pentru ediția <X>`
  - `/mk execută campania din brief-ul aprobat`
- **Email / SMS**
  - `/mk secvență de coș abandonat`
- **Site / SEO / CRO**
  - `/mk audit CRO pentru <URL>`
- **Cercetare**
  - `/mk profilează competitorul <URL>`
- **Setup & automatizări**
  - `/mk onboardează un client nou`
  - `/mk pornește rapoartele automate`

**Conectori:** check which of Shopify, Windsor.ai/Supermetrics, Klaviyo, Canva,
Gmail are attached; list any missing with a one-line note on what they unlock.

**Sugestii rapide:** emit 4–6 prompt suggestions tailored to the current
client's active channels (read from `context.md`).

## Rules
- Entirely in Romanian.
- Don't dump the full skill list — group by goal, keep it scannable.
