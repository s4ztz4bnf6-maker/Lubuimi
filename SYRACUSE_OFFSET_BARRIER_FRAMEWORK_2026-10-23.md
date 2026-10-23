# Syracuse Offset Barrier: a block certificate framework (2026-10-23)

## Status and purpose

This note proposes a new proof-search interface, not a proof of the Collatz conjecture. It reorganizes the exact affine identity already formalized in `SyracuseOffsetIdentity.lean` so that every candidate block has a computable, auditable descent certificate.

For a certified block of (N) accelerated odd steps, write (A=A_N), (C=C_N), (x=x_0>0), and (y=x_N). The exact identity is

[
2^A y=3^N x+C,qquad Cge 0.
]

Therefore

[
y<x quadLongleftrightarrowquad
3^N x+C<2^A x
quadLongleftrightarrowquad
(2^A-3^N)x>C.
]

This last form is the **offset barrier**. It is an exact equivalence, not a heuristic.

## Three certificates for every block

1. **Exponent surplus:** (G=2^A-3^N).
2. **Offset load:** (C), computed from (C_0=0), (C_{j+1}=3C_j+2^{A_j}).
3. **Starting-value barrier:** if (G>0), strict descent is equivalent to (x>C/G), or in integer form (Gx>C).

If (G\le 0) and (C\ge0), strict descent is impossible under this block identity. If (G>0), the exact integer threshold is
[
x\ge \lfloor C/G\rfloor+1.
]
Thus a block can be certified in either of two ways: prove its actual start exceeds the barrier, or prove a trajectory-specific upper bound on the ratio (C/G).

## Why this is a useful new structure

The usual coarse condition (2^A>3^N) only establishes (G>0). It does not compare the starting value with the offset barrier. The pair ((G,C)) keeps the multiplicative advantage and additive obstruction separate, so computational exploration can search for:
- blocks with unusually large (G) relative to (C);
- residue classes that force lower bounds on (x);
- block concatenations for which the barrier composes favourably;
- obstructions where (G\le0), immediately ruling out descent for that block.

For concatenated blocks with data ((N_1,A_1,C_1)) then ((N_2,A_2,C_2)), the affine maps compose as
[
3^{N_2}(3^{N_1}x+C_1)+2^{A_1}C_2
=3^{N_1+N_2}x+(3^{N_2}C_1+2^{A_1}C_2),
]
while the power-of-two exponent accumulates. This gives the exact composition law for offsets, including the essential scale factor $2^{A_1}$ on the second block's local offset. Any search or formalization must use the actual intermediate valuation word; arbitrary triples are not automatically realizable.

## Lean formalization targets

1. Define a block-data structure containing (N,A,C), with an identity certificate and (C\ge0).
2. Prove the natural-number form of the barrier equivalence:
   [
   3^N x+C<2^A x\iff (2^A-3^N)x>C
   ]
   under (3^N\le2^A), with the subtraction handled explicitly.
3. Prove the integer threshold lemma (Gx>C\iff C/G<x) when (G>0), then derive the floor threshold for natural (x).
4. Prove the offset composition law from the recurrence.
5. Connect each block-data object to a realizable valuation word and then to an actual Syracuse orbit. Never assume this final connection without a proof.

## Falsification gates

- Test (N=0), (C=0), (G=0), (G<0), and (x=1).
- Distinguish arbitrary recurrence data from genuine odd Syracuse trajectories.
- No statistical average or positive-density statement can replace the pointwise barrier.
- A finite set of checked starts is evidence about that set only, not a universal theorem.

The framework's potential advance is diagnostic: it turns the vague goal “obtain enough powers of two” into the precise obligation “make the actual start exceed the offset barrier”, and provides a compositional object on which to search for a stronger invariant.
