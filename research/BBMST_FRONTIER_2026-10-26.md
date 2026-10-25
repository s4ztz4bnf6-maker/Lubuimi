# BBMST frontier update — 2026-10-26

## Evidence update

The latest GitHub Actions run attached to the BBMST audit head `0ad99bf7ef957ee1ecfb6b2d59b3df5d55a1e3e9` completed successfully (run 40243940410, workflow run #171). It compiled the audited main file, `BBMSTFiberMassCore`, `BBMSTProbabilityInterface`, `BBMSTStrictInteriorMass`, and `BBMSTProperFiberInterior`. This is build evidence for those modules only, not evidence that the global Erdős–Selfridge claim has been proved or that all dependencies have passed a separate axiom audit.

## Exact mathematical frontier

The algebraic core now separates three logically distinct tasks:

1. **Finite partition identity.** For a finite sample Ω, a label map ℓ:Ω→I, and weights w(x), summing weights inside fibers and then over attained labels recovers the total weight. This is exact finite bookkeeping.
2. **Strict positivity criterion.** For nonnegative fiber masses m_i and proportions α_i in [0,1],
   Σ_i α_i(1-α_i)m_i > 0
   iff some included fiber has m_i>0 and 0<α_i<1. The quantitative version yields a δ^3 lower bound if one fiber satisfies m_i≥δ and δ≤α_i≤1-δ.
3. **Unproved source-specific bridge.** The actual BBMST geometric/probabilistic construction must produce such an interior fiber, with the required uniformity and exact normalizations. The algebraic lemmas do not supply this.

The new exact uncovered-fraction identity in PR #20 repairs a missing interface between a finite incidence deficit and uncovered mass. It does not itself provide a positive deficit.

## Next theorem target: derive, do not postulate, the interior witness

Do not add a free hypothesis such as `∃ i, δ ≤ mass i ∧ δ ≤ α i ∧ α i ≤ 1-δ` to the final theorem. Instead isolate a source-faithful geometric lemma with inputs copied from the paper's finite probability space, incidence/hyperplane definitions, and normalization. Its output should be either:

- a concrete δ and an attained fiber satisfying the three inequalities; or
- a counterexample to the proposed uniform witness under the stated hypotheses, forcing the theorem statement or proof route to be revised.

Required sub-audits:

- Match each Lean object to the paper's actual finite sample, fiber, and conditional proportion.
- Check empty samples and zero denominators before any ratio is introduced.
- Keep endpoint cases α=0 and α=1 explicit.
- Run a transitive axiom/declaration audit on the *final theorem*, not only the helper files; a passing compile does not replace this.
- Keep `sf_sieve_lt_one` and `sieve_criterion` visible until genuinely proved or removed by a mathematically justified reduction.

## Research-method consequence

The AI-assisted Erdős literature shows why prior-work checks and statement alignment must precede a “solved” label: even an apparently convincing AI solution can duplicate a result already in the literature. For this project, record the source theorem, exact hypotheses, exact Lean proposition, compiler evidence, and axiom profile as separate artifacts.

## Status boundary

Known: latest recorded build passed for the listed modules.

Not established: the paper-derived uniform interior-fiber witness, the required global geometric/moment bound, elimination of all admitted sieve assumptions, or the unrestricted conjecture.
