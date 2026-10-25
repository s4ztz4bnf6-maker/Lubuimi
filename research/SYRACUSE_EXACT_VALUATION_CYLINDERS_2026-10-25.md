# Exact finite valuation cylinders for accelerated Syracuse
Date: 2026-10-25

## Theorem target
Let T(n)=(3n+1)/2^{v_2(3n+1)} on positive odd integers. Fix a finite word
a=(a_0,...,a_{r-1}) with every a_i >= 1, and put A_j = sum_{i<j} a_i and A=A_r.
The set of odd integers n whose first r accelerated valuations are exactly this word is one nonempty residue class modulo 2^(A+1). Hence its natural density among odd integers is exactly 2^(-A).

The modulus/density convention matters: among odd residue classes modulo 2^(A+1) there are 2^A classes, and the specified word occupies one. Its density relative to all odd integers is therefore 1/2^A, not 1/2^(A+1).

## Proof mechanism (finite congruence induction)
For an odd integer x, the condition v_2(3x+1)=a is equivalent to
3x+1 == 2^a (mod 2^(a+1)).
Since 3 is invertible modulo every power of 2, this is one odd residue class modulo 2^(a+1). It is the unique lift among the two lifts of the divisibility class modulo 2^a that has exact valuation a.

For a word, recursively impose these exact congruences on the successive odd states. At each stage the accelerated transition is an affine map with odd coefficient 3 divided by the prescribed power of 2. Tracking the congruence precision shows that specifying the next valuation refines the initial residue class by the required number of binary digits. The resulting initial congruence is unique modulo 2^(A+1). The induction should be written carefully so that it proves both existence and uniqueness; divisibility alone is insufficient because it permits a larger valuation.

Equivalent affine identity:
2^A n_r = 3^r n_0 + C_r,
where C_0=0 and C_{j+1}=3 C_j + 2^(A_j).
The final condition n_r odd is precisely the nondivisibility of 3^r n_0+C_r by 2^(A+1). This identity is useful for an independent congruence proof.

## Why this is useful
1. It upgrades a heuristic parity/valuation model into an exact finite-cylinder counting statement.
2. It gives a sound base for finite-prefix distributions and finite-modulus verification.
3. It does NOT imply that every individual orbit has typical valuations, nor that every orbit descends. A density-one statement cannot be substituted for a uniform orbit theorem.

## Lean formalization plan
- Define the iterate and valuation word without relying on a probabilistic assumption.
- Prove exact valuation criterion: v2(3*n+1)=a iff 2^a divides 3*n+1 and 2^(a+1) does not.
- Prove the one-step residue-cylinder lemma modulo 2^(a+1).
- Prove the word-cylinder induction, retaining exactness at each step.
- Derive cardinality one in ZMod (2^(A+1)) restricted to odd residues and then relative density 2^(-A).
- Audit edge cases explicitly: r=0, a_i>=1, positive odd states, and distinction between all integers and odd integers.

## Explicit limitation
The exact-cylinder theorem is a finite combinatorial fact. The missing Collatz ingredient remains an orbit-uniform bound or a descent potential that controls the weighted correction on every positive integer orbit. The probabilistic model with P(a=k)=2^-k has E[a]=2 and variance 2, but this is not an independence theorem for a fixed orbit; moreover E[2^a]=infinity under this law, so naive averaging of exponential corrections is invalid.
