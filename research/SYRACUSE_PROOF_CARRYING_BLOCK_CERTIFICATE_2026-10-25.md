# Next frontier: proof-carrying Syracuse block certificates (2026-10-25)

## Exact local theorem versus global problem

The formal development already has the affine identity
\[
2^{A_r}n_r=3^r n_0+C_r,\qquad C_{j+1}=3C_j+2^{A_j},
\]
and the exact equivalence
\[
n_r<n_0\iff 3^r n_0+C_r<2^{A_r}n_0
\]
under the certified transition identity. The remaining difficulty is not rearranging this equation: it is proving that an arbitrary positive odd orbit supplies a block with a strict margin, or finding an orbit that avoids all such blocks.

## Certificate format

For a proposed block of length \(r\), use a finite certificate containing:

- states \(n_0,\ldots,n_r\);
- exponents \(a_0,\ldots,a_{r-1}\);
- exact transition equations \(2^{a_j}n_{j+1}=3n_j+1\);
- cumulative exponents \(A_0=0\), \(A_{j+1}=A_j+a_j\);
- offsets \(C_0=0\), \(C_{j+1}=3C_j+2^{A_j}\);
- the strict endpoint margin \(3^r n_0+C_r<2^{A_r}n_0\).

A checker should recompute all recurrence fields from the word and verify the final inequality. It must not accept the margin as an unverified narrative claim. This makes a successful block a small, independently checkable descent witness.

## Necessary threshold and a warning

Since \(C_r\geq 3^{r-1}\) for \(r\geq1\), strict descent forces a quantitative lower bound on accumulated exponent. The existing formal consequence is
\[
3^r(n_0+1)<2^{A_r}n_0
\]
under the stated offset bound. This is necessary, not sufficient evidence that every orbit meets the threshold at some block. Average valuation, density-one descent, or compactness in \(\mathbb Z_2\) does not by itself eliminate a density-zero exceptional orbit.

The accelerated map also has a genuine 2-adic discontinuity at \(-1/3\): the valuation of \(3x+1\) is not locally constant there. Therefore a continuous-flow program needs a new invariant that survives this singularity and a theorem translating it back to all positive integer orbits; changing ambient topology alone is not a proof.

## Adversarial tests

- Arbitrarily long valuation-one runs: reject any argument that assumes a fixed upper bound on such runs.
- Valuation two: correction is zero; do not count it as strict descent.
- Valuation at least three: positive local correction does not imply global positive balance.
- Small starting values and zero/one boundary cases: prove the exact domain of the endpoint theorem.
- Independently verify both the affine recurrence and the strict inequality.

## Four-pillar interpretation

- **Meta-structure:** represent a finite orbit segment as a word plus a recurrence certificate.
- **Transformation:** study valuation words and 2-adic residue cylinders, while isolating the discontinuity.
- **Formal verification:** make the checker recompute the certificate, and audit all transitive axioms.
- **Empirical/computational grounding:** use search to discover candidate blocks and counterexamples to proposed lemmas; computations can falsify a universal claim but cannot establish universal termination.

## Exit criterion

First complete the current CI and axiom audit. Then formalize the certificate checker and prove its soundness. The global gap remains: every orbit eventually yields enough certified descent, or a concrete nonterminating orbit is found. Neither is established here.
