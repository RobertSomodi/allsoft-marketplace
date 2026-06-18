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
   language in `context.md` (default **Romanian** unless told otherwise).
2. **Run the interview.** Invoke the `onboarding-interview` skill to fill
   `context.md` and `brand-voice.md` conversationally. (Skill = how to interview;
   this command = when, and what happens next.)
3. **Suggest connectors** based on the channels captured: Shopify for any store,
   Windsor.ai/Supermetrics for paid, Klaviyo for email/SMS, Canva for creative.
   Use the connector registry; show Connect buttons. Don't block on this.
4. **Offer automations.** Hand off to `/setup-automations` so the client picks
   which recurring tasks to turn on and at what time. Do this last, after
   context exists, so the automations inherit real targets.
5. **Confirm** what's set up and what's still open (e.g. missing target ROAS).

## Notes
- One client per workspace folder.
- Don't invent answers in context.md — leave fields blank and list them under
  Open Questions if unknown.
