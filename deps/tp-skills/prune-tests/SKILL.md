---
name: prune-tests
description: Prune a test suite while preserving confidence in live behavior. Use when removing redundant, duplicate, obsolete, dead-code-only, or low-value tests; simplifying brittle test suites; reviewing whether tests still align with production code; or reducing test maintenance and runtime without weakening meaningful coverage.
---

# Prune Tests

Reduce test-suite surface area according to two principles: Redundancy Minimization and Dead Code Alignment. Treat protected behavior, not test count or line coverage, as the unit of value.

## Establish the safety boundary

1. Read repository instructions and identify the relevant test commands, framework conventions, and changed production code.
2. Run the narrowest relevant tests before editing. Record pre-existing failures rather than attributing them to pruning.
3. Map each candidate test to the live behavior or contract it protects. Include meaningful dimensions such as input class, state transition, boundary, failure mode, integration seam, and regression history.
4. If the request is review-only, report candidates and evidence without editing files.

Complete this phase only when every proposed deletion has an identified overlap, dead-code dependency, or absence of a meaningful live contract.

## Apply Redundancy Minimization

Keep the smallest set of tests that independently protects the live behavioral obligations.

- Remove a test when another test exercises the same behavior through the same meaningful dimensions with at least equally strong assertions.
- Prefer the test with clearer intent, less setup, more stable assertions, and the most appropriate layer.
- Consolidate repeated cases into a table or parameterized test when each case remains legible and failures still identify the broken behavior.
- Preserve tests that look similar but cover distinct boundaries, branches, failure modes, permissions, state transitions, integrations, or prior regressions.
- Preserve intentional overlap across layers when each layer localizes a different class of failure; do not treat a unit test and an end-to-end test as duplicates solely because they share a happy path.
- Strengthen a retained test before deleting a weaker duplicate if the retained assertions do not yet subsume its protection.

Use this deletion test: if the candidate alone failed before a plausible regression while all retained tests passed, identify the unique signal. Keep it when that signal protects a supported behavior; otherwise remove it.

## Apply Dead Code Alignment

Make tests describe the supported system rather than its history.

- Remove tests whose sole subject is deleted, unreachable, disabled, or explicitly unsupported production behavior.
- Rewrite tests that still encode a live contract through obsolete helpers, flags, fixtures, endpoints, schemas, or implementation details.
- Remove fixtures, mocks, factories, snapshots, and test helpers that become unused after pruning.
- Distinguish dead code from dormant supported behavior. Keep coverage for feature flags, compatibility paths, error handling, migrations, or platform branches that remain part of the contract even when they are rarely executed.
- Treat commented-out code, skipped tests, and stale snapshots as investigation signals, not proof. Confirm status from production references, configuration, history, or the originating change.
- When production code appears dead but remains present, report it separately unless the user also authorized production cleanup.

Complete this phase only when each removed test dependency is either still used by retained tests or removed with it.

## Edit and verify

1. Prune in coherent, reviewable batches. Keep production behavior unchanged unless explicitly requested otherwise.
2. Search for dangling references and newly unused test support code after each batch.
3. Run the narrowest affected tests, then the repository's broader required checks in proportion to the change.
4. Inspect the final diff for accidental assertion weakening, lost edge cases, broad snapshot updates, and unrelated edits.
5. Summarize what was removed or consolidated, why confidence is preserved, and which checks passed. Call out uncertain candidates that were deliberately retained.

Do not use passing tests alone as evidence that deletion was safe: a deleted test cannot fail. Base the decision on the behavior map and retained assertions.
