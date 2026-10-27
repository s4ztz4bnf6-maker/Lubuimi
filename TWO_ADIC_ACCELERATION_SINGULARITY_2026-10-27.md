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
has a branch length depending on an unbounded valuation. It is not globally continuous on its natural domain of odd 2-adic points with finite valuation.

## 2. Two exact paths show no continuous extension at \(-1/3\)

Let \(x_*=-1/3\in\mathbb Z_2\), which is well-defined because 3 is a 2-adic unit. For \(m\ge1\), define
\[
x_m=x_*+2^m,\qquad y_m=x_*+3\cdot2^m.
\]
Both sequences consist of odd 2-adic integers and converge to \(x_*\). Exact calculation gives
\[
3x_m+1=3\cdot2^m,\qquad 3y_m+1=9\cdot2^m.
\]
Therefore
\[
v_2(3x_m+1)=v_2(3y_m+1)=m,
\qquad S(x_m)=3,\quad S(y_m)=9.
\]
The input sequences converge to the same point, but the output sequences are constantly 3 and constantly 9. Thus no choice of a value for \(S(x_*)\) can make the accelerated map continuous there. At the point itself, \(3x_*+1=0\), so its valuation is infinite and the ordinary accelerated step is undefined.

This is stronger than merely noting that an extension by zero fails: it proves that no continuous extension exists at this exceptional point.

## 3. Better architecture for the continuous-transform pillar

Keep the continuous 2-adic full map \(C\) as the dynamical system. Treat \(S\) as a return/inducing construction on odd points, with exceptional point \(-1/3\) and unbounded return times near it. Any use of compactness, invariant measures, or transfer operators must account for this exceptional point and return-time tails.

A promising formal interface is:
1. define the full map on \(\mathbb Z_2\) and prove continuity branchwise;
2. define the odd return time only where \(3x+1\ne0\) and the valuation is finite;
3. prove the exact induced-map identity on its domain;
4. isolate the exceptional point and quantify how neighborhoods of it generate long valuation blocks;
5. only then ask whether a cocycle/Lyapunov bound controls every positive integer orbit.

## 4. What this does and does not establish

The discontinuity calculation is exact. It does not establish that a positive-integer orbit approaches \(-1/3\), nor that such an orbit diverges, nor that a global descent potential exists. The research value is a clean separation between continuous full dynamics and the singular accelerated return map, preventing an invalid continuity/compactness argument from entering a proof.
