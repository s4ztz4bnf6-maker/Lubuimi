# BBMST: source-faithful incidence bridge (2026-10-23)

## Status and scope

This is a formalization plan, not the BBMST theorem. The current probability interface proves generic finite-mass and finite-incidence identities. The missing mathematics is the derivation of the specific geometric estimates in Balister–Bollobás–Morris–Sahasabudhe–Tiba from their actual hypotheses.

## Minimal interface to build

Do not begin with a free scalar alpha or a free family of fibers. Construct the data in this order:

1. A finite sample space Omega with an explicitly defined probability mass mu and a proof that its total mass is one.
2. The source map f : Omega -> I defining fibers f^{-1}(i), with each fiber induced by the map.
3. The geometric object (hyperplane/incidence condition) as an actual predicate P_i(x), not a free isNontrivial, isParallel, or codimOne assumption.
4. The covered mass mu({x : P_i(x)}) and deficit mu({x : not P_i(x)}) derived from the same predicate.
5. The conditional/fiber estimates proved from the source geometry and then aggregated by the existing weighted-fiber squeeze.

## Conservation is not the theorem

For any normalized finite mass and predicate P, mu(P)+mu(not P)=1. For a uniform finite sample, the incidence fraction is |P|/|Omega|. These identities are bookkeeping. They do not imply the nontrivial BBMST moment bound, nor do they imply that the uncovered mass is positive. The proof must establish a strict quantitative inequality from the geometry.

## Audit obligations

For every imported geometric assertion, record:
- the exact source lemma/equation and its hypotheses;
- the Lean definition corresponding to each mathematical object;
- whether the claim is proved, an explicit hypothesis, or an open obligation;
- the theorem's axiom report;
- edge cases (empty fibers, zero-mass points, degenerate intersections).

Do not hide a missing geometric implication inside a typeclass assumption or a helper predicate. A generic probability theorem is useful only after the source-specific hypotheses have been derived.

## Strategic link to odd covering systems

Published BBMST proves the square-free-moduli obstruction, not the unrestricted odd-moduli problem. Separate results constrain the prime support of any hypothetical odd distinct covering system (including a 2026 preprint claiming an seven-prime lower bound). Such results are possible reduction targets, but they are not substitutes for the source-faithful BBMST geometry and should be treated according to their publication/formal verification status.

## Falsification gates

The formalization is not ready to claim the BBMST result until:
- the geometric sample space and incidence predicate are explicit;
- the source-specific fiber/moment inequality is proved;
- the final theorem uses only intended axioms (typically the standard Lean logical axioms);
- all builds and theorem-level axiom reports pass.

## Literature correction and complementary reduction target (checked 2026-10-23)

A 1 September 2026 preprint by Michael Schroeder claims that any odd distinct covering system must have at least **seven** distinct prime divisors in its least common multiple, with no squarefreeness or prime-power-height restriction. This is a preprint claim, not an independently verified theorem in this repository. It is stronger in scope than the square-free BBMST result if its proof checks out, but it is not a solution to Erdős–Selfridge: systems supported on seven or more primes remain unexcluded by this bound alone.

For our formalization, treat this as a separate proof route, not as a replacement for the source-faithful BBMST reconstruction. A useful next interface would encode the prime support of the LCM and a finite residual product of prime-power trees, then formalize each claimed rational charge as an exact inequality. The source's companion materials and proof dependencies must be independently audited before importing any conclusion. The previously stated eight-prime figure was incorrect and is corrected here.
