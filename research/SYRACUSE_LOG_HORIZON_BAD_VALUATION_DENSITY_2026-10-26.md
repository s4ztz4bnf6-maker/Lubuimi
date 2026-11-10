# Syracuse: a uniform logarithmic-horizon bound for low valuation sums (2026-10-26)

## Result

This note gives a rigorous density estimate for the valuation obstruction at a growing time horizon. It does not yet prove descent, because the affine constant / additive correction must also be controlled.

Let S(n)=(3n+1)/2^{v_2(3n+1)} on positive odd n, and let
A_k(n)=sum_{j=1}^k v_2(3n_{j-1}+1).
Fix c in (1,2), and set k(X)=floor(alpha log X), where log is natural and alpha>0.

For a fixed word of k positive valuations with total a, the exact-cylinder lemma gives one residue class modulo 2^{a+1}. Hence the number of odd n<=X realizing that word differs from X/2^{a+1} by at most 1. Summing over all words of length k and total a<=floor(ck), the total boundary discrepancy is at most
[
sum_{a=k}^{lfloor ckfloor}{a-1choose k-1}
={lfloor ckfloorchoose k}.
]

Under normalized Haar measure on odd 2-adic starts, the exact negative-binomial law is
[
Pr(A_k=a)=2^{-a}{a-1choose k-1},quad age k.
]
For 1<c<2, the Chernoff estimate gives
[
Pr(A_kle ck)le e^{-k I(c)},qquad
I(c)=clograc{2(c-1)}c-log(c-1)>0.
]
Combining the exact-cylinder discrepancy with this tail estimate yields the finite-interval upper bound
[
#{nle X:n	ext{ odd}, A_{k(X)}(n)le c k(X)}
le rac X2 e^{-k(X)I(c)}
+{lfloor c k(X)floorchoose k(X)}+O(1).
]
The O(1) only accounts for endpoint conventions; it can be removed by fixing a consistent interval-count convention.

Using the standard entropy estimate
[
{ lfloor ckfloorchoose k}
le exp(k H_c+O(log k)),quad
H_c=clog c-(c-1)log(c-1),
]
the right-hand side is o(X) whenever
[
alpha I(c)>0quad	ext{and}quad alpha H_c<1.
]
Thus, for every fixed c in (1,2) and every 0<alpha<1/H_c, the set of odd n<=X with A_floor(alpha log X)<=c floor(alpha log X) has density zero as X tends to infinity.

For the concrete choice c=1.6 and alpha=0.5:
H_c approximately 1.0585, so alpha H_c approximately 0.5293<1. The boundary term is at most X^{0.530+o(1)}, while the Chernoff term is O(X^{1-alpha I(c)+o(1)}) and hence also o(X). This is a uniform growing-horizon conclusion, unlike the fixed-k density identity alone.

## Why this is a genuine but limited advance

Since 1.6 > log_2(3) approximately 1.585, the result says that for density-one many odd starts, the first floor(0.5 log X) accelerated valuations have average exceeding a threshold above the naive multiplier-balance threshold.

It does **not** yet imply S^k(n)<n. The exact affine identity is
[
2^{A_k}n_k=3^k n+c_k,quad c_k>0.
]
Even if A_k>k log_2(3), the inequality n_k<n additionally requires
[
(2^{A_k}-3^k)n>c_k.
]
The present counting argument does not bound c_k uniformly over all starts up to X, and the event of low valuation sum is not the only possible obstruction to descent. The next proof obligation is a joint cylinder bound on (A_k,c_k), or a separate deterministic upper bound on c_k on a density-one subset with a proved exceptional-set estimate.

## Relation to existing external work

ProofAtlas currently reports an accepted Lean-checked natural-density theorem with logarithmic descent clocks (145 log N accelerated Syracuse steps and 436 log N raw Collatz steps), while a separate positive-density logarithmic-time convergence result is shown as Lean-checked but with acceptance review open. These are different theorem statements and statuses. This note does not reproduce either artifact and should not be treated as a dependency until their exact declarations, source commits, and axiom evidence are independently inspected.

## Formalization plan

1. Prove the exact word-to-residue-class lemma.
2. Prove the interval count discrepancy by Euclidean division.
3. Prove disjointness for distinct valuation words.
4. Formalize the hockey-stick identity for the number of words.
5. Prove the Chernoff inequality in a separate probability/real-analysis lemma, or state it as an explicitly audited imported theorem.
6. Combine the bounds with explicit floors and logarithms; no asymptotic notation in the final Lean theorem.
7. Keep the descent theorem separate until the affine constant is controlled.

Status: derivation note only, not yet Lean-checked; no Collatz conjecture solution is claimed.
