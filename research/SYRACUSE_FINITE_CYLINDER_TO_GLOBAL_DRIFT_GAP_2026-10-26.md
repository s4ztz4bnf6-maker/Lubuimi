# Syracuse: the precise gap from cylinder probabilities to global descent

Date: 2026-10-26

## Established finite-word structure
For each positive valuation word a=(a_1,...,a_L), the finite affine identity gives a unique odd residue class modulo 2^(K_L+1), where K_L=sum a_i. Consequently, conditional Haar measure on odd 2-adics is 2^(-K_L). This describes finite cylinders, not the long-run behavior of a fixed integer orbit.

## The invalid inference to avoid
It is invalid to infer pointwise convergence of every positive integer orbit from the product cylinder weights or from a density-one theorem. Haar measure on Z_2 and natural density on positive integers are different objects, and a null set can still contain exceptional integer orbits. Also, T(x)=(3x+1)/2^(v_2(3x+1)) is only locally affine on valuation cylinders and has no continuous extension at x=-1/3 in Z_2.

## A target lemma that would actually advance the proof
A useful next theorem must provide a deterministic, orbit-uniform descent certificate. For example, prove the existence of an explicit finite-state potential P on a rigorously defined augmented state space, and constants c>0, C>=0, such that for every positive odd n whose orbit has not entered a known terminal cycle,

P(T^m(n))-P(n) <= -c m + C

for all sufficiently long orbit segments m, with the threshold and constants independent of n. The state must encode enough valuation information to make the inequality deterministic; an i.i.d. or mixing assumption is not acceptable unless separately proved for every orbit.

This displayed inequality is a research target, not an established claim. A successful proof would imply uniform descent of the potential, but an additional theorem must connect bounded potential to bounded positive integer orbit and exclude all nonterminal cycles.

## Falsification program
1. Test every proposed local potential against all residue classes modulo 2^k for increasing k, recording the first exact counterexample.
2. Search for valuation words whose affine multiplier and additive term defeat the proposed drift bound.
3. Separate finite-state conjectures from the theorem: exhaustive finite checks can refute but cannot prove an unbounded-state claim.
4. If the candidate potential fails, minimize the counterexample by word length, total valuation, and modulus; use it to revise the state, not to hide the failure.

## Formal proof obligations
- State space and transition are total and source-faithful.
- Every transition has an exact valuation witness.
- The potential inequality is proved for every state, not sampled states.
- The integer-size or height measure is linked to P by a proved inequality.
- Terminal cycles are exhaustively classified.
- The final statement quantifies over every positive odd integer.

## Status
This note specifies the missing deterministic bridge. It does not prove the potential exists and does not claim a Collatz proof.