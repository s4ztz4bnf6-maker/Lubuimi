# Exact 2-adic inverse branches for odd Syracuse — 2026-10-26

## Purpose and status
This note develops exact structural lemmas, not a proof of Collatz. It separates a useful continuous 2-adic coding from the missing Archimedean descent statement.

Let Z₂ be the 2-adic integers and let Z₂^odd={y∈Z₂ : y≡1 mod 2}. For each integer a≥1 define U_a={x∈Z₂ : v₂(3x+1)=a}. The exceptional point x_* = -1/3 ∈ Z₂ has 3x_*+1=0 and is outside every U_a.

## Exact branch characterization
For a≥1, U_a is a single residue class modulo 2^(a+1): it is the unique class x mod 2^(a+1) satisfying 3x+1 ≡ 2^a (mod 2^(a+1)). Reason: 3 is invertible modulo every power of 2, so the congruence has exactly one residue solution. That solution is odd and has valuation exactly a.

Define T_a:U_a→Z₂^odd by T_a(x)=(3x+1)/2^a. This is well-defined and continuous on U_a. It is bijective, with inverse S_a(y)=(2^a y−1)/3, for y∈Z₂^odd. Indeed 2^a y−1 is odd, division by the 2-adic unit 3 preserves oddness, and 3S_a(y)+1=2^a y, whose valuation is exactly a.

For y,z∈Z₂^odd, S_a(y)−S_a(z)=(2^a/3)(y−z), so |S_a(y)−S_a(z)|₂=2^(−a)|y−z|₂. Thus each inverse branch is a strict 2-adic contraction. This is an exact theorem from the metric and algebra, not a numerical observation.

## Corrected exact affine formula for a finite valuation word
Fix positive integers a₀,…,a_{N−1}, let A=Σᵢ aᵢ, and suppose an integer orbit follows exactly these valuations: n_{i+1}=(3n_i+1)/2^{aᵢ}, for 0≤i<N. Define prefix sums p₀=0 and p_j=Σ_{i<j}aᵢ. Then the correct identity is

    3^N n₀ = 2^A n_N − Σ_{j=0}^{N−1} 3^(N−1−j) 2^(p_j).

The power of 3 is in reverse order. This indexing is essential: for N=2 the subtracted sum must be 3+2^a₀, not 1+3·2^a₀.

Proof by induction: N=1 is 3n₀=2^(a₀)n₁−1. For the induction step, use 3n₀=2^(a₀)n₁−1 and apply the length-(N−1) identity to the orbit starting at n₁. Multiplication by 2^(a₀) shifts every prefix exponent by a₀; the extra −3^(N−1) term supplies the first term in the reversed-power sum. Equivalently, this can be proved by expanding the recurrence 3n_i=2^(a_i)n_{i+1}−1 and collecting each constant term.

Consequently,

    2^A n_N ≡ Σ_{j=0}^{N−1}3^(N−1−j) 2^(p_j) (mod 3^N).

Since 2^A is invertible modulo 3^N, the word determines one residue class for n_N modulo 3^N. This arithmetic constraint complements the 2-adic cylinder modulus: valuation data controls a residue class at a power of 2 on the starting side and a residue class at a power of 3 on the terminal side.

**Audit correction:** an earlier version of this note incorrectly used 3^j instead of 3^(N−1−j). The N=2 hand-check exposes the error. The formula and all dependent congruences have been corrected here. This is exactly why recurrence-level boundary cases must be checked before a formalization is treated as evidence.

## Exact Archimedean drift identity: the bridge we can state, but not yet close
Rearranging the affine identity gives the exact positive-integer recurrence over N odd-only steps:

    n_N = (3^N n₀ + C)/2^A,
    C = Σ_{j=0}^{N−1} 3^(N−1−j) 2^(p_j).

Taking ordinary real logarithms is legitimate because n₀,n_N,C are positive. It yields

    log(n_N/n₀)
      = N log 3 − A log 2 + log(1 + C/(3^N n₀)).

This is the exact bridge between the discrete valuation sum A and ordinary size. It isolates the correction term instead of pretending that the 2-adic contraction itself controls ordinary magnitude.

Consequently, a block is a strict Archimedean descent block if and only if

    A log 2 > N log 3 + log(1 + C/(3^N n₀)).

This condition is exact but depends on the actual start n₀ and the valuation-word correction C. The simpler average condition A/N > log₂(3) is not by itself sufficient for a block to descend, because the positive correction term can outweigh the negative linear drift.

There is also a useful universal upper bound on C for any word with aᵢ≥1. Since pⱼ≤A−(N−j),

    C ≤ Σ_{j=0}^{N−1} 3^(N−1−j) 2^(A−N+j)
      = 2^(A−N)(3^N−2^N).

The equality in this bound can occur only when every remaining valuation constraint is simultaneously tight in the corresponding prefix inequalities; use the non-strict bound as written unless strictness is separately established. It follows that

    C/(3^N n₀) ≤ 2^(A−N)(1−(2/3)^N)/(3^N n₀).

This is a computable upper bound on the correction term, but not yet a uniform descent theorem: its right side still depends on A and n₀, and valuation sums can fluctuate. A proof of universal descent would need to show that every orbit that avoids small values eventually satisfies a block inequality strong enough to dominate this correction, or derive a different pointwise contradiction. No such bound has been proved here.

The logarithmic identity suggests a concrete research target: seek a pointwise lower bound on the cumulative valuation excess A log 2−N log 3 along every sufficiently long orbit segment that has not descended, together with an upper bound on the logarithmic correction. Density-one drift estimates do not supply this pointwise statement for every start.

## Exact cycle obstruction from the same identity
If the valuation word belongs to a positive odd Syracuse cycle of length N, then n_N=n₀. The affine identity therefore gives

    (2^A−3^N)n₀ = Σ_{j=0}^{N−1}3^(N−1−j)2^(p_j) =: C.

Every term in C is positive, so C>0. Since n₀>0, a necessary condition for such a cycle is

    2^A > 3^N, equivalently A/N > log₂(3).

This is an exact obstruction, not a sufficient condition: satisfying the inequality does not produce a cycle. For a specified valuation word, there is a stronger finite test: calculate C and D=2^A−3^N, require D>0 and D∣C, and then test n₀=C/D against the exact valuation word and all intermediate positivity/oddness conditions. Divisibility alone is necessary but is not sufficient to certify the word, since the reconstructed orbit must realize each asserted valuation.

### Exact regression vector: the trivial Syracuse cycle
The known odd cycle n₀=1 has N=1, a₀=2, A=2, p₀=0, C=1, D=2²−3=1. Hence D∣C and n₀=C/D=1. Directly, v₂(3·1+1)=v₂(4)=2 and T(1)=1. This is a useful sanity vector for the affine identity, cycle equation, valuation check, and integer divisibility code. It is only a regression test; it supplies no evidence that nontrivial cycles do or do not exist.

### Finite word-filter algorithm (exact integer arithmetic)
For an input word a₀,…,a_{N−1}:
1. Reject unless N>0 and every aᵢ≥1.
2. Compute A and pⱼ by integer addition; compute C=Σ 3^(N−1−j)2^(pⱼ), D=2^A−3^N.
3. Reject a cycle candidate unless D>0 and C mod D=0.
4. Set candidate n₀=C/D; reconstruct nᵢ₊₁=(3nᵢ+1)/2^aᵢ only if each division is exact.
5. At each stage check nᵢ is positive odd and v₂(3nᵢ+1)=aᵢ; finally require n_N=n₀.
All steps are decidable exact arithmetic. The filter is complete for a supplied finite valuation word: if the word is a genuine positive cycle, it passes; a word that passes is a genuine cycle because the reconstruction and every valuation are checked. This is a classifier for each finite word, not a finite algorithm that proves there are no cycles of arbitrary length.

The threshold A/N>log₂(3) is a familiar necessary cycle condition; the value here is its direct integration with the corrected word-dependent integer C. This creates a sound cycle-filtering stage before any expensive search or Lean proof. It does not exclude all possible cycles, and it does not prove that every orbit reaches 1.

## What this gives
- Every finite valuation word determines a composition of inverse branches on odd 2-adics.
- The corresponding 2-adic cylinder has contraction factor 2^(−Σaᵢ).
- The same word imposes the explicit corrected 3^N terminal congruence above.
- The logarithmic drift identity gives an exact ordinary-size criterion for each finite block.
- These constraints are independent formal invariants for future cylinder-intersection and cycle-exclusion work.

## What it does NOT give
2-adic contraction concerns distance in the 2-adic metric, not ordinary size in ℕ. It does not show that positive integer forward orbits decrease, reach 1, or cannot escape to infinity in the ordinary metric. Compactness of Z₂ alone does not create a unique global attracting sink: a compact dynamical system can have many invariant sets and recurrent orbits.

The exact missing bridge would need an additional arithmetic theorem linking these cylinders and congruences to Archimedean magnitude, for example a universal descent bound or a contradiction for every positive integer orbit that never descends. No such theorem is established here. K-theory or general topological-dynamical language cannot replace this missing implication without a specific proven invariant.

## Lean target
Formalize in order:
1. U_a as a congruence class and prove the valuation characterization.
2. Define S_a on odd 2-adics and prove T_a(S_a y)=y and S_a(T_a x)=x.
3. Prove the exact distance identity for 2-adic norms.
4. Prove the corrected finite affine iterate identity by induction on N, testing N=0, 1, 2 explicitly.
5. Derive the corrected terminal congruence modulo 3^N and explicitly prove invertibility of 2^A modulo 3^N.
6. Derive cylinder modulus 2^(Σaᵢ), carefully distinguishing residue-class depth from ordinary-time parity-prefix length.
7. Formalize the exact finite cycle filter and regression vector n=1.
8. Formalize the real logarithmic drift identity only after the integer identity; keep positivity hypotheses explicit.
9. Keep the global Archimedean descent theorem as a separate target; do not infer it from contraction.

## Source-faithful bridge
The accelerated Collatz map D(n)=n/2 for even n and (3n+1)/2 for odd n differs from the odd-only map T by grouping a variable number of D-steps. On a positive odd integer with valuation a, D^a(n)=T(n). On the raw map R(n)=n/2 if even and 3n+1 if odd, R^(a+1)(n)=T(n). These identities should be separately formalized and used for all time-bound conversions.

## Audit requirements
- No sorry, admit, custom axiom, or unchecked external theorem for the structural lemmas.
- Run #print axioms on each exported theorem.
- Verify exact source statement and Lean/Mathlib pin.
- Regression tests are diagnostic only; they are not substitutes for the universal theorem.


## Finite diagnostic tests run on 2026-10-26 (not formal proof)
A local exact-integer Python diagnostic was run over every odd start n₀<2000 and the first eight odd-only Syracuse steps (1,000 starting values, 8,000 orbit prefixes). At each prefix it checked:
- the corrected affine identity exactly;
- the terminal congruence modulo 3^N;
- the bound C ≤ 2^(A−N)(3^N−2^N).

All 8,000 checks passed. This validates the implementation of these identities on the tested range only; it is not a proof of the identities for all N and does not establish global descent. The induction proof above remains the mathematical proof obligation, and the test is only a regression diagnostic.
