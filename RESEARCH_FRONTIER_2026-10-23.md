# Research frontier and proof obligations — 2026-10-23

This note records a source-aware research update for the two formalization tracks. It deliberately distinguishes published theorems, local Lean lemmas, conditional results, and open obligations.

## 1. Syracuse / Collatz

### Current project result

The branch `collatz/offset-margin-roadmap-2026-10-23` formalizes the affine identity for a certified accelerated-odd orbit:
`2^(A_N) * n_N = 3^N * n_0 + C_N`,
where `C_0 = 0` and `C_(j+1) = 3*C_j + 2^(A_j)`. The canonical offset is now defined by that recurrence and shown unique. The recurrence gives the lower bound `3^N ≤ 2*C_N + 1`, but this is not a descent bound: a lower bound on the positive correction term does not prove the strict upper margin needed for descent.

Exact remaining obligation:
`3^N*n_0 + C_N < 2^(A_N)*n_0`.
A useful next formal target is not another generic lower bound on `C_N`; it is a trajectory-realizability theorem for valuation words `a_j = v₂(3*n_j+1)`, together with a bound on their cumulative sum `A_N = Σ a_j` strong enough to force the margin for at least one block. Any result stated for arbitrary exponent words must be kept separate from results for genuine Syracuse trajectories.

### External frontier and caution

- The October 2026 Collatz/Syracuse conditional-cycle formalization at https://collatz-lab.org/ publishes an erratum: its large-cycle hypothesis `DerivedLargeKBound` was assumed rather than derived. This is a concrete warning that an axiom-clean Lean theorem may still be conditional on a hypothesis equivalent to the desired conclusion.
- Barina's computational verification covers all starts below approximately `2^71`; this is a strong finite result, not a proof for all integers: https://pcbarina.fit.vut.cz/
- Recent positive-density results (for example, https://hexagonmath.org/2610.00249v1) establish convergence for a quantitatively positive, though extremely sparse, subset of inputs. Positive density does not exclude exceptional divergent orbits or nontrivial cycles and cannot be promoted to the universal conjecture without an additional argument.
- An independently maintained Lean repository explicitly marks its global convergence theorems as conditional on open hypotheses: https://qgithub.com/shuanat/collatz-lean4

### Acceptance gates

1. Compile the current branch on its pinned Lean/Mathlib toolchain.
2. Audit `#print axioms` for the exact theorem and transitive imports.
3. Add a closed-form finite-sum theorem for `canonicalOffset` only with a kernel-checked proof.
4. Separate three claims: arithmetic identity, realizability of valuation words, and existence of a positive descent margin. The first is formalized; the latter two remain the research bottleneck.

## 2. Erdős–Selfridge / BBMST

### Current project result

The branch `audit/lean4-erdos-selfridge` contains an endpoint-safe rational mass-splitting core and concrete finite-fiber partition lemmas. The new zero-mass lemma shows that if all point masses are nonnegative and a fiber has total mass zero, every point in that fiber has mass zero. This avoids division by zero and makes the degenerate case explicit.

This is foundational bookkeeping, not the geometric probability argument in Lemma 2.1 of Balister–Bollobás–Morris–Sahasrabudhe–Tiba. The main theorem in `ErdosSelfridge_v17_fixed.lean` still has admitted sieve dependencies `sf_sieve_lt_one` and `sieve_criterion`; this track is not yet axiom-free.

### Source boundary

The 2021 paper proves the Erdős–Selfridge conclusion under the additional hypothesis that the distinct moduli are square-free; it does not settle the unrestricted odd-moduli problem. Official publication record: https://digitalcommons.memphis.edu/facpubs/5868/ . The unrestricted problem remains open; see https://mathdb.com/p/336016/erdos-s-odd-covering-problem .

### Next theorem, with no hidden ratios

Construct the finite box and hyperplane incidence relation from the source definitions. For each actual projection fiber, define its total, removed, and surviving mass as explicit finite sums over disjoint exhaustive subsets. Prove:
- disjointness and coverage within every fiber;
- exact local mass partition;
- zero-mass fiber annihilation without division;
- the source-specific local inequalities from the published hypotheses;
- the global inequality by summing over the image of the projection.

Do not introduce a conditional ratio until its denominator is proved strictly positive. Do not replace the paper's hyperplane geometry by a free coefficient function and then call the resulting envelope inequality Lemma 2.1.

### Acceptance gates

1. Wait for CI on commit `5051c92f8da6ca7456da405e22b89a9855dad3c6`; do not describe the new zero-mass theorem as compiled until that run completes successfully.
2. Build a source-to-Lean mapping table for each inequality of Lemma 2.1.
3. Implement actual finite geometry and source-derived measure before attempting the main sieve step.
4. Keep a transitive axiom report for `ErdosSelfridge_v17_fixed`; the admitted sieve dependencies must be discharged, not renamed.

## Shared epistemic rule

A successful Lean build proves that the encoded statement follows from the imported definitions, hypotheses, and axioms. It does not prove that those hypotheses match the intended mathematical claim. For each milestone, archive (i) exact statement, (ii) source mapping, (iii) toolchain and commit, (iv) CI result, and (v) transitive axiom list.
