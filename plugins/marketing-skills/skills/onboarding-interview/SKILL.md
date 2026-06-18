---
name: onboarding-interview
description: Quick chat-style interview to fill a new client's context.md and brand-voice.md. Run once, inside the client workspace, right after the client folder is created.
---

# Client Onboarding Interview

Use this once per client, **inside that client's workspace only** (a folder with
`AGENTS.md`, `context.md`, and `brand-voice.md`). It turns a short chat interview
into a proposed `context.md` + `brand-voice.md` diff for owner approval.

## Guardrails

- Verify the current workspace is a client root. If not, refuse and ask the owner
  to open `clients/<client-slug>` as the project.
- Never read sibling client folders under `../`. Never import another client's facts.
- Nothing becomes durable until the owner approves the diff (see step 5).
- Skip questions already answered by the existing `context.md` (e.g. name, website,
  platform passed in by `new-client`). Do not re-ask.

## Interview flow

Ask **one question at a time**. Keep it conversational; accept "skip" / "TBD" for
any field and leave it blank. Offer multiple-choice options where natural.

Cover, in order:

1. Industry / what they sell (and how it's made or sourced, if distinctive).
2. Market / location and primary language.
3. E-commerce platform (Shopify / Woo / Presta / Magento / other) — drives data tooling.
4. Services Allsoft will provide.
5. Primary business goal and primary marketing goal.
6. Main audience, secondary audience, buying triggers, common objections.
7. Main offers, lead magnets, current promotions.
8. Active channels (site, SEO, paid ads, social, email).
9. Constraints: budget, legal/compliance, approval process, brand restrictions.
10. Main contact (name + role).
11. Brand voice: tone, words to use, words to avoid, 1-2 example lines they like.

Before fetching anything live, you MAY pull public/site or platform data (e.g. the
official Shopify MCP for a Shopify store) to pre-fill — but mark pre-filled values
as "draft, confirm" in the proposed diff.

## After the interview

1. Map answers onto the `context.md` sections (Snapshot, Business Model, Goals,
   Audience, Offers, Channels, Constraints) and voice answers onto `brand-voice.md`.
2. Put only confirmed durable facts under "Known Facts". Park anything uncertain
   under "Open Questions".
3. Show the exact proposed diff for both files.
4. Wait for explicit owner approval.
5. Apply the approved diff, then summarize the sections changed.

Defer to `update-client-context` rules for all subsequent edits.
