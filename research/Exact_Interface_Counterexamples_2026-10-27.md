# Exact falsification tests for the two global proof interfaces

Date: 2026-10-27
Status: rigorous counterexamples to overly weak interfaces; not counterexamples to either original conjecture.

## Collatz: natural density is not contracted by one inverse step
Let T(n)=n/2 for even n and T(n)=3n+1 for odd n. Set S={m≥1 : m≡1 (mod 3)}. Its natural density is 1/3.

For every odd n, T(n)=3n+1≡1 (mod 3), so every odd positive integer lies in T⁻¹(S). For even n=2m, T(n)=m, and T(n)∈S exactly when m≡1 (mod 3), equivalently n≡2 (mod 6). Thus
  T⁻¹(S) = {n odd} ∪ {n≡2 (mod 6)}.

The two sets are disjoint, with densities 1/2 and 1/6. Hence d(T⁻¹(S))=2/3, twice d(S). This exact example disproves any proposed universal inequality d(T⁻¹(S))≤c d(S) with c<2 for arbitrary density sets; in particular, inverse iteration is not automatically a density contraction. It does not disprove a special estimate for the structured eventual-barrier sets, but shows that such an estimate must exploit their extra orbit structure.

## BBMST: the abstract moment interface has no uniform positive gap
For each integer n≥2, take n equally weighted fibres pᵢ=1/n and αᵢ=1/n. Then pᵢ≥0, Σpᵢ=1 and 0≤αᵢ≤1, but
  Γₙ = Σᵢ pᵢ αᵢ(1−αᵢ) = (1/n)(1−1/n) → 0.

Therefore normalization and the interval constraints alone cannot imply Γ≥δ for any universal δ>0. Nor can they imply a uniform positive mass of fibres bounded away from both endpoints. This is an exact rational family, not a numerical search.

This is not a counterexample to the original BBMST theorem: the family has not been shown to satisfy the source's geometric/hyperplane constraints. It pinpoints why the missing proof must use those constraints in an essential way.

## Consequence for the next proof attempt
Do not pursue (i) a general density-contraction argument for arbitrary sets or (ii) a moment-gap theorem using only normalized weights and 0≤α≤1. Both interfaces are now explicitly falsified. Collatz needs a special distribution theorem for the dynamically defined eventual-barrier set; BBMST needs a source-faithful geometric inequality stronger than the abstract moment axioms.