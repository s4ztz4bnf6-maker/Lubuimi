# Exact obstruction to the global 2-adic Banach-contraction route
Date: 2026-10-27
Status: proved obstruction to one proposed method; no conclusion for the integer Collatz conjecture

## Executive result

The standard shortcut Collatz map on the 2-adic integers is not a contraction in the standard 2-adic metric. On each parity branch it expands distances by exactly a factor of 2. Therefore Banach's fixed-point theorem cannot be applied to the map itself with the standard 2-adic metric. This is an exact obstruction, not a heuristic objection.

## 1. Definition

On Z_2 define
T(x) = x/2 if x is even,
T(x) = (3x+1)/2 if x is odd.

For x,y of the same parity, both inputs use the same affine branch. If they are even,
T(x)-T(y)=(x-y)/2.
If they are odd,
T(x)-T(y)=3(x-y)/2.
Since |2|_2=1/2 and |3|_2=1, in either case
|T(x)-T(y)|_2 = 2 |x-y|_2.
Thus every same-parity pair of distinct points is expanded by exactly 2. In particular, no Lipschitz constant c<1 can hold globally. A fortiori T is not a Banach contraction in the standard 2-adic metric.

This does not rule out a different metric, a different operator, an inverse-branch contraction, or a Lyapunov argument on a restricted invariant set. Any such alternative must be defined and proved to control the positive integers, not merely the compact space Z_2.

## 2. What 2-adic continuity actually gives

If x ≡ y (mod 2^m), then their first m parity decisions agree under the shortcut map; after j iterations the congruence precision is generally reduced to 2^(m-j). This is a finite-horizon symbolic statement. It does not imply that the two integer trajectories become numerically close in the ordinary absolute value, nor that either trajectory decreases.

The parity coding conjugates the 2-adic map to a one-sided shift. A shift is not a global attracting map: it discards one symbol and shifts the rest, rather than forcing all symbolic sequences to one fixed sequence. Compactness of Z_2 also does not imply that the embedded positive integers converge to the 2-adic fixed point 0 or to the ordinary integer 1-cycle.

## 3. Base-six audit

For odd n, n ≡ 1,3,5 (mod 6), hence 3n+1 ≡ 4 (mod 6). Therefore 3n+1 is even, and at least one division by 2 follows. This is true but is not a global descent estimate.

Two precision points:
- Division by 6 is a base-six digit shift; division by 2 is not generally a digit shift, despite 2 dividing 6.
- Knowing m ≡ 4 (mod 6) does not determine (m/2) mod 6: it only determines m/2 mod 3. For example, m=4 gives m/2=2, while m=10 gives m/2=5; both m are 4 mod 6.

So the final base-six digit gives a local residue fact, not a finite-state closed dynamics for the full quotient or a decreasing potential.

## 4. The exact gap that remains

The ordinary-size escape criterion is not supplied by 2-adic topology. To exclude an unbounded integer orbit, one still needs an Archimedean estimate, for example a deterministic inequality on the admissible valuation sequence that forces
log_2(x_0+Q_k)-D_k
to fail to tend to +infinity, together with a separate exclusion of nontrivial cycles. Here D_k and Q_k are the exact cocycle coordinates defined in Valuation_Rhythm_Cocycle_2026-10-27.md.

The exact result of this audit is therefore a method-level falsification: the direct Banach-contraction argument in the usual 2-adic metric cannot be the missing global proof. No counterexample to the Collatz conjecture and no global proof is claimed.
