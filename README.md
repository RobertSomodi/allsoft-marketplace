# allsoft-marketplace

Claude Code / Cowork **marketplace** for Allsoft client marketing.

Contains one plugin: **marketing-skills** (v0.3.0) — full marketing toolkit
(25 skills) + a router agent, slash commands (single front door `/mk`),
automation templates, Romanian-first output, and a strict filing standard. v0.3.0
adds a two-tier workspace setup (agency root + clients) and lead intake
(`/setup-agency`, `/lead-intake`).

## Install
```
/plugin marketplace add <git-url-of-this-repo>
/plugin install marketing-skills@allsoft-marketplace
```
Choose user/global scope so it loads in every client folder.

See `plugins/marketing-skills/README.md` for the full layout.
