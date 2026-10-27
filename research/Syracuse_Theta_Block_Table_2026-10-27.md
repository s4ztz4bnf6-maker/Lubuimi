# Syracuse block threshold table: exact Theta values and boundary case
Date: 2026-10-27
Status: exact arithmetic checked by direct calculation; this note is a research record, not a global Collatz proof.

## Definitions

For a prescribed valuation word a=(a_0,...,a_{L-1}), let A_0=0, A_{j+1}=A_j+a_j and
C_L = sum_{j=0}^{L-1} 3^(L-1-j) 2^(A_j).
The exact block identity is
2^(A_L) x_L = 3^L x_0 + C_L.

When D_L := 2^(A_L)-3^L > 0, define
R_L := C_L / D_L,
Theta_L := C_L / (D_L x_0),
M_L := 1 - Theta_L.
Then x_L < x_0 iff Theta_L < 1, and
1 - x_L/x_0 = (D_L/2^(A_L)) M_L.
When D_L <= 0, C_L>0 forces x_L>x_0, so Theta_L is not used as an abstiegs ratio.

## Exact five-word table

All listed words were checked against the accelerated Syracuse orbit at every step, including the exact valuations v_2(3x_i+1)=a_i. Each x_0 is the least positive representative of the compatible end-congruence class.

| word | x_0 | x_L | A_L | C_L | D_L | R_L | Theta_L | M_L | actual relative drop 1-x_L/x_0 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| [1,3,1,2,1] | 275 | 263 | 8 | 503 | 13 | 503/13 | 503/3575 ≈ 0.1406993007 | 3072/3575 ≈ 0.8593006993 | 12/275 ≈ 0.04363636 |
| [1,3,1,3,1] | 147 | 71 | 9 | 631 | 269 | 631/269 | 631/39543 ≈ 0.0159573123 | 38912/39543 ≈ 0.9840426877 | 76/147 ≈ 0.51700680 |
| [1,2,3,1,2] | 139 | 67 | 9 | 527 | 269 | 527/269 | 527/37391 ≈ 0.0140943008 | 36864/37391 ≈ 0.9859056992 | 72/139 ≈ 0.51798561 |
| [2,3,1,2,1] | 209 | 101 | 9 | 925 | 269 | 925/269 | 925/56221 ≈ 0.0164529268 | 55296/56221 ≈ 0.9835470732 | 108/209 ≈ 0.51674641 |
| [3,1,2,1,3] | 1181 | 281 | 10 | 761 | 781 | 761/781 | 761/922361 ≈ 0.0008250566 | 921600/922361 ≈ 0.9991749434 | 900/1181 ≈ 0.76206605 |

Important interpretation: M_L is the normalized distance from the threshold, not the actual relative drop. The exact relation has the additional lever D_L/2^(A_L). For example, the first word has M≈0.8593 but only a 4.36% actual relative drop because D/2^A=13/256.

## Boundary / non-descent example: the fixed point x=1

Take the valuation word a=[2,2]. The orbit is 1 -> 1 -> 1 and each valuation is exactly 2.
Here L=2, A_L=4, C_L=7, D_L=2^4-3^2=7.
The master identity is 16*1 = 9*1 + 7.
Thus R_L=7/7=1 and Theta_L=1/1=1, so M_L=0 and x_L=x_0. This is the equality boundary, not a strict descent.
More generally, the all-2 word of length L is realized by the fixed orbit x_i=1; its Theta is exactly 1. It therefore gives a clean boundary test for the criterion.

For a word with D_L<=0, e.g. a=[2,1], L=2, A_L=3, C_L=7 and D_L=8-9=-1. Its least compatible positive start is x_0=9, with orbit 9 -> 7 -> 11 and valuations [2,1]. Since D_L<0, the block must expand; the threshold ratio R_L/Theta_L is not defined as a positive descent threshold.

## Next research obligations

1. Extend enumeration to all words in {1,2,3}^L for L up to a declared cutoff, recording exact intermediate valuations, D_L sign, Theta when defined, and x_L/x_0.
2. Keep the full compatible residue class separate from the end-congruence alone: intermediate valuation checks are mandatory.
3. Search for a compositional inequality that controls consecutive blocks, rather than assuming each block descends.
4. Do not interpret finite pattern frequencies as a universal theorem. The global Syracuse/Collatz convergence problem remains open.
