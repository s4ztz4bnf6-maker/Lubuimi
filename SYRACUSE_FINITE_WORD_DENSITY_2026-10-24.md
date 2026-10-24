# Exact finite-word density and the valuation-cylinder partition (2026-10-24)

## Status
This is a mathematical consequence of the finite-word cylinder derivation. It is not yet a Lean-checked theorem and it is not a proof of Collatz termination.

## Cylinder theorem
Fix a finite word of positive exponents a_0,...,a_(N-1). Put
A_0=C_0=0, A_(i+1)=A_i+a_i, C_(i+1)=3C_i+2^(A_i).
Its exact Syracuse valuation cylinder is the unique residue class
3^N n+C_N ≡ 2^(A_N) (mod 2^(A_N+1)).
The class is odd and has modulus 2^(A_N+1).

## New consequence: exact natural density
Among all integers, this cylinder has natural density 2^(-(A_N+1)).
Among odd integers, whose natural density is 1/2, its relative density is therefore
2^(-A_N)=2^(-(a_0+...+a_(N-1))).

This follows exactly from the unique residue class modulo the power of two. For a fixed number N of accelerated odd steps, distinct exact valuation words define disjoint cylinders. Every odd positive integer has one and only one word of length N. Their densities sum to one:
sum_(a_0,...,a_(N-1)>=1) 2^(-(a_0+...+a_(N-1)))
= (sum_(a>=1)2^(-a))^N = 1.

Consequently, under natural density on odd starting integers, any fixed finite prefix has the exact product law
Pr(a_0=b_0,...,a_(N-1)=b_(N-1)) = product_i 2^(-b_i).
Equivalently, the finite-dimensional valuation law is that of independent geometric random variables with Pr(a=k)=2^(-k), k>=1. This is a statement about natural densities of finite prefixes, not a probability measure on an individual infinite orbit and not a proof that every orbit terminates.

## Why this helps, and where it stops
The density-weighted mean of each exponent is sum_(k>=1) k*2^(-k)=2. The suggested mean logarithmic multiplier is therefore
log(3)-2log(2)=log(3/4)<0.
This makes the usual heuristic precise at finite depth. It is still not a global Collatz proof: finite-cylinder frequencies do not exclude exceptional starting values, zero-density infinite trajectories, or rare long blocks whose offsets defeat an average argument. The proof obligation is to turn finite-cylinder frequencies into a uniform, trajectory-wise descent statement, or identify an obstruction to such a strengthening.

## Lean formalization plan
1. Encode a word as a List of natural numbers with every entry positive.
2. Define its accumulated exponent, canonical offset, and terminal residue.
3. Prove the terminal congruence is equivalent to all exact prefix transitions.
4. Prove uniqueness of the residue class using invertibility of 3^N modulo 2^(A_N+1).
5. Prove two distinct words of equal length have disjoint exact cylinders.
6. Formalize natural density carefully: first finite truncations, then the density statement.
7. Keep the finite-cylinder theorem, natural-density theorem, and universal termination theorem as three separate statements.

## Falsification guard
Never infer from the exact finite-dimensional law that exponent sequences along every single orbit behave independently, or that almost-sure statements imply termination for every integer. These are different quantifiers.
