# Collatz/Syracuse exact-head status and open obligations — 10 November 2026

Author and research lead: Ta-Yoshua Lubuimi.

## Collatz/Syracuse proof-status ledger — 10 November 2026

This is an exact-head status record, not a claim that the global Collatz conjecture is proved.

### Verified formal milestones retained

- PR [#53](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/53), head `7d17d7111946b328421f9046f95b03c939dfddb1`, workflow [42805867475](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42805867475): all three jobs passed. The parity/exact-exponent declarations have named axiom outputs; no `sorryAx` guard failure.
- PR [#55](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/55), head `d5c32aba3e9e767cb1051d7aac6b54ff1196ea2d`, workflow [42807396471](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42807396471): all three jobs passed. The exact affine transition is connected to the deterministic Syracuse one-step map.
- PR [#59](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/59), head `5f6e46de8bed7061f8336089857143c54e997af5`, workflow [42809750956](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42809750956): all three jobs passed. The shifted-tail iterate identity and suffix return from least odd nonterminating-start minimality are formally established under the stated hypotheses.
- PR [#62](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/62), head `b0c2d514d903dd17e34247da743bbb666d1e8c1c`, workflow [42811286670](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42811286670): all three jobs passed. The minimality reduction is connected to finite-cap-tree membership and the terminal-residue unit statement.

These results remain valid at their exact source heads. Later candidate failures do not retroactively invalidate them.

### Current terminal-residue bridge attempt

PR [#65](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/65) adds a bridge packaging the cap-tree prefix, unit condition modulo (3^j), and canonical terminal-residue representative. PR [#66](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/66) attempted to normalize (n(0)=n_0) before applying the depth bound.

Exact PR #66 head `1ad0cf18bb8d2fd8a76376cb3768fd3b60bc6a7c`, workflow [42812961296](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42812961296): Lean 4.35.0 paranoid log failed at `SyracuseOffsetIdentity.lean:3504`. The reverse rewrite `rw [← hn0eq]` searched for (n_0) in a goal already containing (n(0)); the target remained `n 0 + 1 < 2 ^ j`. The candidate declaration consequently showed `sorryAx` in the failed build. This is a direction-of-rewrite error, not a failure of the already verified PR #59/#62 results.

PR [#68](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/68), head `214561c9e680f503ec000e74003fe61e8854cc55`, changes the rewrite to `rw [hn0eq]`, the direction matching the goal. At this ledger cut-off, no workflow result was returned for this exact head. Status: **PENDING / NOT VERIFIED**.

### Remaining global mathematical obligation

The verified chain now yields a finite-depth necessary path certificate under a hypothetical least odd nonterminating start. It still does not prove that the finite cap tree has no infinite branch. The (k=2) terminal-residue energy result remains an average estimate; it is not a pathwise inequality. The central global obligation remains a separate infinite-branch exclusion or well-founded descent argument.

Do not infer a global Collatz proof from finite-depth membership, average energy, or a successful local CI run.

### Attribution and licence boundary

The original Collatz/Syracuse research, scripts, manuscripts, and Lean formalization authored by Ta-Yoshua Lubuimi remain attributed to him. AI tools are assistants only. The existing proprietary-rights and commercial-use notices remain unchanged; this entry grants no new licence or reuse permission. Lean, Mathlib, upstream results, and third-party material retain their own licences.
