# Syracuse next-step proof obligations — 2026-10-25

## Status boundary
The calculations below are elementary consequences of the stated exact transitions. They are not a proof of global Collatz termination. Any Lean formalization must use the actual project definitions and pinned toolchain.

## Exact cylinder classification: proof plan
For an odd start n and a fixed positive valuation word a_0,...,a_{r-1}, put A_j = sum_{i<j} a_i. Each transition is
2^(a_j) n_(j+1) = 3 n_j + 1,
with exactness requiring v2(3 n_j+1)=a_j. The intended cylinder statement is that starts realizing a fixed word form either an empty set or one odd residue class modulo 2^(A_r+1), with relative density 2^(-A_r) among odd integers when the word is realizable.

The proof must establish both directions:
- Necessity: induction on j propagates the residue constraint modulo 2^(A_j+1).
- Sufficiency: the residue class forces each valuation to be exactly a_j, not merely at least a_j. This needs the oddness/nondivisibility condition at the next power of two.
- Compatibility: explicitly prove the residue class is nonempty for every positive valuation word, or retain a realizability premise until that lemma is established. Do not silently assume it.
- Density: count the class among odd residues modulo 2^(A_r+1), not among all integers without adjusting the denominator.

## Exact affine block identity
Given certified transitions and A_(j+1)=A_j+a_j, set C_0=0 and C_(j+1)=3 C_j + 2^(A_j). Induction yields
2^(A_r) n_r = 3^r n_0 + C_r.
Then n_r<n_0 iff 3^r n_0+C_r < 2^(A_r)n_0.

Because a_j >= 1, A_j <= A_r-(r-j), so
C_r / 2^(A_r) <= sum_(k=0)^(r-1) 3^k/2^(k+1) = (3/2)^r - 1.
This is a useful local bound but does not by itself give descent on every orbit.

## Density is not orbit-uniformity
Under the finite-prefix cylinder law, the geometric model P(a=k)=2^(-k) has mean 2 and variance 2, so Var(A_r)=2r. Chebyshev implies
P(A_r < lambda*r) <= 2/(r(2-lambda)^2), for 1 < lambda < 2.
This is a density estimate for fixed-length prefixes. It does not exclude a single exceptional orbit or prove recurrent favorable blocks along every orbit.

## Next formal milestones
1. Prove cylinder necessity and sufficiency from exact v2 conditions.
2. Prove finite-prefix counting independently of any infinite independence assertion.
3. Formalize the affine identity from transition certificates.
4. Keep block descent conditional until an orbit-uniform recurrence/descent lemma is proved.
5. Run the pinned Lean toolchain and inspect transitive axioms and statement fidelity.
