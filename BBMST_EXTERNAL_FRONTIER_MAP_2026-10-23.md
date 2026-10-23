# External frontier map: odd covering systems and formalizable partial bounds
Date: 2026-10-23

## Scope discipline

The unrestricted Erdős–Selfridge problem remains open: can a finite covering system have pairwise distinct odd moduli greater than one? Do not describe the square-free-moduli theorem as resolving the unrestricted problem.

## Independently identified nearby results

1. **BBMST (published, peer reviewed).** Balister, Bollobás, Morris, Sahasrabudhe and Tiba prove that a covering system with distinct square-free moduli must contain an even modulus. Publication record and article:
   - https://ora.ox.ac.uk/objects/uuid%3A3c55267c-60be-4652-89a7-db3db5f62c25
   - https://doi.org/10.2140/ant.2021.15.609

2. **General odd-modulus rank lower bound (2026 preprint).** Michael Schroeder's “Seven Prime Divisors in Odd Distinct Covering Systems” claims that any odd distinct covering system has an LCM with at least seven distinct prime divisors, without a square-freeness or prime-power-height assumption. It provides a Lean formalization and exact rational checker. Treat it as a preprint claim until independently audited against its proof package; it does not settle the existence question.
   - https://michaelschroeder.ai/research/SevenPrimeSupport/companion

3. **Kernel-checked finite exclusion (2026 preprint).** Mian and Siddique formalize that any odd covering system with distinct moduli greater than one has LCM exceeding 10000. Their stated contribution is formal verification of a known computational/number-theoretic exclusion, not a solution of the full problem.
   - https://paperswithlean.com/paper/2607.25628.html

## How these results change our formalization strategy

The next BBMST work should not merely reproduce the abstract fiber algebra. We now have two useful independently checkable boundary targets:

- **Finite rank/capacity lane:** encode periodic covering systems modulo their LCM, the distinct-modulus condition, and exact finite coverage certificates. This is an alternate, finite obstruction route, suitable for small-LCM certificates and cross-checking the existing BBMST geometry.
- **Source-faithful BBMST lane:** formalize the actual coordinate-box and hyperplane incidence definitions, then derive the second-moment/fiber distortion estimate. This lane targets the square-free theorem's structural mechanism.

Keep the lanes separate. A finite LCM cutoff does not prove a universal result, and the seven-prime lower bound does not rule out systems supported on seven or more primes. The rank bound may narrow future searches but cannot be inserted as an axiom or silently assumed in the BBMST proof.

## Current local milestones

- The scalar inequality lemma is committed in BBMSTFiberMassCore.lean (commit 08e940e6d2647e7992a2018638cec01fe48b53ab); its CI run 40010690808 succeeded.
- finite_card_ratio_mem_unit_interval has now been added. It proves that if a finite incidence set is a subset of a nonempty finite coordinate set, its normalized rational cardinality is in [0,1]. Current commit: cddeee4dbd47a87799a6f0d8643de122fd4df327. CI run 40011458088 was still running when this note was written; do not report this new lemma as build-verified until that run finishes successfully.

## Kernel soundness

A successful Lean build should be paired with an axiom audit and a modern Lean release. Lean 4.32.2 fixed a kernel soundness bug, and Lean 4.34.0 records further kernel hardening. For external proof packages, inspect their exact Lean version, import closure, hypotheses and theorem statement rather than relying on a clean-looking #print axioms line alone.
- https://lean-lang.org/doc/reference/latest/releases/v4.32.2/
- https://lean-lang.org/doc/reference/latest/releases/v4.34.0/
