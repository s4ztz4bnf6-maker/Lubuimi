# BBMST audit: variance identity and the missing geometric inequality

Date: 2026-10-25

## Algebraic identity

Let `p_i >= 0`, `sum_i p_i = 1`, `0 <= alpha_i <= 1`, and define
`mu = sum_i p_i alpha_i`,
`V = sum_i p_i (alpha_i - mu)^2`,
`Q = sum_i p_i alpha_i (1-alpha_i)`.
Then
`Q = mu(1-mu) - V`.

Proof: expand `Q = sum p_i alpha_i - sum p_i alpha_i^2 = mu - sum p_i alpha_i^2`. Also
`V = sum p_i alpha_i^2 - 2 mu sum p_i alpha_i + mu^2 sum p_i = sum p_i alpha_i^2 - mu^2`.
Substitution yields the identity.

## Consequence: the mean cannot supply the desired lower bound

The endpoint example `p=(1/2,1/2)`, `alpha=(0,1)` has `mu=1/2`, `V=1/4), and `Q=0`. Thus a proof that only controls the mean of the conditional proportions cannot establish a positive lower bound on the averaged quantity Q. It must also control their dispersion (or prove a direct geometric constraint that implies such control).

This is not a defect in the elementary identity. It identifies the exact missing information: a bound such as `V <= mu(1-mu)-epsilon` would imply `Q >= epsilon`; without a variance bound, the claim is false in general.

## Formalization direction

The existing `BBMSTFiberMassCore.lean` already formalizes endpoint-safe finite mass conservation, concrete fibers induced by a label map, and weighted-fiber upper/lower bounds. The next algebraic interface should express the variance identity over finite rational weights, with normalization and endpoint handling explicit. That theorem is purely algebraic.

The hard theorem remains geometric and source-dependent: derive the needed dispersion bound from the actual BBMST probability spaces/hyperplanes and their definitions of `R_k,N_k,B_k,alpha_k`, rather than postulating an abstract variance hypothesis. Do not introduce free predicates such as `isParallel` or `codimOne` to simulate the source argument.

## Statement fidelity blocker

Erdős Problem #7 asks whether a distinct covering system with all moduli odd exists. The BBMST result rules out the square-free odd case, not automatically the unrestricted odd-moduli case. The project's current `CoveringSystem` does not impose square-freeness, and `sieve_criterion` plus `sf_sieve_lt_one` remain admitted assumptions in the final dependency chain. The final theorem must either narrow its hypotheses to match the proven source theorem or supply a genuinely stronger proof.

## Status boundary

The current CI run for the audited BBMST module completed successfully, including the endpoint-safe fiber-mass core. This verifies the existing Lean targets only. Neither the variance identity above nor the source-derived geometric dispersion bound is claimed to have been added as a new Lean theorem in this commit; the unrestricted Erdős–Selfridge problem remains open in the cited problem database.
