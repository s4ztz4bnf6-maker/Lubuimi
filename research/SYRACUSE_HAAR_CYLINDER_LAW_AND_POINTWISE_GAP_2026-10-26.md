# Syracuse valuation words: exact Haar cylinder law and pointwise gap

Date: 2026-10-26

## Main finite-cylinder consequence
Let T(n)=(3n+1)/2^{v_2(3n+1)} on positive odd integers. For a fixed finite word a=(a_1,...,a_L) of positive exponents and K=sum_i a_i, the set of odd 2-adic starting points whose first L valuations equal a is one residue class modulo 2^{K+1}. Its normalized Haar measure inside the odd 2-adic integers is therefore 2^{-K}.

Consequently, for any finite word, the cylinder probability factors as
  2^{-K}= product_i 2^{-a_i}.
This is the finite-dimensional law of independent geometric(1/2) valuations under normalized Haar measure on odd 2-adic inputs. This is an exact measure-theoretic statement about finite cylinders, assuming the residue-cylinder lemma is established.

## Proof architecture
1. For one step, v_2(3x+1)=a is the unique odd residue class satisfying 3x+1 == 2^a mod 2^(a+1).
2. On a fixed a-branch, T(x)=(3x+1)/2^a is affine with odd slope 3. Pulling back a target residue class modulo 2^(b+1) gives a unique residue class modulo 2^(a+b+1), because 3 is invertible modulo powers of 2.
3. Induction yields a unique residue class modulo 2^(K+1) for each finite word.
4. A residue class modulo 2^(K+1) has Haar measure 2^-(K+1) in Z_2; conditioning on odd inputs, whose measure is 1/2, gives 2^-K.

## Critical limitation
The finite-dimensional iid law under Haar measure does not imply that every positive integer orbit behaves typically, nor does it prove convergence to 1. A measure-zero exceptional set can still contain positive integers, and natural-density statements do not rule out a single exceptional start. The accelerated map is piecewise affine on valuation cylinders and is not globally continuous at every point of Z_2; no global smoothing or unique-sink conclusion is claimed.

## Falsifiable next step
Formalize the cylinder pullback lemma in Lean, including the exact domain and valuation hypotheses. Independently enumerate short words and verify that each realized word corresponds to one residue class modulo 2^(K+1). Only after the formal statement and tests agree should the Haar-law corollary be imported.

## Status
This is a proof plan with an elementary derivation. No Lean compilation or regression was run for this artifact. It is not a Collatz proof.