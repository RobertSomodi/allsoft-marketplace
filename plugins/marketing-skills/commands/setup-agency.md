---
description: One-time agency-root setup — interview the agency, compose its profile files, and scaffold the prospects/clients workspace.
argument-hint: "[agency name]"
---

# /setup-agency

Run **once**, in the folder you'll mount as your **agency root** (the place where
pre-sale work lives and where new client folders get created). This command
**orchestrates**; the knowledge lives in the `agency-interview` skill. Keep that
separation — do not duplicate interview questions here.

This is a **files-only** setup. It does NOT register a marketplace or install
plugins — that stays a separate manual step.

## Steps

1. **Confirm location.** Verify the current folder is intended as the agency root
   (not a single client folder). If it already contains `agency.md`, treat this
   as a re-run: offer to update rather than overwrite.
2. **Run the interview.** Invoke the `agency-interview` skill to fill `agency.md`
   and `agency-brand-voice.md` conversationally. (Skill = how to interview; this
   command = when, and what happens next.) Every field is skip-friendly — never
   invent agency facts.
3. **Scaffold the workspace** by running
   `scripts/bootstrap-client.sh --agency <agency-root-folder>` to create the
   agency skeleton: `prospects/`, `clients/`, `_shared/`. Idempotent.
4. **Write the operating files** at the agency root:
   - `CLAUDE.md` / `AGENTS.md` — how Claude operates in this workspace: routing
     defaults (single front door `/mk`), output language **Romanian** by default
     (`_shared/localization.md`), and the filing standard pointer
     (`_shared/output-structure.md`). Note the two-tier model: mount the root for
     prospecting/admin; mount a single `clients/<slug>/` for deep work.
   - `agency.md`, `agency-brand-voice.md` — from the interview (step 2).
5. **Confirm** what was created and what's still open (any skipped `agency.md`
   fields), and point the user at the next step: `/lead-intake <url|email>` to
   assess a prospect, or `/onboard-client` to convert one.

## Notes
- Files-only: no marketplace/plugin registration here.
- `agency.md` is read by `lead-intake` and `onboard-client` for "what we sell /
  who we serve", so briefs and recommendations are framed in the agency's actual
  service lines. Leave unknown fields blank rather than guessing.
- One agency root per workspace. Client folders are created under `clients/`.
