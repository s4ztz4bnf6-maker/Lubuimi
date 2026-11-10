# Lubuimi's Terminal-Residue Collision Energy

**Author:** Ta-Yoshua Lubuimi  
**Date:** 10 November 2026  
**Status:** Standalone mathematical research manuscript; Lean formalization target, not yet compiled.

This project studies the terminal-residue map induced by finite accelerated-Syracuse valuation words. It uses Lubuimi's Finite Valuation-Word Cylinder Partition Theorem as a mathematical input; that theorem is maintained separately in [PR #36](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/36). At fixed prefix length \(k\), every exact word \(\alpha\) has source weight \(w_\alpha=2^{-A(\alpha)}\) and maps to a unit residue
\[
\tau_k(\alpha)=C_k(\alpha)2^{-A(\alpha)}\pmod{3^k}.
\]
Aggregating these weights over the finite place set \((\mathbb Z/3^k\mathbb Z)^\times\) gives terminal masses \(m_k(t)\) and second moment \(E_k\).

The manuscript proves:
- exact diagonal/off-diagonal decomposition \(E_k=3^{-k}+C_k^{\rm coll}\);
- forced off-diagonal lower bound \(C_k^{\rm coll}\ge 1/(2\cdot3^k)\);
- exact first-level example \(E_1=5/9\);
- finite truncation with explicit source-mass and energy error bounds;
- an explicit rational Markov transition matrix \(P_k\) with terminal distribution \(m_k=\delta_0P_k^k\);
- exact \(k=2\) terminal distribution \((8,16,11,4,2,22)/63\) and energy \(5/21\).

## Why it matters

This is a genuine finite-place second-moment theorem for Syracuse valuation words. It supplies an exact diagonal/off-diagonal collision structure and a computable finite-state representation. It is a candidate input for the APW4 transport programme, but it is not the historical APW4 BIB reserve: an index-preserving map, original-weight preservation, and a capacity/Hall inequality remain open. It also does not prove global Collatz descent.

## Contents

- WRITTEN_REVIEW.md — internal mathematical review of the moment identity, truncation, Markov representation, and open interfaces.
- LEAN_FORMALIZATION_ROUTE.md — declaration-by-declaration formalization plan and exact audit requirements.
- lean/ — standalone Lean 4.35.0 project for the finite k=2 transition matrix, two-step distribution, and exact collision energy.
- MANUSCRIPT.md — full mathematical statement and proof, finite truncation, exact Markov matrix, examples, APW4 interface and limitations.
- LICENSE.md — project-specific rights and attribution notice.
- CITATION.cff — citation metadata.

## Verification boundary

The general collision-energy and Markov-matrix theorems remain mathematical manuscript derivations and are not yet Lean-compiled or axiom-audited. The finite k=2 matrix/distribution/energy module is separately Lean-compiled and axiom-audited on the standalone exact-head run recorded below. This finite verification does not certify the general k theorem or the infinite-word collision identity.

**Attribution:** Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers.


## Exact-head Lean 4.35.0 verification — 10 November 2026

Standalone workflow 42735188229 passed on commit `26c7b92fd529bf03582995e1bee301b0d07c131c`. Lean 4.35.0 and Mathlib v4.35.0 were used. All seven audited declarations — `initialRow_sum`, `rowOne_sum`, `rowTwo_sum`, `transitionRow_sum`, `twoStepNumerator_eq`, `twoStepMass_eq`, and `twoStepEnergy_eq_five_div_twentyOne` — print the standard transitive profile [propext, Classical.choice, Quot.sound]. The completed log contains no actual `sorryAx` hit. The exact two-step mass is (8,16,11,4,2,22)/63 and the collision energy is 5/21. This is a finite k=2 theorem module; no APW4/BIB identification or global Collatz consequence is claimed.


## Chronology correction — standalone k=2 audit passed on Lean 4.35.0

The older verification-boundary paragraph above predates the completed standalone audit and is superseded for the finite k=2 module only. Workflow 42735716873 passed on source commit 4e30c083f3e1657edd08b0945cdda4e16c8b0e14 using Lean 4.35.0 and Mathlib v4.35.0. The seven named declarations have transitive profile [propext, Classical.choice, Quot.sound], the completed log contains no actual sorryAx, and lake check --paranoid passed. The exact two-step distribution is (8,16,11,4,2,22)/63 and its collision energy is 5/21. The general k Markov representation, infinite-word moment identity, and APW4/BIB transport remain unverified by this module.
