# Carry-corrected drift: an exact audit of the entropy/Lyapunov proposal
Date: 2026-10-27

Status: research note with exact identities and a falsification target. This is not a proof of the Collatz/Syracuse conjecture, and no Lean build is claimed for the formulas in this note.

## 1. Exact block accounting

For an actual odd Syracuse orbit, write
\[
2^{a_j} n_{j+1}=3n_j+1,\qquad a_j=v_2(3n_j+1)\ge 1,
\]
and set \(A_0=0\), \(A_{j+1}=A_j+a_j\). Repeated substitution gives
\[
2^{A_N}n_N=3^N n_0+C_N,\qquad
C_N=\sum_{0\le j<N}3^{N-1-j}2^{A_j}.
\]
The correction term is positive and is the exact arithmetic footprint of the additive “+1” carry cascade.

Dividing by \(2^{A_N}n_0\) yields the exact identity
\[
\log_2\frac{n_N}{n_0}
=N\log_2 3-A_N+
\underbrace{\log_2\!\left(1+\frac{C_N}{3^Nn_0}\right)}_{\kappa_N>0}.
\]
Thus the correct carry-adjusted drift is
\[
D_N:=A_N-N\log_2 3-\kappa_N,
\qquad n_N<n_0\;\Longleftrightarrow\;D_N>0.
\]
This is an identity, not a new global estimate. It pinpoints exactly what an entropy-only argument omits: a bound on \(\kappa_N\), uniformly for the realized orbit blocks under consideration.

## 2. Why bit entropy alone cannot be the Lyapunov function

A bit-count statistic (Hamming weight, block entropy, or an average valuation) describes a block's distribution, not the exact location of its carries. The affine correction \(C_N\) depends on the *ordered prefix sums* \(A_j\), not just on the number of ones and zeros or on the mean of the exponents.

A decisive stress test is the finite valuation word
\[
(a_0,\ldots,a_{N-1})=(1,\ldots,1).
\]
Finite valuation cylinders allow arbitrarily long prescribed finite prefixes; the corresponding starting integer may depend on \(N\). For this word, \(A_N=N\), so the leading multiplicative term alone predicts growth, not descent. This does **not** exhibit one positive integer with an infinite all-ones itinerary: the realizing start can change with \(N\). It does refute any argument that claims a fixed block length, by itself, forces every block to have negative drift.

The same issue applies to “pseudo-random mixing”: a statistical law for uniformly sampled residues is not a pointwise theorem for the single nested residue path of a given integer orbit.

## 3. Proposed new structure: the carry-spectrum cocycle

Use a state that records the ordered carry contribution, rather than collapsing it to entropy.

For a realized block define
\[
R_0=0,\qquad R_{j+1}=3R_j+2^{A_j}.
\]
Then \(R_N=C_N\), and the block update is the exact affine cocycle
\[
n_N=\frac{3^Nn_0+R_N}{2^{A_N}}.
\]
The proposed *carry spectrum* of a finite word is the tuple
\[
\mathcal S_N=(A_N;A_0,A_1,\ldots,A_{N-1};R_N),
\]
optionally augmented by the initial residue cylinder that certifies the word is realized. It is deliberately ordered and arithmetic, not merely statistical.

A candidate potential can then be stated without logarithms:
\[
\mathcal L_N(n_0):= (2^{A_N}-3^N)n_0-R_N.
\]
For an actual block with \(2^{A_N}>0\),
\[
n_N<n_0\;\Longleftrightarrow\;\mathcal L_N(n_0)>0.
\]
This follows by multiplying the comparison by the positive integer \(2^{A_N}\) and substituting the affine identity. The potential is exact, but it is not automatically monotone across successive blocks; proving a uniform positive lower bound is the hard theorem, not a definition.

## 4. What would turn this into a proof strategy

A viable theorem must establish at least one of the following, with quantifiers explicit:

1. **Uniform realized-block descent:** every odd \(n>1\) has a realized finite block for which \(\mathcal L_N(n)>0\), preferably with a bound on \(N\) in terms of \(\log n\); or
2. **Global potential descent:** a state-dependent correction \(P(n)\) makes \(\log n+P(n)\) strictly decrease along every nonterminal Syracuse step; or
3. **Exceptional-path exclusion:** a proved cylinder-counting/covering theorem excludes every infinite path whose carry-corrected drift never becomes positive.

Average negative drift, density-one descent, or finite enumeration alone does not establish any of these pointwise statements.

## 5. Formalization and experiment queue

1. Formalize \(R_{j+1}=3R_j+2^{A_j}\) and prove by induction the closed sum for \(R_N\).
2. Prove the integer equivalence \(n_N<n_0\leftrightarrow\mathcal L_N(n_0)>0\) from the actual transition equations, without using natural-number subtraction as integer subtraction.
3. Enumerate short valuation words and their exact residue cylinders. Search for counterexamples to proposed *uniform* entropy-drift inequalities; retain the word and residue as a machine-checkable certificate.
4. Compare candidate statistics (Hamming weight, valuation sum, suffix-minimum valuation, and \(R_N/2^{A_N}\)) on the same exact word set. Use the results to reject weak potentials, not to infer the infinite theorem.
5. Only after a candidate bound survives these tests, implement its theorem in Lean and run both the project-specific axiom audit and an independent kernel check.

## 6. Scope boundary

This construction is a new bookkeeping language for the exact carry correction, not a claim that the Collatz problem is solved or that the structure is unprecedented in the literature. The potentially new contribution would be a proved uniform inequality on this state that bridges finite valuation cylinders to every positive integer orbit. That bridge is still open.
