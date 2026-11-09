# Lean formalization status — 10 November 2026

**Author:** Ta-Yoshua Lubuimi

## Mathematical result versus Lean status

The mathematical equivalence in the project manuscript has a complete direct proof. The Lean formalization is a separate task and is not yet complete. The project does not claim that the main theorem has passed Lean compilation or a transitive axiom audit.

## Relevant successful baseline

GitHub Actions run 42717134267 completed successfully on its checked merge commit. It compiled the existing Syracuse offset identity, closed form, lower bound, margin-block and valuation-transition modules. The declared axiom profiles were the Lean standard profile or subsets, and the explicit sorryAx scans for the audited offset and valuation-transition sources found no occurrence. This result is preserved for the exact commit and exact declarations checked.

## New theorem helper

In run 42719689591, the helper valuation_exponent_eq_one_of_mod_four_three compiled with axiom profile [propext, Quot.sound]. Its reported declaration did not contain sorryAx.

## Main theorem: failed attempts and precise diagnosis

Run 42719689591 failed in SyracuseOffsetIdentity.lean at the finite affine induction and terminal divisibility step. The log showed unsolved goals and the error-recovery output for lubuimi_initial_valuation_one_cylinder included sorryAx. This is not a counterexample to the mathematical theorem; it is a failed Lean proof script and must not be represented as a successful formal proof.

Run 42720406876 failed again at SyracuseOffsetIdentity.lean:2421. The diagnostic context showed the induction hypothesis as requiring two explicit premises:
- the restricted prefix statement ∀ j < k, a j = 1;
- the restricted half-step statement ∀ j < k, 2 * n (j + 1) = 3 * n j + 1.

Lean left these two goals unsolved at the attempted application of the induction hypothesis. The failed declaration again showed sorryAx in the error-recovery output. The helper theorem continued to compile with [propext, Quot.sound].

## Next formalization repair

The next edit should construct the two restricted hypotheses as named local facts before applying the induction hypothesis, rather than embedding both tactic proofs directly in the application. The proofs must explicitly transport j < k to j < k + 1. Then rerun the complete build and inspect the actual theorem's #print axioms output. A green compile alone is insufficient: the target declaration must have no sorryAx, and all transitive axioms must be reported.

No source file or successful earlier CI result is to be deleted or overwritten to conceal a failed attempt. The failed runs remain part of the audit history.

## Scope

This Lean target concerns the initial valuation-one cylinder only. It is not a proof of global Collatz descent. The APW4 bridge remains a separate research programme until a concrete index- and weight-preserving map and the necessary incidence inequalities are proved.
