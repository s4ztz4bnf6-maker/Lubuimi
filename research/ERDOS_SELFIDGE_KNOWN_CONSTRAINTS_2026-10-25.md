# Verified literature constraints for the unrestricted odd covering problem
Date: 2026-10-25

## Target status
The unrestricted Erdős–Selfridge question asks whether a finite covering system with pairwise distinct odd moduli greater than one exists. The problem is still listed as open by the Erdős Problems database. The square-free-moduli theorem is a distinct, proved special case.

## Published results relevant to the Lean project
The paper by Balister, Bollobás, Morris, Sahasrabudhe and Tiba, *The Erdős–Selfridge problem with square-free moduli*, Algebra & Number Theory 15 (2021), 609–626, proves that a covering system with distinct square-free moduli must contain an even modulus. This does not settle the unrestricted odd-moduli problem.

For the unrestricted problem, the known constraints include:
- every covering system has a modulus divisible by 2 or 3 (Hough–Nielsen; also proved by BBMST);
- if a covering system has all moduli odd, its least common multiple Q must be divisible by 9 or 15 (BBMST);
- the unrestricted odd-moduli existence question remains open in the Erdős Problems database.

Sources:
- https://www.erdosproblems.com/7
- https://digitalcommons.memphis.edu/facpubs/5868/
- Hough–Nielsen, *Covering systems with restricted divisibility*, Duke Mathematical Journal (2019).
- BBMST, *On the Erdős covering problem: the density of the uncovered set*, Inventiones Mathematicae (2022).

## Lean target to prioritize
Rather than treating the unrestricted nonexistence statement as a theorem already available from the square-free paper, formalize source-backed necessary conditions as intermediate theorems:
1. For a covering system, prove that at least one modulus is divisible by 2 or 3.
2. Specialize to all-odd moduli and derive 3 | Q.
3. Formalize the stronger BBMST restriction 9 | Q or 15 | Q.
4. Use these restrictions to prune finite-period searches, keeping finite exclusion distinct from the unrestricted conjecture.

The exact definitions of Q, the covering predicates, and any divisibility hypotheses must be matched to the primary paper before coding. The restrictions are necessary conditions, not a proof that no odd covering exists.

## Scope warning
A new preprint or computer certificate about a large finite lower bound can strengthen finite exclusion but does not close the unrestricted conjecture unless it proves a bound that applies to every possible finite covering. Audit all quantifiers and assumptions before incorporating such a result.


## Addendum — exact CI and admitted-axiom status, 10 November 2026

The audit branch now has a completed successful workflow: run 40438579953 on exact source commit b27765f601a46ad103ea020d9fc246a5bb6693ec, Lean 4.34.1. The run built the configured project modules. The main conditional declaration erdos_selfridge_conditional_on_admitted_sieve_interfaces prints the transitive axiom profile
[admitted_sf_sieve_certificate_exists, admitted_sieve_criterion, propext, Classical.choice, Quot.sound].

Thus the build is successful, but the unrestricted theorem is not yet Lean-proved. The two admitted interfaces remain the substantive missing proof obligations. Their returned conditions include positive valid delta parameters and a matching list-length condition, so the previously identified empty/misaligned-delta degeneration is guarded at this interface; the existence of such a valid certificate is still admitted.

The project now includes research/ERDOS_SELFRIDGE_WRITTEN_REVIEW_2026-11-10.md, which records the scope, axiom profile, source-fidelity requirements and next proof obligations. Do not report the successful build as an axiom-free proof of Erdős–Selfridge.
