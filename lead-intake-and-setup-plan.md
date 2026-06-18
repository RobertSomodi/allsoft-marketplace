# Plan — Two-tier workspace setup + lead intake

Status: design only (no build yet). Ships into the existing **marketing-skills**
plugin in **allsoft-marketplace**. Nothing here splits the plugin.

---

## 1. The workspace model

Two kinds of mountable folders, each with its own setup flow:

```
allsoftagency/                  ← AGENCY ROOT (mount for intake + creating clients)
├── agency.md                   composed by agency setup interview
├── agency-brand-voice.md       agency's own voice (sales/briefs)
├── CLAUDE.md / AGENTS.md        how Claude operates in this workspace
├── prospects/<slug>/           lead-intake output (lightweight)
│   ├── brief.html
│   ├── scan-notes.md
│   └── inbound-email.md
└── clients/<slug>/             a full client workspace (mount individually)
    ├── context.md              composed by client onboarding interview
    ├── brand-voice.md
    ├── CLAUDE.md / AGENTS.md
    └── reports/ audits/ creative/ campaigns/ research/ exports/ ...
```

Why the root is NOT redundant: it's the only mountable place where pre-sale work
can live and where a *new* client folder can be created (you can't create a
sibling folder from inside a single client mount). Mount the **root** for
prospecting/admin; mount a **single client** for deep work.

---

## 2. The two setup flows (core requirement)

Both are command-orchestrated, both run an **interactive interview** that
composes the base files. Never rely on a human writing context.md/agency.md by
hand — the interview is the mechanism.

### 2a. Agency setup — NEW (we don't have this)
- **Command:** `/setup-agency` (run once, in the agency-root folder).
- **Skill:** `agency-interview` (the Q&A knowledge: who the agency is, services
  offered, ICP/niches served, positioning, pricing model, default client
  targets, team, default output language).
- **Produces:** `agency.md`, `agency-brand-voice.md`, root `CLAUDE.md` +
  `AGENTS.md`, and the folder skeleton (`prospects/`, `clients/`, `_shared/`).
- **Why it matters:** lead-intake and client onboarding both read `agency.md`
  for "what we sell / who we serve" so briefs and recommendations are framed in
  Allsoft's actual service lines.

### 2b. Client setup — HAVE IT, enhance slightly
- **Command:** `/onboard-client` + **skill** `onboarding-interview` (already
  built — interviews and composes `context.md` + `brand-voice.md`, scaffolds the
  per-client tree).
- **Enhancement:** also drop a per-client `CLAUDE.md` + `AGENTS.md` (base
  instruction files) so every client folder is self-describing. On conversion,
  pre-fill `context.md` from the prospect brief instead of starting cold.

### Base files defined
- `agency.md` — agency profile: services, ICP/niches, positioning, pricing,
  default targets, output language.
- `context.md` — per-client profile (as built for Belloreshop).
- `brand-voice.md` — per-client tone, words to use/avoid, compliance lines.
- `CLAUDE.md` / `AGENTS.md` — operating instructions for that folder (routing
  defaults, output language = Romanian, filing standard pointer).

---

## 3. Lead intake (as you approved it)

- **Skill:** `lead-scan` — the assessment *methodology* + brief structure.
- **Command:** `/lead-intake <url | pasted email>` — orchestrates:
  1. Resolve input: a website URL directly, OR read an inbound email (Gmail) to
     extract company, site, contact, stated service need, platforms.
  2. Create `prospects/<slug>/` (lightweight) and save the inbound info.
  3. Run `lead-scan`, reusing existing skills (`seo-audit`, `ai-seo` for GEO,
     `cro`, `competitor-profiling`) + web search/fetch for public research.
  4. Assemble the HTML brief via the `reporting` skill; file to
     `prospects/<slug>/brief.html`.

### Brief structure (Lead Assessment Brief)
1. Header — prospect, site, source, requested service, contact, date
2. Scorecard — R/A/G across Site/CRO, SEO, GEO/AI-search, Paid readiness, Brand,
   Competitive pressure + overall opportunity vs. effort
3. Business snapshot — what they do, niche, audience, price positioning
4. Stated need vs. observed need (the gap)
5. SEO quick read · 6. GEO/AI-search read · 7. CRO/site read
8. Competitive landscape (2–4 rivals, where the opening is)
9. Prioritized quick wins (impact/effort)
10. Recommended engagement — Allsoft services mapped to findings, first-90-days
11. Open questions for the prospect (feed straight into onboarding)
12. Sources + generated timestamp

### Guardrails (in the skill)
Time-boxed; **public data only; no fabricated metrics** — qualitative or ranges
when numbers aren't available, assumptions labeled. Frames recommendations
against the service lines in `agency.md`.

### Language
Internal sales brief defaults to English (it's an internal artifact); a
Romanian client-facing version on request. (Client deliverables stay Romanian
per the global standard.)

---

## 4. End-to-end lifecycle

```
/setup-agency (once, in root)
        │
        ▼
lead arrives (email / organic)
        │
/lead-intake <url|email>  ──►  prospects/<slug>/brief.html
        │
   they sign
        │
/onboard-client  (creates clients/<slug>/, reuses brief to pre-fill context.md)
        │
/mk init  +  /setup-automations
```

---

## 5. What gets built (when approved)

Into `marketing-skills` (allsoft-marketplace):
- NEW skill `agency-interview`, NEW command `/setup-agency`
- NEW skill `lead-scan`, NEW command `/lead-intake`
- NEW asset `skills/reporting/assets/lead-brief.html` (EN, with RO variant)
- Enhance `/onboard-client` to also write per-client CLAUDE.md/AGENTS.md and
  ingest a prospect brief when present
- Update `bootstrap` to know `prospects/` (root) vs client tree
- Bump plugin to v0.3.0

Delivery: staged as files to merge into your `allsoft-marketplace` repo →
commit → `/plugin marketplace update` (or reinstall) to pick up v0.3.0.

---

## 6. Decisions to confirm before building
- `agency.md` field list — anything Allsoft-specific you want captured (e.g.
  retainer tiers, standard target ROAS by niche)?
- Should `/setup-agency` also register the marketplace/plugins, or just files?
- Prospect slug convention (company name? domain?).
