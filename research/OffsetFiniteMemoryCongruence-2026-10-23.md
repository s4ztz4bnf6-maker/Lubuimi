# Finite-memory congruences for Syracuse affine offsets

Let `C_0=0` and `C_{n+1}=3C_n+2^{A_n}`. By induction,
`C_N = sum_{i=0}^{N-1} 3^{N-1-i} 2^{A_i}`.

For any `r ≤ N`, split the sum at `N-r`. Every term in the prefix
`i < N-r` has a factor `3^r`, since `N-1-i ≥ r`. Therefore
`C_N ≡ sum_{i=N-r}^{N-1} 3^{N-1-i} 2^{A_i} (mod 3^r)`.

This gives an exact finite-memory rule: modulo `3^r`, only the last r
exponents matter. The case r=1 recovers `C_N ≡ 2^{A_{N-1}} (mod 3)`.

For Lean, a robust proof route is:
1. prove the weighted-sum closed form by induction (already present);
2. split `Finset.range N` into the prefix and suffix;
3. show each prefix summand is divisible by `3^r`;
4. use modular arithmetic to discard that prefix.

This is a candidate-filter theorem, not an orbit-realizability theorem.
A surviving word must still satisfy exact transition equations, valuation
maximality, and terminal divisibility. No global Collatz proof follows.
