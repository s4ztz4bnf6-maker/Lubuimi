# Syracuse fractional-moment route for the normalized affine correction

Date: 2026-10-26
Status: exact probabilistic lemma under the independent Haar valuation-word law; not Lean-formalized and not a natural-density theorem.

## Recursion

For positive valuation digits a_j with P(a_j=r)=2^{-r}, define

C_k = sum_{ell=1}^k 3^(ell-1) 2^(-(a_k + ... + a_{k-ell+1})), C_0=0.

Then the exact distributional recursion is

C_k = 2^(-a_k) (1 + 3 C_{k-1}),

where a_k is independent of C_{k-1}.

## Fractional moments below order one

For 0<s<1, subadditivity gives (x+y)^s <= x^s+y^s for x,y>=0. Therefore

E[C_k^s] <= E[2^(-s a)] + E[(3/2^a)^s] E[C_(k-1)^s].

The two coefficients are exact geometric sums:

u_s = E[2^(-s a)] = 1/(2^(s+1)-1),

q_s = E[(3/2^a)^s] = 3^s/(2^(s+1)-1).

For s=1/2, q_s = sqrt(3)/(2^(3/2)-1) < 1, since sqrt(3) < 2sqrt(2)-1 (squaring the positive sides reduces this to 3 < 9 - 4sqrt(2), equivalently sqrt(2) < 3/2, which is true). Thus

E[C_k^(1/2)] <= u_(1/2) sum_(j=0)^(k-1) q_(1/2)^j <= u_(1/2)/(1-q_(1/2)),

uniformly in k. Markov then yields the uniform Haar tail

P(C_k >= t) <= K / sqrt(t),

where K = u_(1/2)/(1-q_(1/2)) is an explicit finite constant.

More generally, this argument works for any 0<s<1 satisfying 3^s < 2^(s+1)-1.

## Why this is a useful advance—and its exact limitation

The second moment grows like Theta((9/7)^k), so a second-moment argument is poorly suited to obtaining a uniform tail. The fractional-moment recursion avoids that exponential growth and gives a k-uniform tail under the Haar valuation-word model.

However, this is not yet a pointwise bound for integer starts n<=X, nor a natural-density estimate. The valuations along the first k Syracuse steps of integer starts are distributed by residue cylinders, and transferring the Haar tail to finite intervals requires controlling the total cylinder-boundary error as k grows with X. Also, the descent inequality couples C_k to A_k and n_0; a marginal tail for C_k alone does not prove descent.

## Formalization targets

1. Prove the finite-suffix recursion C_k = 2^(-a_k) * (1 + 3 * C_(k-1)).
2. Prove the geometric-series formulas for u_s and q_s for rational s where exponent notation is formalized, or first formalize s=1/2 using square roots.
3. Prove the subadditivity inequality for exponent 1/2.
4. Derive the uniform moment bound by induction and the Markov tail.
5. Keep the probability-space theorem separate from the finite-interval counting theorem until the boundary-error estimate is proved.

No global Collatz convergence or natural-density conclusion is claimed.