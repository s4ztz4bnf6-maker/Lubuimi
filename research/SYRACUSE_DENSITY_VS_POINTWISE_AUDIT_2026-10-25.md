# Research continuation: density results versus pointwise Syracuse descent
Date: 2026-10-25

## Why this note exists
A source audit must keep three claims separate:
1. a density-one set of starting values has a descent property;
2. a positive-density set reaches a specified target within a time bound;
3. every starting value eventually reaches 1.

The first two do not imply the third without an additional argument eliminating the exceptional set.

## External result worth integrating carefully
ProofAtlas publishes Lech Mazur's Natural-Density Almost-Bounded Collatz Orbits in Logarithmic Time (version 2, 2026-07-21):
https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/

Its stated scope is:
- odd-relative natural-density-one many odd starts have a Syracuse descent below a threshold tending to infinity within 145 log N accelerated steps;
- ordinary natural-density-one many positive starts have a raw-Collatz descent below a threshold tending to infinity within 436 log N raw steps.

The page explicitly says this does not prove the Collatz conjecture, convergence for every start, or arrival at 1; a density-zero exceptional set may remain. The two endpoints use different domains and clocks. Treat the exact pinned Lean declarations and evidence as authoritative; do not infer stronger claims from the headline.

ProofAtlas also lists a distinct positive-density result:
https://www.proofatlas.ai/formalizations/positive-density-log-time-collatz/
It states that a fixed positive fraction of positive starts below sufficiently large cutoffs reach 1 within an explicit logarithmic raw-step bound. This remains a positive-density result, not universal convergence.

## Project-local exact structure
The accelerated odd Syracuse transition is
  2^a * n' = 3*n + 1,
where a = v₂(3*n+1). For a finite valuation word a_0,...,a_{r-1}, set
  A_j = sum_{k<j} a_k,
  C_0 = 0, C_{j+1} = 3*C_j + 2^A_j.
Then the exact identity is
  2^A_j * n_j = 3^j*n_0 + C_j.
The correction term for the normalized weighted expansion is
  Δ(a,A) = (2^a - 4) * 2^A:
negative at a=1, zero at a=2, positive for a≥3.

The explicit family
  n_i = 3^i * 2^(r+1-i) - 1
has 2*n_(i+1)=3*n_i+1 for i<r and n_i = 3 (mod 4) for i<r. Thus arbitrarily long finite valuation-one runs exist. They do not constitute a nonterminating orbit or a counterexample.

## Concrete next formalization targets
1. Define a finite valuation-word correction sum and prove its exact telescoping relation to the affine identity, without using real logarithms or probabilistic assumptions.
2. Prove a conditional block-descent lemma: if a concrete finite block's normalized correction sum is strictly below the corresponding growth margin, then the endpoint is smaller than the start. State every hypothesis explicitly.
3. Add a separate lemma showing why a density-one descent theorem cannot by itself imply universal convergence: formalize only the logical issue (an exceptional set of density zero can be nonempty), not a claim about actual Collatz counterexamples.
4. For any proposed 2-adic extension, distinguish continuity of the polynomial map n ↦ 3n+1 on Z₂ from continuity of the accelerated map involving v₂ and division by a variable power of 2. The latter has a genuine discontinuity obstruction near x* = -1/3 in Z₂; this is not a disproof of integer Collatz.

## Integrity status
No global Collatz proof or counterexample is established here. A successful Lean build and a transitive axiom audit are separate gates; a kernel-checked local lemma does not validate a broader natural-language claim automatically.
