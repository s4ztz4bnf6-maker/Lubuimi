# Literature and proof-gap audit — 2026-10-23

## Scope
This note records research directions and proof obligations. It is not a claim that the Collatz conjecture has been solved, nor that external proof claims have been independently verified.

## Research landscape reviewed
- David Barina, *Improved verification limit for the convergence of the Collatz conjecture* (2025), reports computational verification below 2^71. This is finite verification, not an infinite proof.
- The 2026 *Parity-Based Level-Set Approach to the Collatz Conjecture* studies parity-based level sets and means. Such statistical statements must not be promoted to pointwise descent.
- Kazuo Nakanishi's 2026 parity-vector preprint explicitly limits its conclusion to each fixed finite number of odd steps and does not rule out infinite parity vectors.
- The Collatz Conjecture Challenge is a useful literature/formalization index, but the number of papers formalized is not evidence for the conjecture itself.
- Public repositories advertising complete Lean proofs are audit targets until theorem statements, assumptions, imported axioms, dependencies and kernel-checked builds are independently examined.

## Exact algebraic invariant
For certified accelerated odd transitions 2^(a_k) n_(k+1) = 3 n_k + 1, with A_0=C_0=0, A_(k+1)=A_k+a_k and C_(k+1)=3C_k+2^(A_k), the affine identity is

2^(A_k) n_k = 3^k n_0 + C_k.

This is a finite-orbit identity. It does not show an arbitrary exponent word is realizable or that a realized word yields descent.

## New proof architecture to implement
### Exact finite-orbit certificate
For a finite exponent word and starting odd positive integer, define D_k=3^k n_0+C_k. A certificate must require, for every prefix k: (1) 2^(A_k) divides D_k; (2) n_k=D_k/2^(A_k) is positive and odd; (3) each transition satisfies 2^(a_k)n_(k+1)=3n_k+1; (4) exactness: 2^(a_k+1) does not divide 3n_k+1.

The transition equation plus oddness of the quotient already implies exactness: if 2^(a+1) divided 3n+1=2^a q, cancellation gives q even, contradiction. The existing lemma exponent_is_maximal_of_odd_quotient captures this direction. The converse still needs divisibility/quotient and transition bookkeeping.

### Non-circularity check
Do not define the certificate by requiring the desired descent. Prove descent only from the independent strict margin 3^N n_0+C_N < 2^(A_N)n_0. The existing descent_iff_offset_margin characterizes this condition but does not establish it. Since a_k>=1 gives only A_N>=N, and 3^N outgrows 2^N, that coarse bound cannot prove the margin.

## Next formal milestones
1. Define a finite exponent word using Fin N -> Nat and prefix sums.
2. Prove A_k is the sum of the first k exponents.
3. Prove the offset closed form/prefix split, then establish divisibility and quotient recurrence.
4. Prove certificate soundness and completeness separately.
5. Search for a new uniform valuation/block inequality strong enough to imply the strict margin; do not assume such an inequality without proof.
6. Run #print axioms on each main theorem and check all CI jobs, not merely dependency installation.

## References
- Barina (2025): https://link.springer.com/article/10.1007/s11227-025-07337-0
- Koyuncu et al. (2026): https://www.mdpi.com/2227-7390/14/10/1763
- Nakanishi (2026): https://jxiv.jst.go.jp/index.php/jxiv/preprint/download/3096/7302/6705
- Collatz Conjecture Challenge: https://ccchallenge.org/
