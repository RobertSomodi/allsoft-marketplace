---
description: Pull yesterday's ad spend + store revenue, reconcile ROAS, and flag CPA/ROAS/pace anomalies.
argument-hint: "[client name]"
---

# /ad-check

Fast health check. Also the body of the `daily-ad-check` automation.

1. Read `context.md` for targets, channels, currency, budget cap.
2. Pull yesterday's spend (Meta/Google/TikTok) via Windsor.ai/Supermetrics and
   revenue via Shopify.
3. Reconcile blended ROAS with the `ecommerce-analytics` skill.
4. Compare CPA, ROAS, and spend pace to targets. Output a short status: green if
   all in range; otherwise the breached metric, a one-line cause hypothesis, and
   a recommended action.
5. Keep it to chat (this is a quick check, not a client report).
