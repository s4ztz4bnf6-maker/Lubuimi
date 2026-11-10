# Syracuse affine-block cocycle: compositional certificate

Date: 2026-10-27  
Status: exact algebraic structure/proof target; not a global Collatz argument.

## Motivation

The recurring bottleneck is that local transition identities are easy to compose, while the missing theorem is an orbit-uniform descent guarantee. Store a finite realized block by its **signature**
\[
\Sigma=(m,A,C),\qquad 2^A n_m=3^m n_0+C,
\]
where \(m\) is the number of odd Syracuse steps, \(A=\sum_{i<m}a_i\), and \(C\) is the nonnegative affine offset.

For a realized valuation word, the offset obeys \(C_0=0\) and
\[
C_{j+1}=3C_j+2^{A_j},\qquad A_{j+1}=A_j+a_j.
\]
This signature is a certificate of a block's arithmetic effect, not a certificate that an arbitrary word is realizable.

## Composition law

Suppose block \(U=(m,A,C)\) is followed by block \(V=(\ell,B,D)\). From
\[
2^A n_m=3^m n_0+C,\qquad 2^B n_{m+\ell}=3^\ell n_m+D
\]
we obtain
\[
\boxed{U\star V=(m+\ell,A+B,3^\ell C+2^A D).}
\]
The order matters: \(U\) is traversed first. The empty signature \((0,0,0)\) is an identity. The law is associative, since both parenthesizations of three blocks \((m,A,C),(\ell,B,D),(p,E,F)\) have offset
\[
3^{\ell+p}C+3^p2^A D+2^{A+B}F.
\]
Thus realized blocks form a compositional certificate system. It is suitable for a Lean structure plus a theorem proving the composition law and associativity using only ring/semiring algebra.

## Descent margin

Define \(\Delta=2^A-3^m\). Since
\[
2^A n_m=3^m n_0+C,
\]
the exact integer comparison is
\[
n_m<n_0\iff C<\Delta n_0.
\]
If \(\Delta\le0\), descent is impossible because \(C\ge0\). If \(\Delta>0\), the strict comparison is division-free. Under composition,
\[
\Delta(U\star V)=2^{A+B}-3^{m+\ell},
\]
while the offset follows the law above. This separates the multiplicative budget \(\Delta\) from the additive cost \(C\).

## What this structure does and does not solve

It creates a reusable algebra of finite-block certificates. It enables dynamic programming or proof search to combine verified blocks and to reject blocks whose margin is nonpositive before expensive orbit analysis. But it does **not** prove that every starting integer admits a realized block with \(C<\Delta n_0\), nor that all infinite valuation paths are excluded.

A sound Lean milestone is:
1. define a signature and its composition;
2. prove the signature equation is preserved by composition;
3. prove associativity and the exact descent equivalence;
4. separately prove each signature used for a concrete orbit is realized by the exact valuation conditions;
5. leave universal descent open until a pointwise orbit-level invariant is established.

## Reproducibility gate

Compile on the pinned toolchain, then inspect transitive axioms for each theorem using the project's axiom audit. A documentation-only update is not evidence of Lean compilation. Finite enumeration may find counterexamples to proposed bounds, but cannot prove the universal descent statement.
