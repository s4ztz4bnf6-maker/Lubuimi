# Terminal exactness: one-step backward lemma

**Author:** Ta-Yoshua Lubuimi  
**Date:** 10 November 2026  
**Branch:** `collatz/terminal-exact-backward-step-2026-11-10`  
**Status:** Mathematical one-step implication derived; Lean implementation and CI **OFFEN – NICHT VERIFIZIERT**.

## 1. Exact source definitions

The source module is `SyracuseAffineCore.lean`, namespace `SyracuseAudit`. The checked branch-ref file has blob SHA `f12e3ad0f887e215446f03b5070b0122207f4093`; the companion `SyracuseAffineCorrectionSum.lean` had baseline blob SHA `47616363ac04f999297c7ccb16c3ebc6803fb552`. These are blob identifiers, not the current branch-head commit SHA.

The source definitions are:

[
A_k=\operatorname{prefixExponentSum}(a,k),\qquad
C_k=\operatorname{affineCompositionRhs}(a,n,k),
]
with
[
A_{k+1}=A_k+a_k,qquad C_{k+1}=3C_k+2^{A_k}.
]

The existing theorem `SyracuseAudit.finite_prefix_affine_identity` proves
[
2^{A_N}n_N=C_N
]
under the stated step equations. That identity is conditional algebra; it does not establish arbitrary-word realizability.

## 2. One-step backward statement

Assume (a_k\ge1) and terminal exactness
[
C_{k+1}\equiv 2^{A_{k+1}}\pmod{2^{A_{k+1}+1}}.
]
Then
[
oxed{C_k\equiv2^{A_k}\pmod{2^{A_k+1}}.}
]

In the existing natural-number definitions, the intended Lean statement is:

```lean
theorem terminalExact_backward_step
    (a n : Nat → Nat) (k : Nat)
    (ha : 1 ≤ a k)
    (hterminal :
      affineCompositionRhs a n (k + 1) %
          2 ^ (prefixExponentSum a (k + 1) + 1) =
        2 ^ prefixExponentSum a (k + 1)) :
    affineCompositionRhs a n k %
        2 ^ (prefixExponentSum a k + 1) =
      2 ^ prefixExponentSum a k := by
  ...
```

This is a target signature only. It has not been inserted into Lean source and has not been elaborated.

## 3. Mathematical proof

Write (A=A_k), (B=A_{k+1}=A+a_k), and (C=C_k). Since (a_k\ge1), (B\ge A+1). The terminal congruence says
[
C_{k+1}=2^B+2^{B+1}t
]
for some (t\in\mathbb N). Hence (2^{A+1}\mid C_{k+1}), because (B\ge A+1).

Using the source recursion,
[
C_{k+1}=3C+2^A,
]
we obtain
[
2^{A+1}\mid 3C+2^A.
]
In particular (2^A\mid3C). Since
[
\gcd(3,2^A)=1,
]
Euclid's lemma gives (2^A\mid C). Write (C=2^Aq). Substitution into the stronger divisibility relation gives
[
2^{A+1}\mid2^A(3q+1),
]
and cancellation of the positive factor (2^A) yields (2\mid3q+1). Thus (q) is odd, say (q=2s+1). Therefore
[
C=2^A(2s+1)=2^{A+1}s+2^A,
]
which is exactly
[
C\equiv2^A\pmod{2^{A+1}}.
]

The case (A=0) is included: (2^A=1), the coprimality statement remains true, and the same parity conclusion gives (C\equiv1\pmod2).

## 4. Lean proof decomposition

The implementation should isolate the arithmetic from the recursive definitions:

1. Unfold only the successor equation for `affineCompositionRhs` and the successor equation for `prefixExponentSum`.
2. From (1\le a_k), prove (A_k+1\le A_{k+1}).
3. Convert terminal `Nat.ModEq`/remainder equality into divisibility of (C_{k+1}) by (2^{A_k+1}). Keep the quotient witness explicit.
4. Deduce (2^{A_k}\mid3C_k).
5. Use a named `Nat.Coprime` cancellation lemma for (2^{A_k}) and (3) to obtain (2^{A_k}\mid C_k).
6. Extract (q) with (C_k=2^{A_k}q).
7. Cancel (2^{A_k}) from (2^{A_k+1}\mid2^{A_k}(3q+1)), obtaining (2\mid3q+1).
8. Use `omega` only for the final parity extraction after the divisibility witness is explicit.
9. Rewrite (q=2s+1) and reduce the final remainder using `pow_succ` and the bound (2^{A_k}<2^{A_k+1}).

Do not guess theorem names for the coprime-cancellation or Nat-modulus conversion lemmas. Check them against the pinned Mathlib version during the isolated implementation. Do not replace the proof with a new axiom or an admitted theorem.

## 5. Backward induction target

Once the one-step lemma elaborates, the finite-prefix consequence is:

If (a_j\ge1) for every (j<N) and terminal exactness holds at (N), then exactness holds at every (j\le N):
[
\forall j\le N,quad C_j\equiv2^{A_j}\pmod{2^{A_j+1}}.
]

This induction is a separate Lean declaration. It should call the one-step lemma with (k=N-1,N-2,\ldots,0), without changing the existing `finite_prefix_affine_identity` theorem.

## 6. Scope and non-claims

- This is a local arithmetic backward implication for the existing accumulator.
- It is not yet Lean-compiled, axiom-audited, or CI-verified.
- It does not by itself prove the general finite valuation-word realization theorem, the density theorem, or the finite tail partition.
- It does not prove global Collatz convergence.
- The initial valuation-one cylinder result and its exact-head CI evidence remain independent and unchanged.
- APW4 is not modified or used as a premise.

**Next gate:** implement the one-step lemma in an isolated Lean module on this branch, run the pinned project toolchain, inspect the named `#print axioms` output, and verify the dependency closure has no `sorryAx`. Only then add the backward induction.


## Existing build blocker found and isolated repair — 10 November 2026

The first workflow on this branch, [42835859458](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42835859458), failed while compiling the pre-existing `SyracuseAffineCorrectionSum` target at line 108 with `No goals to be solved`. The diagnostic is caused by `simp [affineCorrectionSum]` already closing the goal in `affineCorrectionSum_ge_last_power`, followed by a redundant `omega` tactic.

A minimal source repair was committed on this branch as `b9a89872e39b6688f7c7ef567755beceb0c1e5f9`: the redundant `omega` line was removed and no theorem statement, definition, or hypothesis changed. The updated blob is `251d96781e9bec0e482ca9ef9c6bcbe731156467`. A fresh exact-head workflow is required; the repair is **OFFEN – NICHT VERIFIZIERT** until that run completes. This is a pre-existing compile blocker exposed by the branch build, not a failure of the new backward-step mathematics.


## One-step backward lemma source candidate — 10 November 2026

The previously documented target signature has now been added as `SyracuseAudit.terminalExact_backward_step` in `SyracuseAffineCore.lean`. Source commit: `0cd469f27477d9ac8364e3feb8d462f280e546cd`; resulting blob: `1826d5bea4b7d20d94904032037ebd97720bdfef`.

The proof script follows the explicit natural-number divisibility route: the terminal remainder identity is expanded with `Nat.mod_add_div`; the higher power divisibility gives divisibility of (3C_k+2^{A_k}) by (2^{A_k+1}); coprimality of (2^{A_k}) and 3 gives (2^{A_k}\mid C_k); cancellation then forces the quotient to be odd, yielding the desired remainder.

**Status: OFFEN – NICHT VERIFIZIERT.** No exact-head Actions run or status check has been returned for this commit. The theorem has not been reported as elaborated or kernel-checked. The finite backward induction is not yet added. The existing target branch `collatz/valuation-cylinders-2026-10-26` remains unchanged; this is an isolated candidate branch. No result is transferred to arbitrary-word realizability, the general density theorem, or global Collatz convergence.


## Finite backward induction source candidate — 10 November 2026

A second declaration, `SyracuseAudit.terminalExact_backward_prefix`, has now been added after the one-step lemma. It states that if `1 ≤ a k` for every `k < N` and terminal exactness holds at `N`, then the exact residue propagates to every `k ≤ N`. Its proof is a finite induction on (N), using the one-step lemma at the terminal edge of each successor stage.

Source commit: `e8f1687f756a6448bfea125e8c5b215607a1f727`; source blob: `14ed3908605d8d8e673d73d96b9eedb5629c7379`. The earlier one-step source commit remains `0cd469f27477d9ac8364e3feb8d462f280e546cd`.

**OFFEN – NICHT VERIFIZIERT:** no exact-head Lean workflow run, isolated compile, axiom output, or transitive no-`sorryAx` check has been returned for the new source head. The induction is a formalization candidate only. It does not prove realizability of arbitrary valuation words, density-to-pointwise transfer, a finite tail partition, or global Collatz convergence. The authoritative working branch `collatz/valuation-cylinders-2026-10-26` remains unchanged; this work is isolated on the terminal-backward-step candidate branch.


## Kernel-verification correction — 10 November 2026

The earlier **OFFEN – NICHT VERIFIZIERT** status above is superseded for the two declarations on the exact source head recorded here. The initial candidate exposed three concrete Lean issues: the `Nat.dvd_add_iff_right` direction was used backwards, the parity inference was too broad for `omega` in the surrounding arithmetic context, and the finite induction introduced its theorem hypotheses twice. These were repaired by commuting the divisibility sum before cancellation, isolating the parity fact as an explicit modulo-two argument, and removing the duplicate `intro` binders.

**Verified source commit:** `e44eb4331cc1481e10d6f60780d695412c47a726`.

**GitHub Actions:** run `42844423707` completed successfully. The declared Lean library, record-time module, deterministic exceptional-orbit obstruction, and exact density arithmetic modules compiled under Lean 4.34.1 / Mathlib 4.34.1. The explicit `#print axioms` report gave, for both `terminalExact_backward_step` and `terminalExact_backward_prefix`:

`[propext, Classical.choice, Quot.sound]`

There is no `sorryAx` in either transitive profile. The two declarations are therefore kernel-verified on this exact commit. This does not claim that `lake check --paranoid` has run; that remains a separate audit step.

The authoritative branch `collatz/valuation-cylinders-2026-10-26` was not changed; it still does not contain either new declaration. Draft PR #72 remains open and unmerged. The mathematical scope remains local finite backward propagation only: no arbitrary-word realizability, density-to-pointwise transfer, global infinite-orbit exclusion, or global Collatz theorem follows from these declarations.
