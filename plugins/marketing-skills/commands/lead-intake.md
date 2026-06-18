---
description: Assess an inbound prospect from a URL or pasted email — creates prospects/<slug>/ and files a Lead Assessment Brief (Romanian HTML).
argument-hint: "<url | pasted email | gmail search>"
---

# /lead-intake

Run in the **agency root** when a lead arrives. Takes a website URL *or* an
inbound email, runs a public-data assessment, and files an HTML brief under
`prospects/<slug>/`. This command **orchestrates**; the assessment method lives
in the `lead-scan` skill and the rendering lives in the `reporting` skill.

## Steps

1. **Resolve input.**
   - A **URL** → that's the prospect site directly.
   - A **pasted email** or a **Gmail reference** → read the inbound message (via
     the Gmail connector if available; otherwise the pasted text) and extract:
     company, website, contact name/role, the stated service need, and any
     platforms/channels mentioned. Save the raw inbound to
     `prospects/<slug>/inbound-email.md`.
   - If neither a company nor a site can be determined, ask the owner once.
2. **Pick the slug.** Use the **company name** (kebab-case, ASCII, no diacritics),
   e.g. `prospects/acme-corp/`. Fall back to the domain only if no company name
   is available.
3. **Create `prospects/<slug>/`** (lightweight) and save the inbound info plus a
   `scan-notes.md` working file.
4. **Read `agency.md`** at the root so recommendations map to real service lines.
   If missing, proceed but flag that engagement recommendations are generic.
5. **Run `lead-scan`** — work the six lenses (Site/CRO, SEO, GEO/AI, Paid
   readiness, Brand, Competitive), reusing `seo-audit`, `ai-seo`, `cro`,
   `competitor-profiling` + web search/fetch. **Public data only; no fabricated
   metrics** — qualitative reads and labeled assumptions when numbers aren't
   available.
6. **Assemble the brief** via the `reporting` skill into `assets/lead-brief.html`
   (Romanian) and file it to `prospects/<slug>/brief.html`.
7. **Summarize** in chat: the headline read, the scorecard at a glance, and the
   top 2–3 quick wins. Point to the brief file and note that on conversion,
   `/onboard-client` will ingest it to pre-fill `context.md`.

## Notes
- Output language: **Romanian** (`_shared/localization.md`), like all
  deliverables.
- Prospect folders are lightweight — `brief.html`, `scan-notes.md`,
  `inbound-email.md`. No full client tree until onboarding.
- Never log into the prospect's systems or invent metrics — this is a public read
  to inform a sales conversation.
