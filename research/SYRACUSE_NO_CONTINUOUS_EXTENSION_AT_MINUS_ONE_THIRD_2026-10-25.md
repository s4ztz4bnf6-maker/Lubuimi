# Explicit two-sequence obstruction to continuous extension at -1/3 in Z_2
Date: 2026-10-25

## Statement
Let x_* = -1/3 in Z_2. On odd 2-adic x != x_* for which v_2(3x+1) is finite, define
T_2(x) = (3x+1) / 2^{v_2(3x+1)}.
There is no continuous extension of T_2 to x_*.

## Proof by two sequences
For every integer m >= 1, put
x_m = x_* + 2^m, and y_m = x_* + 5 * 2^m.
Both sequences consist of odd 2-adic integers and converge 2-adically to x_* because
v_2(x_m - x_*) = m and v_2(y_m - x_*) = m + v_2(5) = m.

Since 3x_* + 1 = 0,
3x_m + 1 = 3 * 2^m, hence v_2(3x_m+1)=m and T_2(x_m)=3.
Likewise,
3y_m + 1 = 15 * 2^m, hence v_2(3y_m+1)=m and T_2(y_m)=15.
Thus x_m -> x_* and y_m -> x_* but their images are the distinct constant sequences 3 and 15. In particular T_2(x_m) does not converge to the same limit as T_2(y_m), so no continuous extension at x_* exists.

## Consequence
A globally continuous extension of the accelerated map on the full odd 2-adic domain cannot be the missing bridge to Collatz. The mathematically viable direction is cylinder-wise / induced dynamics, or a different state space or observable that resolves the singular boundary. Any proposed conjugacy or compactification must preserve the integer-orbit statement and explicitly handle this obstruction.

This is a local topological obstruction only. It neither proves nor disproves the Collatz conjecture.
