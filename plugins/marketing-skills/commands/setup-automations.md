---
description: Turn on recurring tasks for a client from a curated pool — the user just picks which ones and when.
argument-hint: "[client name]"
---

# /setup-automations

Most operators don't know how to author a scheduled task. This command makes it
a pick-list: present the pool, let the user choose, then create the scheduled
tasks for them.

## Steps

1. Read `automations/pool.md` (the support pool) and the client's `context.md`.
2. Present the available automations as a multi-select question — show each
   entry's **name** and **what it does** only (not the prompt or cron). Note
   which require connectors that aren't attached yet.
3. For each chosen automation, ask for the **time** (offer the `default_cadence`
   as the recommended default so they can just accept it).
4. **Create the scheduled task** for each selection using
   `create_scheduled_task`, substituting `{client}` and the chosen time into the
   pool entry's `prompt`, and converting the time to the right cron expression.
5. Confirm what was scheduled (name + time) and how to change or pause it later
   (`/setup-automations` again, or list_scheduled_tasks).

## Rules
- Never schedule something whose required connector is missing — flag it and
  offer to connect first.
- Skip duplicates: check existing scheduled tasks before creating.
- Keep prompts client-scoped so multiple clients don't collide.
