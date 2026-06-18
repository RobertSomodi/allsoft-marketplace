---
name: localization
description: >
  Output-language and locale rules for this toolkit. Consult before writing ANY
  client-facing output (reports, copy, emails, audits, ad creative, messages).
  Default output language is Romanian. Use whenever producing deliverables or
  when unsure what language/format an output should be in.
---

# Localization — Romanian-first

## The rule

**All client-facing output is in Romanian (ro-RO) by default**, regardless of
the language the operator types in. Produce English only when the user
*explicitly* asks for English output. Internal reasoning/chat with the operator
may be in either language, but saved files and client deliverables are Romanian.

Resolution order: explicit per-request instruction → Romanian (default).

## Locale formatting (ro-RO)

- Currency: **lei (RON)**, symbol after the amount: `1.250,50 lei`.
- Decimal separator `,` (comma); thousands separator `.` (dot): `12.500`.
- Dates: `zz.ll.aaaa` in prose (`17.06.2026`); ISO `AAAA-LL-ZZ` only in filenames.
- Percentages: `12,5%`. Week: `săptămâna 25` / files `2026-W25`.

## Report label glossary (use these exact terms)

| EN | RO (use this) |
|----|----------------|
| Spend / Ad spend | Cheltuieli publicitare |
| Revenue | Venituri |
| Orders | Comenzi |
| Conversion rate | Rată de conversie |
| Average order value (AOV) | Valoare medie comandă |
| Customers / New customers | Clienți / Clienți noi |
| Best-sellers | Cele mai vândute |
| Dead stock | Stoc nevândut |
| Profit / Contribution margin | Profit / Marjă de contribuție |
| Week / Month | Săptămână / Lună |
| Trend | Tendință |
| Summary | Rezumat |
| What changed | Ce s-a schimbat |
| What we're doing | Ce facem în continuare |
| Recommendation | Recomandare |
| Target | Țintă |
| Generated on | Generat la |
| Data sources | Surse de date |

Keep **ROAS**, **CPA**, **CTR**, **MER** as-is (industry-standard acronyms).

## Compliance phrasing (RO)

Mandatory product-safety line for bullet products, in Romanian, e.g.:
"Produs decorativ. Glonțul este real, dar inert — nu conține pulbere. Nu este
o armă și nu are funcție de apărare." Never imply weapon/defense function.

## Notes

- `brand-voice.md` (words to use / avoid, tone) applies on top of this.
- HTML report templates ship with RO labels as default; English is a fallback
  variable only.
