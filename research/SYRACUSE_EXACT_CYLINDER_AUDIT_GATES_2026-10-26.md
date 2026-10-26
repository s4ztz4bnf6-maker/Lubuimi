# Syracuse exact-cylinder audit: formalization gates and independent checks

Date: 2026-10-26

## Current algebraic interface

The repository's SyracuseAffineCore.lean proves a general finite-prefix affine identity from the assumed step equations. It is conditional algebra; it does not prove that a prescribed exponent word is realizable.

For a positive exponent word a_0,...,a_(N-1), set A_0=0, A_(k+1)=A_k+a_k and C_0=n, C_(k+1)=3*C_k+2^A_k. Then

C_N = 3^N*n + sum_(j=0)^(N-1) 3^(N-1-j)*2^A_j.

The terminal condition C_N = 2^A_N modulo 2^(A_N+1) determines exactly one residue class for n modulo 2^(A_N+1), since 3^N is invertible modulo a power of two.

## Independent executable regression

File: research/SYRACUSE_EXACT_CYLINDER_RESIDUE_REGRESSION_2026-10-26.py

The script was executed independently with Python. It checked 340 words (length 1 through 4, each exponent 1 through 4), solved the terminal congruence exactly using integer modular inverses, and checked exact prefix valuations on eight representatives per word. All checks passed; the largest tested modulus was 131072.

This is finite regression evidence. It does not prove the general cylinder theorem, and it does not prove global convergence.

## Exact mass identity

For fixed word length N and total exponent A, there are binomial(A-1,N-1) positive compositions and each cylinder has density 2^(-(A+1)), assuming the exact-cylinder theorem. Therefore

sum_(A=N)^infinity binomial(A-1,N-1) * 2^(-(A+1)) = 1/2.

This follows from the standard generating function and is a mathematical identity independent of the finite script. The script at research/SYRACUSE_CYLINDER_MASS_CHECK_2026-10-26.py checks finite rational instances only.

## Next formal Lean obligations

1. State the terminal congruence and prove uniqueness of its residue class modulo 2^(A+1).
2. Prove the general prefix-valuation implication with every positivity and exactness hypothesis explicit.
3. Connect the affine recurrence to the accelerated Syracuse step without circular assumptions.
4. Formalize the composition-count generating-function identity separately.
5. Keep all density results distinct from universal descent. A density-one theorem can leave a density-zero exceptional set.
6. For adversarial trust, pin toolchain versions and use a separately implemented proof checker where practical; do not equate a green CI run with a complete soundness audit.

## 2-adic caution

The ordinary Collatz map has finite-prefix behavior determined by finite 2-adic residue information. For the accelerated map, v_2(3*x+1) is unbounded across 2-adic inputs and the point x=-1/3 requires special treatment. A global continuous self-map on all of Z_2 should not be asserted without a precise domain and definition at that point.
