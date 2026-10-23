# Syracuse valuation-word research note — 2026-10-23

## Exact algebraic spine

For a certified odd trajectory with exponents a_j >= 1 and partial sums A_0=0, A_{j+1}=A_j+a_j, the exact affine identity is

  2^(A_N) x_N = 3^N x_0 + C_N,
  C_N = sum_{j<N} 3^(N-1-j) 2^(A_j).

The identity is formal algebra, not a descent theorem. A strict decrease is equivalent to C_N < (2^(A_N)-3^N) x_0. This separates two burdens: the exponent surplus 2^(A_N)-3^N must be positive, and it must dominate C_N/x_0. Proving only A_N log 2 > N log 3 handles the first burden, not the second.

## Proposed next formal object: realizable valuation words

Do not quantify over arbitrary words and then infer orbit behavior. Define a finite word certificate containing positive exponents a_j; partial sums A_j; odd states x_j; exact transition equations 2^(a_j) x_(j+1) = 3 x_j + 1; and an exactness witness that x_(j+1) is odd. The word is realizable only when these constraints are all satisfied. The next useful theorem is a congruence characterization of the possible next exponents after a fixed prefix, with modulus growing as 2^(A_N). Any global descent lemma must quantify over these realizable words, not all positive integer sequences.

## Literature caution

The 2026 conditional-cycle Lean project at https://collatz-lab.org/ records an erratum: a strong bound had been assumed rather than derived. Its checked theorem excludes cycles only under explicit hypotheses and up to a finite threshold. This is a methodological warning, not a refutation of conditional formalization.

An October 2026 research page for a valuation-word extremal approach is at https://globalresearchspace.com/space?star=W7170075134; it is a preprint and its claims must be independently verified before use. The safe reusable content is the exact affine-word viewpoint, not any unverified global conclusion.

## Acceptance criteria

1. Every finite-word theorem lists its realizability hypotheses.
2. No statistical drift or density statement is promoted to a pointwise statement.
3. A proposed terminal-surplus bound is checked against explicit finite words and small trajectories.
4. Axiom reports and CI are reported separately from mathematical scope.
