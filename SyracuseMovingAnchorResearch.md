# Universal Syracuse route: moving-anchor obstruction

Date: 2026-10-26
Branch: collatz/valuation-cylinders-2026-10-26

## Comparison with related work

Tao's almost-all Collatz theorem is a density theorem, not pointwise convergence. Its Lean blueprint identifies stabilization and high-frequency character decay on a 3-adic cyclic group as major proof obligations:
https://gotrevor.github.io/tao-collatz/blueprint/sect0001.html

The Collatz Conjecture Challenge tracks formalizations and density results, not a proof for every starting value:
https://ccchallenge.org/

The 2026 EOC formalization project separates finite-word realizers, confinement, and almost-all estimates from its open Global Occupation Conjecture and moving-anchor problem:
https://github.com/innerlightr-wq/eoc-lean-verification

These are methodological comparisons. None supplies the missing universal threshold-crossing theorem in this repository.

## Moving-anchor formulation

Fix a finite valuation word a=(a_0,...,a_{N-1}) and A_N=sum a_i. Its cylinder is one odd residue class modulo 2^(A_N+1). Let r_N be the least positive representative. Every positive integer in the cylinder has form
n_0 = r_N + k*2^(A_N+1), k >= 0.

For a fixed start n_0 whose actual orbit follows the word, once 2^(A_N+1)>n_0, the representative is r_N=n_0. This identity is tautological and does not imply descent. The universal proof needs a uniform arithmetic restriction on representatives of indefinitely bad words, not merely a density estimate.

A possible bridge is a lower bound on r_N for words satisfying the bad-prefix restriction
5*A_j < 9*j for every 1 <= j <= N,
or a bound on how long a fixed small integer can realize such a word. Any such bound must use the full affine identity and its positive correction term, and must hold for compatible actual prefixes. A claim that all finite bad words are unrealizable is false.

## Exact constraints on a hypothetical exceptional orbit

If a fixed odd n_0 never reaches the surplus threshold, then for every N:
A_N <= floor((9*N-1)/5),
and
2^A_N*n_N = 3^N*n_0 + sum_{j<N} 3^(N-1-j)*2^A_j.

Since A_N >= N, the cylinder modulus tends to infinity, but this alone is not contradictory. The missing theorem must exploit the simultaneous constraints across all prefixes, not one cylinder in isolation.

Research targets:
1. Prove a lower bound for the least representative of every word whose all prefixes have negative surplus.
2. Prove an infinite-sequence obstruction for valuations arising from a fixed integer.
3. Replace the surplus certificate by a descent inequality directly implied by the affine recurrence and integrality.

These are targets, not results. The density-one statement cannot eliminate a nonempty zero-density exceptional set. No universal Collatz theorem is claimed here.
