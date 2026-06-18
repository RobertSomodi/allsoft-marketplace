---
name: ecommerce-analytics
description: >
  Analyze the economics of an e-commerce store by reconciling ad-platform data
  against the store's own revenue. Use for true ROAS / blended ROAS, MER,
  contribution margin, customer LTV and cohorts, repeat-purchase rate, AOV,
  best-seller and dead-stock analysis, and which products deserve ad budget.
  Use whenever someone asks "is this actually profitable?", "what's our real
  ROAS?", "which products should we push?", or "why is platform ROAS higher than
  what we banked?". Pairs with the `reporting` skill (which presents the numbers)
  and the `ads` skill (which acts on them).
---

# E-commerce Analytics

Platform-reported ROAS lies — it claims credit across overlapping attribution
windows and ignores margin, returns, and shipping. Your job is the honest
number, tied to money that actually hit the store.

## Core metrics

- **Blended ROAS / MER** = total store revenue ÷ total ad spend (all channels).
  The number that matters; immune to attribution double-counting.
- **Platform ROAS** = per-channel reported. Use only for *relative* channel
  comparison, never as the truth.
- **Contribution margin per order** = AOV − COGS − shipping − payment fees −
  per-order ad cost. Profitability lives here, not in ROAS.
- **CAC** = spend ÷ new customers (Shopify first-time buyers, not platform
  conversions).
- **LTV** = avg contribution margin × repeat purchases over horizon; segment by
  acquisition cohort. Compare LTV:CAC.
- **AOV, repeat-purchase rate, time-to-second-order.**

## Product analysis

- **Best-sellers**: units + revenue + margin. High-margin movers get budget.
- **Dead stock**: low velocity / high return rate — pull from ads, consider
  bundling or markdown.
- **Margin map**: rank SKUs by contribution margin, not gross revenue; a
  discounted hero can be unprofitable after ad cost.

## Workflow

1. Pull spend by channel from Windsor.ai / Supermetrics.
2. Pull orders, revenue, products, customers from Shopify.
3. Reconcile: total store revenue in range vs. summed platform-attributed
   revenue. Report the gap and use blended ROAS as the headline.
4. Estimate margin: if COGS isn't available, ask once or use a stated assumed
   margin and label it clearly as an assumption.
5. Hand the computed figures to `reporting` for the HTML surface; surface 2–3
   budget-reallocation recommendations grounded in margin, not gross ROAS.

## Cautions

- State every assumption (margin %, attribution window, date range).
- New vs. returning customer revenue must be split before quoting CAC or LTV.
- Currency/locale per `context.md`.
