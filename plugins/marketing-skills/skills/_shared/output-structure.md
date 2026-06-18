---
name: output-structure
description: >
  The canonical per-client output filing standard. Consult before saving ANY
  file to a client workspace so outputs land in a predictable place, never dumped
  randomly. Defines the folder tree, naming conventions, and the index. Use
  whenever a command or skill is about to write a deliverable.
---

# Output Structure — the filing standard

Every artifact has ONE canonical location. Commands and skills must file outputs
here; they never invent ad-hoc paths. Created per client on first use
(bootstrapped by `/onboard-client` or `/mk init`).

## Per-client tree

```
<client>/
├── context.md                  # client profile (incl. language)
├── brand-voice.md
├── 00_inbox/                   # scratch / unsorted; temporary only
├── reports/
│   └── <AAAA>/
│       ├── weekly/   <AAAA>-W<ss>_<client>_raport-saptamanal.html
│       ├── monthly/  <AAAA>-<LL>_<client>_raport-lunar.html
│       └── campaign/ <AAAA>-<LL>-<ZZ>_<campanie-slug>_recap.html
│   └── INDEX.html              # auto-maintained list of all reports
├── audits/        <AAAA>-<LL>-<ZZ>_<seo|cro>_<tinta-slug>.html
├── creative/      <AAAA>-<LL>-<ZZ>_<editie>_<platforma>/   # copy.md + assets/
├── campaigns/     <campanie-slug>/   # brief.md, calendar.md, copy/, assets/
├── research/
│   ├── competitors/  <competitor-slug>.md
│   └── customers/    <AAAA>-<LL>-<ZZ>_<subiect>.md
└── exports/        # final, client-approved deliverables only (local for now)
```

## Naming conventions (enforced)

- **Dates ISO 8601 in filenames**: `AAAA-LL-ZZ`, weeks `AAAA-Wss`, months
  `AAAA-LL` — guarantees chronological sort in any browser.
- **kebab-case slugs**; prefix shareable artifacts with the client name.
- Numeric prefix only where order matters (`00_inbox`).
- One artifact = one canonical path. `exports/` holds only approved items.
- File contents are Romanian (see `localization.md`); filenames may use RO words
  but stick to ASCII/kebab-case (no diacritics in filenames).

## Filing procedure (every output-producing skill/command follows this)

1. Resolve `<client>` = current workspace root.
2. Pick the canonical folder + filename pattern above for the artifact type.
3. Create the folder if missing.
4. Write the file there (HTML for reports/audits — see `reporting` skill).
5. Update the relevant `INDEX.html` (date, type, link).
6. Present the file path to the user.

## Index

`reports/INDEX.html` (built by the `reporting` skill) lists every report with
date, type, headline metric, and a link — so artifacts are findable by date or
by function without hunting. One index per client.
