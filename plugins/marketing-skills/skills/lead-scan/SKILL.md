---
name: lead-scan
description: The methodology for assessing an inbound prospect from public data only — produces a structured Lead Assessment Brief (R/A/G scorecard + prioritized quick wins + recommended engagement). Use when sizing up a lead before a sales call or onboarding. Reuses seo-audit, ai-seo (GEO), cro, and competitor-profiling.
---

# Lead Scan — prospect assessment methodology

Turn a prospect (a website URL, or an inbound email) into a **Lead Assessment
Brief**: a fast, honest, public-data read of where the opportunity is and how the
agency would help. This skill is the *method* and the *brief structure*; the
`/lead-intake` command orchestrates input resolution and filing, and the
`reporting` skill renders the HTML.

## Always consult the shared layer first

- `../_shared/localization.md` — **output is Romanian by default** (ro-RO).
- `../_shared/output-structure.md` — files land under `prospects/<slug>/`.
- `agency.md` (agency root) — read it for the agency's **services, ICP, pricing
  model, and default targets**. The Recommended Engagement section maps findings
  onto these real service lines. If `agency.md` is missing or a field is blank,
  say so and recommend against generic service lines — never invent offerings.

## Guardrails (non-negotiable)

- **Public data only.** Use the live site, public pages, search results, and the
  inbound email. No logins, no private analytics, no scraping gated data.
- **No fabricated metrics.** If you don't have a real number, say so. Use
  qualitative reads ("checkout has 5 form fields, likely friction") or labeled
  **ranges/assumptions** ("traffic likely low — no content footprint found").
  Never invent traffic, revenue, ROAS, or rankings.
- **Time-boxed.** This is a pre-sale read, not a full audit. Breadth over depth;
  flag what a paid audit would confirm.
- **Label every assumption.** Mark inferred items as "ipoteză" (assumption) so
  the brief is honest in a sales conversation.

## Method (reuse existing skills, don't re-derive)

Work through these lenses, each a quick read, pulling on the matching skill:

1. **Site / CRO** (`cro`) — does the page communicate value, is there a clear CTA,
   is the path to purchase/contact short? Mobile? Trust signals?
2. **SEO** (`seo-audit`) — titles, meta, headings, indexable content, obvious
   technical gaps, content footprint. Public/on-page signals only.
3. **GEO / AI-search** (`ai-seo`) — is the site structured to be cited by AI
   answers (clear entity, FAQ/structured content, citable facts)?
4. **Paid readiness** — is there anything to point ad traffic at (offer, landing
   page, tracking visible in markup)? Not whether they run ads — whether they
   *could* convert paid traffic.
5. **Brand** — clarity, consistency, positioning vs. the category.
6. **Competitive pressure** (`competitor-profiling`) — 2–4 visible rivals, where
   the opening is. Public profiles only.

Use web search/fetch for public research. Keep each lens to a few concrete
observations, not an essay.

## Scorecard (R/A/G)

Rate each dimension **Roșu / Galben / Verde** (Red/Amber/Green) with a one-line
reason — Site/CRO, SEO, GEO/AI-search, Paid readiness, Brand, Competitive
pressure — plus an overall **opportunity vs. effort** read. Color reflects the
prospect's *current state* (Roșu = weak now = bigger opportunity for the agency).

## Brief structure (the 12 sections)

1. **Header** — prospect, site, source, requested service, contact, date.
2. **Scorecard** — the R/A/G grid above + opportunity vs. effort.
3. **Business snapshot** — what they do, niche, audience, price positioning.
4. **Stated vs. observed need** — what they asked for vs. what the scan shows
   (the gap is the consultative wedge).
5. **SEO read** — quick on-page/technical findings.
6. **GEO / AI-search read** — citability for AI answers.
7. **CRO / site read** — conversion friction and quick fixes.
8. **Competitive landscape** — 2–4 rivals, where the opening is.
9. **Prioritized quick wins** — impact vs. effort, highest-leverage first.
10. **Recommended engagement** — agency services (from `agency.md`) mapped to
    findings + a first-90-days sketch.
11. **Open questions for the prospect** — feed straight into onboarding.
12. **Sources + generated timestamp** — every URL consulted.

## Output

Hand the assembled content to the `reporting` skill, which renders
`assets/lead-brief.html` (Romanian) and files it to
`prospects/<slug>/brief.html`. Keep the chat summary to the headline read + top
2–3 quick wins; the brief holds the detail.
