# Mod-8 descent frontier and the p-adic continuity caveat

Date: 2026-10-25  
Branch: `research/mod8-descent-frontier-2026-10-25`  
Base: `219b84edf1f27195cb7270dae5f20b64216e298a`  
Status: exact local arithmetic analysis; this note does **not** claim a proof of the Collatz conjecture.

## 1. Exact local classification

For an odd positive integer (n), write the accelerated Syracuse step as
[
3n+1=2^a n',qquad a=v_2(3n+1),qquad n'	ext{ odd}.
]
The existing Lean lemma `complete_odd_residue_correction_partition` partitions the four odd residue classes modulo (8):
- (n\equiv 3,7\pmod 8\Rightarrow a=1);
- (n\equiv 1\pmod 8\Rightarrow a=2);
- (n\equiv 5\pmod 8\Rightarrow a\ge 3).

The exact descent criterion is
[
n'<n\iff 3n+1<2^a n\iff (2^a-3)n>1.
]
Consequently:
- If (n\equiv5\pmod8), then (a\ge3), so (n'<n).
- If (n\equiv1\pmod8), then (a=2), and (n'<n) for every (n>1); (n=1) is the fixed point.
- If (n\equiv3,7\pmod8), then (a=1), and (n'>n) for every positive odd (n).

This sharpens the interpretation of the mod-8 partition: it is not merely a valuation classification; it exactly identifies the local descent and ascent regimes. The result is local and does not guarantee that an arbitrary orbit ever enters a descent class often enough to force global convergence.

## 2. A safe global bookkeeping interface

For a genuine accelerated orbit (n_0,n_1,\ldots,n_N), let (a_j=v_2(3n_j+1)\ge1), (A_N=\sum_{j<N}a_j), and
[
C_N=\sum_{j<N}3^{N-1-j}2^{A_j},\qquad A_0=0.
]
Then
[
2^{A_N}n_N=3^Nn_0+C_N.
]
A block descends exactly when
[
C_N<(2^{A_N}-3^N)n_0.
]
This identity prevents a common circular step: an estimate for (C_N) must be independently proved and must be strong enough to establish the strict margin. A lower bound on (C_N), or an average heuristic for (A_N), does not provide that upper-margin inequality.

The next formal target should be a *trajectory-certified block lemma*: its inputs must certify that each transition is genuine (including the maximality of each 2-adic valuation), not merely supply an arbitrary list of positive exponents. Separate:
1. the affine identity;
2. admissibility/realizability of a finite valuation word;
3. the descent-margin estimate for that realized word.

## 3. Why the proposed 2-adic embedding is not yet a proof strategy

The accelerated map on odd positive integers does not automatically extend to a globally continuous self-map of all (\mathbb Z_2). The valuation (v_2(3x+1)) is unbounded near the 2-adic root (x=-1/3); division by (2^{v_2(3x+1)}) therefore does not yield a continuous extension by simply reusing the integer formula at every 2-adic point. Any proposed extension must specify its domain and prove continuity where claimed.

Even if a useful 2-adic dynamical system is constructed, convergence in the 2-adic metric is not the same as decreasing in the ordinary order on positive integers. Compactness alone supplies neither a global integer descent nor exclusion of nontrivial cycles. The viable use of 2-adics here is more modest: encode finite valuation cylinders and congruence constraints, prove which valuation words are realizable, then transfer a certified arithmetic inequality back to the integer orbit.

## 4. Acceptance gates

- Compile the Lean declaration and inspect its transitive `#print axioms` output.
- Prove the descent criterion above as a standalone Lean theorem with the (n=1) edge case explicit.
- Keep finite-word experiments as conjecture discovery only until realizability and the margin are proved.
- Do not report a universal convergence result unless the global margin bottleneck is closed without an equivalent hidden hypothesis.

## 5. Relation to the four-pillar research plan

The algebraic/cocycle representation is the affine identity; the discrete-to-2-adic step is a tool for cylinder structure, not a promise of smooth global flow; Lean checks the encoded theorem but not whether an unstated premise is the desired conclusion; no physical experiment is relevant to this purely arithmetic conjecture. The four pillars are useful only when each bridge has a mathematically justified interface.
