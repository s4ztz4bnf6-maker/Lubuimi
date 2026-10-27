# Research continuation: dual Lean audits (2026-10-26)

This note records the next proof-producing milestones for the two active projects. It is a research plan and mathematical audit, not a claim that either global conjecture has been solved.

## 1. Erdos-Selfridge / BBMST: separate algebra from the global sieve argument

### Immediate target
Keep the finite algebraic core independent of the covering/sieve criterion. Formalize the pointwise identity
  max(a,b) + min(a,b) = a + b
for a linearly ordered additive domain, then lift it only after the finite-index and normalization conventions are explicit.

### Proof-obligation ledger
1. **Finite index domain:** state whether the index type is `Fin n`, a finite set, or a multiset. Avoid converting between them implicitly.
2. **Partition/fiber accounting:** prove that the fibers form a disjoint exhaustive partition before using a sum-over-fibers identity.
3. **Normalization:** prove that the total mass is exactly one (or state the non-unit total mass). Do not infer normalization from a definition that can divide by zero.
4. **Degenerate parameters:** treat empty fibers, zero total mass, and endpoint values such as `α = 0` and `α = 1` explicitly.
5. **Sieve criterion:** the theorem statement must contain all hypotheses used by its proof. A lemma with a free or assumed criterion is not a proof of the source theorem.
6. **Axiom audit:** record `#print axioms` for the final theorem and all helper lemmas. Kernel acceptance is necessary, but source-statement fidelity is a separate obligation.

### Useful invariant
For a finite partition `F : ι → ι → Prop`, the accounting theorem should explicitly assume: (i) every object belongs to exactly one fiber; (ii) fiber masses use the same underlying measure; and (iii) the total mass is finite and any normalization denominator is nonzero.
Only then should `fiber_mass_sum` be derived. The algebraic identity should not depend on the disputed sieve criterion.

## 2. Syracuse / Collatz: distinguish local valuation lemmas from global descent

Use the accelerated odd map T(n) = (3n+1)/2^(v₂(3n+1)), for odd n > 1.

### Immediate target
Make the branches `4 ∣ 3n+1` and `4 ∤ 3n+1` exhaustive and disjoint. In the first branch, prove `v₂(3n+1) ≥ 2` from divisibility, then derive the exact quotient relation. In the second branch, establish the exact valuation `v₂(3n+1)=1` for odd n with `3n+1` even but not divisible by four.

### Critical distinction
A continuous extension of a Collatz-related map to Z₂ does **not** by itself prove descent of positive integers in ordinary absolute value. The 2-adic topology measures divisibility by powers of two, not numerical size. Compactness gives convergent subsequences, not a global real-valued Lyapunov function and not convergence to the integer cycle.

A proposed p-adic or topological argument must therefore supply a bridge lemma: either a well-founded or strictly decreasing invariant on positive odd integers, or a rigorously justified implication from the p-adic statement to ordinary integer descent. Without that bridge, the continuous model is a representation tool, not a Collatz proof.

### Required audit
1. State domain and positivity assumptions for every division.
2. Prove quotient integrality before using natural-number division.
3. Check small odd inputs and residue classes computationally as diagnostics only.
4. Run `#print axioms` transitively on the strongest theorem; separately inspect for `sorry`, custom axioms, unsafe escape hatches, and unpinned dependencies.
5. Treat successful CI as reproducibility evidence, not as evidence that the global conjecture follows from local lemmas.

## 3. Shared Math 2.0 protocol

For each theorem, retain three independent artifacts:
- **Mathematical statement audit:** the formal proposition matches the intended published conjecture.
- **Proof audit:** no gaps, hidden assumptions, or vacuous hypotheses.
- **Trust audit:** pinned Lean/mathlib versions, kernel check, transitive axiom report, and (where feasible) a second independent checker.

The two projects should share this audit protocol, but not share unproved mathematical assumptions. A local lemma can be complete even while the global conjecture remains open.