# Syracuse residue-lift proof plan (research note, 2026-10-23)

## Status discipline
This note is a proof plan, not a theorem. The existing CI run 39907916630 had passed the main library and several transition files, but was still running at the exact valuation characterization step when inspected. No global Collatz result is claimed.

## Literature connection and its limit
Bernstein–Lagarias, The 3x+1 Conjugacy Map, Canadian J. Math. 48 (1996), 1154–1169, constructs a 2-adic conjugacy with the shift and studies finite reductions modulo powers of two. This supports a finite-residue/symbolic-dynamics viewpoint: finite parity/valuation data should be treated as congruence cylinders. The conjugacy is a 2-adic dynamical statement, however, and does not imply that a positive integer orbit descends or reaches 1. That gap must remain explicit.

## Exact local condition
For positive odd m and a ≥ 1,
v₂(3m+1)=a iff 2^a | (3m+1) and 2^(a+1) ∤ (3m+1).
The second clause is essential: divisibility by 2^a alone admits valuation words with larger exponents.

For a word a₀,…,aₖ₋₁, define Sⱼ=∑ᵢ₍<ⱼ₎aᵢ. The proposed finite-cylinder invariant is: among odd residues modulo 2^(Sⱼ+1), exactly one residue class realizes the first j valuations. This should be established by induction, with the base j=0 being the unique odd class modulo 2.

## Lift step: obligation checklist
Assume the prefix word fixes one odd class r modulo 2^(S+1). Its lifts to modulus 2^(S+a+1) are represented by
r + t·2^(S+1), 0 ≤ t < 2^a.
The next odd iterate is an affine rational expression in the start value, but after multiplying by the accumulated power of two the numerator is an integer affine function. The coefficient of t must be computed exactly and shown odd modulo 2^(a+1) after normalizing by the previous 2-adic factor. Then t ↦ normalized numerator modulo 2^(a+1) is a bijection on the appropriate parity class, so exactly one t satisfies congruence 2^a mod 2^(a+1). Do not handwave this as “odd coefficient implies unique lift” until the modulus and the affine state normalization are stated and proved.

Potential alternative formalization: avoid recursively defining rational Syracuse iterates. Define the numerator recurrence N₀=n, Nⱼ₊₁=3Nⱼ+2^(Sⱼ) (with the appropriate convention validated against 2^(Sⱼ)nⱼ = Nⱼ), and prove the recurrence/valuation condition jointly. This keeps the proof in ℕ and makes divisibility lemmas easier to reuse.

## Why this is not yet descent
The exact affine identity
2^(Sₖ)nₖ = 3^k n₀ + Cₖ
reduces strict descent to
(2^(Sₖ)−3^k)n₀ > Cₖ.
A realizable valuation word does not ensure this inequality. The next research target is to derive constraints on Cₖ from the congruence cylinder, and then test whether those constraints force a useful lower bound on Sₖ for all positive starts. If not, search for explicit realized words with positive affine margin obstruction; that would falsify this descent route, not Collatz.

## CI / audit checklist
- Verify the exact valuation iff lemma compiles.
- Add a finite small-depth exhaustive test (e.g. all positive exponent words with small total weight) comparing the predicted unique residue class against direct arithmetic.
- Prove the lift bijection as its own theorem.
- Print axioms for each core lemma; do not interpret the axiom report as a substitute for checking the statement is the intended one.
- Separate finite-word realizability, affine descent, and eventual termination as three distinct claims.
