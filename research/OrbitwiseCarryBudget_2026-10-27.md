# Orbitwise carry-budget program (research extension)

Date: 2026-10-27
Status: new research specification; no theorem or Lean compilation claimed.

## A. Replace "entropy causes descent" with a falsifiable invariant

For an odd Syracuse orbit, let
\[
n_{i+1}=(3n_i+1)/2^{k_i},\quad k_i=v_2(3n_i+1),\quad A_N=\sum_{i<N}k_i.
\]
Define the valuation surplus
\[
D_N=A_N-N\log_2 3-\sum_{i<N}\log_2(1+1/(3n_i)).
\]
The exact logarithmic identity gives D_N=log₂(n₀/n_N). Thus D_N>0 is exactly block descent, not merely a heuristic. It is not yet a Lyapunov proof: it repackages the desired conclusion. The research target is a lower bound for A_N uniform over every admissible orbit segment, strong enough to dominate the correction term.

## B. A finite-state object that can actually be checked

For a word w=(k₀,...,kₙ₋₁), put A(w)=sum kᵢ. Define its admissible residue set
R(w) = {n mod 2^(A(w)+1): n odd and the first N exact valuations equal w}.
Do not assume |R(w)|=1: establish the exact modulus and cardinality by induction from the inverse affine maps. This is the first falsifiable lemma. If the expected singleton-cylinder claim fails under the chosen modulus convention, refine the modulus rather than conceal the failure.

Construct a finite prefix tree by splitting each admissible residue cylinder according to the next valuation. Each edge labelled r costs r bits and has density 2^-r in the odd residue space. The tree is a deterministic arithmetic object, not a random-orbit model.

## C. The new proposed invariant: carry debt

For a concrete prefix, retain the triple (A_N, C_N, r_N), where
C_N = sum_{j<N} 3^(N-1-j) 2^(A_j)
and r_N is the exact residue cylinder. A candidate carry debt is the gap between the accumulated valuation budget A_N and threshold
Theta_N = N log₂ 3 + sum_{i<N} log₂(1+1/(3n_i)).
Positive debt means descent; negative debt means growth over that block. The new mathematical task is not naming this quantity but deriving a deterministic restriction on how long an admissible branch can remain below zero debt.

Potential route: prove a prefix-extension inequality that bounds the number of consecutive low-valuation edges compatible with one starting residue, using the exact affine recurrence and modular carry constraints. If no such uniform bound exists, search for a counterexample to the proposed bound before pursuing it.

## D. Exact tests and stopping rules

1. Exhaustively enumerate short valuation words and compute R(w) exactly with integers; use this only to discover/correct the modulus conjecture.
2. Prove the residue-cylinder lemma in Lean, without sorry, then check its transitive axioms.
3. Prove the block identity in naturals/integers first; logarithms are a later corollary.
4. Search for a uniform branch constraint, not a frequency statement.
5. If a proposed inequality is refuted by a finite word, record the counterexample and revise the conjecture.

A density statement, even a Lean-verified one, does not prove that every individual orbit descends. Divergence to infinity is only one possible nonterminating behavior; a nontrivial cycle would also refute the Collatz conjecture without diverging.
