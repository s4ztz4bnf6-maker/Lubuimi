# Syracuse 2-adic regularity audit — 2026-10-26

## Claim being tested

For the accelerated odd Syracuse map
\[
T(x)=(3x+1)/2^{v_2(3x+1)},
\]
one cannot infer global convergence from compactness of \(\mathbb Z_2\), and the map is not globally continuous on its natural domain excluding the zero numerator.

## Local regularity away from the singular point

Let \(x\in\mathbb Z_2\) with \(3x+1\ne0\), and put \(k=v_2(3x+1)\). Write \(3x+1=2^k u\), where \(u\) is odd. If
\[
x'=x+2^{k+1}t,
\]
then
\[
3x'+1=2^k(u+6t).
\]
Since \(u+6t\) remains odd, \(v_2(3x'+1)=k\), and
\[
T(x')-T(x)=3(x'-x)/2^k=6t.
\]
Thus the valuation is constant on this cylinder and the map is continuous there. The 2-adic Lipschitz factor relative to the ambient metric is \(2^k\), not \(2^{-k}\): division by \(2^k\) multiplies the 2-adic absolute value by \(2^k\). This corrects a common sign-of-valuation mistake.

## No continuous extension at \(x_*=-1/3\)

The point \(x_*\in\mathbb Z_2\) satisfies \(3x_*+1=0\), so the accelerated formula is undefined there. For odd \(u\) and integer \(k\ge1\), let
\[
x_{k,u}=x_*+2^k u.
\]
Then \(x_{k,u}\to x_*\) 2-adically and
\[
T(x_{k,u})=3u,
\]
because \(3x_{k,u}+1=3\cdot2^k u\) has valuation exactly \(k\). Taking \(u=1\) yields the constant output 3; taking \(u=3\) yields the constant output 9. Hence no unique limit exists at \(x_*\), and no continuous extension is possible.

## Research consequence

A useful replacement for the proposed global continuous-flow route must explicitly handle the singular point and must separately prove a transfer theorem back to positive integer orbits. Compactness alone gives convergent subsequences, not convergence of every orbit and not attraction to a unique sink.

## Verification status

This is an elementary mathematical audit note. It has not been formalized or compiled in Lean in this commit.