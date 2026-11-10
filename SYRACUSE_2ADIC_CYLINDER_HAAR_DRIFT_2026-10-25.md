# Syracuse finite-word cylinders and Haar drift: audit note (2026-10-25)

## Scope

This is a mathematical roadmap, not a claimed proof of the Collatz conjecture. It separates an exact finite-prefix statement in the 2-adic space from the much harder statement about positive integer orbits.

## Exact cylinder mass

Let a finite accelerated-odd exponent word w=(a_0,...,a_{N-1}) have each a_i >= 1, and let A_N=sum_{i<N} a_i. The one-step condition for exact exponent a is

3n+1 ≡ 2^a (mod 2^(a+1)).

Since 3 is invertible modulo every power of 2, the recursive exact-prefix conditions determine one residue class modulo 2^(A_N+1), provided the induction step is carried out with the current affine prefix identity. In the odd 2-adic integers, there are 2^(A_N) odd residue classes modulo 2^(A_N+1). Thus the cylinder for a fixed word has normalized Haar measure

mu([w]) = 2^(-A_N) = product_{i<N} 2^(-a_i).

This formula should be formalized by induction rather than treated as a consequence of the affine identity alone. The induction must establish existence and uniqueness of the next lifted residue class at each exact valuation.

## Consequence: a Bernoulli coding of the 2-adic odd map

If the cylinder partition and its lifting lemma are proved, the exponent coordinates under normalized Haar measure on odd 2-adic integers have the geometric cylinder law

Pr(a_0=k_0,...,a_{N-1}=k_{N-1}) = product_{i<N} 2^(-k_i), for k_i >= 1.

Hence each coordinate has distribution Pr(a=k)=2^(-k), and mean E[a]=sum_{k>=1} k 2^(-k)=2. The heuristic logarithmic multiplier for the accelerated map is therefore log(3) - E[a] log(2) = log(3/4) < 0.

## Crucial limitation

This is a Haar-almost-everywhere / random-2-adic statement, not a proof of integer Collatz termination. The positive integers form a countable, Haar-null subset of Z_2; a measure-one result does not control every natural-number orbit. Nor does a negative average logarithmic multiplier imply a pointwise descent inequality for every orbit.

## Formalization targets

1. Prove the exact one-step valuation criterion as a modular equivalence.
2. Prove the prefix-cylinder lift and its uniqueness for every finite word.
3. Prove disjointness and exhaustiveness of the finite-word cylinder partition at fixed cumulative depth.
4. Derive the cylinder measure formula from counting odd residue classes.
5. Keep all almost-everywhere conclusions explicitly separate from integer-orbit descent.

The existing affine-offset identity remains the bridge to integer descent: 2^(A_N) n_N = 3^N n_0 + C_N. The unresolved global task is still to control the signed offset margin for every positive integer orbit, not merely for Haar-typical 2-adic points.
