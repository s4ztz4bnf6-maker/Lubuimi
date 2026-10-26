# Research update: valuation-word cylinders and signed margins (2026-10-25)

This note records research targets and proof sketches. It does not claim a completed global proof of the Collatz conjecture, nor does it claim the latest candidate lemma has been checked by Lean.

## Accelerated map and affine identity

For positive odd n, define T(n)=(3n+1)/2^{v₂(3n+1)} and a_j=v₂(3n_j+1), where n_{j+1}=T(n_j). Put A_j=∑_{i<j}a_i. Then
2^{A_N} n_N = 3^N n_0 + C_N, with C_0=0 and C_{j+1}=3C_j+2^{A_j}.

The signed margin M_j=2^{A_j}n_j-4·3^j has local correction
M_{j+1}=3M_j+2^{A_j}(2^{a_j}-4).
The correction is negative for a_j=1, zero for a_j=2, and positive for a_j≥3. Thus local positive corrections do not themselves imply global descent.

## Finite valuation words: exact cylinder induction

For a word a₀,…,a_{m−1} of positive exponents, let K=∑aᵢ. The intended theorem is: there is exactly one odd residue class modulo 2^{K+1} whose positive odd representatives realize this exact valuation prefix.

The induction must preserve the *old cylinder*. It is not sufficient to solve the appended affine congruence over all n₀ modulo 2^{K+b+1}: the affine identity alone only encodes a total divisibility condition and must not silently replace the earlier exact-valuation constraints.

Correct nested-lift proof plan:
1. Assume the old word has one cylinder r modulo 2^{K+1}; restrict candidate starts to n₀=r+t·2^{K+1}, with t ranging modulo 2^b.
2. The affine identity gives 2^K n_m=3^m n₀+C_m. Across these lifts, n_m changes by 3^m·t·2, so modulo 2^{b+1} the value of n_m runs through the unique parity-compatible progression as t varies modulo 2^b.
3. The appended exponent b is equivalent to 3n_m+1 ≡ 2^b (mod 2^{b+1}). Since the coefficient 3^{m+1} is odd, exactly one of the 2^b lifts satisfies this congruence. This selects one nested class modulo 2^{K+b+1}.
4. Prove explicitly that the selected lift has n_m odd and the exact valuation b, and that every earlier valuation remains unchanged because the new start is congruent to r modulo 2^{K+1}.
5. Establish uniqueness among all realizers by reducing any realizer modulo 2^{K+1} to the old cylinder, then applying uniqueness of the selected lift.

The algebra in steps 2–3 must be made precise in Lean, including the map t ↦ n_m mod 2^{b+1}, its injectivity/surjectivity on the relevant parity class, and the exact valuation congruence. Do not use the earlier “one congruence gives the new cylinder” sketch as a substitute for this nested argument.

Positive integer representatives exist by adding multiples of the cylinder modulus; separately prove that the chosen representatives keep every intermediate iterate positive and odd.

## Signed weighted decomposition target

Define P_N as the sum of 3^{N−1−j}·2^{A_j}·(2^{a_j}−4) over j with a_j≥3, and D_N as the sum of 3^{N−1−j}·2^{A_j}·(4−2^{a_j}) over j with a_j=1. Then the exact identity sought is
M_N = 3^N M_0 + P_N − D_N,
because the a_j=2 terms vanish. This is bookkeeping, not a bound on P_N−D_N. Any descent proof must establish a uniform orbit-wise inequality, not merely a mean valuation estimate.

## Evidence and limitations

The cylinder theorem and signed-sum decomposition remain proof targets until encoded and checked against the pinned Lean toolchain. A previous local-correction bridge has no confirmed CI result. The global Collatz conjecture remains open in this project: compactness of ℤ₂, a mean multiplier, density-one descent, or finite-word realizability does not imply every positive integer reaches 1.

Independent itinerary reference: https://github.com/sneakyweasel/btlab/blob/main/docs/collatz_itinerary_compatibility.md
Formalization/evidence landscape: https://www.proofatlas.ai/formalizations/
