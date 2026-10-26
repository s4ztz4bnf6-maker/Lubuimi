# Dual research update — 2026-10-25

This is a research note, not a claim that either open problem has been solved. It advances the two tracks by isolating a precise next lemma and incorporating current AI/formal-verification evidence without treating it as proof by reputation.

## 1. Syracuse / Collatz: valuation cylinders

For each integer k >= 1, the condition v₂(3x+1)=k is equivalent to 3x+1 ≡ 2ᵏ (mod 2ᵏ⁺¹). Since 3 is invertible modulo 2ᵏ⁺¹, this is one residue class modulo 2ᵏ⁺¹: x ≡ 3⁻¹(2ᵏ−1) (mod 2ᵏ⁺¹). Here 3⁻¹ means the modular inverse, not integer division. The congruence itself implies x is odd.

This gives an exact finite cylinder for a single accelerated valuation. It does not prove arbitrary valuation words are realizable: each next valuation must be checked against the affine iterate and the accumulated modulus.

The accelerated map x ↦ (3x+1)/2^{v₂(3x+1)} is not globally continuous on ℤ₂ at x=−1/3, where the valuation is unbounded. The ordinary parity-based Collatz map has a continuous 2-adic extension, but continuity and compactness alone do not imply convergence of integer orbits or create a global attracting sink.

For a finite candidate word a=(a₀,…,a_{N−1}), define Aⱼ=Σᵢ<ⱼ aᵢ and C₀=0, Cⱼ₊₁=3Cⱼ+2^{Aⱼ}. Then 2^{Aⱼ}nⱼ=3ʲn₀+Cⱼ. The next formal target is a theorem that takes a starting residue class and verifies each prescribed valuation exactly (divisible by 2^{aⱼ} but not 2^{aⱼ+1}). Keep this separate from the global claim that a block descends. The margin M_N=2^{A_N}n₀−(3^N n₀+C_N)=2^{A_N}(n₀−n_N), so M_N>0 is exactly descent, not an independent estimate.

Suggested artifact: a finite checker producing (aⱼ,Aⱼ,Cⱼ, residue constraints, exact margin) for actual trajectories, with Lean theorems validating certificates. Computation may discover a lemma; only a proof for all stated inputs closes a universal obligation.

## 2. Erdős–Selfridge / BBMST: ratio-free local mass accounting

The immediate goal remains formalizing the paper's actual finite hyperplane/incidence model, not strengthening a generic scalar inequality and labelling it as the geometric theorem.

For finite S, projection π:S→I, and fiber Fᵢ={x∈S | π(x)=i}, define each mass as a finite sum over a specified subset of Fᵢ. First prove disjointness; prove coverage (or name the remainder); derive the exact local sum identity; handle zero-total fibers separately using nonnegativity; divide by a fiber total only after proving it strictly positive; then sum source-specific local bounds over the finite image of π.

This is a proof architecture, not yet the BBMST inequality. The geometric definitions and hypotheses must be encoded literally. The upstream sieve_criterion interface accepts a degenerate empty delta list; the audit witness demonstrates a specification flaw in that interface, not a counterexample to the original conjecture. The project-specific sieve axioms remain unproved.

For every imported statement from the 2021 square-free-moduli argument, record: paper equation/lemma; exact objects; Lean declaration; hypotheses; dependencies; transitive #print axioms output; CI run and commit. The unrestricted odd-moduli problem must not be described as solved by a result restricted to square-free moduli.

## 3. Formal verification: stricter evidence levels

- Exploration: computation, model-generated argument, or candidate proof.
- Compiled: pinned toolchain compiled the exact commit.
- Kernel-checked: exact proposition has a proof term accepted by the checker.
- Axiom-audited: transitive dependencies were inspected and project-specific assumptions listed.
- Source-aligned: formal statement compared line-by-line with the intended theorem.
- Independently reviewed: another reviewer checked mathematics and scope.
- Solved: all obligations for the original problem are discharged and evidence archived.

A successful Lean build is necessary evidence for a formalization but does not establish source alignment or remove hypotheses. Independent kernels are defense in depth, not a guarantee that every implementation, compiler, platform, and shared dependency is bug-free.

## 4. External frontier and workflow implications

- Quanta's 3 August 2026 report describes AI-assisted Erdős advances, including the unit-distance counterexample, while documenting a false novelty claim caused by missing prior literature. Literature search is therefore a mandatory gate before asserting novelty.
- The MAA reports that the unit-distance construction used a high-dimensional lattice and projection to the plane; human work materially improved the exponent. This illustrates representation change, not a license to treat a speculative embedding as proof.
- Thomas Hales's 9 October 2026 guest post on Terence Tao's blog discusses Lean soundness bugs, independent kernels, and foundational consistency questions. This supports adversarial checking and transparent foundations.
- ProofAtlas presents routes, failed attempts, exact Lean statements, and publication status. Treat displayed claims as candidates until source, theorem statement, imports, and status are inspected.
- OpenAI's public mathematical release is reported as 722 manuscripts across 372 result families, with Lean artifacts for many but not all. Corpus size is not a correctness measure; each item needs its own evidence audit.

## 5. Immediate acceptance gates

### Syracuse
1. Pin branch, commit, Lean toolchain, and dependencies.
2. Prove and test the single-valuation congruence lemma.
3. Build a finite-word certificate checker with exact modular arithmetic.
4. Separate arbitrary words, realizable words, and genuine orbit descent in theorem names and hypotheses.
5. Run #print axioms on the exported theorem and transitive dependencies.

### BBMST
1. Preserve the degenerate witness and immutable upstream pin.
2. Replace generic fiber bookkeeping with source-defined finite geometry.
3. Prove partition and zero-mass cases before any ratio.
4. Map each local inequality to the exact published hypothesis.
5. Keep sieve_criterion and sf_sieve_lt_one marked as open assumptions until proofs are supplied.

No universal Collatz proof or unrestricted Erdős–Selfridge proof is claimed in this update.
