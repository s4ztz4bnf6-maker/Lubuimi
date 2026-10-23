# BBMST uniform-deficit proof target

Date: 2026-10-23

## Why finite positivity is insufficient

For a finite nonempty sample S and a covered subset P, the exact deficit is |S \\ P| / |S|. One uncovered point gives only 1/|S|. This lower bound is not uniform as |S| grows, so it cannot alone establish a geometric sieve estimate.

## Required theorem shape

The next target must match the published BBMST configuration space and prove a source-derived lower bound for the relevant incidence deficit, with constants and hypotheses obtained from the fiber/hyperplane geometry. Do not add a free epsilon parameter as an assumption and then call the result the paper's estimate.

## Dependency order

1. Define the finite configuration space and exact incidence predicate from the published version.
2. Define each fiber as the actual preimage of a projection label.
3. Prove disjointness and exhaustiveness of removed/retained subsets and mass conservation.
4. State denominator-positivity hypotheses before introducing conditional ratios; zero-mass fibers must be handled separately.
5. Formalize the source's local moment and intersection estimates.
6. Derive the uniform deficit and only then compose the sieve criterion.

The existing generic finite-fiber algebra is reusable infrastructure. It does not prove the geometric premises. Any admitted declarations such as `sf_sieve_lt_one` and `sieve_criterion` remain open obligations.

## Verification boundary

As of the latest check, CI run 40025676268 had completed Lean toolchain/manifest setup and was installing dependencies/cache. The changed probability interface had not yet reached compilation. A failed or pending workflow must not be reported as a successful theorem verification.
