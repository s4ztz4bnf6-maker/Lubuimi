# Collatz/Syracuse manuscript and CI addendum — 10 November 2026

**Research author:** Ta-Yoshua Lubuimi. AI tools are research assistants only, not authors or independent mathematical verifiers.

## Exact-head CI result

PR #48 finite cap-tree branch source head: `b0509fb5944f172ad9f7d71e7316907d4e988842`.

Workflow [42759509255](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42759509255) completed all three jobs successfully:

- `kernel-check-lean-434` — success;
- `kernel-check-lean-435-paranoid` — success, including `lake check --paranoid` and the no-`sorryAx` guard for the named finite-path/terminal-residue declarations;
- `compile-drafts` — success, including the listed Syracuse, offset, valuation-transition, terminal-residue energy, and L945 moment modules.

This establishes a complete job-level CI pass for this exact source head and these jobs. It does not prove that the finite cap tree has no infinite branch and does not prove global Collatz termination.

## Established results retained

The following remain separate established results at their previously recorded mathematical and exact-commit scopes: initial valuation-one cylinder; finite exact valuation-word cylinder theorem (including the published arbitrary finite word argument); mixed word `(1,2)`; valuation bounds; exact offset identity; strict-margin consequences; dyadic uniform-fibre cardinality identity; finite terminal-residue energy result. No later integration outcome reopens or downgrades any of them.

## Next proof obligation: derive the suffix-return premise

The current wrapper `orbit_lower_bound_of_minimal_counterexample` assumes

\[
\forall j,\quad n_j<n_0\Longrightarrow \exists k,\ n_{j+k}=1.
\]

This is not yet derived from the actual deterministic Syracuse dynamics. The next formal chain must establish, in order:

1. From `2^(a j) * n(j+1) = 3*n(j)+1` and `0 < a(j)`, prove every `n(j)` is odd (using the preceding transition).
2. Since the next iterate is odd, prove `a(j)` is the exact 2-adic valuation of `3*n(j)+1`, not merely an exponent in a scaled identity.
3. Define or invoke the canonical accelerated Syracuse successor and prove uniqueness of the odd quotient.
4. Prove by induction that the shifted sequence `fun k => n(j+k)` is the deterministic orbit starting at `n(j)`.
5. State minimality among odd nonterminating starts precisely and derive the suffix-return premise from that definition.

Only after this bridge is proved may the conditional minimal-counterexample lower-bound theorem be used without its current explicit suffix-return assumption. Even then, finite cap-tree membership is only a necessary finite-depth condition. A separate well-founded ranking, uniform descent, or other argument excluding every infinite branch remains necessary for the global theorem.

## Manuscript integrity

This addendum supplements the existing published finite valuation-word cylinder manuscript; it does not edit, replace, or downgrade that manuscript. The exact finite-word theorem remains established independently of the current PR #48 cap-tree work.

**Status: finite cap-tree CI PASS at the exact head above; global Collatz proof OPEN.**
