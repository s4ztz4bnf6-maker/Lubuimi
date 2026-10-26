# 2-adic continuity boundary: shortcut Collatz versus accelerated Syracuse

## Purpose

The proposed 2-adic embedding is mathematically useful, but compactness alone does not force positive integer trajectories to converge to a global sink. This note separates the continuous map from the accelerated map and records the exact obstruction.

## The continuous shortcut map

Define on 2-adic integers

`C(x) = x/2` when `x` is even, and `C(x) = (3x+1)/2` when `x` is odd.

Parity classes are clopen in `Z₂`; on each class the formula is affine and division by 2 is valid on the corresponding even numerator. Hence the two branches define a continuous map on `Z₂`. The parity-vector coding of this shortcut dynamics is related to the one-sided shift: it is a powerful symbolic representation, but symbolic conjugacy does not itself prove the integer Collatz conjecture.

## Why the accelerated odd map is different

For odd x, accelerated Syracuse uses

`T(x) = (3x+1) / 2^(v₂(3x+1))`.

The exponent `v₂(3x+1)` is unbounded on odd 2-adic inputs approaching `-1/3`. At `x = -1/3`, the numerator vanishes, so the valuation is not a finite integer at all. In every sufficiently small neighborhood of this point there are inputs for which the valuation is arbitrarily large. Therefore the accelerated rule does not extend as an ordinary continuous self-map on all odd `Z₂` by simply applying the integer valuation formula.

Any proposed topological model must either exclude this singular point and control approaches to it, or replace the accelerated map with a different state space that records the valuation as additional symbolic data. The latter construction would need a proved topology and a proved semiconjugacy; it cannot be assumed to inherit compactness or continuity for free.

## Compactness is not a descent theorem

Compactness of `Z₂` gives convergent subsequences for sequences of 2-adic states. It does not imply that an orbit converges, that its limit is an integer, that its ordinary integer magnitude decreases, or that every positive integer orbit reaches 1. A density-one descent result also leaves open an exceptional set, even if that set has natural density zero.

A valid bridge to the integer conjecture must supply a further arithmetic statement, for example a universal descent inequality, an exclusion of every nontrivial recurrent symbolic itinerary that can arise from a positive integer, or a well-founded ranking function on the integer states. Each is a substantive unresolved obligation, not a consequence of topology alone.

## Formal audit obligations

1. Define `C` and prove branchwise continuity in the chosen 2-adic topology.
2. State the parity-coding theorem with exact hypotheses and a precise conjugacy/semiconjugacy claim.
3. Formalize the singular behavior near `-1/3` before defining any accelerated extension.
4. Prove a separate bridge from symbolic/2-adic information to positive integer descent.
5. Keep density-one statements distinct from universal statements.

No global Collatz theorem is claimed in this note.