---
description: Onboard a new client end-to-end — scaffold the workspace, run the interview, suggest connectors, and offer automations.
argument-hint: "[client name]"
---

# /onboard-client

Run once per new client, inside (or to create) that client's workspace folder.
This command **orchestrates**; the knowledge lives in the `onboarding-interview`
skill. Keep that separation — do not duplicate interview questions here.

## Steps

1. **Scaffold** the workspace: create `context.md` and `brand-voice.md` if
   missing, then run `scripts/bootstrap-client.sh <client-folder>` to create the
   full canonical output tree (per `output-structure.md`). Set the output
   language in `context.md` (default **Romanian** unless told otherwise). Also
   write a per-client `CLAUDE.md` + `AGENTS.md` if missing — base operating
   instructions for that folder: single front door `/mk`, output language
   Romanian (`_shared/localization.md`), filing standard pointer
   (`_shared/output-structure.md`), and "one client per workspace". This makes
   every client folder self-describing.
2. **Ingest the prospect brief if present.** If this client converted from a
   prospect, look for `../prospects/<slug>/brief.html` (or ask the owner for the
   slug). When found, read it and **pre-fill** `context.md` from the brief's
   Business snapshot, observed need, and recommended engagement — so onboarding
   starts warm, not cold. Mark pre-filled values as "draft, confirm" and route
   the brief's Open Questions into the interview (step 3). If no brief exists,
   start fresh.
3. **Run the interview.** Invoke the `onboarding-interview` skill to fill
   `context.md` and `brand-voice.md` conversationally, confirming any pre-filled
   draft values. (Skill = how to interview; this command = when, and what happens
   next.)
4. **Suggest connectors** based on the channels captured: Shopify for any store,
   Windsor.ai/Supermetrics for paid, Klaviyo for email/SMS, Canva for creative.
   Use the connector registry; show Connect buttons. Don't block on this.
5. **Offer automations.** Hand off to `/setup-automations` so the client picks
   which recurring tasks to turn on and at what time. Do this last, after
   context exists, so the automations inherit real targets.
6. **Confirm** what's set up and what's still open (e.g. missing target ROAS).

## Notes
- One client per workspace folder.
- Don't invent answers in context.md — leave fields blank and list them under
  Open Questions if unknown.
- Created under the agency root as `clients/<slug>/`. The prospect brief (if any)
  lives at the root under `prospects/<slug>/` — read it, don't move it.
- `CLAUDE.md`/`AGENTS.md` are operating instructions, not client facts; keep
  client profile in `context.md`.
