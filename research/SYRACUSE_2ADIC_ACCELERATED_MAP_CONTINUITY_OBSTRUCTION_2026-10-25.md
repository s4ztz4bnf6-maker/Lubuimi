# 2-adic continuity obstruction for the accelerated Syracuse map

Date: 2026-10-25

## Result

The ordinary Collatz map has a natural continuous extension to the 2-adic integers when defined piecewise on the clopen parity classes:
\[
F(x)=\begin{cases}
x/2,&x\in 2\mathbb Z_2,\\
(3x+1)/2,&x\in 1+2\mathbb Z_2.
\end{cases}
\]
Each quotient is well-defined on its indicated clopen domain, and both branches are continuous there.

The *accelerated odd map*
\[
T(x)=\frac{3x+1}{2^{v_2(3x+1)}}
\]
does not, however, extend continuously to all odd 2-adic inputs by assigning any value at \(x_*=-1/3\in\mathbb Z_2\). At \(x_*\), the numerator vanishes, so its valuation is infinite and the formula itself is not defined.

## Proof of the obstruction

For each odd 2-adic unit \(u\), let
\[
x_k=x_*+2^k u,\qquad k\ge 1.
\]
Then \(x_k\to x_*\) 2-adically, and
\[
3x_k+1=3(-1/3+2^k u)+1=3\cdot 2^k u.
\]
Since both 3 and \(u\) are 2-adic units, \(v_2(3x_k+1)=k\). Consequently,
\[
T(x_k)=\frac{3\cdot2^k u}{2^k}=3u
\]
for every \(k\).

Taking \(u=1\) gives the constant image sequence 3; taking \(u=3\) gives the constant image sequence 9. Both input sequences converge to the same point \(x_*\), but their image limits differ. Therefore no choice of \(T(x_*)\) can make the accelerated map continuous at \(x_*\).

## Consequence for the four-pillar strategy

A 2-adic embedding remains a plausible tool, but the claim that the accelerated dynamics can simply be made into a globally continuous flow is too strong. The unaccelerated parity-split map is the more natural continuous system. Any argument using the accelerated map must either:

1. work on a restricted domain excluding the singular point and control approach to it;
2. retain the valuation as a return-time/cocycle over the continuous unaccelerated map; or
3. use a skew-product/state extension that records the valuation rather than assuming the quotient map itself is globally continuous.

None of these alternatives by itself proves global convergence. In particular, compactness of \(\mathbb Z_2\) does not imply that every orbit converges to one fixed point.

## Audit status

This is a mathematical obstruction note, not a Lean-checked theorem. It narrows the continuous-transformation pillar and suggests a source-faithful formal target: prove continuity of the piecewise unaccelerated map on \(\mathbb Z_2\), then formalize the accelerated map as a return-time construction on its valid domain.
