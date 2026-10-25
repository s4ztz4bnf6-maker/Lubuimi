# Dual-track mathematical frontier note (2026-10-25)

Status: research design and exact elementary deductions only. This note does not claim either global conjecture is solved, and no Lean build is asserted here.

## 1. Shared reliability protocol

For each claimed theorem, maintain three independent objects:
1. **Statement contract**: exact definitions, domain, quantifiers, edge cases, and source theorem being represented.
2. **Proof dependency contract**: transitive axiom/dependency report, including all noncomputable choices and imported axioms.
3. **Reproducibility contract**: pinned Lean/mathlib versions, exact commit, compiler output, and independent kernel/checker results.

A kernel-accepted proof only certifies the formal proposition actually stated. It does not repair a mismatch between that proposition and the intended mathematics. Conversely, a source-faithful statement with sorry or an axiom placeholder is not a proof of the source theorem.

## 2. Erdős–Selfridge / BBMST: isolate the missing interfaces

The current ErdosSelfridge_v17_fixed.lean explicitly retains two admitted interfaces:
- sieve_criterion: turns a numerical sieve bound into noncoverage for a generic CoveringSystem;
- sf_sieve_lt_one: asserts parameter existence for every finite list of odd primes.

These are logically separate obligations and should not be merged into one opaque lemma.

### Proposed proof graph

A. **Finite geometry**: define the finite product probability space and the actual hyperplane events from the BBMST source.
B. **Fiber decomposition**: for each fixed coordinate/fiber, define the event masses and prove the elementary identity min(a,b) + max(a,b) = a+b; then prove the source-specific normalization and fiber-sum identity. The elementary min/max identity alone is not the probabilistic theorem.
C. **Moment bound**: encode the source's first/second moment criterion with explicit positivity and denominator hypotheses; prohibit totalized division from silently hiding zero denominators.
D. **Finite certificate**: transcribe the paper's finite parameter certificate and verify every rational inequality exactly.
E. **Tail recurrence**: prove the large-prime recurrence and termination/bound needed to extend the finite certificate.
F. **Arithmetic bridge**: prove the Chinese-remainder correspondence and square-free-modulus hypotheses required by the actual Erdős–Selfridge statement.

### Immediate falsification checks

- Do not quantify over arbitrary odd moduli if the source theorem assumes square-free moduli.
- Do not let List.getD defaults stand in for actual in-range parameters without a length proof.
- For every rational denominator d, prove d ≠ 0 (or the stronger sign condition needed) before division.
- Keep the two placeholder names visible in the final theorem's dependency report until each is genuinely replaced.

### Small proved algebraic kernel

For rational a,b, min a b + max a b = a+b. This is a valid reusable algebraic lemma, but it supplies only the local mass-splitting identity. The next useful target is not a more elaborate algebraic identity: it is a source-faithful definition of the finite probability space and a proof that its fibers partition the sample space and preserve total mass.

## 3. Collatz / accelerated Syracuse: exact residue transition

Use the odd accelerated map T(n) = (3*n+1) / 2^(v₂(3*n+1)) for odd n > 1.

The following residue facts are elementary and should be treated as local transition lemmas, not a global descent proof:

- If n ≡ 1 (mod 4), then 4 divides 3*n+1; hence T(n) ≤ (3*n+1)/4 < n for n > 1.
- If n ≡ 3 (mod 4), then 3*n+1 ≡ 2 (mod 4), so its 2-adic valuation is exactly one and T(n) = (3*n+1)/2. This is larger than n for positive n; therefore the quarter-descent lemma cannot close the other residue class.

This exposes the real bottleneck: prove that the expanding 3 mod 4 transitions cannot persist in a way that defeats later powers-of-two removal. Merely embedding the map in ℤ₂ does not imply convergence to a global sink; the usual 2-adic extension is continuous for the non-accelerated parity map, but 2-adic closeness does not encode ordinary-size descent on positive integers.

### A sharper proof target: realized parity-word cocycle

For an odd orbit segment of length k, let a_j = v₂(3 n_j + 1) and A_k = sum of a_j for j<k. Iterating the exact affine recurrence gives n_k = (3^k n_0 + C_k) / 2^(A_k), where C_k is the positive integer offset obtained by composing the affine maps (it depends on the realized valuation word). This is an identity, not an estimate. The useful global descent condition is 3^k n_0 + C_k < 2^(A_k) n_0, or equivalently n_k < n_0; estimates must control the offset as well as the average valuation.

Research task: formalize the affine composition for finite realized valuation words, prove the identity by induction, then search for a uniform block condition that forces descent. Do not replace the realized word by arbitrary exponents without proving that the word is admissible for an orbit.

## 4. Novelty filter and next actions

A proposed new structure is useful only if it creates a verifiable bridge:
- For BBMST: a typed FiniteProbabilityModel carrying a finite sample type, normalized mass, event predicates, and fiber maps, with lemmas for partition and mass conservation.
- For Syracuse: an AffineOrbitBlock carrying the realized valuation word, offset recurrence, and a certified descent margin. The certificate should distinguish exact identities from conjectural uniform bounds.

Neither structure by itself solves the open problem. The success criterion is that it removes a named gap in the existing proof graph without weakening the target theorem.
