# Research continuation: valuation-cylinder census and the universal-exception barrier
Date: 2026-10-26

This note adds a precise finite-computation route for the Syracuse project. It is a research plan with exact statements, not a claim of a new global theorem.

## 1. One-step valuation cylinders are exactly countable

For odd n, let a=v₂(3n+1), so a≥1. The condition a=r is equivalent to
  3n+1 ≡ 2^r (mod 2^(r+1)).
Because 3 is invertible modulo every power of 2, this selects exactly one residue class modulo 2^(r+1). Among odd residue classes modulo 2^(r+1), there are 2^r classes, so the one-step cylinder has relative density 2^(-r).

Consequently the one-step valuation distribution under uniform odd residues is
  P(a=r)=2^(-r), r≥1,
and its mean is
  Σ_{r≥1} r/2^r = 2.
This is an exact finite-cylinder fact, not an assumption of independent valuations along an orbit.

## 2. Why this does not yet give global descent

The heuristic mean drift for D_k=5A_k-9k is
  E[D_(k+1)-D_k] = 5 E[a_k]-9 = 1
under the one-step uniform-residue distribution. This positive mean is suggestive but is not a proof about every deterministic orbit:
- the valuation at later times is conditioned on the previous residue constraints;
- finite-prefix cylinder densities do not rule out a single exceptional infinite orbit;
- positive average drift in probability does not automatically provide a record-time descent certificate for every starting integer.

A valid proof must quantify the joint cylinders or supply a deterministic orbit argument that controls the exceptional set.

## 3. Exact finite-prefix cylinder counting proposal

For a valuation word (a_0,...,a_(N-1)), the recurrence
  n_(k+1)=(3 n_k+1)/2^(a_k)
imposes congruence constraints on n_0. Iterating the affine identity gives
  2^(A_N)n_N = 3^N n_0 + C_N,
where C_N=Σ_{j<N}3^(N-1-j)2^(A_j).
For fixed word, integrality of every step can be encoded by congruences modulo 2^(A_N); because 3 is odd, the affine map determines at most one residue class modulo 2^(A_N) for n_0. The exact admissibility condition should be derived and formalized rather than assuming every word is realizable.

A finite-prefix enumerator can therefore:
1. enumerate odd residue classes modulo 2^m;
2. compute the exact valuation word until cumulative valuation reaches m;
3. independently verify each word against the affine formula;
4. count the cylinders satisfying the suffix-drift condition;
5. emit a certificate (residue class, valuation word, endpoint, correction sum) checked by a small Lean theorem.

This provides reproducible finite data and may expose a sharper invariant, but finite data alone cannot establish the universal claim.

## 4. Research target: deterministic alternative, not just high probability

A potentially useful theorem shape is:
For every odd n>1, there exists a realized finite block ending at m<n, with the block certified either by (i) a suffix-drift record time or (ii) a different explicit correction-sum inequality.

The disjunction matters. Requiring every orbit to satisfy one particular drift threshold may be too rigid. A proof of the disjunction would suffice for strong induction and hence global convergence; a probabilistic statement would not.

## 5. Formal and computational safeguards

- Use integers for differences of cumulative valuations; avoid truncated subtraction in Nat.
- Keep the actual Syracuse transition in the admissibility predicate; do not quantify over arbitrary exponent lists as if all were realizable.
- A checker should recompute every claimed residue, valuation, and correction term independently.
- Report finite search bounds and exhaustive residue coverage explicitly.
- No global Collatz result, Lean compilation, or axiom audit is claimed by this note.
