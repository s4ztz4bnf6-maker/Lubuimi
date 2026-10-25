# ProofAtlas Collatz density results: transfer boundary and actionable bridge

Date: 2026-10-25

## Newly identified external formalization

ProofAtlas currently lists a formalization titled “Positive-density Collatz convergence in logarithmic time.” Its stated scope is that for every sufficiently large cutoff, at least cX positive starting values below X reach 1 within at most 10.46 ln(n) ordinary Collatz steps, for an explicit c>0 and cutoff X0. The page labels independent paper-to-statement alignment as pending and says the full Collatz conjecture remains open. This is a valuable finite-time, positive-density theorem, not an all-start theorem.

The same catalog lists a distinct “Natural-density Collatz descent in logarithmic time” result: density-one many starts descend below their initial value within a logarithmic number of steps (with separate odd-relative and ordinary-step formulations). It does not say that those starts reach 1.

It also lists the positive-lower-density predecessor theorem: for fixed a>0 with 3∤a, predecessors of a have positive lower natural density. If a counterexample exists, nonconvergent starts have positive lower density. The conditional theorem that upper-density-one convergence implies universal convergence has an unproved premise.

## Correct composition logic

These results do not presently compose into the Collatz conjecture. Positive-density convergence at a fixed logarithmic time bound leaves a complement of positive density potentially available; density-one descent is only a one-time descent below the starting value, not convergence to 1. A descent argument must be iterated with a quantitatively controlled exceptional set and a proof that the total exceptional set is empty, or a different pointwise invariant must be found.

The new potential research target is a quantitative transfer lemma:

Given a family of cutoffs X_j and a per-scale exceptional count E(X_j), prove a summable, orbit-compatible bound on the set of starts that fail to enter the already-certified convergence set at every scale. Plain density-one estimates are insufficient because a nonempty exceptional set may have density zero.

A second possible route is a certified block descent: for each n above a threshold, produce a finite orbit block with a verifiable decrease and a bound on block length. The existing logarithmic-time positive-density results may guide candidate block distributions, but cannot be substituted for the required pointwise block certificate.

## 2-adic caution

Any 2-adic argument must handle x*=-1/3 explicitly. Since 3x*+1=0, the valuation v2(3x+1) is unbounded in neighborhoods approaching x*. Thus the accelerated odd map does not extend continuously across x* in the naïve way. Compactness alone gives no global sink or pointwise integer descent.

## Formalization and provenance audit

Before importing a public Lean theorem, pin its exact source revision, Lean/mathlib versions, theorem declaration, assumptions, and imported dependency closure. The ProofAtlas pages state that supporting compiled dependencies were reused for some audits; do not describe this as a cold rebuild of every dependency or an independent kernel implementation. Also separate formal checking from independent paper-to-statement review, which the new logarithmic-time page says remains pending.

## Scope status

This note records a new literature lead and a formalization strategy. No external code has been imported, no theorem has been proved in this repository by this note, and the full Collatz conjecture remains unresolved.
