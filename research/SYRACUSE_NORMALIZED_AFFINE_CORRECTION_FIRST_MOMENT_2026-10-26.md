# Syracuse: normalized affine correction and the critical first moment

Date: 2026-10-26
Status: exact derivation under the normalized Haar valuation-word law; not a global Collatz proof and not yet Lean-formalized.

## 1. Exact decomposition

For odd Syracuse iterates n_{j+1}=(3n_j+1)/2^{a_{j+1}}, where a_{j+1}=v_2(3n_j+1) and A_j=a_1+...+a_j, define c_0=0 and c_{j+1}=3c_j+2^{A_j}. Induction gives

2^{A_k} n_k = 3^k n_0 + c_k,

and hence

n_k = (3^k/2^{A_k}) n_0 + C_k,

where

C_k := c_k/2^{A_k} = sum_{ell=1}^k 3^(ell-1) / 2^(a_k+a_{k-1}+...+a_{k-ell+1}).

This rewrites the affine obstruction as a sum over suffixes of the valuation word. It is more useful for probabilistic analysis than the forward recurrence for c_k because every summand is a nonnegative function of a suffix.

## 2. Exact first moment under Haar valuation law

Under normalized Haar measure on odd 2-adic inputs, a finite positive valuation word (a_1,...,a_k) has probability 2^(-A_k), so its valuation coordinates have the geometric law P(a_i=a)=2^(-a), a>=1. In particular,

E[2^(-a_i)] = sum_{a>=1} 2^(-a) 2^(-a) = sum_{a>=1} 4^(-a) = 1/3.

The coordinates are independent under this finite-cylinder law. Therefore for each suffix length ell,

E[3^(ell-1) 2^(-(a_k+...+a_{k-ell+1}))]
= 3^(ell-1) (1/3)^ell = 1/3.

Summing the k suffixes gives the exact identity

E[C_k] = k/3.

This is a nontrivial diagnostic: the affine correction is not uniformly bounded in expectation. It grows linearly, even though the multiplicative coefficient 3^k/2^(A_k) is typically exponentially small when A_k is near 2k.

## 3. Immediate rigorous consequence and why it is not enough

For any t>0, Markov's inequality gives

P(C_k >= t) <= k/(3t).

This controls the Haar-measure tail of the normalized affine correction. It does not yet give the required natural-density estimate for integers n<=X with a threshold t depending on n. To obtain that bridge, one must combine exact valuation cylinders with a uniform truncation of the suffix sum and account for the accumulated residue-class boundary errors as k grows with log X.

For descent, the exact criterion is

n_k<n_0 iff (1 - 3^k/2^(A_k)) n_0 > C_k.

Thus a promising sufficient event is simultaneously (i) a positive multiplicative gap 3^k/2^(A_k) <= 1-epsilon and (ii) C_k < epsilon n_0. The low-valuation exceptional-set estimate addresses only part (i); the first-moment identity begins addressing (ii), but the conditioning and finite-interval transfer remain open obligations.

## 4. Proposed next lemma chain

1. Formalize the suffix expansion of C_k from the affine recurrence.
2. Prove the exact cylinder probability and finite-k independence of valuation coordinates.
3. Prove E[C_k]=k/3 by a finite sum, with no asymptotic interchange.
4. Obtain a truncated-tail estimate for C_k by splitting suffix lengths at L and controlling the long-suffix remainder.
5. Transfer the truncated event to [1,X] with explicit boundary error; choose L=L(X) slowly enough that the error is o(X).
6. Combine the affine-correction event with a multiplicative phase-gap estimate, checking all floors and exceptional small starts.
7. Formalize each exact lemma in Lean and audit the final theorem's transitive axioms.

## 5. Boundary of the claim

This note proves an exact expectation identity under the stated Haar law. It does not prove that almost all positive integers descend within a particular bound, does not prove eventual descent for every integer, and does not resolve Collatz. The key new research target is a tail/finite-interval estimate for C_k, not the expectation alone.