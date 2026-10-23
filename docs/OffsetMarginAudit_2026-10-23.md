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

## Next Lean proof obligations

1. Define a valuation-certified transition relation that records exact divisibility by 2^{a_i}, including the maximality condition defining v₂.
2. Prove the one-step scaled recurrence, then the displayed identity by induction.
3. Prove the descent equivalence with `omega`/ring-normalization after keeping powers and exponents explicit.
4. Define the precise assumptions accepted by `offsetMarginCheck_sound`; prove they follow from the certified transition data rather than from a caller-supplied conclusion.
5. Search for a counterexample to each proposed uniform margin bound before attempting a global induction.

No compile, axiom audit, or global theorem is claimed by this note.
