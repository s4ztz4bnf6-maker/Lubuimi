# Exact obstruction to finite-window valuation barriers
Date: 2026-10-27
Status: proved by explicit integer construction; not a Collatz counterexample

## The claim a local proof strategy cannot use

No fixed window length L and cutoff H can force a Syracuse valuation-one step in every length-L segment whose source states all exceed H. This is stronger than a finite search: it is an explicit infinite family of counterexamples to that proposed finite-window barrier.

For the accelerated odd map
\[
S(x)=\frac{3x+1}{2^{v_2(3x+1)}},
\qquad a(x)=v_2(3x+1),
\]
a valuation-one step occurs exactly when x is 3 modulo 4.

## Explicit family with arbitrarily long runs of valuation exactly two

Fix any integer L >= 1 and any cutoff H. Choose an integer m sufficiently large and set
\[
x_0=1+m\,2^{2L+1}.
\]
For j=0,...,L define
\[
x_j=1+m\,3^j2^{2(L-j)+1}.
\]
For j<L, the exponent 2(L-j)+1 is at least 3, so x_j is 1 modulo 8. Therefore
\[
3x_j+1\equiv4\pmod8,
\]
which proves v_2(3x_j+1)=2. Moreover,
\[
\frac{3x_j+1}{4}
=1+m\,3^{j+1}2^{2(L-j)-1}
=x_{j+1}.
\]
Thus x_0,...,x_L is an actual integer Syracuse orbit segment with
\[
a(x_0)=a(x_1)=\cdots=a(x_{L-1})=2.
\]
By increasing m, every one of these finitely many states can be made larger than H. Hence no fixed finite window can force even one valuation-one step, regardless of how high a fixed barrier H is set.

This is not a divergent orbit and not a counterexample to Collatz. The construction is a finite orbit segment near the 2-adic fixed point 1, lifted to arbitrarily large positive integers.

## Consequence for our audit history

The escape-frequency bound
\[
\liminf_k \frac{1}{k}\#\{j<k:a_j=1\}\ge \log_2(4/3)
\]
for a genuinely divergent orbit may still be correct. The construction above shows why it cannot be proved by a uniform local rule requiring a valuation-one event in every fixed-length block. Any valid global proof must allow arbitrarily long exceptional blocks and control their aggregate contribution, or use information beyond the valuation word alone (for example, a uniform global bound on affine carry debt).

Likewise, a block entropy/Lyapunov potential must be shown to decrease despite these exact exceptional blocks. Calling the carries pseudorandom is not a substitute for that inequality.

## Reproducibility

A direct check of the formula uses only integer arithmetic. For each L and m, verify:
1. x_j is odd for all j;
2. 4 divides 3*x_j+1;
3. 8 does not divide 3*x_j+1;
4. (3*x_j+1)/4 equals x_{j+1};
5. min(x_0,...,x_{L-1}) > H.

All five checks are exact. No numerical approximation or probabilistic assumption is used.

## Next meaningful target

Replace a fixed-window barrier with a *uniform aggregate surplus theorem*: for every admissible length-k orbit prefix, compare
\[
D_{j+1}=3D_j+(2^{a_j}-4)2^{A_j}
\]
against the exact affine offset, and prove a global lower bound on the cumulative surplus that is strong enough to force descent or density one. If such a bound fails, the search must return a certified admissible prefix with its full states and offsets, not merely a formal exponent word.

No global Collatz proof or counterexample is claimed.
