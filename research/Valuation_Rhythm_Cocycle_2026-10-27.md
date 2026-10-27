# Valuation-rhythm cocycle: exact carry/discrepancy coordinates
Date: 2026-10-27
Status: exact reformulation of accelerated Syracuse dynamics; no global drift inequality established

## Purpose

The audits repeatedly locate the same bottleneck: the valuation sequence is not random noise that can be averaged away. It is an integer word constrained by the orbit itself, and any entropy or acoustic analogy must eventually become a deterministic inequality for every admissible word. This note defines a two-coordinate signature of that word so proposed potentials can be tested against exact identities rather than intuition.

The terminology "rhythm" is a project-specific mnemonic, not a claim that the construction is unprecedented in mathematics.

## 1. Definitions

Let x_0 be a positive odd integer and iterate the accelerated odd Syracuse map
x_(j+1)=(3x_j+1)/2^(a_j), where a_j=v_2(3x_j+1) >= 1.
Set
A_0=0, A_k=sum_{j<k} a_j,
D_k=A_k-k log_2(3),
Q_0=0, Q_k=(1/3) sum_{j<k} 2^(D_j).

- The integer word (a_j) is the valuation rhythm.
- D_k is the cumulative 2-versus-3 logarithmic discrepancy.
- Q_k is the accumulated normalized carry mass.

D_k is real, while A_k and each x_k are integers. Since log_2(3) is irrational, D_k is not periodic even if the valuation word were periodic.

## 2. Exact cocycle theorem

For every k >= 0,
[
oxed{x_k=2^{-D_k}(x_0+Q_k).}
]
Moreover,
[
oxed{D_{k+1}=D_k+a_k-log_2 3,qquad
Q_{k+1}=Q_k+2^{D_k}/3.}
]

**Proof.** Repeated substitution in the accelerated recurrence gives
[
2^{A_k}x_k=3^k x_0+C_k,quad
C_k=sum_{j=0}^{k-1}3^{k-1-j}2^{A_j}.
]
Dividing by 3^k yields
[
x_k=2^{-D_k}left(x_0+sum_{j=0}^{k-1}rac{2^{A_j}}{3^{j+1}}ight).
]
Since 2^{A_j}/3^j=2^{D_j}, the sum is (1/3)sum_{j<k}2^{D_j}=Q_k. The two recurrences follow directly from the definitions. QED.

## 3. Exact escape criterion

For this orbit,
[
x_k	oinfty
quadLongleftrightarrowquad
log_2(x_0+Q_k)-D_k	oinfty.
]
This is not a solution of Collatz; it isolates the competing mechanisms. Growth of the discrepancy D_k alone is not enough to conclude descent, because the accumulated carry mass Q_k also grows. Conversely, a large Q_k alone does not imply escape if D_k grows still faster.

For a fixed barrier H, the condition x_k>H is exactly
[
D_k<log_2((x_0+Q_k)/H).
]
Thus any proof of escape must exhibit an admissible valuation word whose cumulative carry mass dominates the discrepancy at every sufficiently late time. Any proof excluding escape must show that every admissible word eventually violates this inequality for each fixed H, or use a separate cycle argument.

## 4. Why this is a sharper audit object than a raw entropy heuristic

A proposed entropy score or musical/rhythmic statistic built from the bits is useful only if it controls one of the exact coordinates above. In particular, a claim that "typical carries mix" is not a deterministic theorem. To prove global descent, the next step must be one of:
- a deterministic upper bound on Q_k relative to D_k for all admissible valuation words;
- a deterministic lower bound forcing D_k to cross the barrier log_2((x_0+Q_k)/H);
- a structural classification of the valuation words that evade such a crossing, followed by an exclusion of those words using the residue constraints a_j=v_2(3x_j+1).

A word of positive integers a_j >= 1 is not automatically admissible. The congruence constraints linking a_j to x_j are part of the theorem and must not be dropped when searching for a counterexample or proving a bound.

## 5. Falsification protocol

Any proposed inequality in D_k and Q_k should be tested in this order:
1. Test all short admissible valuation words by exact integer simulation, not arbitrary unconstrained words.
2. Search for a family of admissible words violating the inequality as length grows.
3. If no violation appears, state the exact quantifiers and prove the inequality without probabilistic assumptions.
4. Formalize the identity and the proved inequality in Lean; audit the transitive axiom set and source statement independently.

Finite searches can refute a universal inequality by a concrete counterexample, but cannot establish it for all k. No global bound, cycle exclusion, counterexample orbit, Lean build, or CI success is claimed in this note.
