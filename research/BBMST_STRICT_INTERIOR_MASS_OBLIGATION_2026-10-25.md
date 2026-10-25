# BBMST positivity: strict-interior mass is the actual missing premise

Date: 2026-10-25

## Algebraic identity

For a finite index set with weights p_i≥0 and sum p_i=1, values α_i∈[0,1], mean μ=Σ p_i α_i, define Q=Σ p_i α_i(1−α_i) and V=Σ p_i(α_i−μ)^2. Then Q = μ(1−μ) − V. This follows by expanding Q=Σp_iα_i−Σp_iα_i² and V=Σp_iα_i²−μ².

## Audit consequence

Normalization and 0≤α_i≤1 do not imply Q>0. Counterexample: two equal weights and α=(0,1) gives μ=1/2, V=1/4, Q=0. Therefore a proof of strict positivity must establish additional source-derived geometry, for example an index i with p_i>0 and 0<α_i<1, a strict variance bound V<μ(1−μ), or another BBMST lemma that excludes the boundary-only configuration.

The generic finite-sum lemma weighted_interior_mass_positive is valid only after the positive-mass strict-interior witness has actually been proved from the paper's definitions. It cannot replace that geometric argument.

## Required source-fidelity split

Keep three propositions separate: (1) the algebraic identity Q=μ(1−μ)−V; (2) strict positivity under an explicit interior-witness hypothesis; (3) the original BBMST theorem under its exact hypotheses and complete small-prime / large-prime argument.

A successful Lean build of (1) or (2) does not establish (3). Likewise, an external finite certificate for a stated threshold or square-free-modulus variant cannot be silently promoted to the unrestricted target theorem.

## Current audit blockers

The transitive axiom report for the main theorem previously listed custom assumptions sf_sieve_lt_one and sieve_criterion alongside standard Lean axioms. These are proof obligations, not acceptable terminal assumptions for the requested axiom-free result. Next code work should trace their exact declarations and replace each with a theorem proved from the source-faithful hypotheses, not merely rename or weaken the target.

## Scope status

This is an audit specification, not a new proof of the BBMST theorem. It intentionally records the counterexample to the tempting but invalid inference that normalized nonnegative weights alone force strict interior mass.
