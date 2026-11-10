# Terminal exactness: one-step backward lemma

**Author:** Ta-Yoshua Lubuimi  
**Date:** 10 November 2026  
**Branch:** `collatz/terminal-exact-backward-step-2026-11-10`  
**Status:** Mathematical one-step implication derived; Lean implementation and CI **OFFEN – NICHT VERIFIZIERT**.

## 1. Exact source definitions

The source module is `SyracuseAffineCore.lean`, namespace `SyracuseAudit`. The checked branch-ref file has blob SHA `f12e3ad0f887e215446f03b5070b0122207f4093`; the companion `SyracuseAffineCorrectionSum.lean) has blob SHA `47616363ac04f999297c7ccb16c3ebc6803fb552`. These are blob identifiers, not the current branch-head commit SHA.

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

**Next gate:** implement the one-step lemma in an isolated Lean module on this branch, run the pinned project toolchain, inspect the named `#print axioms` output, and verify the dependency closure has no `sorryAx). Only then add the backward induction.
