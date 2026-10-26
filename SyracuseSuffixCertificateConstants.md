# Conditional Syracuse descent certificate: sharpened constants

Date: 2026-10-26. This note proves a conditional finite-block estimate; it does not prove the global Collatz conjecture.

Let a_0,...,a_(N-1) be the actual valuations of a Syracuse orbit block, A_j=Σ_{k<j}a_k, and
C_N=Σ_{j<N}3^(N-1-j)2^(A_j). Then
2^(A_N)n_N=3^N n_0+C_N.

Set q=17/5. Since (17/5)^5 < 2^9, the suffix condition
5(A_N-A_j) >= 9(N-j) for every j<N
implies
2^(A_N-A_j) >= q^(N-j).
Hence
C_N/2^(A_N)
 = Σ_{i=1}^N 3^(i-1)/2^(A_N-A_(N-i))
 <= Σ_{i=1}^N 3^(i-1)/q^i
 = (1-(3/q)^N)/(q-3)
 = (5/2)(1-(15/17)^N).
Also 3^N/2^(A_N) <= (15/17)^N. Therefore
n_0(1-3^N/2^(A_N)) >= n_0(1-(15/17)^N).
For n_0>=3 and N>=1 this is at least 3(1-(15/17)^N), strictly greater than C_N/2^(A_N), which is at most (5/2)(1-(15/17)^N). Consequently C_N < (2^(A_N)-3^N)n_0, and n_N<n_0.

The unresolved condition is the existence of such a suffix-certified block for every odd n_0>1. The valuation word must come from the actual Syracuse orbit; arbitrary exponent sequences cannot be assumed realizable. Thus this is a conditional certificate theorem, not a global proof.
