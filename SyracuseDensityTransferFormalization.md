# Syracuse: formal density transfer and the universal-exception gap

Date: 2026-10-26
Branch: `collatz/valuation-cylinders-2026-10-26`

## Purpose and status

This note separates three claims that must not be conflated:

1. exact finite-cylinder counts for valuation prefixes;
2. transfer from those counts to a zero-natural-density exceptional set;
3. the still-open universal claim that every positive starting integer crosses the surplus threshold.

The first is elementary arithmetic. The second follows from finite-horizon exponential tails and a careful upper-density comparison; it does **not** require the strong law. The third does not follow from either of the first two.

## Definitions

For odd positive starts, define the accelerated map
`T(n)=(3n+1)/2^{v_2(3n+1)}`, valuations `a_i=v₂(3n_i+1)≥1`, cumulative valuation `A_N=Σ_{i<N}a_i`, and surplus `S_N=5A_N-9N`.

Let `Bad_N` be the set of odd positive starts whose first `N` valuations satisfy `S_N<0`, equivalently `A_N<9N/5`. Let `E` be the set of odd positive starts for which `S_N<0` for every `N≥1`. Then `E ⊆ Bad_N` for every fixed `N`.

## Exact cylinder count

Fix a positive word `a=(a₀,…,a_{N-1})`, and put `A=Σaᵢ`. The successive exact valuation constraints determine one compatible odd residue class modulo `2^(A+1)`. (This must be proved from the triangular congruences, using that powers of 3 are invertible modulo powers of 2, and that the exact valuation at step i fixes the next required binary digit.) Among odd integers up to X, the count in this residue class is
`X/2^(A+1)+O(1)`; the count of all odd integers up to X is `X/2+O(1)`. Thus the relative natural density is exactly `2^(-A)=Πᵢ2^(-aᵢ)`.

For a fixed N, `Bad_N` is a **finite union** of such cylinders: if `Σaᵢ<9N/5` and every `aᵢ≥1`, then every coordinate is bounded by `aᵢ<9N/5`. Distinct valuation words define disjoint cylinders. Therefore
`d_odd(Bad_N)=Σ_{a₀,…,a_{N-1}≥1, Σaᵢ<9N/5} 2^(-Σaᵢ)`,
which is exactly the probability `P(A_N<9N/5)` for independent geometric variables with `P(a=k)=2^(-k)`.

## Transfer to the exceptional set: the missing quantifier step

For every X and every N,
`|E ∩ [1,X] ∩ Odd| ≤ |Bad_N ∩ [1,X] ∩ Odd|`.
Divide by the number of odd positive integers ≤ X and take `limsup_{X→∞}`. Since the right-hand set has a natural relative density,
`overline d_odd(E) ≤ d_odd(Bad_N)`
for each fixed N. Chernoff's inequality gives
`d_odd(Bad_N) ≤ c^N`,
where
`c=(9/10)(9/8)^(4/5)<1`.
Hence `overline d_odd(E)≤c^N` for every N, and taking `N→∞` yields `overline d_odd(E)=0`. Since upper density is nonnegative, the exceptional set has relative natural density zero among odd positive integers.

This is the full transfer argument. Crucial point: the exceptional set is contained in **each** finite-horizon bad set, not merely in their union. It is therefore valid to bound its upper density by every finite-horizon density and then send the horizon to infinity. One must not interchange limits without this set-inclusion argument.

## Chernoff calculation

For a geometric valuation `a`,
`E[e^(-t a)]=e^(-t)/(2-e^(-t))`.
For `t>0`,
`P(A_N<9N/5) ≤ [e^(9t/5) E(e^(-ta))]^N = [e^(4t/5)/(2-e^(-t))]^N`.
Set `e^(-t)=8/9`; the base becomes `(9/10)(9/8)^(4/5)<1`. A formal proof can avoid irrational powers by raising the desired inequality to the fifth power and using rational arithmetic:
`c^5=(9/10)^5(9/8)^4<1`.

## Lean formalization plan

The formalization should be split into small declarations, with no measure-theoretic theorem silently standing in for a counting argument:

1. **Valuation word / cylinder arithmetic**
   - Define a finite word as `Fin N → ℕ`, with each entry positive.
   - Define its total exponent and its cylinder predicate on odd starts.
   - Prove the cylinder predicate is equivalent to one residue class modulo `2^(A+1)`; keep the exact-valuation step explicit.
   - Prove the count of a residue class in `Finset.range X` differs from `X / modulus` by a bounded error, then derive relative density along odd integers.
2. **Finite horizon decomposition**
   - Define the finite set of admissible bad words using the sum threshold.
   - Prove coordinate boundedness from the threshold, so the indexing set is finite.
   - Prove cylinders for distinct words are disjoint and that `Bad_N` is their union.
   - Sum exact cylinder densities to identify `d_odd(Bad_N)` with the finite geometric probability.
3. **Tail bound**
   - Prove the finite-product generating-function identity by induction.
   - Prove Markov/Chernoff in a finite probability space, or use a finite weighted-sum inequality with the same proof.
   - Establish `c<1` with rational arithmetic after taking fifth powers.
4. **Exceptional-set transfer**
   - Define relative upper density over odd positive integers with denominator `#{n≤X:n odd}`.
   - Prove `E⊆Bad_N` for each N.
   - Apply monotonicity of finite counts, then `limsup`, to obtain `upperDensity(E)≤density(Bad_N)`.
   - Combine with `≤c^N` for every N and the fact `c^N→0`.
5. **Audit**
   - Keep all declarations axiom-audited; do not use `sorry`, `sorryAx`, or an unproved density interface.
   - A CI pass is evidence that Lean checks the encoded statements, not evidence that the statements match the intended Collatz theorem unless this audit is also done.

## Universal threshold claim: exact remaining obstruction

The density result says only that the set of odd starts never reaching `S_N≥0` has density zero. It does not imply that the set is empty: any nonempty set of integers can have density zero. The finite-word realizability result is an additional warning: no proof can exclude every bad finite valuation word, because every fixed finite positive valuation word is realized by a residue class. A universal proof must use an infinite-orbit compatibility constraint, a stronger descent certificate, or a global arithmetic obstruction that is invisible at any fixed finite prefix.

The current suffix certificate proves descent **conditional** on a suitable valuation surplus condition. What remains is a theorem that every actual positive orbit satisfies such a condition at some time, or a replacement argument proving descent without it. No such theorem is established here, and claiming otherwise would be incorrect.

## Connection to BBMST

The structural analogy is exact only at the level of proof obligations:
- Syracuse: finite cylinder mass is known; a zero-density exceptional set follows; the missing universal step is to eliminate every exceptional orbit.
- BBMST: a proper finite fiber yields a positive local interior term; the missing global step is to derive an appropriate proper fiber with quantitatively sufficient mass from the actual hyperplane geometry and update rule.

In neither project may a qualitative local positivity lemma be promoted to a global positive lower bound without proving the required geometric/mass distribution statement.
