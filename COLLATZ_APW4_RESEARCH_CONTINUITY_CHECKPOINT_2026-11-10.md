# Cross-project research continuity checkpoint — 10 November 2026, 22:58 CET

**Research author:** Ta-Yoshua Lubuimi.  
**Scope:** Syracuse/Collatz progress, exact Lean status, and the separate APW4/BBMST integration track. Documentation only; no theorem, hypothesis, or source definition is changed here.

## 1. Syracuse terminal-exact backward propagation — verified finite result

On this isolated branch, the following declarations are implemented in Lean:

- `SyracuseAudit.terminalExact_backward_step`: if (a_k\geq1) and the terminal accumulator is exact at (k+1), then (C_k\equiv2^{A_k}\pmod{2^{A_k+1}}).
- `SyracuseAudit.terminalExact_backward_prefix`: iterates the one-step implication backwards over a finite suffix whose valuations are all positive.

The source-level proof uses the actual affine recurrence
`A_{k+1}=A_k+a_k`, `C_{k+1}=3C_k+2^{A_k}`. It is a finite accumulator theorem, not a universal descent statement.

**Exact verification record**
- Lean source commit: `e44eb4331cc1481e10d6f60780d695412c47a726`.
- Later documentation-only branch head: `f36fdcc157e2f40dffd96485898f4ad35136550b`.
- Exact-source workflow: [42844423707](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42844423707), successful.
- Latest branch-head workflow: [42845962042](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42845962042), successful.
- Toolchain: Lean 4.34.1 / Mathlib 4.34.1.
- Both declarations report `[propext, Classical.choice, Quot.sound]`.
- The explicit `sorryAx` guard passed.

**Toolchain boundary:** Lean 4.34.1 does not provide `lake check`; consequently no `lake check --paranoid` result is claimed. The successful workflow instead completed the declared library build, the listed dependent modules, the named axiom report, and the no-`sorryAx` guard. This is a genuine Lean/kernel result at the cited source head, but it is not an APW4/BBMST integrated audit.

The initial workflow [42835859458](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42835859458) failed at `SyracuseAffineCorrectionSum.lean:108:2` because `simp` had already closed the goal before a redundant `omega`. Commit `b9a89872e39b6688f7c7ef567755beceb0c1e5f9` removed only that redundant tactic. Later commits added the backward-step theorem and finite-prefix induction; the successful exact-head results above supersede the earlier target-only status text.

## 2. What remains open in Syracuse/Collatz

The finite backward result does **not** prove:
- arbitrary finite valuation-word realizability;
- the complete general valuation-cylinder/tail-partition theorem;
- a 2-adic Haar-measure derivation or density-to-pointwise transfer;
- that every realizable valuation sequence has a positive descent margin;
- global orbit descent or Collatz termination.

The affine offset identity
`2^{A_k}n_k=3^k n_0+C_k`
remains the exact arithmetic interface. The next global mathematical task is to identify which realizable valuation sequences force (n_k<n_0), using the valuation cylinders, carry recursion, local residue transitions, and threshold margins together. A local quarter-descent regime must not be promoted to a universal descent theorem.

Previously verified initial cylinders, parity/exponent results, affine one-step transition, offset/margin results, and finite valuation-word results retain their own exact source/CI scope. No later integration failure retroactively downgrades them.

## 3. APW4/BBMST — separate repository, separate PR numbering

The APW4/BBMST project lives in [`Lubuimi-`](https://github.com/s4ztz4bnf6-maker/Lubuimi-). Its PR #72 is **not** this Syracuse PR #72. The APW4/BBMST surgical PR #72 concerned dependent prefix-coordinate transport and recurrence-index normalization; it is recorded as closed, with no positive integrated-verification claim.

The current APW4 documentation checkpoint is [RESEARCH_CONTINUITY_CHECKPOINT_2026-11-10.md](https://github.com/s4ztz4bnf6-maker/Lubuimi-/blob/docs/apw4-exact-head-v13-ci-ledger-2026-11-10/publication/RESEARCH_CONTINUITY_CHECKPOINT_2026-11-10.md).

The established APW4 mathematical energy proof remains preserved at its stated historical hypotheses: exact two-term energy split, DT, weighted HT, global upper bound, strict lower bound in its stated regime, and conditional contradiction. The outstanding historical Event-to-BIB map, index preservation, weight preservation, BIB-slot incidence, capacity/weighted-Hall proof, and arbitrary-(t) shadow lemma remain reconstruction/formalization obligations.

For the current BBMST integrated branch, PR #69 head `17eb308d106c770ab559d254bcee2bdfd2ead6c4` failed workflow [42739454140](https://github.com/s4ztz4bnf6-maker/Lubuimi-/actions/runs/42739454140). The direct blocker is `BBMSTPrefixMeasureRecursion.lean` at lines 391 and 393 (`No goals to be solved`), with error-recovery `sorryAx` in dependent recursion declarations. The integrated job reached `BBMSTHyperplaneFibreIncidence.lean` without a direct error in that run; it is not recorded as a confirmed failure there. APW4 PR #138 v15 remains **OFFEN – NICHT VERIFIZIERT** at exact head `94b89a2c5bda9a494c0c42e79ad054aabacabdd8` because no exact-head workflow result was returned.

## 4. Shared evidence discipline

For both projects, every result is tracked on three independent levels:

1. **MATHEMATISCH BEWIESEN** — full derivation at stated hypotheses.
2. **LEAN BEWIESEN** — successful elaboration and kernel acceptance at the exact source head.
3. **INTEGRIERT VERIFIZIERT** — complete transitive dependency closure, named axiom reports, and no-`sorryAx` audit on the exact integrated CI head.

The Syracuse backward-step and finite-prefix declarations are Lean-proved on their isolated branch. They do not prove global Collatz. The APW4 mathematical core remains established; its historical integration and current full Lean audit remain open. No result is transferred between repositories or branches merely because the topics are related.
