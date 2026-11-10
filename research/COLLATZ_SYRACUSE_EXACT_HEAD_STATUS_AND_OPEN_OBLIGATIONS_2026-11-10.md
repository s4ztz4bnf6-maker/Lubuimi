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


## Exact-head update — terminal-residue bridge and CI activation (10 November 2026, 13:43 CET)

### Verified finite-path milestone retained

PR #62 remains the verified finite-cap-tree bridge at its exact source head `b0c2d514d903dd17e34247da743bbb666d1e8c1c`, workflow [42811286670](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42811286670). All three jobs passed: compile-drafts, Lean 4.35.0 paranoid, and Lean 4.34.1 kernel-check. The declarations `affine_minimal_counterexample_prefix_mem_finiteCapTree` and `affine_minimal_counterexample_prefix_cap_tree_and_terminal_unit` report `[propext, Classical.choice, Quot.sound]` and no `sorryAx`. This proves the stated necessary finite-depth path certificate under a hypothetical least odd nonterminating start; it does not exclude an infinite branch or prove global Collatz termination.

### New terminal bridge candidates

- PR #65 exact head `78222bfae2e28a767d3482531b495ef48d85a342`, workflow 42812080857, failed because the depth hypothesis was expressed using `n₀` while the called terminal-residue lemma required `n 0`.
- PR #66 derives `n 0 = n₀` from the existing affine offset identity at index zero.
- PR #68 / v3 exact head `214561c9e680f503ec000e74003fe61e8854cc55` changes the depth rewrite direction to `rw [hn0eq]`.
- PR #70 / v4 exact head `1870845e3afe3fce2f0be4d55264e085c5eb6146` uses `simpa [hn0eq] using hdepth` as an alternative transport.
- At this checkpoint, neither #68 nor #70 has an associated workflow run. Do not claim either repair is verified.

### CI workflow dependency

PR #71 adds `.github/workflows/lean-collatz-audit.yml` to the default branch as the required infrastructure for pull-request-triggered exact-head CI. The PR is still **OPEN / DRAFT / NOT MERGED** at this checkpoint. The file is not yet present on `main`; therefore the #68/#70 exact-head jobs have not been activated. After the workflow is merged, synchronize or reopen the proof PRs and inspect all three jobs, their named axiom outputs, and no-`sorryAx` guards.

### Exact arithmetic research boundary

The valuation-word program records the realized-block identity
`2^A_N n_N = 3^N n_0 + C_N`, with `C_{j+1}=3C_j+2^{A_j}`, and the exact margin identity
`M_N = 2^{A_N}(n_0-n_N)`.
For a realized block, `M_N>0` is equivalent to descent. Neither identity supplies a uniform upper bound on `C_N` or `M_N>0` for every starting value. The finite congruence-cylinder representation is useful for exact enumeration, but the universal infinite-branch exclusion remains open.

Existing verified PR #59/#62 results remain valid at their exact heads and are not withdrawn by the later PR #65 failure.


## Exact-head update — signed-offset margin and terminal bridge (10 November 2026, 13:55 CET)

### Verified margin result retained

The signed-offset margin result remains verified at exact commit `ca48ec7fdad5e8d6f8aeb82fed8586a1b57c12bc`, workflow [42728049650](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42728049650). The checked declarations are:

- `signedOffsetMargin_nonpos_succ_iff_exponent_cap`;
- `signedOffsetMargin_nonpos_of_nondecreasing_orbit`;
- `nondecreasing_orbit_next_exponent_cap`.

The local equivalence is

\[
D_{j+1}\le 0\iff 2^{A_j+a_j}+3D_j\le 4\cdot 2^{A_j}.
\]

This gives a necessary local exponent cap under the stated nondecreasing-orbit condition. It is not a global descent theorem and does not exclude every infinite branch. Preserve it as an independent proved component; do not erase it because a later bridge candidate fails.

### Minimal-counterexample and finite-cap-tree chain

PR [#59](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/59) and PR [#62](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/62) remain exact-head verified with all three CI jobs passing and the named standard axiom profiles. In particular, PR #62 connects least-start minimality/suffix-return to a necessary finite-depth cap-tree and terminal-unit certificate. It does not yet prove the finite cap tree has no infinite branch.

PRs [#68](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/68) and [#70](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/70) are parallel proof-script candidates for transporting the initial depth bound through `n 0 = n₀`; neither is promoted to verified without exact-head runs. PR [#71](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/71) installs the exact-head audit workflow on the default branch; once it is merged, trigger fresh runs for #68 and #70 and inspect all three jobs, named axioms, and the no-`sorryAx` guard.

The remaining mathematical target is still the infinite-branch exclusion / well-founded descent step. The verified margin and finite-depth certificates are useful constraints on that step, not substitutes for it. No global Collatz proof is claimed.
