# Syracuse valuation cylinders: exact affine lifting lemma

Date: 2026-10-25

For a positive valuation word a_0,...,a_{r-1}, define A_0=0, A_{j+1}=A_j+a_j and C_0=0, C_{j+1}=3 C_j + 2^{A_j}. Along the corresponding orbit, 2^{A_j} n_j = 3^j n_0 + C_j.

The exact valuation condition at step j is 3 n_j + 1 congruent to 2^{a_j} modulo 2^{a_j+1}. Multiplying by 2^{A_j} and using the affine identity gives the pulled-back congruence

3^{j+1} n_0 + C_{j+1} congruent to 2^{A_{j+1}} modulo 2^{A_{j+1}+1}.

The coefficient 3^{j+1} is odd, hence invertible modulo every power of two. Thus the new exact valuation condition specifies one residue class modulo 2^{A_{j+1}+1}.

Compatibility with the preceding cylinder follows by reducing the new congruence modulo 2^{A_j+1}. Its right side vanishes modulo that lower power. From the previous condition 3^j n_0+C_j congruent to 2^{A_j} modulo 2^{A_j+1}, multiply by 3 and add 2^{A_j}; the resulting left side is 3^{j+1}n_0+C_{j+1}, and its right side is 4*2^{A_j}, which vanishes modulo 2^{A_j+1}. Therefore the new residue class lifts the old one.

## Formalization target

1. Prove the pulled-back congruence using C_{j+1}=3C_j+2^{A_j}.
2. Prove uniqueness of solutions to u*n+v congruent to w modulo 2^k when u is odd.
3. Prove reduction compatibility with the preceding cylinder.
4. Inductively show a realizable finite exact-valuation word determines one residue class modulo 2^{A_r+1}.
5. Count odd classes to obtain conditional cylinder density 2^{-A_r}.

The exact valuation must retain non-divisibility at the next power; divisibility alone is insufficient. This is a formalization reduction, not yet a Lean-checked theorem. The finite cylinder-density statement does not imply global Collatz descent, and a measure-zero exceptional set may still contain positive integers.
