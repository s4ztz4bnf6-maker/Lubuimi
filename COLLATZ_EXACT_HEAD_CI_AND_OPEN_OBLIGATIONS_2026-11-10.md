# Exact-head Collatz/Syracuse status and proof obligations — 10 November 2026

**Research author:** Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers.

## 1. Verified baseline retained

The earlier exact source commit `b0509fb5944f172ad9f7d71e7316907d4e988842`, workflow [42759509255](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42759509255), completed all three jobs successfully: Lean 4.34.1 build/kernel-check, Lean 4.35.0 paranoid-kernel check, and `compile-drafts`. This remains valid for that exact commit and the declarations included in that run. It is not a proof of global Collatz termination and does not cover later source additions.

## 2. New affine parity/exactness candidate

The candidate source commit `a8b593cd8ef59105e6b62b11d0dfc7e41e89a3bb`, workflow [42762395691](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42762395691), failed all three build jobs at `SyracuseOffsetIdentity.lean:3095`. The compiler reported `omega could not prove the goal` while trying to derive `a j ≠ 0` from `ha : ∀ j, 0 < a j`. Error recovery printed `sorryAx` for the two new declarations; they are not verified at that source head. Downstream target steps were skipped after the library build failed.

The two candidate declarations are `every_state_odd_of_positive_affine_steps` and `every_affine_exponent_is_exact`. The mathematical implication is unchanged: from `2^(a j) * n (j+1) = 3*n j + 1` and `a j > 0`, the left side is even, hence `3*n j + 1` is even and `n j` is odd. The code repair now obtains `a j ≠ 0` directly by `Nat.ne_of_gt (ha j)` and eliminates the zero exponent case by contradiction.

## 3. Current repair PR and CI state

- Diagnostic PR: [#53](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/53).
- Exact code head: `7d17d7111946b328421f9046f95b03c939dfddb1`.
- Exact-head workflow: [42805867475](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42805867475).
- At the latest poll, Lean 4.34.1, Lean 4.35.0 paranoid, and `compile-drafts` were in progress.

**Status: OFFEN – NICHT VERIFIZIERT.** No PASS is claimed until all required jobs finish, both named declarations print the accepted transitive axiom profile, and the complete relevant logs contain no actual `sorryAx`.

PR #53 is a diagnostic/staging PR based on the exact parent of the candidate. It is not yet a merge into the principal research branch.

## 4. Global minimal-counterexample bridge

The declaration `orbit_lower_bound_of_minimal_counterexample` is axiom-free in the recorded compiler output, but it assumes `∀ j, n j < n₀ → ∃ k, n (j+k)=1`. That suffix-return premise is not yet derived from the actual deterministic Syracuse dynamics and the least-counterexample definition.

The candidate route is: (1) prove every state odd from the positive affine steps; (2) prove every exponent is the exact 2-adic valuation using oddness of the next quotient; (3) identify each shifted sequence `k ↦ n (j+k)` with the unique deterministic accelerated Syracuse orbit from `n j`; (4) derive suffix return from minimality among odd nonterminating starts; (5) separately prove a well-founded descent/ranking or another valid infinite-path exclusion.

Finite cap-tree membership at every fixed depth is not an infinite-branch exclusion. The finite tree cannot be called terminating merely because each finite level is finite.

## 5. Results that remain established at their exact scopes

- Affine offset identities and their recorded Lean checks.
- Signed-margin identities and conditional descent implications.
- The initial valuation-one cylinder classification, independently derived by Ta-Yoshua Lubuimi and formally audited on its recorded exact commits.
- The finite exact valuation-word cylinder classification as a mathematical result; its general Lean formalization remains separate.
- The exact mixed-word `(1,2)` cylinder declaration on its recorded exact commit.
- The dyadic uniform-fibre cardinality identity on its recorded exact commit.
- Finite terminal-residue `k=2` calculations and finite Kolaz threshold-return archives, each only within its stated finite scope.
- The finite cap-tree path certificate on the exact source commit and run listed above.

No failed later integration run retroactively invalidates any of these earlier exact-commit results. Conversely, none of these components alone proves the global Collatz conjecture.

## 6. Attribution, naming, and licensing

Use descriptive labels such as **initial valuation-one cylinder classification** and **finite exact valuation-word cylinder classification**. Do not use the author's surname as an eponymous theorem name or imply priority over the classical parity-vector literature. The independent derivations and formalization work remain attributed to Ta-Yoshua Lubuimi. Earlier successful cylinder CI snapshots used an author-derived Lean identifier. The current continuation branch renames that declaration to the descriptive `initial_valuation_one_cylinder_iff_dyadic_divisibility`; the proposition and proof are unchanged, but the new identifier requires fresh exact-head CI and axiom verification. Historical CI results remain scoped to the earlier source identifier and are not transferred automatically.

The repository already contains `LICENSE-PROPRIETARY.md` and `LICENSE-COMMERCIAL-USE-AND-REMUNERATION.md`. The published policy reserves rights only in original copyrightable materials owned by the author, leaves Lean/Mathlib/third-party materials under their own licences, and does not claim exclusive copyright in mathematical facts or abstract ideas. This register does not expand or alter those legal terms.

---

**Acceptance rule:** no global Collatz completion claim until the deterministic suffix-return implication and a valid infinite-path exclusion are proved, formalized, and checked on the exact final source with named axiom traces and no `sorryAx`.
## Exact-head repair result — 10 November 2026

Workflow [42805867475](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42805867475) completed successfully on exact source commit `7d17d7111946b328421f9046f95b03c939dfddb1`. All three jobs passed: Lean 4.34.1 kernel/build check, `compile-drafts`, and Lean 4.35.0 paranoid kernel check.

The named declaration outputs are:

- `CollatzSyracuseAudit.every_state_odd_of_positive_affine_steps`: `[propext, Quot.sound]`.
- `CollatzSyracuseAudit.every_affine_exponent_is_exact`: `[propext, Classical.choice, Quot.sound]`.
- `CollatzSyracuseAudit.orbit_lower_bound_of_minimal_counterexample`: no axioms, but still conditional on its explicit suffix-return premise.

The completed Lean 4.35.0 log explicitly reports `Lean paranoid kernel accepts the solution`. The `sorryAx` guard passed for `SyracuseOffsetIdentity.lean`; no actual `sorryAx` dependency is reported for the two new declarations. This verifies these two named affine/parity lemmas on this exact source head and the listed toolchains only.

The global Collatz conjecture remains open. The suffix-return premise still must be derived from deterministic Syracuse dynamics and minimality, and a separate well-founded descent/ranking or other infinite-branch exclusion is still required.
## 7. Deterministic Syracuse one-step bridge — candidate

After the parity and exact-exponent lemmas passed, a new declaration `affine_step_eq_syracuse_of_exact_exponent` was added to connect an affine transition with an odd quotient to the deterministic map `syracuse` already defined in `SyracuseReferenceTest.lean`.

The first candidate source head `400307622c62488878c1fa00362d06bddfa54744` failed before the theorem body was checked: `SyracuseReferenceTest` was not a registered library root, so `SyracuseOffsetIdentity.lean` could not import the module. This was a build dependency-graph error, not a mathematical counterexample or proof failure.

The dependency graph was corrected by adding `SyracuseReferenceTest` to the `CollatzAudit` library roots. Current candidate: PR [#55](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/55), exact head `d5c32aba3e9e767cb1051d7aac6b54ff1196ea2d`, workflow [42807396471](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42807396471). Workflow 42807396471 completed all three jobs successfully on that exact head: Lean 4.34.1, Lean 4.35.0 paranoid, and `compile-drafts`. The new declaration `CollatzSyracuseAudit.affine_step_eq_syracuse_of_exact_exponent` prints `[propext, Classical.choice, Quot.sound]`. The paranoid kernel accepts the solution and the `sorryAx` gate passed. This verifies the one-step affine-to-deterministic-Syracuse transition at this exact head.

The next target is the shifted-tail identity `syracuse^[k] (n j) = n (j+k)` by induction. That identity will let the least-counterexample minimality property be applied to each actual shifted Syracuse orbit. The suffix-return implication and infinite-branch exclusion remain separate obligations.
## Exact-head one-step transition result — PASS

On exact source head `d5c32aba3e9e767cb1051d7aac6b54ff1196ea2d`, workflow [42807396471](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42807396471) passed Lean 4.34.1, Lean 4.35.0 paranoid, and `compile-drafts`. The declaration `affine_step_eq_syracuse_of_exact_exponent` has transitive axiom profile `[propext, Classical.choice, Quot.sound]`; the paranoid kernel accepted the solution and the no-`sorryAx` gate passed. The previously verified parity and exact-exponent declarations remain verified on their own exact head `7d17d7111946b328421f9046f95b03c939dfddb1`.

This closes the affine-to-one-step deterministic transition obligation. It does not yet prove the shifted-tail iterate identity, suffix return from minimality, or global termination.
## Shifted-tail and least-counterexample bridge — candidate

After the one-step theorem passed, candidate PR [#56](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/56) adds `affine_trajectory_eq_syracuse_iterate`, the least odd nonterminating-start predicate and well-ordering lemma, and a suffix-return theorem derived from least-start minimality. It also packages the resulting sequence lower bound without the earlier abstract `hminimal` premise.

After adding the neutral cylinder declaration name, the current PR #56 head is `1da1e7f97622f709bd0a8b56427e1872dc7fce1f`; exact-head workflow [42808797159](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42808797159) was queued at the latest poll. The earlier tail candidate head `1fd204750a1088efbf5e81b40b9ad95962fdb2ed` is superseded and its run is not evidence for the renamed source. All new declarations and the renamed cylinder declaration remain **OFFEN – NICHT VERIFIZIERT** until the new exact-head three-job run, named axiom outputs, and no-`sorryAx` gate pass.

Even if this bridge passes, it only shows that a hypothetical least odd nonterminating Syracuse start generates a nondecreasing affine orbit whose shifted tails are deterministic Syracuse orbits. It does not exclude the existence of such a nonterminating start. A separate infinite-trajectory/infinite-branch exclusion remains the global open problem.

## 8. Latest PR #56 exact-head poll and identifier rename — 10 November 2026

The current PR #56 head is `1da1e7f97622f709bd0a8b56427e1872dc7fce1f`, workflow [42808797159](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42808797159). It includes the shifted-tail iterate identity, the least odd nonterminating-start/minimality bridge, and renames the historical internal declaration identifier `lubuimi_initial_valuation_one_cylinder` to `initial_valuation_one_cylinder_iff_dyadic_divisibility`. The mathematical proposition and proof are stated to be unchanged. At the latest poll, job `129804657707` (`compile-drafts`) and job `129804658211` (Lean 4.34.1 kernel-check) were in progress; job `129804658308` (Lean 4.35.0 paranoid) was queued. The earlier PR #56 head `1fd204750a1088efbf5e81b40b9ad95962fdb2ed`, run 42808379459, is superseded and all three jobs failed; it is not evidence for the renamed source.

No successful verification is claimed for the new shifted-tail/minimality declarations or the renamed cylinder identifier until all three jobs pass, the named axiom output is inspected, and the no-`sorryAx` guard passes on this exact head. The earlier PASS results for the old declaration identifier remain valid for their own commits and are not revoked or silently transferred.

## 9. Verified deterministic one-step transition — retained exact scope

PR #55 head `d5c32aba3e9e767cb1051d7aac6b54ff1196ea2d`, workflow [42807396471](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42807396471), passed Lean 4.34.1, `compile-drafts`, and Lean 4.35.0 paranoid. `CollatzSyracuseAudit.affine_step_eq_syracuse_of_exact_exponent` has transitive profile `[propext, Classical.choice, Quot.sound]`; the paranoid kernel accepted it and the no-`sorryAx` guard passed. This verifies the affine-to-deterministic one-step transition only, not the shifted-tail identity or global termination.


## 10. PR #56 failure and PR #59 repair candidate — 10 November 2026

PR #56 exact head `1da1e7f97622f709bd0a8b56427e1872dc7fce1f`, workflow [42808797159](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42808797159), completed with all three jobs failed. The errors in `SyracuseOffsetIdentity.lean` were: missing local classical instance for `Nat.find`; failure to derive positivity of `n j` because the proof did not use the already established oddness fact; and a forward reference to `orbit_lower_bound_of_minimal_counterexample`, declared later. The shifted-tail identity itself printed `[propext, Classical.choice, Quot.sound]`. The renamed cylinder declaration also printed that profile in the partial build log, but the complete module failed later, so the renamed declaration is not accepted as a completed exact-head CI result.

PR #59 head `5f6e46de8bed7061f8336089857143c54e997af5` applies the local classical instance, explicitly passes oddness to `omega`, and proves the lower-bound wrapper directly from the suffix-return lemma. No exact-head workflow was visible at the latest poll. Status: OFFEN – NICHT VERIFIZIERT. The global infinite-branch exclusion remains open.


## 11. Latest PR #59 exact-head poll — 10 November 2026

Workflow [42809750956](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42809750956) is now attached to exact head `5f6e46de8bed7061f8336089857143c54e997af5`. Job states: `compile-drafts` `129807911809` in progress; Lean 4.34.1 `129807911748` queued; Lean 4.35.0 paranoid `129807911880` queued. No successful result or axiom profile is claimed for PR #59 until all three jobs finish and their logs are inspected.


## 12. Parallel PR #58 / PR #59 minimality proof repairs — 10 November 2026

Both PRs are focused repairs of the same PR #56 diagnostics. PR #58 head `a2eea6f3c979e25a705c3da60d09d6ec84a41b7f`, workflow [42809723676](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42809723676), has compile-drafts job `129807819022`, Lean 4.34.1 job `129807818770`, and Lean 4.35.0 paranoid job `129807818658` all in progress. PR #59 head `5f6e46de8bed7061f8336089857143c54e997af5`, workflow [42809750956](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42809750956), has compile-drafts `129807911809`, Lean 4.34.1 `129807911748`, and Lean 4.35.0 paranoid `129807911880` all in progress.

Both add the local classical instance for `Nat.find`, pass the instantiated oddness fact into the positivity proof, and avoid the forward reference by proving the sequence lower bound directly. PR #58 closes the final inequality with `omega`; PR #59 uses `Nat.lt_of_not_ge`. These are alternative proof-script candidates for the same conditional reduction, not two separate mathematical results. No PASS is claimed yet.
