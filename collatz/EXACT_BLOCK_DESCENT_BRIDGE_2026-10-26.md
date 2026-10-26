# Collatz: exact block descent criterion and missing uniform bridge
Date: 2026-10-26

## Status
This advances the valuation-cylinder line by isolating the exact arithmetic condition for a realized odd-only Syracuse block to descend. It is a finite-block theorem, not a proof of universal Collatz. No Lean build or CI run is claimed.

## 1. Exact identity
Let odd positive integers satisfy n_(i+1)=(3 n_i+1)/2^a_i for 0<=i<N, where a_i=v_2(3n_i+1)>=1. Put A=sum_i a_i, p_j=sum_(i<j) a_i, and
C=sum_(j=0)^(N-1) 3^(N-1-j) 2^(p_j)>0.
Repeated substitution gives
2^A n_N = 3^N n_0 + C.
This follows by induction on N: each additive +1 term contributes one summand to C. The proof needs no logarithms or approximations.

Therefore the exact descent criterion is
n_N<n_0 iff (2^A-3^N)n_0>C.
This is sharper than the average-valuation test. A log drift condition A log 2 > N log 3 is not sufficient by itself because C is positive.

The terminal congruence is 2^A n_N = C (mod 3^N). Every exponent in a realized word must be the exact valuation, not merely a positive integer. Formally, require 2^a_i divides 3n_i+1 and 2^(a_i+1) does not.

## 2. Why the elementary correction bound does not close the problem
Since p_j<=A-(N-j), one obtains C<=2^(A-N)(3^N-2^N). This is a valid coarse bound but does not close descent: it discards the correlation among starting value n_0, the realized valuation word, and C. Treating arbitrary positive exponent words as realized words is a proof gap.

## 3. A two-obligation bridge
For any proposed family of blocks, prove both:

(U) Uniform descent margin: (2^A-3^N)n_0 >= C+D for some D>0, or an explicit block-dependent positive margin, for every covered realized block.

(R) Global coverage: every positive odd starting value has a block in the covered family, or belongs to a separately controlled exceptional class. An infinite branch cannot be ignored.

(U) implies strict descent on covered blocks; (R) prevents an unexamined infinite valuation-cylinder branch from being mistaken for a proof. Neither obligation follows from 2-adic contraction.

A plausible research target is a lower bound on n_0 conditional on a long valuation prefix, combined with an upper bound on C conditioned on the same prefix. The bounds must preserve the correlation well enough to imply the exact integer inequality.

## 4. 2-adic scope
For each a>=1, v_2(3x+1)=a specifies one residue class modulo 2^(a+1). The inverse branch S_a(y)=(2^a y-1)/3 acts only on the appropriate congruence class; its 2-adic distance scaling is local. Compactness of Z_2 does not imply convergence in the ordinary order on positive integers. A continuous map on a compact space need not have all orbits converge to one fixed point. The slogan 'compactness gives a global sink' is invalid without an additional theorem bridging 2-adic topology and Archimedean size.

## 5. Lean plan (not yet implemented or built)
Create an independent SyracuseBlockDescent.lean:
1. Define finite exponent lists and partial sums.
2. Define the correction C by a recurrence and prove its closed form.
3. Prove the affine identity by induction, keeping the central statement in Nat or Int and avoiding division.
4. Prove the exact integer block_descends_iff theorem.
5. Separately encode exact valuations of the realized iterates.
6. Audit dependencies and statement fidelity; pin patched Lean/mathlib and cross-check with an independent kernel when feasible.
Do not introduce global descent as an axiom.

## Verdict
Established algebraically: the finite block identity and exact strict descent criterion. Not established: a uniform margin for all odd starts, global coverage of valuation-cylinder branches, or universal convergence. The key separation is between the integer descent inequality and the global branch-coverage theorem; both remain necessary.

## 8. Exact realized counterexample to the average-only descent criterion

A finite exact-integer search found a realized block starting at n_0=165 for which the average valuation exceeds log_2(3), yet the block does not descend. The 17 exponents are

(4,1,1,1,1,2,2,1,2,1,1,2,1,1,1,2,3).

Their sum is A=27, N=17, and
A/N = 27/17 = 1.588235... > log_2(3) = 1.584962....

The actual endpoint is n_17=167, so it has increased rather than decreased. The exact correction is C=1,106,233,681, whereas
(2^A-3^N)n_0 = 837,798,225.
Thus the exact descent inequality fails by
(2^A-3^N)n_0-C = -268,435,456.

This is a concrete realized counterexample to the *claim that average valuation alone guarantees descent on every finite block*. It is not a counterexample to Collatz. It demonstrates why the additive correction and actual start value cannot be dropped from the proof obligation. The values were calculated with exact integer arithmetic; no Lean proof or formal build is claimed.
