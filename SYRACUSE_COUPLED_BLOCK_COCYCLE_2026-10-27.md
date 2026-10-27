# Coupled Syracuse block cocycle: valuation gain versus correction mass

Status: exact reformulation; not a proof of the Collatz conjecture.

For the accelerated odd Syracuse orbit
\[
n_{j+1}=(3n_j+1)/2^{a_j},\qquad a_j=v_2(3n_j+1)\ge 1,
\]
write
\[
A_N=\sum_{j<N}a_j,\qquad
R_0=0,\quad R_{N+1}=3R_N+2^{A_N}.
\]
Then
\[
2^{A_N}n_N=3^N n_0+R_N.
\]

Define the *coupled block state*
\[
\lambda_N=\frac{2^{A_N}}{3^N},\qquad q_N=\frac{R_N}{3^N}.
\]
These are exact rational quantities, not statistical estimates. Their updates are
\[
\lambda_{N+1}=\lambda_N\frac{2^{a_N}}3,
\qquad q_{N+1}=q_N+\frac{\lambda_N}{3},
\qquad (\lambda_0,q_0)=(1,0).
\]
The second coordinate is a positive accumulated correction. It is the information discarded by a valuation-frequency-only argument.

Dividing the block identity by \(3^N\) gives
\[
\lambda_N n_N=n_0+q_N.
\]
Consequently the exact strict-descent test is
\[
n_N<n_0
\iff (\lambda_N-1)n_0>q_N.
\]
In particular, if \(\lambda_N\le1\), strict descent at that block endpoint is impossible; if \(\lambda_N>1\), the accumulated correction \(q_N\) sets the precise threshold.

## Research use

A future block theorem must control the *joint orbit* \((\lambda_N,q_N)\), rather than only the average of \(a_j\). One possible target is a uniform bound on \(q_N/(\lambda_N-1)\) over a family of realizable valuation blocks, or a theorem forcing a strict descent endpoint from the coupled recurrence. Neither target is established here.

This state-space formulation is a project-specific synthesis of the exact block identity. It is not claimed to be historically unprecedented, and it does not by itself exclude divergent orbits or nontrivial cycles.
