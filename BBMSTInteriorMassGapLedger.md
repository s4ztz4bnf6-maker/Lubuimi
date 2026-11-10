# Source-faithful BBMST interior-mass bridge: gap ledger

Date: 2026-10-26

## Source and target

The target is the proof of the Erdős–Selfridge square-free-moduli theorem in Balister, Bollobás, Morris, Sahasrabudhe and Tiba (2021), not merely a generic probability inequality. The source geometry must justify every `R_k/N_k/B_k` object, the definition of `alpha_k`, and the positive interior contribution. Original source records:
- https://digitalcommons.memphis.edu/facpubs/5868/
- https://people.maths.ox.ac.uk/balister/Erdos-Selfridge.html

## What the current Lean geometry module really proves

`BBMSTHyperplaneFiberGeometry.lean` models a hyperplane as fixed-coordinate data `h : (Fin n ⊕ Unit) → Option α`. If the last coordinate is fixed to a value a, the compatible last-coordinate fiber has at most one point. A finite union of such fibers has size at most the number of hyperplanes.

The strict-fraction lemma then assumes both:
- the number of indexed fibers is smaller than the coordinate set, and
- the union is nonempty.

Under these hypotheses it proves the union's relative size lies strictly between zero and one. This is a valid local combinatorial fact, but neither hypothesis may be silently identified with the BBMST source condition. The actual proof still has to derive them from the source's geometric construction and the relevant prefix.

## Current repair

The first CI run for the explicit coordinate model failed because the filtered finite set needed classical decidability. The model now marks the finite fiber definition noncomputable and opens `classical` in the theorem proof. Commit: 8fd933e8befe0e85f09164f0c357b2b5f7fda05c. This is a repair awaiting CI, not a claimed successful build.

## Crucial next derivation

For each prefix x, let `I_x` be the *source-defined* set of newly exposed hyperplanes that contain at least one extension of x and fix the final coordinate. Let `F_x` be the union of compatible final-coordinate values.

The required proof obligations are:

1. **Fiber bound:** derive `|F_x| ≤ |I_x|` from the source hyperplane definitions and nonparallelity, not from a pre-assumed singleton-fiber model.
2. **Strict upper bound:** derive `|F_x| < |S_k|` from the exact source condition excluding a newly exposed codimension-one hyperplane and the distinctness/nonparallelity constraints. If the source does not imply this in a given case, isolate that case rather than assume the inequality.
3. **Strict lower bound on positive-mass prefixes:** show that the set of prefixes with positive probability and `F_x ≠ ∅` has positive total mass. A single nonempty fiber somewhere is not enough.
4. **Weighted interior mass:** apply the existing finite weighted identity
   `Σ w_i α_i(1-α_i) = μ(1-μ) - Σ w_i(α_i-μ)^2`
   only after the geometric lower bound has been established. The mean alone does not force positive interior mass; endpoint masses α=0 and α=1 can have mean 1/2 and zero interior term.
5. **Source update:** connect the derived bound to the exact second-moment update in Lemma 2.1 (equations (3)–(6)), preserving the source's finite probability space and indexing.

## New proof architecture: a three-level certificate

Keep the geometry separate from the mass algebra:
- Level A: a source-faithful finite coordinate model for hyperplanes and their intersections with product fibers.
- Level B: a theorem `exists_positive_mass_proper_fiber` whose hypotheses are precisely the source conditions, with no `I.card < S.card` or `F_x.Nonempty` assumption inserted as a surrogate conclusion.
- Level C: the existing algebraic weighted-mass theorem consumes the Level B witness and produces a quantitative positive interior contribution.

This decomposition makes the key open obligation visible and prevents an algebraic lemma from being mistaken for the global geometric theorem.

## Audit gate

- Check current Actions after commit 8fd933e; do not infer success from a source edit.
- Run `#print axioms` on the exact endpoint and all geometric bridge declarations.
- Search the full transitive dependency closure for `sorry`, `sorryAx`, custom axioms, and vacuous definitions.
- Audit theorem statements against the paper's actual hypotheses, not just the local Lean signatures.
