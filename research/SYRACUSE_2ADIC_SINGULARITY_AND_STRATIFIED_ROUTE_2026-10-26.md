# Syracuse checkpoint: the accelerated map has an unavoidable 2-adic singularity

Date: 2026-10-26

## New exact observation: no continuous extension at the exceptional point

Let
\[
T(x)=\frac{3x+1}{2^{v_2(3x+1)}}
\]
on odd 2-adic integers for which \(3x+1\ne0\). The exceptional point is
\(x_*=-1/3\in\mathbb Z_2\), where the valuation is infinite and the accelerated
map is undefined.

For every fixed positive odd integer \(c\), set
\[
x_n^{(c)}=-\frac13+c2^n.
\]
Then \(x_n^{(c)}\to x_*\) in \(\mathbb Z_2\), and
\[
3x_n^{(c)}+1=3c2^n,\qquad v_2(3x_n^{(c)}+1)=n,
\]
so \(T(x_n^{(c)})=3c\) for every \(n\). Taking \(c=1\) gives the constant
image sequence 3; taking \(c=3\) gives the constant image sequence 9.
Therefore no choice of a value at \(x_*\) can make \(T\) continuous there:
continuity would force both limits to equal the same value.

This is an exact obstruction to the proposed *global continuous-flow* shortcut,
not an obstruction to every 2-adic approach. The right object is a stratified
dynamical system on the clopen valuation cylinders
\[
D_k=\{x\in\mathbb Z_2:v_2(3x+1)=k\},\quad k\ge1,
\]
where the branch formula \(T_k(x)=(3x+1)/2^k\) is affine on its domain.
Any global argument must explicitly control excursions between cylinders and
the exceptional point; it cannot assume a continuous extension across \(-1/3\).

## Formal proof obligations (Lean)

1. Define the 2-adic valuation condition without assigning a finite valuation to zero.
2. Prove \(x_n^{(c)}\to -1/3\) using the 2-adic metric / neighbourhood basis.
3. Prove the valuation identity for odd \(c\): \(v_2(3c2^n)=n\).
4. Prove the branch value is exactly \(3c\).
5. State the no-continuous-extension theorem by contradiction using \(c=1\) and \(c=3\).

The first four are elementary and suitable for a small standalone Lean file. The
fifth must use the precise topology and domain/codomain chosen in the formal
definition. No Lean compilation is claimed in this checkpoint.

## Research consequence

Do not attempt to smooth the accelerated Syracuse map globally at the singular
point. Replace that ambition with a cylinder-wise/induced map and a quantitative
bound on how orbits visit high-valuation cylinders. This shifts the hard question
from a false continuity premise to an explicit recurrence/visit-frequency
estimate. It does not prove or refute Collatz.
