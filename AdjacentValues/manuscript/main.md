# Consecutive Values of Restricted \(2\)-\(3\) Sums

**Tayoshua Luguimi and Phillipp Haas**  
Working research manuscript — 18 November 2026

## Abstract

We study the values
\[
T_n(e)=\sum_{j=0}^{n-1}3^{n-1-j}2^{e_j}
\]
associated with strictly increasing sequences of nonnegative integer exponents. The central question is whether two admissible sequences of every fixed positive length can produce consecutive values. The project investigates a proposed block-induction strategy based on a concatenation identity, an odd-target induction invariant, and finite block certificates. The universal existence statement remains open in the latest independently retrievable v0.6.0 validation record.

This file is the initial repository manuscript record. It states the mathematical architecture but is **not yet a complete publication proof**: the exact five certificate tables and their reproducible witness data still need to be inserted and checked against the source dossier.

## 1. Definitions and main question

For \(n\geq 1\) and a strictly increasing sequence \(e=(e_0,\ldots,e_{n-1})\) of nonnegative integers, set
\[
T_n(e)=\sum_{j=0}^{n-1}3^{n-1-j}2^{e_j}.
\]
The adjacent-values problem asks whether for every \(n\geq1\) there exist admissible \(e,f\) such that
\[
T_n(f)-T_n(e)=1.
\]

## 2. Block concatenation

For a prefix \(e\) of length \(L\), a suffix \(a\) of length \(k\), and a shift placing every suffix exponent above every prefix exponent, the project uses the identity
\[
T_{L+k}\bigl(e\mathbin{\|}(a+E+1)\bigr)
=3^kT_L(e)+2^{E+1}T_k(a),
\]
where every exponent of \(e\) is at most \(E\). This separates the prefix contribution from the translated suffix contribution.

## 3. Odd-target invariant

The proposed induction invariant \(Q(L,E)\) is:

For every odd integer \(t\) with \(|t|\leq 2^{E+1}\), there are admissible length-\(L\) sequences \(e,f\), with exponents bounded by \(E\), such that
\[
T_L(f)-T_L(e)=t.
\]

The reported block-step strategy is organized around the congruence
\[
u\equiv 3^{-k}t\pmod{2^{E+1}},
\qquad
v=\frac{t-3^ku}{2^{E+1}}.
\]
Two representatives of the residue class differ by \(2^{E+1}\), so their corresponding \(v\)-values differ by \(3^k\), an odd integer. Consequently exactly one of the two corresponding values is odd. The finite block certificate is intended to cover the resulting odd \(v\)-range.

## 4. Certificate parameters and exponent bound

The five reported block parameter pairs (not yet supported here by the underlying CSV archive) are
\[
(5,10),\ (6,11),\ (7,13),\ (8,14),\ (9,15).
\]
The exact finite tables and witness encodings are not included in this initial manuscript snapshot. They are a required proof artifact, not optional numerical illustration.

For \(n\geq5\), the proposed decomposition starts with a block of length \(5+r\), \(0\leq r\leq4\), and continues with blocks of length \(5\). The recorded exponent bound is \(E_n\leq2n-1\).

The even-target consequence uses \(t=2^s t'\) with \(t'\) odd and the scaling identity
\[
T_n(e+s)=2^sT_n(e).
\]
The claimed corollary is that every integer \(t\) with \(|t|\leq2^{2n-3}\) is representable, with exponent bound \(4n-4\). This implication is conditional on a valid proof of the odd-target induction statement; neither the induction proof nor the finite certificates are independently available in this repository snapshot.

## 5. Base cases

The recorded witnesses are:

\[
\begin{array}{c|c|c}
n&e&f\\\hline
1&(0)&(1)\\
2&(1,2)&(0,3)\\
3&(0,2,4)&(1,2,3)\\
4&(0,1,5,6)&(1,3,4,5)
\end{array}
\]

These are finite base witnesses. They do not replace the induction step.

## 6. Mathematical and formal verification status

The latest independently retrievable v0.6.0 validation log states that the universal adjacent-value conjecture remains **OPEN — NOT PROVED**. A later proof package and five certificate tables have been reported, but the archive and exact proof script were not available in the repository or Library during this update. Their reported 89,824 rows and independent verification therefore remain **REPORTED — NOT VERIFIED HERE**.

The accompanying Lean subproject currently formalizes the definition of \(T_n\), admissibility as strict monotonicity, and the exponent-shift identity. It does not yet formalize \(Q(L,E)\), the finite block tables, the block induction, or the universal adjacent-values theorem. No claim of Lean kernel verification or axiom audit for the main theorem is made in this version.

## 7. Required completion items

1. Import the exact five finite block tables and witness encodings from the authoritative project source.
2. Re-run an independent verifier against those exact tables.
3. Formalize finite certificate coverage in Lean without sorry, project-specific axioms, or untrusted theorem oracles.
4. Formalize the odd-target induction and derive the adjacent-values theorem.
5. Run #print axioms on the main theorem and every nontrivial dependency.
6. Record exact commit SHA, Lean and Mathlib versions, workflow run, job logs, and axiom output.
7. Complete a full related-work review before making a definitive novelty claim.

## Acknowledgements and disclosure

The authors are Tayoshua Luguimi and Phillipp Haas. AI tools were used in this research session for mathematical exploration, drafting of the proposed block-induction route, and assistance with certificate/checker development. The precise provenance and contents of the reported certificate archive remain to be inspected. AI tools are not authors or independent verifiers; the authors remain responsible for the statements, proofs, code, and reproducibility.
