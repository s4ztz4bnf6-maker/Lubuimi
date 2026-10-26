# Syracuse valuation words: residue-class theorem and formalization target

Date: 2026-10-26
Status: mathematical derivation and Lean specification; not yet formalized or CI-checked.

## 1. Exact finite-word affine formula

Fix a finite exponent word a_0,...,a_{N-1} in natural numbers. Define
\[
A_0=0,\qquad A_{k+1}=A_k+a_k,
\]
and define the integer accumulator
\[
C_0=n_0,\qquad C_{k+1}=3C_k+2^{A_k}.
\]
If a sequence of natural states satisfies the prescribed step equations
\[
2^{a_k}n_{k+1}=3n_k+1,
\]
then induction gives
\[
2^{A_k}n_k=C_k
\]
for every prefix k. Expanding the recurrence gives the closed form
\[
C_N=3^N n_0+S_N,\qquad
S_N=\sum_{j=0}^{N-1}3^{N-1-j}2^{A_j}.
\]
This is a finite affine identity, not a claim that arbitrary words are realized by an odd Syracuse orbit.

## 2. Unique residue class for finite-prefix integrality

For a fixed word, the terminal divisibility condition is
\[
3^N n_0+S_N\equiv0\pmod{2^{A_N}}.
\]
Since 3 is invertible modulo every power of 2, so is 3^N. Consequently there is exactly one residue class
\[
n_0\equiv - (3^N)^{-1}S_N\pmod{2^{A_N}}
\]
satisfying the terminal congruence. This is a genuine finite-word rigidity statement.

Moreover, the terminal condition implies all prefix divisibilities. For k≤N, the recurrence expansion yields
\[
C_N\equiv 3^{N-k}C_k\pmod{2^{A_k}},
\]
because each later summand has exponent A_j≥A_k. If 2^{A_N} divides C_N, then 2^{A_k} divides C_N; since 3^{N-k} is odd, it follows that 2^{A_k} divides C_k. Thus the unique terminal residue class makes all reconstructed prefix states integral.

Boundary: if A_N=0, the modulus is 1 and the statement is trivial. For odd Syracuse starts, exact valuation words have stronger constraints: each quotient n_{k+1} must be odd, equivalently
\[
2^{a_k}\mid 3n_k+1,\qquad 2^{a_k+1}\nmid 3n_k+1.
\]
The unique integrality class alone does not prove these exact valuation constraints, positivity, or that the word is an actual accelerated Syracuse orbit.

## 3. Lean formalization route

Prefer a finite word a : Fin N → Nat (or a List Nat with explicit length) rather than an unconstrained infinite function for the first theorem. Define prefix sums and S_N recursively. Prove in order:

1. affine_accumulator_closed_form: the recurrence for C_N expands to the displayed finite sum.
2. pow_three_isUnit_mod_two_pow: multiplication by 3^N is invertible in ZMod (2 ^ A_N).
3. terminal_congruence_unique: for fixed word, exactly one n₀ : ZMod (2 ^ A_N) solves 3^N*n₀ + S_N = 0.
4. terminal_divisibility_implies_prefix_divisibility: derive C_N ≡ 3^(N-k) C_k mod 2^(A_k), using monotonicity of A.
5. Only after these, formalize exact valuations using Nat.factorization or divisibility plus nondivisibility, and prove the orbit-specific conditions.

For the modular uniqueness lemma, ZMod (2 ^ A_N) is the likely clean interface; avoid division in ℕ. A proof that relies only on an integer equation and terminal divisibility should remain separate from any theorem asserting Collatz convergence.

## 4. Why this is useful

The exponent word determines a unique 2-adic cylinder of starting residues for finite-prefix integrality. The next mathematical question is not whether the affine formula exists, but which words satisfy all exact-valuation, parity, and positivity constraints, and whether infinite compatible cylinders contain positive integer starts. Compactness of the 2-adic inverse limit alone does not establish convergence of positive integer orbits.

## Acceptance standard

No claim of Lean verification until the lemma is committed to the project, compiled on the pinned Lean/Mathlib toolchain, and included in an axiom audit. The current project file SyracuseAffineCore.lean proves the conditional finite-prefix affine identity; the closed form, modular uniqueness, and prefix-divisibility consequences above are not yet part of that checked file.
