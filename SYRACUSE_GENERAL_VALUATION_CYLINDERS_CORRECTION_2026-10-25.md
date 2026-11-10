# Correction: general Syracuse valuation cylinders

The earlier roadmap's proposed modulus `2^(1 + sum a_j)` is not generally correct for the accelerated Syracuse valuation word. This note supersedes that claim.

Let `x_0` be odd and `x_{j+1}=(3x_j+1)/2^{a_j}` with exact valuation `v₂(3x_j+1)=a_j`. The condition at step j is `3x_j+1 ≡ 2^{a_j} (mod 2^{a_j+1})`, but pulling later constraints back through the affine recurrence changes their coefficients and residues. One must prove the lifting map at every step; the modulus cannot be inferred merely by adding valuation exponents.

For a fixed finite valuation word, the correct general statement to establish is that the admissible odd starting values form either an empty set or a single residue class modulo `2^(1 + sum a_j)`, with existence and uniqueness proved by induction. This remains a conjectured lemma until formally proved. Before coding it, test small words by direct exact arithmetic and verify the induction invariant, including positivity and oddness of every intermediate accelerated state.

The all-ones word is a verified special case: the first k valuations equal one exactly when `n ≡ -1 (mod 2^(k+1))`; its relative density among odd starts is `2^-k`. This special case does not validate the arbitrary-word claim.

Audit rule: no density formula for arbitrary words may be presented as established until the general congruence-lifting lemma is proved and compiled in Lean.