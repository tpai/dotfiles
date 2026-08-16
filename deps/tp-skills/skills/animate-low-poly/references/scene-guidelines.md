# Scene Guidelines

## Visual language

- Build recognizable objects from a few polygons rather than detailed illustration.
- Use one neutral background, one primary color, one accent, and one status color when needed.
- Suggest depth with scale, overlap, and two or three flat shades. Avoid expensive 3D rendering unless the repository already uses it.
- Keep important labels stationary. Moving text is difficult to read.
- Use a consistent semantic mapping: the same concept always keeps the same shape and color.
- Give the focal object the strongest contrast; mute supporting objects.

## Animation grammar

Choose motion by meaning:

| Meaning | Motion |
| --- | --- |
| Data or control flow | Travel along a visible path |
| Creation | Scale or unfold from its source |
| Removal | Contract or fade toward its owner |
| Transformation | Morph, rotate, or recolor in place |
| Blocked or invalid | Stop at a boundary with a brief restrained pulse |
| Parallel work | Move simultaneously on separate aligned paths |
| Consolidation | Merge several objects into one stable object |

Keep entrance motion quick, explanatory motion readable, and pauses long enough to inspect. Use easing consistently. Avoid looping motion that competes with exploration.

## Quick-understanding contract

- Title: name the concept or behavior, not the technology showcase.
- Takeaway: one sentence, ideally under 18 words.
- Labels: use concrete nouns and verbs; avoid jargon when an everyday word works.
- Steps: use no more than three at once.
- Code: show only lines needed to explain the visible difference.

Test the copy by removing the animation. A reader should still understand the core claim. Then test the simulation without the copy. Its controls, direction, and contrast should still reveal that claim.

## Bilingual copy contract

Both locales are first-class. Neither reads as a translation of the other.

- Keep the string table flat and readable: one key per string, each key holding `en-US` and `zh-Hant`. Missing keys are bugs, not fallbacks.
- Length budget: takeaway under 18 words in English, under 30 characters in `zh-Hant`; labels one to five words in English, two to six characters in `zh-Hant`.
- Size every label box, button, and copy block for the longer rendered string across both locales so switching never reflows the scene, clips text, or introduces a scrollbar. Check at 375px width.
- Use a system font stack that covers both scripts, such as `system-ui, "PingFang TC", "Noto Sans TC", "Microsoft JhengHei", sans-serif`. Do not load a CJK webfont; it is too heavy for a standalone file.
- Give `zh-Hant` text a slightly looser line height than the Latin copy, around 1.7, and never fake emphasis with letter-spacing.
- Use full-width Chinese punctuation in `zh-Hant`: `，。、：「」`. Keep half-width punctuation around inline English or code tokens.
- Leave the language switch labels untranslated as `EN` and `繁中` so either audience can find them from either state.
- Keep numbers, units, and code snippets identical across locales; translate only their surrounding explanation.

## Interaction and recall contract

- Let the reader change a meaningful cause and observe its effect immediately.
- Prefer one or two direct controls over a dashboard of options.
- Keep controls beside the objects they affect and label them with concrete verbs.
- Preserve object identity, color, and spatial relationships across every state so the visual model becomes memorable.
- Reward prediction: make the next outcome easy to anticipate, then clearly confirm or correct it.
- Support rapid replay, reset, and comparison without accumulated timeline state.
- End each interaction in a readable state that reinforces the one idea worth remembering.

## Before/After interaction contract

Use a two-option segmented control or toggle with visible text labels `Before` and `After`. Do not rely on color alone.

- Expose state with a native control when practical, or apply correct button semantics, focus treatment, and `aria-pressed`/selection state.
- Keep both options available at all times.
- Use a single render-state function or reversible timeline so switching is deterministic.
- Cancel or finish the active transition before starting the next one.
- Keep shared elements fixed and transform only the changed relationships or outcomes.
- Add one brief state-specific takeaway near the control.

For structural changes, show stable nodes and altered connections. For behavioral changes, replay the same input through each state. For performance changes, compare honest relative duration or workload without fabricating measurements.

## Accessibility and resilience

- Meet readable contrast and never encode meaning through color alone.
- Support keyboard focus and activation for every control.
- Under `prefers-reduced-motion: reduce`, remove nonessential transitions and render the selected state immediately.
- Ensure the concept remains clear if Anime.js fails to load: render a meaningful static state first, then enhance it.
- Avoid rapid flashes, excessive parallax, and large continuous movement.
- Keep the primary concept and controls visible at narrow widths without horizontal scrolling, in both locales.
- Keep `document.documentElement.lang` accurate so screen readers and text rendering follow the active locale, and label the language switch in the language it selects.
- Fit the whole artifact in the visible viewport: the scene, controls, and copy must all be visible without scrolling, and no horizontal or vertical scrollbar may appear at common mobile or desktop sizes.
