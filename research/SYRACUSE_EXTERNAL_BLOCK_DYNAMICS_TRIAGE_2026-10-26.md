# Syracuse external-idea triage: block dynamics, inverse branches, and proof obligations
Date: 2026-10-26

## Purpose
This is a source-triage memo, not an endorsement of any claimed Collatz result. It compares a recently indexed Mersenne-block proposal with the project's exact inverse-branch framework and specifies what would be required before importing it into the proof pipeline.

## Source observed
Stephen R. Campbell, "Mersenne Block Dynamics: A Framework for the Collatz Conjecture" (vixra preprint, 18 Dec 2025), indexed abstract at https://ai.vixra.org/pdf/2512.0068v1.pdf. The abstract describes blocks based on the 2-adic valuation of x+1, a coarse-grained block map, and an expected logarithmic drift under an orbit-mixing / i.i.d. geometric assumption.

This source is a candidate for idea mining only. Its presence in a repository or search index does not establish correctness, peer review, or a proof of Collatz.

## Mathematical separation: deterministic identity versus probabilistic closure
A block decomposition can be useful if each block transition is an exact deterministic identity. But the conclusion that typical block parameters behave like independent geometric random variables is a separate statistical hypothesis. Exact one-step distributions do not imply temporal independence along a deterministic orbit.

Therefore:
- retain any exact block transition identity only after deriving it directly from the standard Syracuse map;
- treat an i.i.d. or orbit-mixing premise as an explicit assumption, never silently promote it to a theorem;
- a negative expected logarithmic drift is not a pointwise descent theorem and does not rule out exceptional orbits;
- do not infer all-start convergence from density or typical-orbit behavior.

## Exact inverse-branch compatibility test
For odd y>0 and exponent a>=1, a predecessor x exists precisely when
  2^a y == 1 (mod 3),
and then x=(2^a y-1)/3 is positive odd with v2(3x+1)=a.
Equivalently y == (-1)^a (mod 3). This is the current deterministic gate.

Any proposed block map must commute with this exact gate: each alleged predecessor and each intermediate state must be integral, positive, odd when required, and have the claimed exact valuation.

## Proposed falsification protocol
For each candidate block identity:
1. rewrite it using integer variables and explicit valuation hypotheses;
2. derive it from a finite number of standard Syracuse steps without probabilistic assumptions;
3. test all small admissible inputs by exact integer arithmetic;
4. search specifically for off-by-one errors in v2(x+1) versus v2(3x+1), and for transitions that leave the positive odd domain;
5. separate a verified identity from any probabilistic drift statement;
6. formalize the identity in Lean before using it as a lemma in a global argument.

## Global transfer gate
A global proof still needs a deterministic theorem excluding every nontrivial divergent orbit (including nonrepeating unbounded orbits). A no-cycle result, an almost-everywhere result, a density-one result, and a negative expected drift are each insufficient by themselves.

## Status
No source theorem from this preprint is imported as an established result. No Lean compilation or Collatz proof is claimed. The actionable outcome is a disciplined route for extracting exact block identities while rejecting unproved independence assumptions.
