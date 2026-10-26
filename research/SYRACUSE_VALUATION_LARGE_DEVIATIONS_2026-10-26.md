# Syracuse: exact large-deviation bound for valuation sums (2026-10-26)

## Scope

This note derives a rigorous probability bound for the total valuation in a length-k symbolic cylinder. It is a statement about normalized Haar measure on odd 2-adic starts and the induced valuation-word distribution, not a theorem about every positive integer orbit.

## Exact distribution

For a positive integer-valued geometric variable X with P(X=a)=2^{-a}, a>=1, the probability generating function is
E[z^X] = z/(2-z), for |z|<2.
The valuation-word calculation gives A_k=X_1+...+X_k with independent geometric coordinates under the cylinder measure, hence
P(A_k=a)=binomial(a-1,k-1) 2^{-a}, a>=k.
In particular E[A_k]=2k and Var(A_k)=2k.

## Chernoff lower-tail bound

For t<0, Markov's inequality applied to exp(t A_k) gives, for c in (1,2),
P(A_k <= c k) <= exp(-k I(c)),
where
I(c) = c log(c/2) + (2-c) log(2-c).
To verify the formula, the moment generating function is
E[exp(t X)] = exp(t)/(2-exp(t)).
The optimizing parameter solves c = 2/(2-exp(t)), so exp(t)=2-2/c. Substitution yields the stated rate I(c)>0 for c<2. For nonintegral ck, replace the event by A_k <= floor(ck); the displayed bound remains valid because floor(ck)<=ck and t<0.

For the descent threshold c=log(3)/log(2) (about 1.585), I(c)>0. Thus the probability that the total valuation sum falls below the first-order threshold needed to offset 3^k decays exponentially in k, at the symbolic/Haar level.

## Critical limitation

The accelerated orbit identity is
n_k/n_0 = 3^k / 2^{A_k} + (correction terms)/2^{A_k}n_0,
or equivalently the affine recurrence recorded in the main cylinder note. The positive correction terms and the distinction between Haar-almost-every 2-adic start and each natural-number start remain essential. An exponentially small measure of low-valuation words does not prove that every integer orbit descends, nor does it automatically control correlations between the valuation word and the real size of an orbit. No Collatz solution is claimed.

## Formalization target

Formalize (1) the finite-word probability distribution, (2) the generating-function identity over rational truncations or a suitable infinite-series framework, and (3) the Chernoff inequality with the optimizing parameter kept symbolic. A finite exact-rational checker can validate individual cutoffs, but it is not a substitute for the analytic theorem.
