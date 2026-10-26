# 2-adic continuity obstruction for the accelerated Syracuse map

## Scope

This note records a precise obstruction to one tempting version of the
"continuous embedding" strategy. It is not a disproof of the Collatz
conjecture and does not rule out useful 2-adic encodings, skew products,
symbolic extensions, or discontinuous/stratified dynamics.

For positive odd integers, define the accelerated Syracuse map
\[
T(n)=\frac{3n+1}{2^{v_2(3n+1)}}.
\]
The positive odd integers are viewed as a subset of the 2-adic integers
\(\mathbb Z_2\).

## Proposition

There is no continuous map \(F: X\to\mathbb Z_2\), where \(X\) is a
2-adically closed domain containing all positive odd integers and their
limit point \(-1/3\), that agrees with \(T\) on every positive odd
integer.

### Proof

For every integer \(m\ge 1\), set
\[
x_m=\frac{2^{2m}-1}{3},\qquad
y_m=\frac{7\cdot 2^{2m}-1}{3}.
\]
Both are positive odd integers: the numerators are divisible by three,
and each numerator is congruent to three modulo six. Moreover,
\[
3x_m+1=2^{2m},\qquad
3y_m+1=7\cdot2^{2m}.
\]
Since 1 and 7 are odd,
\[
v_2(3x_m+1)=v_2(3y_m+1)=2m,
\]
so
\[
T(x_m)=1,\qquad T(y_m)=7.
\]

In \(\mathbb Z_2\),
\[
x_m-(-1/3)=2^{2m}/3\to0,\qquad
y_m-(-1/3)=7\cdot2^{2m}/3\to0.
\]
Thus both sequences converge 2-adically to \(-1/3\), while their images
are the distinct constant sequences 1 and 7. If a continuous extension
\(F\) existed at \(-1/3\), both image sequences would have to converge
to the same value \(F(-1/3)\), a contradiction. \(\square\)

## Consequence for the four-pillar strategy

The accelerated map cannot simply be extended continuously to all of the
odd 2-adic closure while preserving its values on positive odd integers.
The obstruction occurs at the 2-adic point \(-1/3\), where
\(3x+1=0\) in \(\mathbb Z_2\) and the valuation is not finite.

This does **not** invalidate 2-adic methods. On each valuation cylinder
\[
v_2(3x+1)=k,
\]
the valuation is locally constant and the formula
\[
x\mapsto (3x+1)/2^k
\]
is continuous on that cylinder. A viable approach may therefore use a
stratified/cylinder-wise system, keep track of the valuation symbolically,
or study a different continuous observable. Any such construction must
prove that it retains enough information to imply descent of the original
integer orbit; compactness alone does not imply a unique global attractor.

## Formalization checklist

A Lean development of this proposition should separately formalize:
1. integrality and oddness of \(x_m,y_m\);
2. their exact 2-adic convergence to \(-1/3\);
3. the exact valuations and outputs 1 and 7;
4. the contradiction with continuity.

Until those four steps are encoded and compiled, this repository note is a
mathematical argument, not a kernel-checked Lean theorem.
