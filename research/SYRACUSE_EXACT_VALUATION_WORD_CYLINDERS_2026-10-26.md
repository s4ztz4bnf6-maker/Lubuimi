# Syracuse valuation-word cylinders

Date: 2026-10-26

## Exact finite-cylinder result
For a prescribed word of positive exponents a_1,...,a_L with total K=sum a_i, the positive odd starting values realizing that exact accelerated Syracuse valuation word form either the empty set or one residue class modulo 2^(K+1), restricted to positive odd inputs.

## Proof idea
For one step, v_2(3n+1)=a is equivalent to 3n+1 == 2^a mod 2^(a+1). Since 3 is invertible modulo powers of 2, this fixes one odd residue class modulo 2^(a+1). At each subsequent step, the affine map on a fixed exponent-a branch sends n to (3n+1)/2^a; changing n by 2^(a+b+1) changes this output by 3*2^(b+1), preserving the next condition modulo 2^(b+1). The lift is unique because multiplication by 3 is invertible modulo powers of 2. Iterating gives a unique class modulo 2^(K+1), unless the constraints are inconsistent, in which case the cylinder is empty.

## Scope
This is a finite symbolic-cylinder result only. It does not imply that every abstract word is realized by a positive orbit, and it does not prove convergence to 1. Intermediate positivity and exact valuation conditions remain explicit obligations.

## Formalization target
Prove the statement in Lean for finite lists of positive exponents, with the domain and exact valuation definitions fixed. Then test an independent enumerator against the residue class prediction. No Lean build or regression is claimed here.
