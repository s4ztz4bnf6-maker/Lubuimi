# 2-adic singularity of the accelerated Syracuse map
Date: 2026-10-27

Status: exact mathematical observation and research direction; not a Collatz proof.

## 1. The key distinction

The ordinary Collatz map
\[
C(n)=\begin{cases}n/2&n\equiv0\pmod2,\\(3n+1)/2&n\equiv1\pmod2\end{cases}
\]
has a natural continuous extension to \(\mathbb Z_2\): parity classes are clopen, and division by 2 is continuous on the even branch.

The odd-only accelerated map
\[
S(n)=\frac{3n+1}{2^{v_2(3n+1)}}
\]
is different. Its branch length depends on an unbounded valuation, so one cannot simply treat it as a globally continuous 2-adic flow.

## 2. Exact discontinuity witness

Let \(x_*=-1/3\in\mathbb Z_2\). Since 3 is a 2-adic unit, this is well-defined and odd. For every integer \(m\ge1\), set
\[
x_m=x_*+2^m.
\]
Then \(x_m\to x_*\) in the 2-adic metric, each \(x_m\) is odd, and
\[
3x_m+1=3(x_*+2^m)+1=3\cdot2^m.
\]
Hence \(v_2(3x_m+1)=m\) and the accelerated map gives
\[
S(x_m)=3
\]
for every \(m\ge1\). But \(3x_*+1=0\), so the valuation in the definition of \(S(x_*)\) is not finite; the accelerated map is not defined there as an ordinary odd Syracuse step. If one artificially extends it by assigning value 0 at \(x_*\), the sequence of outputs still converges to 3, not 0. Thus that extension is discontinuous at \(-1/3\).

This is a concrete obstruction to the naive idea that acceleration automatically turns the integer problem into a smooth global flow.

## 3. Better architecture for the continuous-transform pillar

Keep the continuous 2-adic full map \(C\) as the dynamical system. Treat the accelerated map \(S\) as a return/inducing construction on odd points, with a singular exceptional 2-adic point \(-1/3\) and unbounded return times near it. Any use of compactness, invariant measures, or transfer operators must explicitly account for this exceptional point and for return-time tails.

A promising formal interface is:
1. define the full map on \(\mathbb Z_2\) and prove continuity branchwise;
2. define the odd return time only where \(3x+1\ne0\) and the valuation is finite;
3. prove the exact induced-map identity on its domain;
4. isolate the exceptional point and quantify how neighborhoods of it generate long valuation blocks;
5. only then ask whether a cocycle/Lyapunov bound controls every positive integer orbit.

## 4. What this does and does not establish

The discontinuity calculation is exact. It does not establish that a positive-integer orbit approaches \(-1/3\), nor that such an orbit diverges, nor that a global descent potential exists. The proposed research gain is a cleaner separation between continuous full dynamics and the singular accelerated return map, preventing an invalid continuity/compactness argument from entering a proof.
