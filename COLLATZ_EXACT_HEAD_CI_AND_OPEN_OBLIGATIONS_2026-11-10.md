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

Use descriptive labels such as **initial valuation-one cylinder classification** and **finite exact valuation-word cylinder classification**. Do not use the author's surname as an eponymous theorem name or imply priority over the classical parity-vector literature. The independent derivations and formalization work remain attributed to Ta-Yoshua Lubuimi. The historical Lean declaration identifier `lubuimi_initial_valuation_one_cylinder` is a source identifier, not a claim of mathematical naming priority; renaming it requires a separate source change and new exact-head CI.

The repository already contains `LICENSE-PROPRIETARY.md` and `LICENSE-COMMERCIAL-USE-AND-REMUNERATION.md`. The published policy reserves rights only in original copyrightable materials owned by the author, leaves Lean/Mathlib/third-party materials under their own licences, and does not claim exclusive copyright in mathematical facts or abstract ideas. This register does not expand or alter those legal terms.

---

**Acceptance rule:** no global Collatz completion claim until the deterministic suffix-return implication and a valid infinite-path exclusion are proved, formalized, and checked on the exact final source with named axiom traces and no `sorryAx`.