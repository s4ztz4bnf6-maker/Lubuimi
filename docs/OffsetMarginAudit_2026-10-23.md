# Offset recurrence and open-path audit roadmap (2026-10-23)

## Scope and status

This note isolates an exact identity for the accelerated odd Syracuse map. It is not a global Collatz proof, and it does not establish that an infinite path of non-descending transitions is impossible.

Let n_i be odd positive integers, let a_i = v₂(3 n_i + 1), and suppose
n_{i+1} = (3 n_i + 1) / 2^{a_i}.
Set A_0 = 0 and A_j = ∑_{i<j} a_i. Define C_0 = 0 and
C_{j+1} = 3 C_j + 2^{A_j}.

## Exact identity

For every j for which the orbit and valuations are defined,
2^{A_j} n_j = 3^j n_0 + C_j.

Proof by induction:
- j = 0: both sides equal n_0.
- If the identity holds at j, then
  2^{A_{j+1}} n_{j+1}
  = 2^{A_j}(3 n_j + 1)
  = 3(2^{A_j}n_j) + 2^{A_j}
  = 3^{j+1} n_0 + (3 C_j + 2^{A_j})
  = 3^{j+1} n_0 + C_{j+1}.

Equivalently,
C_j = ∑_{i<j} 3^{j-1-i} 2^{A_i}.
The recurrence is exact and purely algebraic; it supplies a useful kernel-checkable bridge between the valuation word and the realized orbit.

## What the identity does and does not give

The strict-descent test n_j < n_0 is equivalent to
3^j n_0 + C_j < 2^{A_j} n_0.
This equivalence is useful only when A_j and C_j are computed from a genuinely realized valuation sequence. A finite residue-class search may certify individual transitions, but it does not show that every infinite sequence of open transitions is impossible.

A proposed margin lemma must therefore state explicit hypotheses on the valuation sequence and prove a deterministic inequality from them. Average drift, heuristic independence, or the fact that most residue classes descend is not enough.

## New local result and its exact scope

The current Lean branch also contains a parity lemma: if both the current and next values are odd and the exact transition equation
`2^a * n_next = 3 * n + 1` holds, then `a > 0`. This is correct as a local parity consequence; it does not show `a ≥ 2`, nor that the iterate decreases. The branch also characterizes descent exactly by the strict offset margin. These additions still require the latest CI run to finish before their compilation status can be reported as verified.

## Next Lean proof obligations

1. Make the transition certificate explicitly encode exactness: `2^a ∣ 3*n+1` and `¬ 2^(a+1) ∣ 3*n+1`, or equivalently an odd quotient together with the scaled transition equation.
2. Prove that the odd-quotient certificate implies maximality of the removed power of two, and connect the certificate to the actual Syracuse map rather than an arbitrary sequence.
3. Prove the one-step scaled recurrence, then the displayed identity by induction.
4. Define the precise assumptions accepted by `offsetMarginCheck_sound`; prove they follow from certified transition data rather than from a caller-supplied conclusion.
5. Search for counterexamples to each proposed uniform margin bound before attempting a global induction.

No compile, axiom audit, or global theorem is claimed by this note.
