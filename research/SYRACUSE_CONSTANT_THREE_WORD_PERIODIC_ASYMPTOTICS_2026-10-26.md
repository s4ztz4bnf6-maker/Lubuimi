# Exact periodic asymptotics of the least realizer for the word 3^N

Date: 2026-10-26

## Theorem

Let M_N=2^(3N+1), and let n_N be the least positive integer realizing the first N accelerated Syracuse valuations all equal to 3. The preceding exact-cylinder calculation gives

n_N = (t_N M_N + 1)/5,

where t_N is the unique integer in {1,2,3,4} satisfying t_N M_N ≡ -1 (mod 5).

Since M_N ≡ 2·3^N (mod 5), t_N is periodic with period four:

| N mod 4 | M_N mod 5 | t_N | n_N/M_N |
|---:|---:|---:|---:|
| 0 | 2 | 2 | 2/5 + 1/(5M_N) |
| 1 | 1 | 4 | 4/5 + 1/(5M_N) |
| 2 | 3 | 3 | 3/5 + 1/(5M_N) |
| 3 | 4 | 1 | 1/5 + 1/(5M_N) |

Thus the normalized least realizer has four subsequential limits 2/5, 4/5, 3/5, 1/5 in the corresponding residue classes of N modulo 4. In particular, n_N grows exponentially like a positive constant times 8^N, and cannot be bounded by any polynomial in N.

## Proof

The congruence 5n_N ≡ 1 (mod M_N) gives 5n_N=t_N M_N+1 for some integer t_N. The least positive inverse has 1≤t_N≤4. Reducing modulo 5, M_N≡2·8^N≡2·3^N (mod 5). Evaluating N modulo 4 gives M_N residues 2,1,3,4, respectively; solving t_N M_N≡-1 (mod 5) gives t_N=2,4,3,1. Dividing the exact expression by M_N proves the limits.

## Interpretation and limitation

This sharpens the lower bound by identifying its exact four-phase oscillation, not just its exponential order. It is a result about the least positive integer realizing one prescribed finite valuation word. It neither supplies an infinite orbit with these valuations nor proves divergence or convergence for Syracuse/Collatz. The growth obstruction explains why finite-cylinder existence alone does not provide small integer realizers.

The calculation uses only modular arithmetic and is independently regression-tested by the companion script. No Lean compilation or CI run is claimed here.
