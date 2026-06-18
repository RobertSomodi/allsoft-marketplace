# Automation Support Pool

The catalog `/setup-automations` reads from. Each entry is a ready-to-install
scheduled task. The command shows the user the **name + what it does**, asks
which they want and at what time, then creates the scheduled task using the
`prompt` below (substituting the client name and chosen time). Users never write
cron or prompts themselves.

Fields: `id` · `name` · `what` · `default_cadence` · `needs` (connectors) ·
`prompt` (the scheduled-task instruction).

---

## daily-ad-check
- **name:** Morning ad-performance check
- **what:** Flags CPA spikes / ROAS drops vs target from yesterday; messages only if action is needed.
- **default_cadence:** Weekdays 08:00
- **needs:** Windsor.ai (or Supermetrics), Shopify
- **prompt:** "For {client}, pull yesterday's ad spend (Meta/Google/TikTok) and Shopify revenue. Reconcile blended ROAS using the ecommerce-analytics skill. Compare CPA and ROAS to targets in context.md. If any campaign breaches target or spend pace looks off, send a short alert with the cause hypothesis and a recommended action. If everything is within range, stay silent."

## budget-pacing
- **name:** Budget pacing guard
- **what:** Tracks month-to-date spend vs the monthly cap; warns before overspend.
- **default_cadence:** Daily 09:00
- **needs:** Windsor.ai (or Supermetrics)
- **prompt:** "For {client}, sum month-to-date ad spend across channels and compare to the monthly budget cap in context.md. If projected end-of-month spend would exceed the cap (or pacing is >10% off an even daily run rate), alert me with the numbers and a suggested adjustment."

## weekly-report
- **name:** Weekly performance digest
- **what:** Monday HTML report — ROAS/CPA by channel and product, top/bottom creatives, 2-3 actions.
- **default_cadence:** Monday 08:00
- **needs:** Windsor.ai (or Supermetrics), Shopify; Klaviyo if email active
- **prompt:** "For {client}, run /weekly-report for the prior week and save the HTML to the /reports folder, then message me the headline metric and top recommended action with a link to the file."

## creative-fatigue
- **name:** Creative fatigue scan
- **what:** Detects declining ad creatives and proposes a refresh batch.
- **default_cadence:** Thursday 10:00
- **needs:** Windsor.ai (or Supermetrics)
- **prompt:** "For {client}, identify ad creatives whose CTR or ROAS has declined materially over the last 7-14 days. List the fatiguing creatives and offer to run /creative-batch to generate replacements."

## monthly-report
- **name:** Monthly client report
- **what:** Month-end HTML report with MoM trends and LTV/cohort view.
- **default_cadence:** 1st of month 08:00
- **needs:** Windsor.ai (or Supermetrics), Shopify
- **prompt:** "For {client}, produce the monthly HTML report (reporting skill) for last month including blended ROAS, contribution margin, best-sellers, dead stock, and LTV:CAC. Save to /reports and message me the summary."
