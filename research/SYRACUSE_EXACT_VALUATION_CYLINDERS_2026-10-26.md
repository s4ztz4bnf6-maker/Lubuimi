# Syracuse valuation cylinders: finite-word theorem and formalization plan

Status: mathematical derivation / formalization target. This document is not a Lean-checked theorem and does not claim a Collatz solution.

## 1. Definitions

Fix a finite word of positive exponents a_0,...,a_(N-1), with a_k >= 1. Define
A_0=0, A_(k+1)=A_k+a_k,
and for a chosen start n_0 in Nat,
C_0=n_0, C_(k+1)=3C_k+2^(A_k).
Expanding the recurrence gives
C_N=3^N n_0+S_N, where S_N=sum_{j=0}^{N-1} 3^(N-1-j) 2^(A_j).

## 2. Exact endpoint cylinder

For a natural number C, encode v_2(C)=A_N without relying on a partial valuation function as
2^(A_N) divides C and 2^(A_N+1) does not divide C.
Equivalently, C_N is congruent to 2^(A_N) modulo 2^(A_N+1).

Because 3^N is odd, it is a unit modulo 2^(A_N+1). Thus the endpoint condition selects exactly one residue class for the start:
n_0 is congruent to (2^(A_N)-S_N) times the inverse of 3^N modulo 2^(A_N+1).
For N=0, handle the empty word separately: A_0=0, C_0=n_0, and the endpoint exact-valuation condition says simply that n_0 is odd. Do not silently use the positive-length argument in this case.

## 3. Why the endpoint forces all prefix valuations

Assume N>0, all exponents are positive, and 2^(A_N) divides C_N. For every k<N, expanding the recurrence from index k yields
C_N=3^(N-k)C_k + sum from j=k to N-1 of 3^(N-1-j)2^(A_j).
Modulo 2^(A_k+1), every summand with j>k vanishes, since A_j >= A_k+1. Also A_N >= A_k+1, so
0 is congruent to C_N, which is congruent to 3^(N-k-1)(3C_k+2^(A_k)) modulo 2^(A_k+1).
The odd factor 3^(N-k-1) is invertible modulo 2^(A_k+1). Hence
3C_k+2^(A_k) is congruent to 0 modulo 2^(A_k+1).
It follows that 2^(A_k) divides C_k, and the quotient C_k/2^(A_k) is odd. Thus every prefix has exact valuation A_k.

Set n_k=C_k/2^(A_k). Then n_k is odd and
2^(a_k)n_(k+1)=3n_k+1.
Choose a sufficiently large nonnegative representative in the selected residue class for n_0 to ensure all states are positive. The recurrence then produces a genuine finite accelerated-Syracuse word.

## 4. Formalization plan (Lean 4 / Mathlib)

1. Define prefix sums and the affine recurrence using Fin indices or recursion on N.
2. Prove the closed form for C_N by induction.
3. State exact valuation as divisibility plus non-divisibility, avoiding totalized division and partial valuation edge cases.
4. Prove Nat.Coprime (3^N) (2^(A_N+1)), then express the unique solution using ZMod (2^(A_N+1)) and IsUnit.
5. Prove prefix exactness with the displayed congruence; isolate N = 0.
6. Define each state as the quotient after proving divisibility; prove oddness, positivity, and the Syracuse step equation.
7. Add an exhaustive small-word test as a diagnostic only, then run the project build and transitive #print axioms audit.

## 5. What this does not prove

This is a finite-cylinder classification for prescribed positive exponent words. It does not prove that every orbit descends, that a cylinder contains a small representative, or that all Collatz orbits reach 1. Compactness of Z_2 alone does not turn a finite-word statement into universal convergence. The next meaningful target is a quantitative bound on the least positive representative of a word cylinder, or a rigorous count of cylinders with a specified descent property.

## 6. Executable finite certificate added (2026-10-26)

The accompanying script `research/tools/syracuse_valuation_cylinder_certificate.py` computes the unique residue class using modular inversion and checks direct orbit realizations for several lifts. Regression tests are in `research/tools/test_syracuse_valuation_cylinder_certificate.py`.

For the word (1,4), the tool returns the class n_0 = 3 (mod 64), whose first representative gives 3 -> 5 -> 1. A local independent check exercised 119 positive words with total exponent at most 7 (under a maximum word length of 5), checking three lifts per word; all matched their prescribed valuation words.

This is a concrete implementation check, not Lean verification. The general theorem above still requires formalization and a full project build. The tool itself does not establish an Archimedean descent bound: each cylinder contains arbitrarily large starts, and the residue-class structure is 2-adic rather than a monotonicity theorem over the positive integers.

## 7. New structural observation: cylinder measure is exact, descent is a separate observable

For a fixed word a=(a_0,...,a_(N-1)), the class is one residue modulo 2^(A_N+1). Among all integers its natural density is 2^(-(A_N+1)); conditioned on an odd starting integer, its relative density is exactly 2^(-A_N). This follows directly because the odd integers occupy one of two residue classes modulo 2, and the cylinder is a single odd class modulo 2^(A_N+1).

Consequently, for fixed length N the cylinders indexed by all positive words of length N have total conditional 2-adic measure
sum_{a_0,...,a_(N-1)>=1} 2^(-sum a_i) = (sum_{a>=1}2^(-a))^N = 1.
This is a partition-of-mass identity, not a descent theorem. It formalizes the valuation process as a probability-preserving symbolic coding under normalized Haar measure on odd 2-adic integers. The key missing estimate is a joint bound linking this cylinder measure to the real-valued endpoint n_N/n_0; Haar measure does not control the least positive representative in the required way.

A candidate next lemma is therefore deliberately modest: formalize the exact cylinder measure and the mass identity first, then separately seek an inequality on the affine correction term
sum_{j<N} log(1+1/(3 n_j)).
Any argument that treats the valuation digits as independent for a fixed deterministic integer orbit must prove that dependence claim; the geometric Haar distribution alone is insufficient.

## 8. Literature/reliability audit (2026-10-26)

Recent public literature includes several formalized or computationally supported partial results, but none cited here closes the full conjecture. The 2026 “nu_2 Countdown” claim concerns consecutive single-halving compound steps in a specified residue regime, not universal convergence. Other conditional cycle analyses explicitly retain hypotheses. A project advertised as a full Lean Collatz proof must be checked for statement fidelity, the actual pinned Lean version, and transitive axioms; the July/August 2026 kernel soundness incident makes post-fix rebuilds important.

Relevant reading:
- Tao/Hales, reliability and AI, 9 Oct 2026: https://terrytao.wordpress.com/2026/10/09/what-mathematicians-should-know-about-the-lean-theorem-proverquestions-of-reliability-and-ai/
- Lean kernel soundness bug postmortem: https://leodemoura.github.io/blog/2026-8-1-postmortem-for-kernel-soundness-bug-14576/
- A reported valuation countdown theorem (scope to be audited): https://zenodo.org/records/19371947
- A conditional-cycle project with a recent post-fix recheck report: https://collatz-lab.org/

No global proof or counterexample is claimed.
