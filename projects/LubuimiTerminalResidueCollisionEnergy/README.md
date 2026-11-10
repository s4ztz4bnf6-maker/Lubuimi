# Lubuimi's Terminal-Residue Collision Energy

**Author:** Ta-Yoshua Lubuimi  
**Date:** 10 November 2026  
**Status:** Standalone mathematical research manuscript; Lean formalization target, not yet compiled.

This project studies the terminal-residue map induced by finite accelerated-Syracuse valuation words. At fixed prefix length \(k\), every exact word \(\alpha\) has source weight \(w_\alpha=2^{-A(\alpha)}\) and maps to a unit residue
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
- MANUSCRIPT.md — full mathematical statement and proof, finite truncation, exact Markov matrix, examples, APW4 interface and limitations.
- LICENSE.md — project-specific rights and attribution notice.
- CITATION.cff — citation metadata.

## Verification boundary

The collision-energy and Markov-matrix results are mathematical manuscript derivations. They are not yet Lean-compiled or axiom-audited. The initial all-one cylinder theorem and the offset/margin modules have separate successful Lean audits; those do not certify this manuscript.

**Attribution:** Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers.
