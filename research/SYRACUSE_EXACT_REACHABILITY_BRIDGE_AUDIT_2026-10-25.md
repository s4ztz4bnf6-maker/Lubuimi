# Syracuse: exact ordinary/accelerated reachability bridge

Date: 2026-10-25

## Goal

The accelerated odd map is defined on positive odd integers by
\[
T(n)=\frac{3n+1}{2^{v_2(3n+1)}}.
\]
A theorem about this map can be transferred to ordinary Collatz only after proving both directions of the finite-step correspondence.

## Exact bridge (no global conjecture assumed)

Let the ordinary Collatz map on positive integers be
\[
C(n)=\begin{cases}n/2,&2\mid n,\\3n+1,&2\nmid n.\end{cases}
\]
For every positive odd n, write a=v_2(3n+1). Since 3n+1 is positive and even, a≥1 and
\[
C^{a+1}(n)=T(n),
\]
where the first ordinary step is 3n+1 and the next a divisions by 2 include the complete power of 2. (Here C^{a+1} means iterate C a+1 times.) This identity should be proved by induction on a, using the exact divisibility statement 2^a ∣ 3n+1 and 2^(a+1) ∤ 3n+1.

Conversely, every ordinary trajectory segment starting at an odd number and ending at the next odd number consists of exactly one 3n+1 step followed by a finite run of divisions by 2. Thus ordinary reachability of 1 is equivalent to accelerated odd reachability of 1, provided the ordinary trajectory is segmented at each odd state. The special terminal state 1 is harmless: T(1)=1, while ordinary Collatz has the familiar 1→4→2→1 cycle.

## Proof obligations for Lean

1. Define C and T with explicit positive-integer domains; avoid division-by-zero conventions.
2. Prove the valuation decomposition: 3*n+1 = 2^a * T(n), with odd T(n), a≥1, and exactness at a+1.
3. Prove the finite-iterate identity by induction on a.
4. Define finite reachability as a reflexive-transitive closure or an explicit iterate witness.
5. Prove each accelerated step expands to a finite ordinary path, and each ordinary path between odd states contracts to one accelerated step.
6. State the equivalence for reaching 1 separately from the cycle convention. Do not infer pointwise convergence from density-one statements.

## Why the 2-adic embedding alone does not solve the problem

The accelerated map is not continuous at x_*=-1/3 in Z_2: 3*x_*+1=0, and nearby inputs can have arbitrarily large v_2(3x+1). Compactness of Z_2 therefore supplies no automatic global attracting point or uniform descent. Any topological argument must explicitly handle this singular point and must prove that its conclusion transfers back to positive integers.

## Scope status

This note is a proof plan, not a claimed Lean-checked theorem. It does not prove that every orbit reaches 1. The next implementation target is the finite-iterate identity and reachability equivalence, then compile and audit them on the pinned Lean toolchain.
