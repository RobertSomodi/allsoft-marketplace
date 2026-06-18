---
description: Generate a batch of ad/social creative variations from a brief or from fatiguing creatives.
argument-hint: "[product/edition] [count]"
---

# /creative-batch

1. Read `brand-voice.md` (tone, words to use/avoid, compliance lines) and
   `context.md`.
2. If pointed at fatiguing creatives, pull their angles first so replacements
   differ; otherwise take the brief.
3. Use the `ad-creative` skill to produce the requested count of variations
   (headlines / primary text / hooks) per platform, honoring the mandatory
   product-safety disclaimer and avoiding restricted words.
4. Optionally hand visuals to `canva-creator`.
5. Save copy to `/outputs` and present.
