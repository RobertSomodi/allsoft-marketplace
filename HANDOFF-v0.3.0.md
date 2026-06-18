# HANDOFF — marketing-skills v0.3.0 build

Drop this file (and `lead-intake-and-setup-plan.md`) in the repo root. Start the
new session mounted on the **allsoft-marketplace repo** (e.g. `~/allsoft-marketplace`).

---

## 0. Why a new session
Edits must happen in the repo folder. The previous session was mounted on a
client folder (`belloreshop`) and could not edit the plugin (installed copy is
read-only; repo lives outside that mount).

---

## 1. Current state (what already exists & is installed)

- **Marketplace repo:** `allsoft-marketplace/` — git repo, 1 commit, root
  `.claude-plugin/marketplace.json` + README.
- **Plugin:** `marketing-skills` **v0.2.0**, installed GLOBALLY and verified
  working (commands/skills invocable; smoke tests passed).
- **Repo layout (current):**
  ```
  allsoft-marketplace/
  ├── .claude-plugin/marketplace.json
  ├── README.md
  └── plugins/marketing-skills/
      ├── .claude-plugin/plugin.json        # version: 0.2.0
      ├── README.md
      ├── agents/marketing-router.md
      ├── commands/{mk,help,onboard-client,setup-automations,ad-check,
      │             weekly-report,creative-batch,audit,campaign}.md
      ├── automations/pool.md
      ├── scripts/bootstrap-client.sh
      └── skills/
          ├── _shared/{localization.md, output-structure.md}
          ├── reporting/SKILL.md + assets/{raport-saptamanal,raport-lunar,
          │            audit,INDEX}.html
          ├── ecommerce-analytics/SKILL.md
          ├── onboarding-interview/SKILL.md        # creates context.md+brand-voice.md
          └── <19 other marketing skills>/SKILL.md (+ references/, evals/)
  ```
- **Total:** 24 skill folders, 9 commands, 1 agent. 128 tracked files.

## 2. Locked decisions (do not relitigate)
- One plugin `marketing-skills` in marketplace `allsoft-marketplace`. Do NOT split.
- Single front-door command **`/mk`** routes via `marketing-router` agent.
- **Output language: Romanian by default** (`_shared/localization.md`; ro-RO, lei).
  Exception: internal sales/lead briefs may default to English.
- **Filing standard** `_shared/output-structure.md` — every artifact to a
  canonical path; ISO dates; `INDEX.html`. No ad-hoc paths.
- Automations are NOT bundled; `/setup-automations` installs them from
  `automations/pool.md` as scheduled tasks.
- `exports/` local only (no Drive/email sync).

## 3. v0.3.0 scope to BUILD (full spec in lead-intake-and-setup-plan.md)

Two-tier setup architecture + lead intake. New/changed units:

A. **Agency-root setup (NEW)**
   - command `commands/setup-agency.md` (run once in agency-root folder)
   - skill `skills/agency-interview/SKILL.md` (interview → composes agency files)
   - outputs: `agency.md`, `agency-brand-voice.md`, root `CLAUDE.md`+`AGENTS.md`,
     skeleton `prospects/` + `clients/` + `_shared/`.

B. **Lead intake (NEW)**
   - skill `skills/lead-scan/SKILL.md` (assessment methodology + brief structure;
     public-data-only, no fabricated metrics; reuses seo-audit, ai-seo[GEO], cro,
     competitor-profiling + web search/fetch)
   - command `commands/lead-intake.md` (input: URL OR pasted email via Gmail;
     creates `prospects/<slug>/`, runs lead-scan, files `brief.html`)
   - asset `skills/reporting/assets/lead-brief.html` (EN default, RO variant)

C. **Client setup (ENHANCE existing)**
   - `commands/onboard-client.md`: also write per-client `CLAUDE.md`+`AGENTS.md`;
     ingest `prospects/<slug>/brief.html` to pre-fill `context.md` when present.

D. **bootstrap** — teach it `prospects/` (root) vs the client tree (split the
   script or add a mode flag).

E. Bump `plugin.json` to **0.3.0**; update READMEs.

### Lead Assessment Brief sections (for lead-scan + lead-brief.html)
Header · Scorecard (R/A/G: Site/CRO, SEO, GEO/AI-search, Paid, Brand,
Competitive + opportunity vs effort) · Business snapshot · Stated vs observed
need · SEO read · GEO/AI read · CRO read · Competitive landscape · Prioritized
quick wins · Recommended engagement (Allsoft services + first 90 days) · Open
questions (feed onboarding) · Sources.

## 4. Execution order
1. Resolve open decisions (§6) with the user.
2. Build A (agency setup) → test interview composes agency.md + skeleton.
3. Build B (lead-scan + lead-intake + lead-brief.html).
4. Do C (onboard-client enhancements) + D (bootstrap).
5. Bump version, update READMEs, validate (§5).
6. Commit, push, reinstall, smoke test (§7).

## 5. Conventions / validation
- Skills: `SKILL.md` with YAML frontmatter `name:` + `description:` (first line `---`).
- Commands: frontmatter `description:` (+ optional `argument-hint:`).
- Agents: frontmatter `name:`, `description:`, `tools:`.
- Every output-producing unit must reference `_shared/localization.md` and
  `_shared/output-structure.md`.
- Validate: all `*.md` start with `---`; `plugin.json`/`marketplace.json` parse;
  any `.sh` is `chmod +x` and idempotent. (In the previous session the mount
  forced read-only perm quirks — irrelevant in the repo folder, but still run
  a frontmatter + JSON check before committing.)

## 6. Open decisions to confirm with user
- `agency.md` fields: retainer tiers? standard target ROAS/CPA by niche? team?
- Should `/setup-agency` also add/register the marketplace+plugins, or files only?
- Prospect slug convention: company name vs domain.
- Confirm internal lead brief = English, client version = Romanian.

## 7. Delivery / reinstall workflow
```
# in repo
git add -A && git commit -m "v0.3.0: agency setup + lead intake"
git push
# in Claude app
/plugin marketplace update allsoft-marketplace   # or reinstall marketing-skills
```
Smoke test in a scratch agency-root folder: `/setup-agency` → `/lead-intake <url>`
→ verify `prospects/<slug>/brief.html`. Then a client folder: `/onboard-client`
→ confirm CLAUDE.md/AGENTS.md created and brief ingested.

## 8. Notes from this session
- `belloreshop` client folder was wiped and rebuilt via onboarding as a smoke
  test; it now holds context.md, brand-voice.md, and a sample weekly report.
- 4 demo scheduled tasks exist (belloreshop-ad-check, -budget-pacing,
  -weekly-report, -creative-fatigue). Remove if not wanted.
- Installed plugin id this session: plugin_012p2A3KjB7WTFPDkcEzjeXX (will differ
  after reinstall).
