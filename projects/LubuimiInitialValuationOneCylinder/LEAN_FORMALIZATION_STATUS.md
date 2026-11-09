# Lean formalization status — 10 November 2026

**Author:** Ta-Yoshua Lubuimi

## Mathematical result versus Lean status

The mathematical equivalence in the project manuscript has a complete direct proof. The main Lean declaration `lubuimi_initial_valuation_one_cylinder` is now compiled and transitive-axiom-audited on two independent exact-commit workflow snapshots. The broader finite valuation-word cylinder partition theorem remains a separate formalization task.

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

## Successful full formalization and axiom audits

The source was refined to explicitly apply the induction hypothesis to the two restricted prefix assumptions. The resulting declaration passed two full workflows:

- Run `42721006544`: merge commit `44bb2ac`, PR head `013192ce524a4572a9d96c8d4dcb2796830b1f62`.
- Run `42721305220`: merge commit `3d79761`, PR head `ad7203f5571d03e5989b9ac935b2103300f02409`.

Both completed the complete library build and every workflow step, including `SyracuseOffsetIdentity.lean`, closed-form offset, lower bound, margin block and valuation transition. Both logs print `CollatzSyracuseAudit.lubuimi_initial_valuation_one_cylinder` with transitive axiom profile `[propext, Classical.choice, Quot.sound]`. The workflow's explicit complete-log `sorryAx` scan found no occurrence. This is a positive Lean/kernel-audit result for the initial cylinder declaration on those exact snapshots.

Run `42721911555` is now also complete and successful. Its full workflow again built the library and every listed Syracuse module; the target declaration printed `[propext, Classical.choice, Quot.sound]`, and the explicit complete-log sorryAx scan passed. This is a third successful exact-head snapshot for the initial cylinder theorem. Run `42722186081` remains in progress at this retrieval. The broader finite valuation-word partition theorem and finite tail-cylinder partition remain formalization targets.

The earlier failed attempts are preserved above as part of the chronology. They are not erased, but they are superseded for the main cylinder theorem by the two later successful exact-commit audits.

## Scope

This Lean target concerns the initial valuation-one cylinder only. It is not a proof of global Collatz descent. The APW4 bridge remains a separate research programme until a concrete index- and weight-preserving map and the necessary incidence inequalities are proved.


## Additional Lean targets — not yet compiled

The following mathematical statements are now documented but are not claimed as Lean-verified:

- Lubuimi's Finite Valuation-Word Cylinder Partition Theorem (all finite exact positive exponent words, explicit residue class and mass).
- The finite truncation/tail-cylinder partition with exact weights.
- Lubuimi's Terminal-Residue Collision Energy: terminal residue map modulo 3^k, exact diagonal mass 3^-k, off-diagonal collision energy and lower bound 1/(2·3^k), including finite truncation error control.

The initial valuation-one cylinder theorem remains the separately verified declaration described above. No failed attempt for that declaration overrides its two later successful full CI audits.
