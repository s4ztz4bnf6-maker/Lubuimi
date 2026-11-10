# Collatz–Syracuse and APW4 bridge: proof-obligation ledger

**Author and research lead:** Ta-Yoshua Lubuimi  
**Date:** 10 November 2026  
**Purpose:** preserve the parallel workstreams without conflating their theorem scopes.

## 1. Verified Collatz/Syracuse components

The research record contains exact affine-offset identities, signed-margin lemmas, the initial valuation-one cylinder theorem, and finite exact valuation-word/cylinder results. The initial valuation-one theorem has passed exact-head Lean compile and axiom audit on the documented commits. The finite dyadic uniform-fibre cardinality identity `dyadicUniformFibre_partition_card` passed workflow 42738528207 on source commit `a1becbc8e837f10abcd952a2e03832cb057fb2b8`, with standard transitive profile `[propext, Classical.choice, Quot.sound]` and no actual `sorryAx` in the completed log.

The finite terminal-residue collision-energy project is a separate finite-​k=2 result. Kolaz threshold-return tables through B=8191 and their regression/confluence tests are finite-computation reproducibility results. None is a global Collatz proof or a uniform all-start descent theorem.

## 2. Central unresolved universal obligation

The main mathematical target remains: for every positive odd starting value, construct a finite realized Syracuse block with a strictly positive signed margin (or an equivalent rigorously justified descent certificate), in a form that excludes every possible infinite non-descending trajectory.

A prefix-dependent finite cap and a finite set of children do not alone rule out an infinite path. A valid closure must supply an additional global argument—such as a proved well-founded ranking, a uniform descent mechanism, or a contradiction from an exact energy/capacity inequality. The argument must apply to every admissible starting value and every branch, not only a finite sample or a bounded threshold.

## 3. APW4-style energy bridge: conditional research programme

The proposed Syracuse terminal-residue energy has a finite diagonal/off-diagonal decomposition and exact finite collision identities. It is a useful model for testing energy bookkeeping. It is **not** yet the historical APW4 BIB reserve, and no historical APW4 event-index map or weighted Hall capacity theorem has been identified with it.

Before using this bridge in the universal Collatz proof, prove explicitly:
1. the source and target finite sets and the exact atom map;
2. injectivity/surjectivity or the precise multiplicity formula;
3. preservation of the original cylinder weights;
4. the diagonal contribution identity;
5. the off-diagonal demand/capacity inequality with no unweighted substitution;
6. a strict inequality strong enough to force a positive realized block margin for every starting value.

If any item fails, keep the finite energy result as an independent theorem and continue the other Collatz strands. Do not retrofit APW4 historical definitions to fit a Syracuse model.

## 4. Parallel work plan

- Continue exact affine-offset and signed-margin lemmas.
- Formalize the general finite valuation-word partition and full cap/tree/interval/residue-fibre bijection.
- Keep the initial valuation-one cylinder, the word (1,2) special case, the general word theorem, and the uniform-fibre cardinality identity as separate scope-labelled results.
- Continue Kolaz finite threshold-return enumeration as a computational side project, preserving its finite bounds and exact source tables.
- Investigate whether the terminal-residue Markov matrix yields a rigorous universal estimate; do not infer it from the k=2 calculation.
- Test the APW4-style bridge only through explicit index- and weight-preserving maps.
- For every candidate global argument, state the quantified start value, block length, valuation word, margin inequality and descent consequence.

## 5. CI and documentation rules

Every CI statement is bound to an immutable commit, Lean/Mathlib version, named declarations, and exact audit scope. A successful compile does not prove global descent. A failed or cancelled run does not erase earlier successful results. Error-recovery `sorryAx` is a failure, never a placeholder for acceptance.

The existing proprietary notices and commercial licensing terms remain unchanged. Third-party Lean/Mathlib licenses remain separate. Authorship remains Ta-Yoshua Lubuimi; AI systems are assistants only.

**Current conclusion:** substantial exact finite arithmetic and Lean milestones are verified. The global Collatz conjecture remains open in this project record. The APW4 energy bridge is a research candidate, not an established Collatz theorem.
