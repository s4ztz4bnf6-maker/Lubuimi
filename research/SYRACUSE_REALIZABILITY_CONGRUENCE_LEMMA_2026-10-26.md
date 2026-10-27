# Realizability-sensitive congruence constraint for odd Syracuse blocks
Date: 2026-10-26

## Exact consequence of the block identity

Let a=(a_0,...,a_(N-1)) be a positive exponent list, A=sum a_i, and let
C=sum_{j=0}^{N-1} 3^(N-1-j) 2^(a_0+...+a_(j-1)).
For any realized odd-only block with odd start n and odd endpoint m,
2^A m = 3^N n + C.

This gives more than an inequality. A necessary condition for a to be realizable from n is
3^N n + C = 0 (mod 2^A),
and because m is odd, the stronger residue condition is
3^N n + C = 2^A (mod 2^(A+1)).
Here the second congruence means the quotient by 2^A is odd. Since 3^N is odd, it has a multiplicative inverse modulo every power of two. Thus for a fixed exponent list, the start n is constrained to one residue class modulo 2^A by the first congruence, and to the appropriate odd-quotient class modulo 2^(A+1) by the second.

These are necessary conditions; they do not alone prove global descent. They give a concrete way to exploit realizability that is absent from the crude estimate a_i >= 1.

## Step-level exact valuation condition

For an odd current state n_i, a positive exponent a_i is the exact Syracuse exponent precisely when
2^(a_i) divides 3*n_i+1 but 2^(a_i+1) does not, and the next state is
n_(i+1)=(3*n_i+1)/2^(a_i), which must be odd. The division-free Lean relation captures the equality; a future formalization should explicitly capture exactness/oddness at every state.

## Formalization plan

1. Define the prefix sums and the correction term in chronological order.
2. Prove the block identity (already present in SyracuseBlockDescent.lean).
3. Derive the modular divisibility condition from the identity.
4. Add endpoint oddness to derive the modulo 2^(A+1) condition.
5. Prove uniqueness of the residue class using oddness/invertibility of 3^N modulo powers of two.
6. Investigate whether the sequence of prefix congruences eliminates enough exponent words to establish a stronger correction bound or a finite-state potential.

The key limitation is explicit: residue restrictions prune unrealizable exponent words, but a global Collatz proof still needs a theorem that turns these restrictions into a universal descent/convergence argument.
