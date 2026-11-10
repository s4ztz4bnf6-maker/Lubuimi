# Collatz/Syracuse finite-prefix to terminal-residue scale bridge — 10 November 2026

**Status: mathematical derivation complete; current Lean integration and dual-toolchain audit pending. No global Collatz result is claimed.**

## 1. New finite-prefix scale inequality

Assume an exact accelerated odd Syracuse path

\[2^{a_j}n_{j+1}=3n_j+1,\qquad a_j\ge1.\]

Then

\[2(n_{j+1}+1)\le3(n_j+1).\]

Induction gives the finite-depth scale bound

\[2^j(n_j+1)\le3^j(n_0+1).\]

This is not a statistical assertion: it holds for each finite prefix of every path satisfying the exact recurrence and positive valuation condition.

## 2. Actual orbit value below the terminal modulus

If the depth additionally satisfies

\[n_0+1<2^j,\]

then the scale inequality implies

\[n_j<3^j.\]

The already established affine identity

\[2^{A_j}n_j=3^jn_0+C_j\]

identifies the terminal residue modulo 3^j. Since n_j is now below the modulus, its least nonnegative representative is the actual integer orbit value:

\[(\operatorname{canonicalTerminalResidue}(A,j)).\mathrm{val}=n_j.\]

This is a genuine bridge from the terminal-residue strand to actual Syracuse orbit values at sufficiently large depths. It does **not** imply that the orbit descends, that a residue-energy estimate applies to every orbit, or that the orbit terminates.

## 3. Lean declarations and exact status

Added to SyracuseOffsetIdentity.lean:

- `syracuse_step_scale_inequality`
- `syracuse_iterate_dyadic_ternary_scale_bound`
- `syracuse_iterate_lt_terminal_modulus`
- `canonicalTerminalResidue_val_eq_actual_iterate`

The first two declarations compiled on the previous exact build and printed the standard profile [propext, Quot.sound]. The previous build failed in the latter two because the Nat multiplier-cancellation theorem was applied with the wrong argument shape; that proof has been corrected.

The same previous build exposed a forward reference from `initial_lower_bounded_orbit_prefix_cap_tree_and_terminal_unit` to a compatibility alias declared later. The theorem now calls the already established `initial_lower_bounded_orbit_prefix_mem_finiteCapTree` directly, removing the forward reference. This also removes the route by which sorryAx had entered the dependent prefix-tree declarations.

Exact source commits:

- `684ada0bc8548e2446d8662e296882d005ca8778`: corrected the positive-multiplier equivalence in the terminal-modulus proof.
- `892772228e756606ff49cb8b0c83bafb748a4533`: removed the forward reference in the minimal-counterexample prefix theorem.

Workflow `42753827894` is queued for the latest source head. It includes the Lean 4.34.1 compile/audit job and the Lean 4.35.0 paranoid job. No PASS is claimed until the exact-head run completes, the four new declarations print their transitive profiles, and the sorryAx scan is clean.

## 4. Minimal-counterexample finite-cap path lemma

The existing conditional reduction remains separate:

- if no orbit term equals 1;
- and every term below n₀ has a future suffix reaching 1, as required by minimality of a counterexample;
- then every orbit term is at least n₀.

Combined with the exact affine identity and the finite exponent cap, this yields a finite-cap-tree prefix at every finite depth. The terminal residue is a unit modulo 3^j. This is a conditional path certificate, not an exclusion of an infinite branch. The current source correction removes a forward-reference defect; the exact-head audit remains pending.

## 5. Research boundaries

- The all-one valuation cylinder theorem remains kernel-verified on its previously recorded commits.
- The general finite valuation-word cylinder theorem remains mathematically proved and documented, but not yet Lean-compiled and axiom-audited.
- The local signed-offset margin inequality and state-dependent finite valuation cap remain necessary conditions; they do not exclude an infinite nondecreasing path.
- The k=2 terminal-residue energy calculation remains a separate finite verified module. This new scale bridge does not convert its finite average into a universal trajectory bound.
- The dyadic residue-cylinder model in the APW4 branch is only a residue-class count interface until its tail residue is identified with the exact prefix word. No APW4 BIB identity is inferred from it.

## 6. Next mathematical obligation

Use the actual orbit-value representation of terminal residues to derive a pathwise inequality from the k=2 terminal-residue energy, or prove that no such inequality follows from the current finite-state data. Any transfer must preserve the exact residue indices and weights. The ultimate goal remains exclusion of a nontrivial infinite Syracuse path; the current theorem is only a new finite-prefix bridge.

## Latest exact-head CI update

The latest PR #48 head is e45b372a7727e3fd105df50452e6c43400a3439d. Workflow 42754068650 is running three independent jobs: the Lean 4.34.1 full library/audit job, the focused compile-and-axiom audit, and the Lean 4.35.0 paranoid kernel job. No PASS is claimed yet.

The prior failed build confirmed that the first two scale lemmas themselves compiled with the standard profile [propext, Quot.sound]. The failures were in the downstream terminal-modulus cancellation and the minimal-counterexample prefix theorem's forward reference. Both source defects have been corrected in the commits listed above; this exact-head run is the first verification of the combined corrected state.


## Terminal-residue / finite-cap-tree scale bridge — proof-script correction, 10 November 2026

The exact scale estimate and residue representative theorem are present in the source:
- `syracuse_step_scale_inequality`: (2(n_{j+1}+1)\le 3(n_j+1)).
- `syracuse_iterate_dyadic_ternary_scale_bound): (2^j(n_j+1)\le 3^j(n_0+1)).
- `syracuse_iterate_lt_terminal_modulus): if (n_0+1<2^j), then (n_j<3^j).
- `canonicalTerminalResidue_val_eq_actual_iterate): at that depth the canonical terminal residue has the actual iterate as its least nonnegative representative.
- `affine_minimal_counterexample_terminal_residue_cap_tree_bridge): combines finite-cap-tree membership, the terminal-residue unit condition, and the representative identity.

The first integration head `1ad0cf18bb8d2fd8a76376cb3768fd3b60bc6a7c` failed workflow [42812961296](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42812961296) at the normalization step: the proof used `rw [← hn0eq]` although `hn0eq : n 0 = n₀) must normalize the target (n 0+1<2^j) from the hypothesis (n₀+1<2^j). The diagnostic showed the rewrite searched for (n₀) in the target, where only (n 0) occurred.

The current candidate replaces that rewrite with:
```lean
have hdepth' : n 0 + 1 < 2 ^ j := by
  simpa [hn0eq] using hdepth
```
This is the directionally correct simplification. Candidate source branch: `collatz/terminal-residue-cap-tree-bridge-simpa-v4-2026-11-10`; current exact-head refresh commit: `ad40af22c1b2c8322616dec94c09d98b73e3eabb`. **OFFEN – NICHT VERIFIZIERT:** no exact-head workflow has yet been returned for this candidate. The failed run is retained as history and does not alter earlier verified finite-cap or minimality lemmas.

Even after this bridge compiles, it only identifies the terminal residue with the actual orbit value at sufficiently large depth. It does not exclude an infinite branch or prove global Collatz termination.
