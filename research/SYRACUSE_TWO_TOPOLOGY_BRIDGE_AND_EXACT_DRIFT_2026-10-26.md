# Syracuse: two-topology bridge and an exact drift interface

Date: 2026-10-26

## Purpose

This note turns the broad proposal “smooth Collatz in the 2-adics” into a precise obligation. It is a research design and elementary derivation, not a proof of the Collatz conjecture and not a novelty claim for the classical identities.

## 1. The 2-adic extension is continuous, but that fact is not a descent theorem

Use the non-accelerated map
[
T(x)=\begin{cases}x/2,&x\equiv0\pmod2,\\(3x+1)/2,&x\equiv1\pmod2.\end{cases}
]
Both parity classes are clopen in \(\mathbb Z_2\). Division by 2 is continuous on the even class, and \((3x+1)/2\) is continuous on the odd class because \(3x+1\in2\mathbb Z_2\). Hence \(T:\mathbb Z_2\to\mathbb Z_2\) is continuous.

This does **not** imply that positive integer orbits decrease in the ordinary absolute value. The two topologies encode different notions of closeness. For example, \(2^k\to0\) in \(\mathbb Z_2\), while \(2^k\to\infty\) in \(\mathbb R\). Compactness of \(\mathbb Z_2\) gives convergent subsequences, not an Archimedean bound on integer orbit size.

Therefore any successful 2-adic strategy needs an explicit bridge lemma that controls ordinary size or supplies a well-founded descent measure. “There is a continuous extension on a compact space” is not that bridge.

## 2. Exact logarithmic identity for the odd-only map

For odd positive integers \(n_i\), let
\[
S(n_i)=n_{i+1}=\frac{3n_i+1}{2^{a_i}},\qquad a_i=v_2(3n_i+1).
\]
Then, exactly,
\[
\log n_{i+1}-\log n_i
=\log 3- a_i\log2+\log\!\left(1+\frac1{3n_i}\right).
\]
Summing for \(i=0,\ldots,k-1\) telescopes:
\[
\log\frac{n_k}{n_0}
=k\log3-\Big(\sum_{i<k}a_i\Big)\log2
+\sum_{i<k}\log\!\left(1+\frac1{3n_i}\right).
\]
This is an identity, not an asymptotic estimate. The final sum is nonnegative and satisfies
\[
0<\sum_{i<k}\log\!\left(1+\frac1{3n_i}\right)
\le \sum_{i<k}\frac1{3n_i},
\]
using \(0<\log(1+x)\le x\) for \(x>0\).

The unresolved issue is not deriving the identity. It is obtaining a deterministic orbit-uniform constraint on the valuation sum and the correction term strong enough to force a decrease/return statement in the ordinary integer size.

## 3. A precise bridge obligation

A useful target should be stated in a form that can be falsified by finite data and then formalized:

**Uniform-return target (research interface).** Find explicit constants \(C>0\), \(\eta>0\), and a finite, checkable condition on each orbit block such that every odd starting value \(n\ge C\) has a block length \(1\le k\le K(n)\) for which \(n_k\le (1-\eta)n\), with all exceptional small states handled separately.

This target is stronger than average negative drift and is only one possible route; it is not asserted true here. Any proposed condition must be derived from exact valuation/carry information, not from Haar-average behavior alone.

A complementary stopping-time formulation may instead prove that every orbit enters a fixed finite set. Either formulation must retain explicit dependence on the starting state and cannot substitute “almost every orbit”.

## 4. Falsification-first experiment

For each proposed finite-block inequality:
1. enumerate all odd starts up to a declared cutoff and all block lengths up to the declared bound;
2. calculate valuations and orbit values using integer arithmetic only;
3. report the minimal violating start, block length, valuation word, and exact integer inequality if one exists;
4. compare the observed failure modes with the low-frequency \(\lambda=1\) obstruction and avoid treating finite success as evidence of a universal theorem;
5. only after the statement survives the scan, formalize the finite checker and separately prove that its hypotheses cover all starts.

A finite scan can refute a universal claim, but cannot prove it without a theorem reducing the infinite domain to the checked cases.

## 5. Formalization and audit checklist

- Keep the accelerated odd map and the parity-step map as distinct definitions.
- Prove the logarithmic identity from the defining equation; do not introduce it as an axiom.
- Keep real logarithms/inequalities separate from 2-adic continuity lemmas.
- Run `#print axioms` transitively on the final theorem and inspect every nonstandard axiom.
- Check exact statement fidelity, including positivity, oddness, and the valuation convention.
- Record compiler/version and commit; a successful CI run is evidence only for the compiled files, not for a conjectural global statement.

## Status

The continuity observation and the exact identity above are elementary/classical. This note contributes a sharper project interface and a falsification protocol, not a Collatz proof. The global Collatz conjecture remains unresolved.
