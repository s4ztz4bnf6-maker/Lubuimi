# Syracuse research note: suffix certificates as record times

Date: 2026-10-26

## Exact reformulation

Let an actual odd Syracuse trajectory satisfy
\[
2^{a_k}n_{k+1}=3n_k+1,
\qquad A_k=\sum_{i<k}a_i.
\]
Define the integer-valued valuation surplus
\[
D_k=5A_k-9k.
\]
Then for any indices \(j<N\),
\[
5(A_N-A_j)\ge 9(N-j)
\quad\Longleftrightarrow\quad
D_N\ge D_j.
\]
Consequently, the suffix certificate
\[
5(A_N-A_j)\ge 9(N-j)\quad\text{for every }j<N
\]
is exactly the statement that \(N\) is a weak record time of \(D\), relative to all earlier indices. In particular, taking \(j=0\) forces \(D_N\ge0\), i.e. \(A_N/N\ge9/5\) for \(N>0\).

## Why this is useful

This turns an opaque family of suffix inequalities into a one-dimensional record process. The surplus increments are
\[
D_{k+1}-D_k=5a_k-9.
\]
For odd Syracuse inputs, \(a_k\ge1\), so the increment is at least \(-4\); it is positive exactly when \(a_k\ge2\). The certificate therefore asks for a nonnegative record of the cumulative valuation surplus, not merely a good average over the entire prefix.

Combined with the geometric estimate using \(q=17/5\), any such record time gives the conditional descent certificate for \(n_0\ge3\), provided the exact affine block identity and the actual Syracuse step equations hold.

## Explicit limitation / next lemma target

This reformulation does **not** prove that a nonnegative record time exists on every orbit. Expected valuation 2 under a uniform odd-residue model is a statistical heuristic and does not imply a universal record-time theorem; valuations along a deterministic orbit are not known to be independent.

The next formal target is to encode \(D_k\) over integers and prove the equivalence between the all-suffix condition and the record-time predicate. The next mathematical target is stronger: prove that every nontrivial actual orbit either reaches such a record time or satisfies another independently verified descent certificate. No arbitrary valuation word may be substituted for a realizable orbit.
