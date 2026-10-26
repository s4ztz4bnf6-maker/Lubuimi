# Syracuse normalized affine correction: second-moment diagnostic

Date: 2026-10-26
Status: exact finite-k identity under the normalized Haar valuation-word law; not Lean-formalized.

Let

X_l = 3^(l-1) 2^(-(a_k + a_{k-1} + ... + a_{k-l+1})), 1 <= l <= k,

so C_k = sum_{l=1}^k X_l. Under the independent valuation law P(a=r)=2^(-r), r>=1, we have

E[2^(-a)] = 1/3, and E[2^(-2a)] = sum_{r>=1} 2^(-3r) = 1/7.

For l<=m, the first l valuations in the shorter suffix occur twice in X_l X_m and the remaining m-l valuations once. Therefore

E[X_l X_m] = 3^(l+m-2) (1/7)^l (1/3)^(m-l) = (1/9)(9/7)^l.

In particular E[X_l^2]=(1/9)(9/7)^l, and the cross moment is independent of m once l is fixed. Summing the diagonal and off-diagonal terms yields the exact finite sum

E[C_k^2] = (1/9) sum_{l=1}^k (2(k-l)+1)(9/7)^l.

Writing q=9/7 and substituting j=k-l gives

E[C_k^2] = (q^k/9) sum_{j=0}^{k-1} (2j+1)q^(-j).

The final sum increases to a finite positive limit because q^(-1)=7/9<1. Hence E[C_k^2] = Theta((9/7)^k), whereas E[C_k]=k/3. Rare long suffixes dominate the second moment. This explains why the first moment is too weak for an efficient tail bound and cautions against casually applying a variance/Chebyshev argument to C_k.

Research implication: prioritize truncating C_k by suffix length and proving a separate tail estimate for the long suffix, rather than expecting a uniform second-moment bound. Any such tail estimate must be transferred to finite intervals [1,X] with explicit cylinder-boundary errors before it can imply a natural-density statement.

No claim of global Collatz descent is made.