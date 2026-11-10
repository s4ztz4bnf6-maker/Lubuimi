# Lean formalization status — 10 November 2026

> **Scholarly-framing correction (version 1.1):** The initial valuation-one cylinder statement is a classical parity-vector congruence consequence, not a new theorem. The general finite exact valuation-word cylinder statement is likewise a classical consequence of the finite parity-vector permutation theorem. The author's independent proof, exposition, and formalization remain attributed to Ta-Yoshua Lubuimi. The historical Lean identifier lubuimi_initial_valuation_one_cylinder is a source-level name, not a claim of mathematical priority. The finite-word statement remains a separate formalization target and is not covered by the initial-cylinder CI audits.


**Author:** Ta-Yoshua Lubuimi

## Mathematical result versus Lean status

The mathematical equivalence in the project manuscript has a complete direct proof. The main Lean declaration `lubuimi_initial_valuation_one_cylinder` is now compiled and transitive-axiom-audited on two independent exact-commit workflow snapshots. The finite-word cylinder classification is a separate formalization task. Its mathematical content is a classical parity-vector consequence; no novelty claim is made.

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

Runs `42721911555` and `42722186081` are both complete and successful. Both completed the full workflow, printed the same transitive profile `[propext, Classical.choice, Quot.sound]` for the main declaration, and passed the complete-log `sorryAx` scan. The main cylinder theorem has seven successful exact-commit CI snapshots: 42721006544, 42721305220, 42721911555, 42722186081, 42724343412, 42725006480 and 42725493567. The latest checked run, 42722186081, belongs to the Syracuse offset-roadmap pull-request workflow and is successful on its exact checked snapshot.

The earlier failed attempts are preserved above as part of the chronology. They are not erased, but are superseded for the main cylinder theorem by the six later successful exact-commit audits.

## Scope

This Lean target concerns the initial valuation-one cylinder only. It is not a proof of global Collatz descent. The APW4 bridge remains a separate research programme until a concrete index- and weight-preserving map and the necessary incidence inequalities are proved.


## Additional Lean targets — not yet compiled

The following mathematical statements are now documented but are not claimed as Lean-verified:

- Finite exact valuation-word cylinder classification (all finite exact positive exponent words, explicit residue class and mass), a classical parity-vector consequence; not yet Lean-verified.
- The finite truncation/tail-cylinder partition with exact weights.
- Lubuimi's Terminal-Residue Collision Energy: terminal residue map modulo 3^k, exact diagonal mass 3^-k, off-diagonal collision energy and lower bound 1/(2·3^k), including finite truncation error control.

The initial valuation-one cylinder theorem remains the separately verified declaration described above. No failed attempt for that declaration overrides its two later successful full CI audits.


The terminal-residue collision-energy note now also gives an explicit finite rational Markov matrix `P_k`, with terminal mass vector `m_k = δ_0 P_k^k`; the order formula for 2 modulo 3^k supplies the matrix entries. The exact k=2 distribution and second moment are recorded. This Markov representation, like the collision-energy identity itself, remains a Lean formalization target and is not part of the already verified initial-cylinder declaration.


## Four completed exact-commit audits of the initial cylinder declaration

In addition to runs 42721006544 and 42721305220, the same declaration passed runs 42721911555 and 42722186081:

- `42721911555`: merge `7b84a1b`, PR head `21829b4dd3b82a73edb19cf0d09ed011f55ef384`.
- `42722186081`: merge `5d4a19c`, PR head `a36894eefc52e5d28cd43110f5e289805509ad33`.

All seven complete workflows succeeded. The main theorem's transitive axiom profile is `[propext, Classical.choice, Quot.sound]`, and the explicit `sorryAx` audit steps passed. Run 42724343412 subsequently completed successfully on head `29b27dc529b9e81a33b5211e9e01a01e19edc256`; run 42725006480 is the sixth successful exact-source snapshot. The current documentation/status recheck is 42725493567. The finite valuation-word partition, tail partition, terminal-residue collision energy and Markov matrix remain separate Lean targets.


## Fifth successful exact-commit audit

Run `42724343412` also completed successfully on merge commit `06675a1`, PR head `29b27dc529b9e81a33b5211e9e01a01e19edc256`. It completed the full compile-drafts workflow, including library build, iteration and threshold modules, Syracuse reference and quarter-descent modules, offset identity, closed-form offset, stronger lower bound, valuation-one margin block and exact valuation transition. The main cylinder theorem again printed `[propext, Classical.choice, Quot.sound]`, and both explicit `sorryAx` audit steps passed. The current documentation/status recheck is run `42725493567` on head `a52dffc23b323964f33bc7f6c61c2cb24bcdf708`, in progress.


## Sixth successful exact-commit audit

Run `42725006480` completed successfully on exact source commit `b1a8599c686c37893a33453b759dee42047c7727` in the Syracuse programme PR #9 workflow. It compiled `CollatzSyracuseAudit.lubuimi_initial_valuation_one_cylinder`, printed `[propext, Classical.choice, Quot.sound]`, and the complete job log contained no actual `sorryAx` occurrence. This is a sixth independent successful exact-source snapshot for the initial-cylinder declaration. The general finite-word theorem, finite tail partition, collision energy and Markov matrix remain separate Lean targets.


## Seventh successful full compile/audit snapshot

Run `42725493567` completed successfully on exact source commit `a52dffc23b323964f33bc7f6c61c2cb24bcdf708`, a documentation-only descendant of the source snapshot checked by run `42725006480`. It completed the full compile-drafts suite. The log emitted 274 named axiom-profile outputs, all among `[propext]`, `[propext, Quot.sound]`, and `[propext, Classical.choice, Quot.sound]`; no actual `sorryAx` occurrence appeared in the completed log. No Lean source change intervened between the two snapshots; this is a seventh successful exact-commit workflow, not a new theorem or a broader verification scope.


## Chronology correction — seventh successful exact-commit audit confirmed

A previous paragraph in this status file described run 42725493567 as still in progress. That was a stale status captured before completion. The exact workflow was rechecked: run 42725493567 completed successfully on source commit a52dffc23b323964f33bc7f6c61c2cb24bcdf708. Its compile-drafts job includes CollatzSyracuseAudit.lubuimi_initial_valuation_one_cylinder, prints the transitive axiom profile [propext, Classical.choice, Quot.sound], and contains no actual sorryAx occurrence in the completed job log. Therefore the initial valuation-one declaration has seven verified successful exact-commit workflow snapshots: 42721006544, 42721305220, 42721911555, 42722186081, 42724343412, 42725006480 and 42725493567. The earlier chronology entries saying four or six refer to earlier points in time and are superseded by this explicit count of seven. This correction does not change the theorem or broaden the audited scope.
