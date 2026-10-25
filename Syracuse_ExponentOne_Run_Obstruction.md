# Syracuse exponent-one runs: exact obstruction to bounded-run arguments

Date: 2026-10-25

## Claim

For every integer r >= 1, there exists a positive odd starting value whose first r accelerated Syracuse exponents are all exactly 1. One explicit choice is

\[
n_0=2^{r+1}-1.
\]

Here the accelerated map is \(T(n)=(3n+1)/2^{v_2(3n+1)}\), and exponent \(a_i\) is defined by
\[
2^{a_i}n_{i+1}=3n_i+1,\qquad n_{i+1}\text{ odd}.
\]

## Proof

Inductively, for every \(0\le i\le r\),
\[
n_i\equiv -1\pmod {2^{r+1-i}}.
\]
The base case follows from the definition of \(n_0\). If the congruence holds at index \(i<r\), write \(n_i=-1+2^{r+1-i}q\). Then
\[
3n_i+1=-2+3\cdot2^{r+1-i}q
=2\left(-1+3\cdot2^{r-i}q\right).
\]
Thus the odd quotient for the exponent-one step is congruent to \(-1\) modulo \(2^{r-i}\), and is odd. Since \(r+1-i\ge2\), we also have \(n_i\equiv-1\equiv3\pmod4\), so \(3n_i+1\equiv2\pmod4\): exactly one factor of 2 is removed. This proves \(a_i=1\) for each \(i<r\).

## Consequence for the proof strategy

There is no uniform finite upper bound on consecutive exponent-one steps across all odd starting values. Therefore a proposed global descent proof cannot simply assert that negative local corrections are separated by a bounded number of positive corrections.

This does **not** disprove Collatz termination: the constructed starting value depends on r, and a long local run does not imply an infinite orbit. It instead rules out one tempting but invalid route to a global estimate.

## What remains to prove

The weighted correction identity has terms
\[
(2^{a_i}-4)2^{A_i},\qquad A_i=\sum_{j<i}a_j,
\]
with negative terms at exponent one and positive terms at exponents at least three. Any useful global lemma must control their *weighted cumulative balance* along realizable trajectories, not merely bound the maximum run length or use the Haar-random average exponent.

This note is a mathematical obstruction/roadmap, not a formal Lean proof and not a solution of the Collatz conjecture.
