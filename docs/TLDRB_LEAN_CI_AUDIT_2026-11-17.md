# TL-DRB Lean CI audit report — 17 November 2026

## Result

**PASS — exact PR-head package build and axiom-output gate**

GitHub Actions workflow [#44026016138](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/44026016138) completed successfully on 17 November 2026.

- Repository: s4ztz4bnf6-maker/Lubuimi
- PR: [#90](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/90), still draft
- PR head: 1a7c7a7df4c5ba014c3a6a932d2bdcb2d8d6c42d
- GitHub merge ref tested by CI: 1c9e501699557cccfeb8c97f96fc3f2ca5bb1593
- Workflow job: tldrbaudit-lean-435
- Job ID: 133846418781
- Toolchain: Lean 4.35.0
- Mathlib: v4.35.0, revision 56a005855ea17e0b0958f73ec801ae140b0a1679

## Build evidence

The workflow executed lake update, lake build TLDRB, and lake env lean TLDRB.lean.

The build log reports:

    ⚠ [9047/9048] Built TLDRB (3.5s)
    Build completed successfully (9048 jobs).

The warning is that TLDRB.lean imports the aggregate Mathlib module without a module declaration. It is non-fatal and did not prevent the target build. It is a cleanup item, not a mathematical failure.

## Named axiom profiles printed by the successful run

    affine_trajectory_identity
      [propext]

    dynamicResidual_eq_affineCorrection
      [propext, Quot.sound]

    overlap_identity
      [propext, Quot.sound]

    overlapResidual_succ
      [propext, Quot.sound]

    descent_threshold
      [propext, Classical.choice, Quot.sound]

All profiles are subsets of the project's accepted foundational profile [propext, Classical.choice, Quot.sound].

## sorryAx gate

The workflow piped the complete Lean output to a log, searched for sorryAx, and would exit nonzero if found. The step completed successfully. Therefore no sorryAx occurrence was detected in the named source compilation output for this run.

This is a targeted grep gate over the emitted output, not a claim that every repository file or unrelated module has been globally audited.

## What this CI result establishes

For the exact PR head and tested merge ref above, CI establishes that:
1. the pinned Lean package dependencies resolved;
2. lake build TLDRB completed successfully;
3. the declarations listed above compiled;
4. the named #print axioms profiles were emitted and inspected;
5. the explicit sorryAx gate passed.

## What this CI result does not establish

It does not establish:
- lake check --paranoid or a whole-repository build;
- a proof that the abstract division-witness function is the actual 2-adic valuation of the Syracuse orbit;
- a complete actual-orbit instantiation of descent_threshold;
- the universal dynamic descent theorem;
- exclusion of every infinite non-descending valuation path;
- the global Collatz conjecture.

In particular, the generic finite-prefix affine identity and residual embedding are formalized, but the actual Syracuse valuation bridge remains a separate obligation. CI success must not be described as a global Collatz proof.

## Prior failed attempt

The preceding attempt failed because a cast-normalization goal remained after rewriting the residual induction hypothesis. The proof was corrected by inserting push_cast before ring. The corrected head is the commit listed above; this report records only the successful corrected run.

## Reproducibility

The workflow source is [tldrbaudit.yml](../.github/workflows/tldrbaudit.yml). The Lean source is [TLDRB.lean](../formalization/TLDRB/TLDRB.lean). The PR remains a draft; this audit report does not merge it into the default branch.
