---
description: Generate the weekly client performance report as a self-contained HTML file.
argument-hint: "[client name] [week]"
---

# /weekly-report

1. Read `context.md` (client, currency, targets, channels).
2. Pull last week's data: ads (Windsor.ai/Supermetrics), revenue/orders/products
   (Shopify), email (Klaviyo if active).
3. Reconcile blended ROAS via `ecommerce-analytics`.
4. Build the report with the `reporting` skill (weekly template): KPI cards with
   WoW deltas, trend chart, channel + product breakdown, and a
   "what changed / what we're doing" action list.
5. Write the `.html` to the client's `/reports` folder and present it. Chat gets
   only the headline metric + top action.
