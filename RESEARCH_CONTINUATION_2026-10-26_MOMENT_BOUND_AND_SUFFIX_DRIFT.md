# Research continuation: exact BBMST moment interface and Syracuse suffix-drift certificate
Date: 2026-10-26

This note records two mathematical reductions ready to become Lean lemmas. It does not claim either global problem is solved; neither candidate has yet been compiled in Lean in this repository.

## A. BBMST: reduce the second-moment theorem to one pointwise inequality

### Source and external reconstruction

The published source is Balister, Bollobás, Morris, Sahasrabudhe and Tiba, *The Erdős–Selfridge problem with square-free moduli*, Algebra & Number Theory 15 (2021), 609–626, DOI https://doi.org/10.2140/ant.2021.15.609. Canonical publisher PDF: https://par.nsf.gov/servlets/purl/10300177.

A source-oriented reconstruction at https://erdosproblems.ai/wiki/library/covering_systems/balister_2021_erdos_selfridge_problem_square_free_moduli records the full proof chain, including Lemma 2.1, Theorem 3.1, finite rational certificates, and endpoint conventions. It uses exact Python integer/rational checking for finite certificates; it is not a Lean proof and is not a substitute for this project's formalization. It is valuable as a cross-check of theorem statements and edge cases.

### Exact local inequality

Let 0 ≤ α ≤ 1, 0 < δ < 1, and define the normalized removed-fiber mass
gδ(α) = max(0, (α − δ)/(1 − δ)).
Then
0 ≤ gδ(α) ≤ α, and gδ(α) ≤ α²/[4δ(1 − δ)].

Proof, with endpoints explicit:
- If α ≤ δ, then g = 0, so both bounds follow from nonnegativity of α and positivity of the denominator.
- If α > δ, then g = (α − δ)/(1 − δ). The first bound is equivalent to α − δ ≤ α(1 − δ), i.e. δ(1 − α) ≥ 0.
- For the second bound, multiplying by the positive denominator 4δ(1 − δ) reduces it to
  4δ(α − δ) ≤ α², equivalently (α − 2δ)² ≥ 0.
Thus no probabilistic or geometric assertion is hidden in the key scalar inequality.

For each fiber x, BBMST's update multiplies each removed point's old mass by max(0, (α_k(x) − δ_k)/(α_k(x)(1 − δ_k))). Since the old removed fraction in the fiber is α_k(x), the total removed mass of that fiber is exactly its old fiber mass times gδ(α_k(x)). Consequently, summing over fibers gives the source bounds
P_k(B_k) ≤ M_k^(1), and P_k(B_k) ≤ M_k^(2)/[4δ_k(1 − δ_k)],
provided the source definitions of stage measure and moments are formalized and zero-mass/endpoint cases are treated faithfully. Taking the minimum yields the removed-mass estimate used by the sieve.

### Lean task decomposition

1. Prove the scalar lemma over ℚ, with assumptions 0 ≤ α ≤ 1 and 0 < δ < 1.
2. Define α from finite cardinalities, prove 0 ≤ α ≤ 1, and establish that α = 0 means the removed fiber is empty and α = 1 means its complement is empty.
3. Prove the fiber-level mass identity. Do not cancel α at α = 0; define the updated pointwise density by a branch that is never evaluated on an empty removed set.
4. Sum the scalar bound against actual previous fiber masses to recover the two moment bounds.
5. Only then prove all of BBMST Lemma 2.1 and the downstream stage induction.

This is a concrete bridge beyond the current BBMSTFiberMassCore.lean, which proves mass-split algebra but does not define the evolving measure or establish Lemma 2.1. Algebraic-geometric language is not needed for this scalar step; any later transversality claim must prove a precise finite-fiber hypothesis rather than assume a proper removed subset exists.

## B. Syracuse: a suffix-drift criterion that controls the affine correction term

### Existing exact recurrence

For an actual odd Syracuse block 2^(a_j) n_(j+1) = 3 n_j + 1, with A_0 = 0 and A_(j+1) = A_j + a_j, the repository's finite_prefix_affine_identity gives
2^(A_N) n_N = 3^N n_0 + C_N,
where C_N = sum over 0 ≤ j < N of 3^(N−1−j) 2^(A_j).
The exact descent criterion is
n_N < n_0 iff C_N < (2^(A_N) − 3^N)n_0.
The positive difference alone is not enough; the correction sum must also be controlled.

### New finite-block sufficient condition

Assume N ≥ 1 and every suffix of the realized valuation block has average valuation at least 9/5:
5(A_N − A_j) ≥ 9(N − j) for every 0 ≤ j < N.
Then for every starting odd integer n_0 ≥ 3, the block ends strictly below its start: n_N < n_0.

Proof:
1. Put q = 17/5. Since (17/5)^5 < 2^9, the suffix hypothesis implies 2^(A_N−A_j) ≥ q^(N−j).
2. Normalize the correction sum by 2^(A_N), and put i = N−j:
C_N / 2^(A_N) = sum over j < N of 3^(N−1−j) / 2^(A_N−A_j)
≤ sum over i = 1 to N of 3^(i−1)/q^i
= [1 − (3/q)^N]/(q − 3).
3. The j = 0 case gives 2^(A_N) ≥ q^N, so 3^N/2^(A_N) ≤ (3/q)^N. Therefore
(2^(A_N) − 3^N)/2^(A_N) ≥ 1 − (3/q)^N.
Combining the estimates gives
C_N ≤ [1/(q − 3)](2^(A_N) − 3^N) = (5/2)(2^(A_N) − 3^N).
4. Since n_0 ≥ 3 > 5/2, C_N < (2^(A_N) − 3^N)n_0, hence descent.

The strict inequality in step 1 follows from (17/5)^5 = 1,419,857/3125 < 512 = 2^9. All block hypotheses are integer inequalities; the analytic estimate is a finite geometric sum. The argument does not assume arbitrary exponent words are realizable.

### Why this is useful and what remains open

This gives a reusable local certificate for an actual valuation block whose every suffix has sufficient 2-adic valuation drift. It is stronger than merely checking A_N > N log₂ 3, because it controls every suffix and therefore the full additive correction C_N.

It is not a global Collatz proof. The missing theorem is that every odd orbit from n > 1 must contain such a suffix-drift block (or another well-founded descent certificate). The condition may fail indefinitely along an orbit; this note does not show otherwise.

Next formal tasks:
1. Prove the correction-sum expansion by induction.
2. Prove the geometric-series bound using the rational majorant q = 17/5, avoiding real logarithms.
3. Prove the integer descent equivalence and the certificate theorem.
4. Separately study realized valuation cylinders and whether a combinatorial counting theorem forces a certificate in every orbit.

## C. Audit and provenance boundary

- No Lean source was changed in this research note.
- No Lean build, #print axioms, independent checker, or CI was run for the candidate lemmas.
- The published BBMST article and external Erdős Problems reconstruction are research references, not dependencies of a kernel-checked theorem in this repository.
- The supplied sources on AI mathematics and Lean reliability motivate statement-fidelity and independent-checking gates; they do not establish either mathematical result.
