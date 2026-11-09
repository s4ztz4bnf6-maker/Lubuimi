# Syracuse block-residue correction (2026-10-24)

## Exact derivation

If the first k accelerated odd steps have exponent 1, then

n_0 + 1 = 2^(k+1) q, and n_j + 1 = 3^j 2^(k+1-j) q for 0 ≤ j ≤ k,

for a positive integer q. Hence n_k = 2·3^k q − 1.

The next exponent is **not always at least 2**. Since 3^k is odd,

- if q is odd, n_k ≡ 1 (mod 4), so the next exponent a_k ≥ 2;
- if q is even, n_k ≡ 3 (mod 4), so the next exponent a_k = 1.

In the latter case the run continues, and q contains another factor of 2. This corrects the overstrong claim that every such block is necessarily followed by exponent at least 2. The rigorous continuation rule is conditional on the parity of q.

## What this does prove

A run of k exponent-one steps implies 2^(k+1) divides n_0+1, so k ≤ floor(log2(n_0+1))−1. The run length is bounded in terms of the initial value but can be arbitrarily large across starting values.

## What remains open

This does not give a uniform bound on the negative contribution to D_(j+1) = 3 D_j + (2^(a_j)−4)2^(A_j). To obtain one, the proof must combine run length with subsequent exponent blocks and their actual 2-adic admissibility. No global Collatz conclusion follows from this note.
