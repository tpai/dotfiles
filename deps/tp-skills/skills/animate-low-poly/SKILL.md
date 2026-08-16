---
name: animate-low-poly
description: Create simple, interactive low-poly simulations with Anime.js that help readers quickly grasp and remember an idea, process, system, or code change. Use when turning an abstract concept or source-code change into a hands-on visual explanation, explorable simulation, animated diagram, or before/after comparison. For code changes, always provide an obvious Before/After switch so users can compare behavior or structure. Every artifact ships bilingual copy (en-US and zh-Hant) behind an in-page language switch.
---

# Animate Low Poly

Build a polished, self-contained interactive simulation that makes one concept quick to grasp and easy to remember. Let readers learn by manipulating the scene and seeing immediate cause and effect. Use low-poly geometry, restrained motion, and very short explanations. Complete every request by writing a standalone HTML artifact to the current working directory.

## Find the concept and memory hook

1. Inspect any supplied code, diff, screenshots, or repository context before designing the scene.
2. State the one idea the reader should remember in a plain sentence.
3. Select at most three observable cause-and-effect relationships that reveal the idea.
4. Map each important concept to a stable visual object, color, and motion. Keep those mappings consistent.
5. Choose the smallest interaction that lets the reader predict, manipulate, and replay the important behavior.
6. For code changes, identify exactly what differs in behavior, data flow, structure, or outcome. Do not animate incidental syntax.

If details are missing, make a modest assumption and label it in the UI or handoff instead of inventing technical facts.

## Build the artifact

Read [references/scene-guidelines.md](references/scene-guidelines.md) before implementation. Follow its visual language, interaction contract, and accessibility checks.

If the `/frontend-design` skill is available in this environment (loaded alongside this one), consult it before designing and let its direction set the palette, typography, layout, and signature element. When it is not available, follow the scene guidelines' visual language as the default.

Create one standalone `.html` file directly in the current working directory. Choose a short, descriptive kebab-case filename based on the concept. Keep all authored HTML, CSS, SVG, and JavaScript in that file; do not create a project scaffold, companion assets, or require a build step. Load Anime.js from a browser-ready CDN script when it is not practical to embed the library. Avoid overwriting an existing file unless the user explicitly requested that filename or approved replacement.

Implement these essentials:

- Draw the scene with lightweight polygonal SVG or CSS shapes. Use facets, flat shading, and limited colors; avoid photorealism and decorative clutter.
- Make motion explain causality, sequence, state, or contrast. Every animated element must carry meaning.
- Make interaction central rather than ornamental. Give readers one or two obvious controls that change a meaningful input, state, or path and produce immediate visual feedback.
- Make exploration repeatable and safe: readers should be able to try alternatives, reset, and quickly connect each action to its outcome.
- Keep on-screen copy plain, precise, and brief: one short title, one-sentence takeaway, and labels of roughly one to five words. Write it in both supported languages.
- Provide replay or restart when the animation is not continuously understandable.
- Keep controls keyboard-accessible and visible at common mobile and desktop widths.
- Respect `prefers-reduced-motion`; show the meaningful end state without relying on movement.
- Fit the entire scene, controls, and copy inside the visible viewport at common mobile and desktop sizes; nothing may require scrolling — no horizontal or vertical scrollbars may appear.

## Ship English and Traditional Chinese

Every artifact carries its complete on-screen copy in `en-US` and `zh-Hant`, switchable in the page. Read the bilingual copy contract in [references/scene-guidelines.md](references/scene-guidelines.md) before writing any string.

- Keep every user-facing string in one table keyed by locale: title, takeaway, control labels, scene labels, state-specific copy, code annotations, and any assumption note. Leave no hardcoded user-facing text in the markup.
- Add a two-option language switch labeled `EN` and `繁中`. Place it near the title, keep both options always available, and give it the same keyboard access, focus treatment, and selection semantics required of the Before/After switch.
- Start in `en-US`, unless the user asks otherwise or the browser reports a Traditional Chinese locale (`zh-Hant`, `zh-TW`, `zh-HK`, `zh-MO`).
- Set `document.documentElement.lang` to the active locale on load and on every switch.
- Re-render text from the same render-state function that draws the scene. Switching language must not restart the animation, reset the Before/After state, or leave stale text behind.
- Write the `zh-Hant` copy as natural Traditional Chinese in Taiwan usage, not a word-for-word rendering of the English. Carry the same claim, not the same sentence shape. Keep technical terms in English when that is how readers say them.

## Require comparison for code changes

When the input includes a code change, diff, refactor, bug fix, migration, or old/new behavior, always add a clearly labeled `Before` / `After` switch.

- Default to `After` unless the story depends on revealing the change.
- Preserve camera, scale, layout, labels, and object identity across both states wherever possible.
- Change only visuals that represent the code change.
- Update the short takeaway with the selected state.
- Animate the transition when useful, but make both states understandable when paused.
- Allow repeated switching without stale inline styles, duplicated objects, or timeline drift.
- Do not substitute a one-way autoplay sequence for the switch.

Show code snippets only when they clarify the concept. Keep them to the smallest changed lines and visually connect each snippet to its scene effect.

## Verify and hand off

1. Confirm the deliverable is a single HTML file in the current working directory and opens directly in a browser without a build step.
2. Open the artifact when browser tooling is available. Check initial render, replay, responsive layout, reduced motion, and keyboard controls.
3. For code changes, switch Before/After repeatedly and confirm that each view is accurate, distinct, and stable.
4. Switch languages in both directions, in every scene state, and confirm that no English text remains in the `zh-Hant` view, no text clips or wraps out of the viewport, and the scene state survives the switch.
5. Confirm a reader can discover the main cause and effect through interaction, then state the core idea from the resulting visual state, in either language.
6. Remove any visual, label, motion, or control that does not improve understanding or recall.
7. Report the saved file with a clickable absolute path, then summarize what it shows and how to use its controls.

Do not over-explain implementation details unless the user asks. Let the animation carry the explanation.
