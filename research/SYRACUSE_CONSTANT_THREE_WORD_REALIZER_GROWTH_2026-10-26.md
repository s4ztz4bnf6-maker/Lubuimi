# Exact realization-size obstruction: the constant valuation word 3^N

Date: 2026-10-26

## Result

For the accelerated Syracuse map
[
T(n)=rac{3n+1}{2^{v_2(3n+1)}},
]
consider the finite valuation word (a_0=cdots=a_{N-1}=3). The unique positive odd integer realizing this word in the first (N) steps is the least positive inverse of 5 modulo (2^{3N+1}):
[
n_N equiv 5^{-1}pmod{2^{3N+1}},qquad 1le n_N<2^{3N+1}.
]
In particular,
[
n_N=rac{t_N,2^{3N+1}+1}{5},qquad t_Nin{1,2,3,4},
]
where (t_N) is the unique member of ({1,2,3,4}) making the numerator divisible by 5. Therefore
[
n_Ngeq rac{2^{3N+1}+1}{5}.
]
This is an exact exponential lower bound for the *least positive integer realizing this prescribed finite word*, not a statement about a divergent orbit or a Collatz counterexample.

## Derivation

Let (A_0=0), (A_{k+1}=A_k+3), and (C_0=n), (C_{k+1}=3C_k+2^{A_k}). Then
[
C_N=3^N n+sum_{j=0}^{N-1}3^{N-1-j}2^{3j}
=3^N n+rac{8^N-3^N}{5}.
]
The terminal exact-valuation condition is
[
C_Nequiv 2^{3N}pmod {2^{3N+1}}.
]
Substituting the sum and multiplying by 5 gives
[
5cdot3^N n+8^N-3^Nequiv5cdot8^N
pmod {2^{3N+1}}.
]
Since (8^N=2^{3N}), every term involving (8^N) vanishes modulo (2^{3N+1}) after multiplication by 4 or 5 as appropriate; equivalently, reducing the original congruence gives
[
3^N(5n-1)equiv0pmod {2^{3N+1}}.
]
Because (3^N) is invertible modulo (2^{3N+1}), (5nequiv1pmod {2^{3N+1}}). Thus (n) is the unique residue (5^{-1}), and the least positive representative has the stated form and lower bound.

The unique residue is odd. The exact-cylinder backward argument then gives the prescribed valuation 3 at every step, so this is an actual finite accelerated-Syracuse orbit segment.

## Independent exact regression

A local Python check passed 4,925 assertions:
- the closed form and modular inverse for all (N=1,ldots,100);
- direct terminal-congruence checks for all length-six words with exponents in ({1,2,3}) and in ({1,2,3,4});
- positivity and oddness of the computed least representatives.

The regression is exact integer arithmetic. It is not a Lean compilation and does not establish a global Collatz result.

## Why this matters

The exact-cylinder theorem classifies a unique residue class for each finite word, but the least positive representative can be exponentially large in the total valuation. Consequently, a strategy that tries to turn arbitrary valuation words into small integer realizers using only finite-cylinder existence cannot close the global problem. Any useful realizer-size argument must exploit additional restrictions on the infinite orbit or on the family of words that can occur along one fixed integer.

## Prior-art boundary

The 2-adic conjugacy and valuation-word reconstruction are classical (Bernstein; Bernstein–Lagarias), as recorded by the EOC Lean Verification literature audit. This calculation is an exact special-case obstruction and a reproducible regression, not a novelty claim about the conjugacy itself.
