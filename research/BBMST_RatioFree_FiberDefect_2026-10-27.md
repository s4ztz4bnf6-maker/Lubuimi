# BBMST finite-fiber defect: ratio-free certificate

Date: 2026-10-27  
Status: exact finite counting reduction; not the source geometric moment bound.

## The local obstruction, isolated

Let a finite fiber S have cardinality q>0, and let B be its covered part with r=|B|. Set
\[
\alpha=\frac rq,\qquad
\mathfrak d(B;S)=\alpha(1-\alpha)=\frac{r(q-r)}{q^2}.
\]
The integer numerator r(q-r) is the **mixed-fiber defect**. It vanishes exactly at the endpoint fibers r=0 and r=q; it is positive exactly when the fiber is proper and nonempty. This avoids dividing by alpha or 1-alpha in the endpoint cases.

For 1≤r≤q−1, the exact integer inequality
\[
r(q-r)\ge q-1
\]
gives
\[
\boxed{\mathfrak d(B;S)\ge\frac{q-1}{q^2}.}
\]
The proof is elementary: r(q-r)-(q-1)=(r-1)(q-r-1)≥0. Equality occurs at r=1 or r=q−1, so the bound is sharp.

## Aggregate form

For a finite base space X, let the fiber over x have fixed size q, covered count r_x, and nonnegative weight w_x. Then the total defect is exactly
\[
\mathcal D=\sum_{x\in X}w_x\frac{r_x(q-r_x)}{q^2}.
\]
If q≥2 and at least one positive-weight fiber is proper and nonempty, the corresponding term supplies a positive lower bound. Under uniform base weights w_x=1/|X|, one such fiber gives
\[
\mathcal D\ge\frac{q-1}{|X|q^2}.
\]
For nonuniform weights, the bound must include the weight of the witness fiber; silently replacing it by a uniform lower bound is invalid.

## The actual BBMST gap

This reduction only converts a **proved mixed-fiber witness** into a quantitative defect. It does not establish that the paper's hyperplane geometry produces such a witness with adequate total weight, nor does it prove the required second-moment/incidence estimate. The difficult bridge is still geometric: derive the right positive mass from the source-defined Q_k,N_k,B_k,alpha_k without assuming nondegeneracy.

A useful proof architecture is to keep three obligations separate:
1. **Counting:** prove r(q-r)≥q−1 over integers, with endpoint cases explicit.
2. **Witness:** prove a proper nonempty fiber exists and quantify its base weight.
3. **Geometry/moments:** derive the witness or stronger aggregate estimate from the actual BBMST incidence structure and source hypotheses.

## Formal-integrity gate

Use a ratio-free integer lemma for the numerator first, then derive the rational bound under q>0. Audit the exact source theorem and all transitive axioms. In particular, this local defect lemma cannot discharge project assumptions such as sieve_criterion or sf_sieve_lt_one, and it is not a proof of the unrestricted Erdős–Selfridge conjecture. CI status and theorem status must remain separate.
