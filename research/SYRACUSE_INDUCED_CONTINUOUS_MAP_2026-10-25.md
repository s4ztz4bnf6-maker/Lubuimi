# Positive replacement for naive 2-adic smoothing: induce the continuous Collatz map
Date: 2026-10-25

## Definition
Define the ordinary 2-adic Collatz map C : Z_2 -> Z_2 by
C(x) = x/2 when x is even, and C(x) = (3x+1)/2 when x is odd.
The two parity classes 2 Z_2 and 1+2 Z_2 are clopen. On each class the relevant division by 2 is a continuous map on its natural domain, so the piecewise map C is continuous.

Let O = 1 + 2 Z_2 be the odd 2-adic integers. For x in O with 3x+1 != 0, let a=v_2(3x+1). Then a is finite and
C(x)=(3x+1)/2,
and the next a-1 iterates are successive halvings of this even value. Consequently the first return to O occurs at time a and
C^a(x)=(3x+1)/2^a.
Thus the accelerated Syracuse map is the first-return (induced) map of the continuous ordinary Collatz map on O, away from x_*=-1/3.

## The exceptional point
At x_*=-1/3, C(x_*)=0 and C(0)=0, so the orbit never returns to O. The induced return map is therefore naturally partial at this point; the unbounded return time near x_* is exactly the obstruction to continuous extension of the accelerated map.

## Research consequence
This avoids the false goal of making the accelerated map itself globally continuous. The ambient map C is continuous, while the accelerated map is an induced map with unbounded return time. The useful objects to investigate are:
1. return-time cylinders {x in O : v_2(3x+1)=a};
2. the distribution and arithmetic compatibility of successive return times;
3. induced transfer operators or weighted sums on these cylinders;
4. a descent potential whose integer restriction is proved to decrease, not merely whose average drift is negative.

Compactness and continuity of C alone still do not imply the Collatz conjecture. A proof would need a theorem linking induced return times to every positive integer orbit.

## Formalization checklist
- Define parity on Z_2 and prove both parity classes are clopen.
- Prove C is continuous by piecewise continuity on the clopen partition.
- Prove for odd x and a=v_2(3x+1)<infty that the first return time to O is exactly a.
- Isolate x_* and prove it has no return.
- Keep these topological facts separate from the global integer termination conjecture.
