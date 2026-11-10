# Almost-bounded Collatz theorem: transfer audit (2026-10-24)

## Source status and scope
The Reddit post reports a quantitative strengthening of an almost-all Collatz result: for every threshold function f(N) tending to infinity, almost every starting value reaches below f(N) within an explicit logarithmic number of steps (reported constants include 145 for the accelerated odd map and 436 for the ordinary map). Treat these constants as claims to be checked against the actual paper and formal artifact, not as a global Collatz proof. Natural density one permits an exceptional set of density zero.

Relevant source trail:
- Tao, “Almost all orbits of the Collatz map attain almost bounded values”, arXiv preprint dated July 2026 (verify current version and exact statement).
- Reddit discussion is a secondary report, not a primary proof source.
- ProofAtlas artifact describes a Lean package and reports its own build/evidence status; that status does not automatically validate our repository or the theorem statement.

## Transferable proof architecture
The relevant reusable modules are logically separate:
1. exact arithmetic of the accelerated odd map and maximal 2-adic valuation;
2. a quantitative Diophantine estimate involving log_2(3);
3. density estimates for exceptional starting values;
4. conversion from fixed thresholds to arbitrary f(N) -> infinity;
5. translation between accelerated odd steps and ordinary Collatz steps.

Only (1) directly overlaps with our current local affine/residue formalization. Modules (2)-(4) are analytic/number-theoretic and cannot be inferred from finite residue lemmas. Module (5) needs an explicit accounting of the number of ordinary steps represented by each odd step.

## Local theorem target
For odd n and a natural a, if 2^a * m = 3*n+1 and Odd m, prove
(3*n+1) % 2^(a+1) = 2^a.
Proof: write m=2*q+1, substitute, and reduce modulo 2^(a+1). The stronger uniqueness claim for n modulo 2^(a+1) uses invertibility of 3 modulo powers of 2 and should be a separate lemma.

This target is a formalization task, not a new global result. It should be compiled in a small standalone file before being integrated into the larger development.

## Audit questions before importing a theorem
- Is the exact theorem statement quantified over all threshold functions f with f(N) -> infinity, or over a restricted class?
- Does the time bound use natural logarithm or logarithm base 2? Constants change under conversion.
- Is the starting variable restricted to odd integers in the accelerated map?
- Is “reaches below f(N)” measured in accelerated steps or ordinary steps?
- Are exceptional-set estimates proved, or assumed as an imported theorem?
- Does the Lean theorem's transitive axiom trace contain only the accepted Lean foundations and imported mathematically proved results?
- Does the formal statement match the paper's theorem without strengthening hidden hypotheses?

## Boundary
Density-one results cannot remove a density-zero exceptional set. They do not establish termination for every positive integer. The project's global conjecture remains open unless a separate argument eliminates every exceptional orbit.

## Next falsifiable milestone
Create a small Lean file that proves the generic residue lemma and its uniqueness consequence, then check it with the project's pinned Lean/Mathlib versions and print its transitive axioms. Separately, reproduce the exact statement of the quantitative almost-bounded theorem from the primary paper before attempting to port any of its density machinery.
