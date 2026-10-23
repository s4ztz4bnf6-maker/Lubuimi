# Realizable valuation words: congruence certificate and moving-anchor obstruction
Date: 2026-10-23

## Purpose and status

This note sharpens the current offset-margin roadmap by separating (i) which finite valuation words are realizable from (ii) whether the resulting endpoint decreases. The exact congruence criterion below is an algebraic finite-word lemma; it is not a proof of Collatz. An external research lead is the EOC Lean-verification project (linked below), whose own README explicitly says its global occupation conjecture and Collatz remain open. Treat its claims as research to audit, not as an authority or as a proof imported into this repository.

## Critical correction: the endpoint congruence alone is not sufficient

The earlier statement below that the final congruence alone characterizes an exact valuation word was too strong and is withdrawn. A concrete counterexample is the word `(1,1)`: here `S_L=2`, `C_L=5`, and the endpoint congruence is `9n+5 ≡ 4 (mod 8)`, which is satisfied by `n ≡ 7 (mod 8)`. But at `n=7`, the accelerated odd map gives `7 -> 11 -> 17`, with valuations `v₂(3·7+1)=1` and `v₂(3·11+1)=v₂(34)=1`? Careful: `3·11+1=34`, so the second valuation is indeed `1`; the endpoint after two steps is `17`, and the affine identity gives `4·17=68=9·7+5`. Thus this example does realize `(1,1)` and is not a counterexample. The correct obstruction must be checked against all prefix constraints, not inferred from the endpoint alone.

For an exact word, each prefix `j` must satisfy its own congruence
`3^j n + C_j ≡ 2^{S_j} (mod 2^{S_j+1})`.
The endpoint congruence is just the `j=L` member of this family. The proof target is therefore the equivalence between exact realizability and the full family of prefix congruences, together with the affine recurrences. Do not claim that the endpoint condition alone is sufficient until a proof or counterexample search settles it.

## Exact finite-word criterion

Fix a word a_0,...,a_(L-1) of positive integers. Put
- S_0 = 0 and S_(j+1) = S_j + a_j;
- B = 2^S_L;
- C_0 = 0 and C_(j+1) = 3 C_j + 2^S_j;
- A = 3^L.

Composition of the accelerated odd map gives the affine identity
  B x_L = A x_0 + C_L.
For a positive odd starting integer n, the exact valuation word is realized if and only if
  3^L n + C_L ≡ 2^S_L (mod 2^(S_L+1)).
Equivalently, with D = 3^L - 2^S_L,
  2^(S_L+1) divides D n + C_L.

Why the endpoint congruence is strong enough: the composed affine expression for the endpoint, reduced modulo each prefix modulus 2^(S_j+1), forces the quotient at that prefix to be odd. Since each prescribed a_j is positive, the intermediate states are odd and each division removes exactly a_j powers of two. This prefix-reduction argument needs a full Lean proof before the criterion is accepted as formalized here.

The criterion says that each fixed finite word selects one odd residue class modulo 2^(S_L+1), because D is odd. Thus finite words are locally realizable infinitely often. This is not a contradiction to global convergence: the realizing integers may grow with word length and need not form one fixed positive integer or one consistent infinite positive orbit.

## The moving-anchor obstruction

For a repeated fixed word, the same linear form D n + C is repeatedly constrained. For a changing word, both D and C change. Therefore a 2-adic limit or a one-word congruence class does not provide a monotone Archimedean measure on a single positive orbit. This is the exact point at which a tempting compactness argument fails.

The next useful formal target is a finite valuation-word certificate containing:
1. a finite list of positive exponents;
2. states x_j;
3. exact transition equations 2^(a_j) x_(j+1) = 3*x_j+1;
4. oddness of each state and the exactness/maximality of every exponent;
5. the derived endpoint congruence and affine identity.

Then prove both directions of the congruence criterion separately. After that, search for a genuinely orbit-compatible invariant that controls changing linear forms; do not assume arbitrary valuation words have the same statistical properties as realized words.

## Relation to the current offset margin

The current identity is
  2^(S_L) x_L = 3^L x_0 + C_L.
Strict descent is equivalent to
  3^L x_0 + C_L < 2^(S_L) x_0.
A positive exponent surplus 2^(S_L) > 3^L is necessary but not sufficient. The congruence criterion restricts which exponent words are realized, but it does not itself bound C_L tightly enough to prove descent.

## Verification gates

- Keep all divisibility statements over naturals/integers explicit; do not use real logarithms as a substitute for exact arithmetic.
- Test the criterion against exhaustive small words and starting residues, but treat computation only as counterexample search.
- Print transitive axioms and build under a Lean release with the kernel-soundness fix.
- Any theorem about all words must state whether the word is merely positive or is realized by an actual orbit.

## Research leads (not imported as proof)

- EOC Lean verification repository: https://github.com/innerlightr-wq/eoc-lean-verification
- Collatz conditional-cycle audit and its October 2026 erratum: https://collatz-lab.org/
- Standard background: https://mathworld.wolfram.com/CollatzConjecture.html

No global descent result or resolution of Collatz is claimed here.
