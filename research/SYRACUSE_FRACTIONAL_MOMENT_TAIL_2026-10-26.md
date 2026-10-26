# Syracuse: fractional-moment tail and the next density-transfer obligation

Date: 2026-10-26
Status: exact probabilistic lemma under the independent Haar valuation-word law; not Lean-formalized and not a natural-density theorem.

## Exact suffix recursion

For positive valuation digits a_j with P(a_j=r)=2^{-r}, define

C_k = sum_{ell=1}^k 3^(ell-1) 2^(-(a_k + ... + a_{k-ell+1})), C_0=0.

Then C_k = 2^(-a_k) (1 + 3 C_(k-1)), where a_k is independent of C_(k-1).

## Fractional moments

For 0<s<1, subadditivity gives (x+y)^s <= x^s+y^s for x,y>=0. Hence

E[C_k^s] <= u_s + q_s E[C_(k-1)^s],

where the geometric sums are exact:

u_s = E[2^(-s a)] = 1/(2^(s+1)-1),
q_s = E[(3/2^a)^s] = 3^s/(2^(s+1)-1).

For s=1/2, q = sqrt(3)/(2^(3/2)-1) < 1. Indeed sqrt(3) < 2sqrt(2)-1, because this is equivalent to sqrt(2) < 3/2. Thus

E[sqrt(C_k)] <= u_(1/2)/(1-q)

uniformly in k, and Markov gives P(C_k >= t) <= K/sqrt(t), with K = u_(1/2)/(1-q).

The same method works for any 0<s<1 satisfying 3^s < 2^(s+1)-1.

## New frontier comparison: density-one descent versus positive-density convergence

ProofAtlas lists an accepted formalization stating that for thresholds f(N) tending to infinity, density-one many starts descend below f(N) within logarithmic time (145 log N accelerated Syracuse steps on odd starts, 436 log N raw Collatz steps on all positive starts). This does not establish arrival at 1.

ProofAtlas separately lists a positive-density convergence-to-1 result: at least cX positive integers n<X reach 1 within 10.46 ln(n) ordinary Collatz steps for explicit c>0 and sufficiently large cutoff X_0. The listing itself says paper-to-statement review is pending and the cutoff is extremely large. Treat it as an external formalization claim pending independent review, not as an accepted theorem or a dependency of our work.

These two statements are not contradictory: density-one descent below a growing threshold is weaker than convergence to 1 for a positive-density subset. Neither yields convergence for every starting value.

## What must be proved next

The missing transfer is quantitative, not merely philosophical. For a truncation depth k, each valuation word defines a residue cylinder modulo a power of two. To transfer the Haar tail to integers in [1,X], establish an explicit error of the form

| #{n <= X : C_k(n) >= t}/X - P_Haar(C_k >= t) | <= E(X,k),

with a justified E(X,k) uniform over the relevant event, and choose k=k(X) so E(X,k) -> 0 while the valuation-word description remains valid. If the event depends on too many residue classes for this bound to be useful, replace it with a truncated suffix statistic whose cylinder count is tractable, and bound the omitted suffix separately.

Then couple this with the valuation-sum event A_k and the exact descent condition

(1 - 3^k / 2^(A_k)) n_0 > C_k.

A marginal tail estimate for C_k alone does not prove descent.

## Formalization and audit boundary

1. Formalize the finite-suffix recursion.
2. Formalize the half-moment subadditivity and exact geometric sums.
3. Prove the uniform moment bound and Markov tail.
4. Independently check the finite-cylinder counting/error theorem.
5. Keep the probabilistic Haar theorem, finite-interval theorem, natural-density consequence, and any universal Collatz claim as separate declarations with explicit hypotheses.

No global Collatz convergence or natural-density conclusion is claimed by the fractional-moment lemma itself.