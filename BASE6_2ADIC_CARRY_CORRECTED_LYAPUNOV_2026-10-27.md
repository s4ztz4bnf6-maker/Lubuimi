# Base-6 digits, 2-adic continuity, and a carry-corrected Lyapunov target
Date: 2026-10-27

Status: exact observations and a research specification; not a Collatz proof, not a claim of novelty, and not a Lean compilation.

## 1. What base 6 really simplifies

Write an integer in base 6 as n = sum_i d_i 6^i, with digits d_i in {0,...,5}. If n is odd, then n mod 2 is determined by d_0 mod 2 because 6^i is even for i >= 1. Also 3n+1 is congruent to 4 modulo 6, since 3n is congruent to 3 modulo 6 for odd n. Thus the least base-6 digit of 3n+1 is exactly 4.

This is a valid local fact, but its strength must not be overstated:
- A last digit 4 guarantees divisibility by 2, not by 4. For example n=3 gives 3n+1=10, whose 2-adic valuation is 1.
- The ordinary Collatz rule therefore takes an even step after every odd step. This is already a basic property of the original rule; base 6 repackages it but does not strengthen it.
- Division by 2 is not uniformly a digit-local operation in base 6. Although the least digit of an even n is even, higher base-6 digits contribute 3 d_i 6^(i-1) to n/2, and the products 3 d_i can generate carries.

So base 6 is useful as a parity-visible coordinate system, not as a mechanism that eliminates carry propagation.

## 2. Exact 2-adic continuity boundary

The ordinary, unaccelerated Collatz map on Z_2 is continuous: parity classes are clopen, and each branch is a polynomial/rational-by-2 operation restricted to its domain. But continuity alone does not imply contraction, convergence to 1, or a global descent theorem.

Moreover, if x and y agree modulo 2^m, an even step can reduce the guaranteed congruence precision by one bit. Thus equal last m bits do not automatically guarantee identical trajectories for m full steps.

The accelerated odd map S(n)=(3n+1)/2^{v_2(3n+1)} is more delicate: its valuation depends on arbitrarily many low bits, and it has no continuous extension at x_*=-1/3 in Z_2. For x_m=x_*+2^m and y_m=x_*+3*2^m, both sequences approach x_*, while S(x_m)=3 and S(y_m)=9. A contraction argument cannot be asserted for this accelerated map on all of Z_2 without changing the domain or topology and proving the required hypotheses.

## 3. Carry-corrected potential

For odd Syracuse iterates, write a_j=v_2(3n_j+1), A_N=sum_{j<N}a_j, and
R_0=0, R_{j+1}=3R_j+2^{A_j}.
Then
2^{A_N} n_N = 3^N n_0 + R_N
and
log_2(n_N/n_0) = N log_2(3) - A_N + log_2(1+R_N/(3^N n_0)).

Define the block drift
D_N(n_0)=A_N log(2)-N log(3)-log(1+R_N/(3^N n_0)).
Then D_N(n_0)>0 is equivalent to n_N<n_0. This is not a new global Lyapunov theorem; it is an exact restatement that makes the neglected correction explicit.

### Candidate research target (not assumed true)

Seek a state potential V(n,A,R) or a uniform nested-cylinder inequality such that:
1. it is well-defined on every realized odd-Syracuse state;
2. its decrease is proved for every permitted transition or over a rigorously certified bounded block;
3. it controls the R correction and not just the empirical frequency/entropy of valuation symbols;
4. its strict decrease rules out all unbounded non-descending trajectories, with a separate argument handling the finite small-state/cycle cases.

A finite block word alone cannot be labelled “too improbable” to matter: every finite positive valuation word is realizable by infinitely many positive starts. Statistical mixing, entropy, and random-walk drift are therefore hypotheses to test, not substitutes for the uniform deterministic inequality.

## 4. Matrix-potential warning

A positive-definite quadratic form on a fixed finite bit vector does not automatically represent the integer after 3n+1: multiplication has carries and changes the bit length. Any matrix certificate must include a correct transition encoding for carries, leading-bit growth, and the division/valuation branch. A finite-state SAT certificate could establish a bounded local statement, but cannot by itself cover unbounded integer lengths unless a proved abstraction theorem connects the finite model to all integers.

## 5. Formal milestones

- Prove the base-6 congruence lemma n odd -> 3n+1 ≡ 4 (mod 6).
- Prove the exact affine block identity and the equivalence between D_N>0 and block descent.
- Formalize valuation-cylinder correctness and exact residue lifts.
- Treat a global nested-cylinder/Lyapunov inequality as the separate open bridge.

No step above proves the Collatz conjecture. The useful progress is to separate true local simplifications from the missing global contraction claim.
