# Syracuse 2-adic realizability: exact finite-block constraints

Status: research note, not a theorem about global Collatz termination.

## 1. One-step valuation classes

For an integer x and k >= 1,

    v2(3*x + 1) = k

is equivalent (when v2 is defined on the nonzero integer 3*x+1) to

    3*x + 1 ≡ 2^k (mod 2^(k+1)).

Since 3 is a unit modulo 2^(k+1), this determines one residue class for x modulo 2^(k+1):

    x ≡ 3^{-1} * (2^k - 1) (mod 2^(k+1)).

Here the inverse is modular, not the rational number 1/3. The exceptional integer x = -1/3 is not an integer, so it does not arise for integer x; in the 2-adic extension, however, the point -1/3 makes 3*x+1 zero and the valuation-based accelerated map needs special treatment.

## 2. Finite exponent words are constrained

For an accelerated Syracuse block

    n_(j+1) = (3*n_j + 1) / 2^(a_j),
    A_j = sum_{i<j} a_i,

the exact affine identity is

    2^(A_j) * n_j = 3^j * n_0 + C_j,
    C_0 = 0,
    C_(j+1) = 3*C_j + 2^(A_j).

A proposed exponent word (a_0,...,a_(N-1)) is not automatically realizable. At each stage it must satisfy the exact valuation condition

    3*n_j + 1 ≡ 2^(a_j) (mod 2^(a_j+1)),

and the quotient must be an odd positive integer if the accelerated odd-only dynamics is intended. Equivalently, the affine numerator must be divisible by 2^(A_j) and the resulting n_j must meet the required domain conditions at every prefix.

This suggests a proof-producing finite-block checker: it should return either (i) a certified starting residue class and the derived orbit for a word, or (ii) a precise failed prefix constraint. Enumeration alone is not a global proof; a universal theorem would still be needed to bound all realizable words.

## 3. Non-circular descent obligation

The affine identity gives

    n_N < n_0  iff  (2^(A_N) - 3^N) * n_0 > C_N.

Any proposed global descent argument must prove this inequality from the realizability constraints and the hypotheses on n_0. Assuming this inequality, or assuming a sign condition equivalent to it, would be circular.

## 4. Next formalization milestones

1. Formalize the one-step valuation/congruence equivalence for the project's exact definition of v2.
2. Formalize prefix consistency of a finite exponent word.
3. Prove the checker sound: every accepted word yields a genuine finite Syracuse trajectory.
4. Search for counterexamples to candidate universal bounds over all realizable words; report finite searches only as evidence, never as proof of the universal statement.
5. Keep the global Collatz conjecture explicitly open until a non-circular universal argument is kernel-checked.

## 5. Connection to the four-pillar research plan

- Algebraic representation: affine numerator and offset recurrence.
- 2-adic structure: exact residue classes for each valuation.
- Formal assurance: a sound checker and explicit domain hypotheses.
- Empirical/computational work: bounded search can falsify candidate lemmas, but cannot certify universal termination.
