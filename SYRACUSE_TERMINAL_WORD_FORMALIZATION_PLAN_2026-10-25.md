# Syracuse finite-word criterion: formal proof plan and dependency boundary

Status: proof specification for a finite arithmetic lemma, not a Collatz proof.

## Setup

Fix a positive odd start n₀ and positive exponents a₀,…,a_{N−1}. Define
A₀ = 0, A_{j+1} = A_j + a_j,
C₀ = 0, C_{j+1} = 3C_j + 2^{A_j},
and X_j = 3^j n₀ + C_j.

The affine recurrence gives X_{j+1} = 3X_j + 2^{A_j}. If the exponent word is realized by the accelerated odd Syracuse map, then X_j = 2^{A_j} n_j with n_j odd at every prefix.

## Terminal-congruence candidate

The proposed finite-word characterization is
X_N ≡ 2^{A_N} (mod 2^{A_N+1}).

Equivalently, X_N has exact 2-adic valuation A_N. This is not merely a divisibility condition: the residue modulo the next power of two must be nonzero and exact.

### Why a terminal condition can encode every prefix

For each j ≤ N, expand
X_N = 3^{N-j} X_j + 2^{A_j} R_j,
where
R_j = Σ_{k=j}^{N-1} 3^{N-1-k} 2^{A_k-A_j},
with R_N = 0. For j < N, the first summand in R_j is odd and all later summands are even, so R_j is odd.

If X_N ≡ 2^{A_N} mod 2^{A_N+1}, then for j < N we also have X_N ≡ 0 mod 2^{A_j+1}, since A_N > A_j. Reducing the expansion modulo 2^{A_j+1}, and using that 3^{N-j} and R_j are odd, forces
X_j ≡ 2^{A_j} mod 2^{A_j+1}.
Thus every prefix numerator has exact valuation A_j. The converse follows from X_N = 2^{A_N}n_N with n_N odd.

This argument is a mathematical proof sketch; its finite-sum expansion, oddness of R_j, and modular implications still need formal Lean lemmas. In particular, the Lean statement must link the resulting prefix quotients to the actual recursive Syracuse transition, rather than merely to an abstract affine sequence.

## Lean milestone sequence

1. Define a finite-word record carrying a₀,…,a_{N−1}, A, C, and the recurrence invariants.
2. Prove X_{j+1} = 3X_j + 2^{A_j} and the prefix/suffix expansion.
3. Prove R_j is odd when j < N and all exponents are positive.
4. Prove terminal exact residue implies exact residue at every prefix.
5. Prove equivalence between prefix exact residues and a certified accelerated Syracuse trajectory with the specified exponents.
6. Run a transitive axiom audit on the final equivalence.

## Global limitation

Even a complete proof of this finite-word characterization would not prove Collatz termination. It characterizes which finite exponent words are realizable. A global proof still needs a theorem showing that every positive odd starting value eventually satisfies the exact offset-margin condition
3^N n₀ + C_N < 2^{A_N} n₀,
or another argument that forces termination. No such universal inequality is established here.

## Rejected shortcut

Long finite runs of exponent one exist: n₀ = 2^{L+1}q − 1 (L,q positive) gives L initial steps with exact exponent one. Thus no lower bound on the next exponent that grows solely with the length of the preceding run can be valid. Any global argument must use additional weighted information from the whole admissible word.
