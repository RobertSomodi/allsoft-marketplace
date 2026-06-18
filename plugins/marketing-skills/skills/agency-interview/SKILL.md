---
name: agency-interview
description: Quick chat-style interview to compose an agency's agency.md and agency-brand-voice.md. Run once, in the agency-root folder, via /setup-agency — before any prospecting or client onboarding.
---

# Agency Setup Interview

Use this once per agency, **in the agency-root folder** (the workspace that holds
`prospects/`, `clients/`, and `_shared/`). It turns a short chat interview into a
proposed `agency.md` + `agency-brand-voice.md` diff for owner approval.

This skill is **agency-agnostic**: it holds the *method* for interviewing any
marketing agency. It never hardcodes a specific agency's services, pricing, or
positioning — those facts only ever get written into the mounted agency's files
at runtime.

## Guardrails

- Verify the current workspace is the agency root, not a single client folder. If
  it looks like a client folder (`context.md` present, no `clients/`), refuse and
  ask the owner to open the agency root instead.
- Nothing becomes durable until the owner approves the diff (see "After the
  interview").
- **Every field is skip-friendly.** Not all agencies can answer cleanly (e.g.
  retainer tiers, target ROAS by niche). Accept "skip" / "TBD" and leave the
  field blank — never invent agency facts.
- You MAY offer to read the agency's **own** website to pre-fill answers (services,
  positioning, pricing if public). Mark anything pre-filled this way as "draft,
  confirm" in the proposed diff. This is the agency describing itself — not
  scraped third-party content baked into the plugin.

## Interview flow

Ask **one question at a time**. Keep it conversational; offer multiple-choice
where natural. Cover, in order:

1. **Agency name** and one-line description of what they do.
2. **Services offered** — the actual service lines (e.g. paid ads, SEO, CRO,
   email, social, creative, full-funnel retainer). These become the menu that
   lead briefs and client plans map recommendations onto.
3. **ICP / niches served** — industries, business types, typical company size or
   stage. "Generalist" is a valid answer.
4. **Positioning** — what makes them different; how they'd want a prospect to
   describe them.
5. **Pricing model** — how they charge (retainer / project / performance /
   hourly), and retainer tiers or typical ranges *if they have them*. Skip freely.
6. **Default client targets** — any standard benchmarks they aim for (e.g. target
   ROAS or CPA by niche). Many agencies won't have these — skip is fine.
7. **Team / capacity** — who delivers, and any service they can't staff. Optional.
8. **Default output language** — Romanian by default (per
   `_shared/localization.md`); confirm or override.
9. **Brand voice** (for `agency-brand-voice.md`) — tone for the agency's own
   sales/briefs, words to use, words to avoid, 1–2 example lines they like.

## After the interview

1. Map answers onto `agency.md` sections: **Snapshot** (name, description),
   **Services**, **ICP / Niches**, **Positioning**, **Pricing**, **Default
   targets**, **Team**, **Output language**. Map voice answers onto
   `agency-brand-voice.md`.
2. Put only confirmed facts under "Known". Park anything uncertain or skipped
   under "Open Questions" so it's visible, not silently missing.
3. Show the exact proposed diff for both files.
4. Wait for explicit owner approval.
5. Apply the approved diff, then summarize what was written and what's still open.

## Why this matters

`agency.md` is the source of truth that `lead-intake` and `onboard-client` read
for "what we sell / who we serve." If a field is blank, downstream skills should
degrade gracefully (recommend against generic service lines, flag the gap) rather
than fabricate. Keep `agency.md` honest and current.
