# Lean formalization route: terminal exact-residue criterion

**Project:** Finite Exact Valuation-Word Cylinder Classification and Tail Partition  
**Author:** Ta-Yoshua Lubuimi  
**Date:** 10 November 2026  
**Status:** Mathematical derivation and formalization design; not yet Lean-compiled or axiom-audited.

This note gives a direct formalization route for the general finite-word theorem. It does not replace the standalone manuscript and does not claim a Lean result.

## 1. Finite-word data

Fix \(k\in\mathbb N\), a positive exponent word \(a:\mathrm{Fin}(k)\to\mathbb N\), and a positive odd start \(n_0\). Define prefix sums by
\[
A_0=0,\qquad A_{j+1}=A_j+a_j,
\]
and offsets by
\[
C_0=0,\qquad C_{j+1}=3C_j+2^{A_j}.
\]
Set
\[
X_j=3^j n_0+C_j.
\]
Then
\[
X_{j+1}=3X_j+2^{A_j}.
\]
For an actually realized valuation word, the affine offset identity is
\[
X_j=2^{A_j}n_j.
\]

## 2. Terminal exact-residue criterion

Let \(A=A_k\). The central condition is
\[
\boxed{X_k\equiv 2^A\pmod{2^{A+1}}.}
\]
It says exactly that \(2^A\mid X_k\) and the quotient \(X_k/2^A\) is odd.

For each \(j<k\), repeated expansion of the recurrence gives
\[
X_k=3^{k-j}X_j+2^{A_j}R_j,
\]
where
\[
R_j=\sum_{t=j}^{k-1}3^{k-1-t}2^{A_t-A_j}.
\]
The first summand of \(R_j\) is odd. Every later summand is even because all exponents are positive and hence \(A_t>A_j\) for \(t>j\). Therefore \(R_j\) is odd.

Since \(A_k>A_j\), the terminal congruence implies
\[
X_k\equiv0\pmod{2^{A_j+1}}.
\]
The suffix expansion first implies \(2^{A_j}\mid X_j\), because \(3^{k-j}\) is odd and the second term is divisible by \(2^{A_j}\). Write \(X_j=2^{A_j}y_j\). Reducing the expansion modulo \(2^{A_j+1}\) gives
\[
3^{k-j}y_j+R_j\equiv0\pmod2.
\]
Both \(3^{k-j}\) and \(R_j\) are odd, so \(y_j\) is odd. Thus
\[
\boxed{X_j\equiv2^{A_j}\pmod{2^{A_j+1}}\quad(0\le j\le k).}
\]
The terminal exact-residue condition forces exact divisibility and odd quotient at every prefix.

Conversely, if the prescribed transitions are realized with odd quotients, then \(X_k=2^{A_k}n_k\) with \(n_k\) odd, which gives the terminal congruence. The forward direction reconstructs the entire quotient orbit by setting \(n_j=X_j/2^{A_j}\). The recurrence for \(X_j\) then yields
\[
2^{a_j}n_{j+1}=3n_j+1,
\]
and oddness of \(n_{j+1}\) makes \(a_j\) the exact 2-adic valuation.

## 3. Unique initial residue

The terminal condition is
\[
3^k n_0+C_k\equiv2^A\pmod{2^{A+1}}.
\]
Since \(3^k\) is invertible modulo \(2^{A+1}\), it determines exactly one residue:
\[
\boxed{
r_\alpha\equiv(2^A-C_k)(3^k)^{-1}\pmod{2^{A+1}}.
}
\]
For \(k>0\), the offset \(C_k\) is odd, so \(r_\alpha\) is odd. For the empty word, the condition is simply \(n_0\equiv1\pmod2\). Thus the unique class is always an odd starting class.

This gives the one-cylinder classification and relative odd-start density \(2^{-A}\).

## 4. Lean declaration sequence

Formalize the proof as small independently audited declarations:

1. prefixExponent_succ: prefix-sum recurrence and monotonicity \(A_j\le A_t\) for \(j\le t\).
2. offsetNumerator_succ: \(X_{j+1}=3X_j+2^{A_j}\).
3. suffixExpansion: the finite suffix identity \(X_k=3^{k-j}X_j+2^{A_j}R_j\).
4. suffixCorrection_odd: oddness of \(R_j\) for \(j<k\).
5. terminalExact_residue_prefixExact: terminal exact residue implies exact residue at every prefix.
6. prefixExact_reconstructOddOrbit: define \(n_j=X_j/2^{A_j}\) after proving divisibility; establish positivity, oddness, and the transition identity.
7. terminalExact_iff_wordRealized: combine reconstruction with the direct direction.
8. initialResidue_unique: solve the terminal congruence using the inverse of \(3^k\) modulo \(2^{A+1}\).
9. finiteCylinder_density: count one odd residue class among the \(2^A\) odd classes modulo \(2^{A+1}\).

Use one arithmetic representation consistently. Nat.ModEq, divisibility, or ZMod \((2^{A+1})\) are all viable, but conversions should be explicit named lemmas. For natural-number division, prove divisibility before using Nat.div_mul_cancel; do not expect omega to infer quotient identities without the divisibility premise.

## 5. Finite tail partition

For a fixed parent word of total exponent \(A\), write its starts as
\[
n_0=r+2^{A+1}t.
\]
The affine identity gives
\[
n_k=n_k^*+2\cdot3^k t.
\]
The tail event \(a_k\ge B+1\) is exactly
\[
3n_k+1\equiv0\pmod{2^{B+1}}.
\]
After dividing this congruence by \(2\), the coefficient of \(t\) is \(3^{k+1}\), which is odd and hence invertible modulo \(2^B\). There is exactly one \(t\pmod{2^B}\) satisfying the tail condition. Therefore the tail is one residue class modulo \(2^{A+B+1}\).

The exact children \(b=1,\ldots,B\) have relative masses \(2^{-b}\), while the tail has relative mass \(2^{-B}\):
\[
\sum_{b=1}^{B}2^{-b}+2^{-B}=1.
\]
Formalize this only after parent-cylinder reconstruction and the exact-next-exponent lemma are complete.

## 6. Required audit boundary

- The general finite-word theorem and finite tail partition have mathematical proofs in the standalone manuscript, but are not yet Lean-compiled.
- The initial all-one special case is separately Lean-audited in seven successful exact-commit workflows: 42721006544, 42721305220, 42721911555, 42722186081, 42724343412, 42725006480, and 42725493567.
- This terminal-congruence route is a proof design, not a verified general-word result.
- Final evidence must include the exact commit SHA, successful full build, positive declaration coverage, lake check --paranoid, named #print axioms output for the theorem and density corollary, and a complete-log scan free of sorryAx and project-specific axioms.
- Finite cylinder density alone does not imply global Collatz descent.

**Attribution:** Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers.


## Cross-project formalization note — 10 November 2026

The general finite valuation-word cylinder theorem and its exact tail partition remain mathematically proved in the companion manuscript but are not yet Lean-formalized. A separate finite-state sub-result arising from the terminal-residue project has now been implemented as `LubuimiTerminalResidueEnergyK2.lean` on the Syracuse/Collatz formalization branch, commit `c0d3e93e19d13fda2044e24f7c8902d4c47d75d8`. It encodes the rational k=2 transition matrix modulo 9 and the exact two-step distribution/energy. Workflow 42730248268 was queued for that exact head when this note was written.

This is a formalization of the finite k=2 calculation only. It does not formalize the general finite-word cylinder classification, its density theorem, or the exact finite tail partition. Those remain separate obligations in Sections 4–5 above. No formal verification claim is made until the exact-head run completes and the named declarations pass the axiom audit.


## Cross-project verification update — 10 November 2026

The separate finite k=2 terminal-residue transition matrix and collision-energy calculation is now Lean-verified independently in its own project. Standalone Lean 4.35.0/Mathlib v4.35.0 workflow 42735188229 passed on code commit `26c7b92fd529bf03582995e1bee301b0d07c131c`; all seven named declarations print [propext, Classical.choice, Quot.sound], with no actual `sorryAx` hit. The unified Syracuse/Collatz root-library workflow 42733657952 also passed and compiled the same k=2 module alongside the signed-margin cap and finite L945 CRT audit.

The B=1023 threshold-return archive supplies a concrete exact word `(1,2)`: (731\to1097\to823), (A=3), (C=5), residue (11\pmod{16}), and affine identity (8\cdot823=9\cdot731+5). Its regression certificate also checks the local margin caps. This is a finite cross-check of the cylinder and margin formulae, not a Lean proof of the general finite-word theorem.

**Unchanged formalization boundary:** this project’s general finite-word one-cylinder theorem, its exact density corollary, and the finite cutoff/tail-cylinder partition remain mathematically proved in the manuscript but not yet Lean-compiled. The all-one special case and the local signed-margin cap are separately Lean-verified; neither substitutes for this general theorem.


## First mixed-word Lean test case — (1,2), pending exact-head audit

The Syracuse/Collatz programme now contains a concrete finite-word declaration in SyracuseOffsetIdentity.lean:

`realizesValuationWord12_iff_mod_sixteen_eleven`.

It formalizes the exact two-step word (1,2), using odd quotient witnesses n₁,n₂ with
2*n₁=3*n+1 and 4*n₂=3*n₁+1, and proves that this word is realized exactly when n ≡ 11 (mod 16). This is the A=3 instance of the general finite-word residue formula. It is also the exact valuation word of the finite Kolaz witness 731 -> 1097 -> 823.

The declaration is present on Syracuse PR #9 source head 56c6d6d86fb5122d75f89f5e614f7f333e2d31a9. Exact-head workflow 42736159935 is still in progress at this update. Therefore this is a formalization candidate, not yet a Lean-verified result. If it passes, it will provide a verified mixed-word test case, but it will not by itself formalize the arbitrary-word theorem or the finite tail partition.


## Exact mixed-word (1,2) Lean verification — completed

The pending declaration above has now passed. Workflow 42736159935 completed successfully on exact Syracuse source commit 56c6d6d86fb5122d75f89f5e614f7f333e2d31a9. It compiled realizesValuationWord12_iff_mod_sixteen_eleven, printed transitive profile [propext, Classical.choice, Quot.sound], and the completed job log contained no actual sorryAx occurrence. The compile-drafts build completed successfully (8,932 jobs).

This verifies the specific mixed word (1,2), equivalently n ≡ 11 mod 16, including the exact odd quotient witnesses. It is the A=3 instance of the general finite-word formula. It does not formalize arbitrary words, the tail partition, or the general finite-word theorem. The general theorem remains mathematically proved with Lean formalization open.


## Lean-verified mixed-word example — 10 November 2026

The unified Syracuse/Collatz root audit now includes the concrete mixed word (1,2). Declaration `CollatzSyracuseAudit.realizesValuationWord12_iff_mod_sixteen_eleven` proves that there exist odd quotients n₁,n₂ with 2n₁=3n+1 and 4n₂=3n₁+1 if and only if n≡11 (mod 16). Exact-head workflow 42736159935 passed on commit `56c6d6d86fb5122d75f89f5e614f7f333e2d31a9`; the declaration prints [propext, Classical.choice, Quot.sound], and the completed checked logs have no actual `sorryAx` hit.

This formally verifies one nontrivial finite word and its exact residue cylinder. It is consistent with the B=1023 Kolaz example 731→1097→823, but does not yet prove the general finite-word theorem, its density corollary, or the finite tail-cylinder partition. Those remain open Lean formalization tasks.


## Local one-step backward lemma — 10 November 2026

Before formalizing the full suffix expansion, the source accumulator recurrence permits a shorter local implication. If `a k ≥ 1` and `C_(k+1) ≡ 2^(A_(k+1)) [MOD 2^(A_(k+1)+1)]`, then `C_k ≡ 2^(A_k) [MOD 2^(A_k+1)]`. The mathematical divisibility proof and target signature are recorded in the companion [backward-step note](https://github.com/s4ztz4bnf6-maker/Lubuimi/blob/collatz/terminal-exact-backward-step-2026-11-10/research/SYRACUSE_TERMINAL_EXACT_BACKWARD_STEP_2026-11-10.md). This is not yet implemented or Lean-compiled. It does not replace the remaining reconstruction, arbitrary-word cylinder, density, or finite-tail formalization obligations.


## CI job-level scope correction — 10 November 2026

The current PR #36 branch-head workflow [42835807279](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42835807279) completed at workflow level, but the `compile-drafts`, Lean 4.34 kernel-check, and Lean 4.35 paranoid jobs were **skipped** because the project detector found no Lean project at the checkout root. It is not evidence of Lean compilation of the finite-word theorem. The verified initial all-one special case and the separately verified mixed word `(1,2)` retain their own exact source commits and CI scope. The arbitrary finite-word theorem, density corollary, and finite tail partition remain **OFFEN – NICHT VERIFIZIERT** in Lean.
