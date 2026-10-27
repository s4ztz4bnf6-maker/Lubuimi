# Escape-frequency certificate for the divergent Syracuse branch
Date: 2026-10-27
Status: exact mathematical derivation; not yet Lean-checked; not a Collatz proof

## Why this is the right global branch to test

The Collatz audit has repeatedly hit the same boundary: typical valuation statistics do not control every orbit. Instead of assuming pseudorandom carries, this note derives a necessary valuation-frequency condition for the only escape alternative, an odd Syracuse trajectory tending to infinity. It is deterministic and falsifiable against exact orbit data.

Let
\[
S(x)=\frac{3x+1}{2^{v_2(3x+1)}}
\]
for odd positive integers x, and write \(a_i=v_2(3x_i+1)\), where \(x_{i+1}=S(x_i)\). Thus \(a_i\ge1\), and \(a_i=1\) exactly when \(x_i\equiv3\pmod4\).

## Theorem (necessary escape frequency)

If \(x_i\to\infty\), then
\[
\liminf_{k\to\infty}\frac1k
\#\{0\le i<k:a_i=1\}
\;\ge\;\log_2(4/3)\;\approx\;0.4150374993.
\]

### Proof

Fix any integer \(H>1\). Since \(x_i\to\infty\), choose t so that \(x_i>H\) for all \(i\ge t\). Set
\[
c_H=\frac{3+1/H}{4}<1.
\]
For \(i\ge t\):
- if \(a_i=1\), then \(x_{i+1}=(3x_i+1)/2 < 2c_H x_i\);
- if \(a_i\ge2\), then \(x_{i+1}\le(3x_i+1)/4 < c_H x_i\).

For a length-k tail segment, let u_k be the number of indices with \(a_i=1\). Multiplication gives
\[
x_{t+k}<x_t\,c_H^k 2^{u_k}.
\]
Because \(x_i\to\infty\), eventually \(x_{t+k}>x_t\). Hence for all sufficiently large k,
\[
1<c_H^k2^{u_k},\qquad
\frac{u_k}{k}>-\log_2 c_H=\log_2\frac{4}{3+1/H}.
\]
A finite shift by t does not change asymptotic frequency. Taking the liminf and then letting H tend to infinity proves the claim. \(\square\)

## What this buys us, and what it does not

This turns “a divergent orbit needs unusually favorable carries” into a necessary numerical condition: at least about 41.5% of its odd-to-odd steps must have valuation exactly one in the long-run lower-frequency sense. Those steps are precisely residues \(x_i\equiv3\pmod4\).

It does NOT rule out escape: the natural 2-adic valuation law has frequency 1/2 for valuation one, above this threshold. It does not exclude nontrivial cycles. The threshold is therefore a diagnostic, not a proof.

## The next decisive experiment

For exact Syracuse trajectories, record the running minimum of
\[
\frac{1}{k}\#\{i<k:x_i\equiv3\pmod4\}
\]
along the largest tested ranges, alongside \(\log_2(4/3)\). Search specifically for long intervals with frequency below the threshold while the trajectory's minimum remains large. Any finite observation is only a falsification of a proposed finite-scale strengthening, not evidence of a global theorem.

The mathematically meaningful next step is to exploit dependencies between successive residues, not just the one-step frequency. A proof would need to show that the residue constraints force a stronger blockwise inequality, or else construct an admissible infinite valuation sequence whose exact affine cocycle yields escape. The standard 2-adic metric cannot supply this by contraction: same-parity distances expand by exactly 2.

## Integrity boundary

This is a paper derivation added as a research target. No Lean compilation, formal proof, empirical run, or global Collatz conclusion is claimed. The theorem is elementary enough to formalize with exact rational inequalities plus a real-logarithm interface; until that is checked, it remains a handwritten derivation.
