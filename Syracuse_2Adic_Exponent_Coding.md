# Syracuse 2-adic exponent coding: exact model and proof boundary

Status: exact 2-adic structural model / research note. Not a proof of the natural-number Collatz conjecture.

## 1. Branches of the accelerated odd map

For odd integers (and odd 2-adic integers) write
\[
T(x)=\frac{3x+1}{2^{v_2(3x+1)}}.
\]
For each exponent \(a\ge 1\), the branch with exact valuation \(a\) is the residue class
\[
3x+1\equiv 2^a\pmod {2^{a+1}}.
\]
Since 3 is a unit modulo every power of 2, this congruence has exactly one solution modulo \(2^{a+1}\). The solution is odd because \(2^a-1\) is odd. Hence each exact-valuation branch is one odd residue class modulo \(2^{a+1}\).

Among odd 2-adic integers with normalized Haar measure, the branch has measure \(2^{-a}\). The branch probabilities sum to one:
\[
\sum_{a=1}^{\infty}2^{-a}=1.
\]

## 2. Inverse branches

For every odd 2-adic integer \(y\) and every \(a\ge1\), define
\[
\phi_a(y)=\frac{2^a y-1}{3}\in\mathbb Z_2.
\]
The numerator is odd and 3 is invertible in \(\mathbb Z_2\), so \(\phi_a(y)\) is odd. Moreover,
\[
3\phi_a(y)+1=2^a y,
\]
and because \(y\) is odd, the exact valuation is \(a\). Thus \(T(\phi_a(y))=y\).

The inverse branch contracts 2-adic distances by the factor \(2^a\):
\[
|\phi_a(y)-\phi_a(z)|_2=2^{-a}|y-z|_2.
\]
Consequently a finite exponent prefix determines a nested 2-adic residue class whose diameter tends to zero as the prefix length grows. This gives a natural coding of odd 2-adic points by exponent sequences.

## 3. Why this does not settle Collatz

The 2-adic model makes the exponent dynamics simple, and the Haar branch distribution is geometric. Under the invariant random model, the expected exponent is
\[
\mathbb E[a]=\sum_{a\ge1}a2^{-a}=2.
\]
The corresponding heuristic logarithmic size drift is
\[
\log 3-2\log 2=\log(3/4)<0.
\]
This is a rigorous expectation calculation for the branch distribution, but it is not a universal orbitwise estimate on positive integers. A natural number is a single 2-adic point of measure zero; an almost-sure statement does not control every such point. The exact coding also permits exponent sequences that do not correspond to a terminating natural-number orbit.

## 4. Concrete next theorem target

Formalize in Lean, in this order:
1. uniqueness of the exact-valuation residue class modulo \(2^{a+1}\);
2. the inverse-branch identity \(3\phi_a(y)+1=2^a y\);
3. exact valuation from oddness of \(y\);
4. contraction of each inverse branch in the 2-adic metric;
5. only then, a measure-preservation statement and the geometric distribution of valuations.

The genuine arithmetic obstacle remains: obtain a deterministic constraint that distinguishes exponent sequences of positive-integer orbits from arbitrary 2-adic sequences strongly enough to prove descent or exclude nontrivial cycles. Do not replace that obligation with negative average drift.


## 5. Measure-preservation check (mathematical derivation)

On the branch with exponent a, write x = r_a + 2^(a+1)z, where r_a is its unique odd residue. Then
\[
T(x)=\frac{3r_a+1}{2^a}+6z.
\]
The constant term is odd and multiplication by 3 is a unit in \(\mathbb Z_2\), so as z ranges with Haar measure, this expression is Haar-uniform on the odd 2-adic integers. Thus each branch, conditional on its exponent, maps normalized branch measure to normalized Haar measure on the odd domain. Since branch a has weight 2^(-a) and these weights sum to one, the accelerated map preserves the normalized Haar measure on odd 2-adic integers.

Consequently, under Haar-random initial data, successive exponent labels are independent with distribution \(\Pr(a=j)=2^{-j}\): after any specified finite prefix, the image again has normalized Haar distribution. The strong law then gives average exponent 2 almost surely and negative asymptotic logarithmic multiplier \(\log(3/4)\) in the idealized multiplicative model.

This remains an almost-sure 2-adic statement. It does not imply that every positive integer orbit descends, and the additive +1 term and the natural-integer embedding must be handled for a universal theorem.
