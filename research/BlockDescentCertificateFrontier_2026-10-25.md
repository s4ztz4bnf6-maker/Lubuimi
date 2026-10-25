# Block-descent certificate: exact margin, valuation budget, and the remaining global gap

Date: 2026-10-25  
Status: research note attached to the mod-8 frontier; no global Collatz theorem claimed.

## 1. Exact block identity (already available in the Lean source)

For an accelerated odd orbit, write
\[
2^{a_i}n_{i+1}=3n_i+1,\qquad
A_r=\sum_{i<r}a_i,
\]
and define the canonical offset by
\[
C_0=0,\qquad C_{i+1}=3C_i+2^{A_i}.
\]
Induction gives the exact identity
\[
2^{A_r}n_r=3^r n_0+C_r.
\]
The repository already formalizes this affine identity and the exact descent-margin equivalence. The offset is not a free parameter: it is determined by the valuation word.

## 2. A sharper separation of necessary and sufficient conditions

The block descends exactly when
\[
3^r n_0+C_r<2^{A_r}n_0,
\]
equivalently, provided \(2^{A_r}\ge 3^r\),
\[
C_r<(2^{A_r}-3^r)n_0.
\]
Thus there are two logically distinct obligations:

1. **Multiplicative budget:** \(2^{A_r}>3^r\). This is necessary for strict descent from a positive start.
2. **Additive margin:** the canonical offset must fit below the gap times the starting value.

The first condition alone is not sufficient. This distinction prevents a common error: replacing an exact affine recurrence with an average-growth heuristic.

Because every certified odd-to-odd step has \(a_i\ge1\), write
\[
A_r=r+E_r,\qquad E_r=\sum_{i<r}(a_i-1).
\]
The multiplicative budget is therefore exactly
\[
2^{E_r}>(3/2)^r.
\]
This is an integer-free way to state the valuation-excess requirement without floating-point logarithms. It says that a descending block must accumulate enough valuation above the baseline one factor of two per odd step. It does **not** bound the offset \(C_r\), nor prove that every orbit contains enough excess valuation.

## 3. Falsifiable next Lean target

Add a theorem over a *certified finite transition sequence* (not an arbitrary list asserted to be an orbit) proving:

- \(A_r=\sum_{i<r}a_i\);
- \(E_r=\sum_{i<r}(a_i-1)\) when all \(a_i\ge1\);
- strict descent implies \(2^{A_r}>3^r\), using the canonical affine identity and \(C_r\ge0\);
- equivalently, strict descent implies \(2^{r+E_r}>3^r\).

The final step should be proved in naturals, not with a floating approximation to \(\log_2 3\). It is a useful necessary-condition certificate and should have no project-specific axioms. It is not a substitute for the hard global theorem: one still needs a uniform upper bound on the canonical offset or a directly proved margin on every orbit.

## 4. Why the p-adic idea needs stratification

The existing discontinuity note establishes that the accelerated map on positive odd integers has no continuous extension to all of \(\mathbb Z_2\) agreeing with every integer transition: distinct odd sequences converge 2-adically to \(-1/3\), while their accelerated images are constantly 1 and 5. This refutes the *single globally continuous accelerated-map* route, not all p-adic approaches.

A defensible replacement is a valuation-stratified system: on the clopen stratum where \(v_2(3x+1)=k\), the quotient is locally defined; the exceptional accumulation at \(-1/3\) must be represented explicitly, not hidden by compactness. The research question becomes whether the integer-realizable valuation language admits a global combinatorial invariant strong enough to imply the additive margin.

## 5. Reliability gates

Before interpreting any new result as evidence about Collatz:

1. Compile under a patched Lean release and pinned Mathlib.
2. Record the exact theorem declaration and transitive `#print axioms`.
3. Recheck exported proof terms with current independent tooling where available; the 2026 soundness incidents show that a clean axiom report alone is not a kernel-integrity certificate.
4. Compare the Lean statement with the integer-orbit claim, including positivity, oddness, and exactness of each removed power of two.

Relevant references:
- Tao / Hales, *What mathematicians should know about the Lean Theorem Prover: questions of reliability and AI* (9 Oct 2026): https://terrytao.wordpress.com/2026/10/09/what-mathematicians-should-know-about-the-lean-theorem-proverquestions-of-reliability-and-ai/
- Lean FRO, *Postmortem for Kernel Soundness Bug #14576*: https://leodemoura.github.io/blog/2026-8-1-postmortem-for-kernel-soundness-bug-14576/
- Lean FRO, *Postmortem for the Kernel Soundness Bug Hunt*: https://leodemoura.github.io/blog/2026-8-24-postmortem-for-the-kernel-soundness-bug-hunt/
- Lean 4.32.2 release note (kernel fix): https://lean-lang.org/doc/reference/latest/releases/v4.32.2/
