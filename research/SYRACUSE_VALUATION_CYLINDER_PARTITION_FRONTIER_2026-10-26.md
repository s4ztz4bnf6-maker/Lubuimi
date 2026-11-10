# Syracuse valuation-cylinder frontier: exact next layer (2026-10-26)

## Status and scope

This is a research note, not a proof of the Collatz conjecture. It records an exact finite-cylinder identity and the obstruction to turning the currently verified local lemmas into descent. It deliberately makes no claim that a compiler or CI run has been performed for this note.

## 1. Exact algebra behind the current branch

For odd n, define S(n)=(3n+1)/2^{v₂(3n+1)}. If a prescribed finite valuation word is a₀,…,aᵣ₋₁ and Aⱼ=Σᵢ<ⱼ aᵢ, then repeated substitution gives

2^{Aⱼ} nⱼ = 3ʲ n₀ + cⱼ, with c₀=0 and cⱼ₊₁=3cⱼ+2^{Aⱼ}.

This recurrence is exact whenever the valuation assumptions defining the word hold. It yields the cylinder congruence
3ʳ n₀+cᵣ ≡ 0 (mod 2^{Aᵣ}),
together with the exactness exclusions that the numerator at each earlier stage is not divisible by one additional power of two. The congruence alone is not enough: omitting those exclusions merges distinct valuation cylinders.

## 2. What the current residue calculations actually say

On the branch collatz/valuation-cylinders-2026-10-26, the earlier exact calculation for n=4m+3 gives S(n)=6m+5. If m is odd, the next numerator is 2(9m+8), with 9m+8 odd, so S²(4m+3)=9m+8>4m+3. This is a verified non-descent cylinder, not an exceptional detail to average away. If m=4j+2, the second valuation is exactly two and the second output is 18j+13; if m=8k+4, it is exactly three and the output is 18k+11; if m=16j, it is exactly four and the output is 18j+1. These are residue-local identities only.

## 3. A sharper next lemma target: cylinder partition, not a universal one-step descent

For each depth A, define a cylinder as a residue class modulo 2^A plus the list of exactness exclusions. The next finite theorem worth formalizing is:

**Cylinder partition theorem (finite depth).** For every odd starting value and every fixed depth r, the exact valuation words of length r partition the odd inputs into pairwise disjoint cylinders; on each cylinder the r-step accelerated iterate is the affine rational expression
nᵣ=(3ʳ n₀+cᵣ)/2^{Aᵣ},
and its integrality and oddness follow from the exactness conditions.

The proof is by induction on r, with the induction invariant carrying both the affine numerator and the excluded higher divisibility. This theorem is useful infrastructure but is not itself a global descent theorem.

## 4. Why the continuous/2-adic lift does not automatically solve the integer problem

The valuation v₂(3x+1) is locally constant on suitable 2-adic residue cylinders where its value is fixed. But the accelerated Syracuse map is not globally continuous on all of Z₂ as a single map with an unbounded, varying exponent: the valuation partition has infinitely many cylinders accumulating at the 2-adic point −1/3, where 3x+1=0. A continuous extension of the unaccelerated map x↦3x+1 modulo powers of two is straightforward; division by a variable 2^{v₂} is the singular operation. Any proposed 2-adic flow must explicitly handle this boundary and prove that its topology controls ordinary integer size. Compactness alone gives neither integer descent nor convergence to the integer cycle.

## 5. Computational falsification protocol

Before attempting the cylinder-partition theorem in Lean, generate all valuation words up to depth r≤8 and modulus 2^A for a small bounded A, and compare:
1. direct iteration of S;
2. the recurrence for cⱼ;
3. the exactness exclusions at each stage;
4. disjointness and coverage of the enumerated residue classes.

Store a counterexample with its full word, residue, modulus, and first failed equality if any. A successful finite sweep is regression evidence only, not a proof for all depths.

## 6. Formal integrity checklist

- Keep the odd-domain condition explicit at every iterate.
- Never infer exact valuation from divisibility alone; include the next-power nondivisibility.
- Keep Nat division and integer/rational affine identities separate until divisibility is proved.
- Run the project's pinned Lean toolchain, inspect errors, then run #print axioms on the theorem and all helper lemmas.
- Report CI/compiler status only from an actual run. Do not promote local residue identities to the global conjecture.

## Research conclusion

The concrete advance is a better formal target: prove the exact finite valuation-cylinder partition with exclusion data, then investigate whether the resulting cylinder tree admits a uniform integer-size Lyapunov bound. That uniform bound is the genuine missing bridge; neither 2-adic compactness nor average drift supplies it by itself.
