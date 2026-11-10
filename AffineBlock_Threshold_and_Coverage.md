# Affine block thresholds and the global coverage gap

Status: research note, not a Collatz proof.

## Exact local threshold

For a fixed exact valuation word of length k, let A=Σ_{i<k} a_i and let C be its affine offset, so 2^A n_k = 3^k n_0 + C.

Set D=2^A−3^k. If D≤0, this block cannot certify n_k<n_0 for any positive n_0, since C≥0. If D>0, strict descent is equivalent to D n_0>C. Thus this particular word has the exact integer threshold n_0 ≥ floor(C/D)+1.

This is more precise than a vague “for sufficiently large n” statement: each fixed word has its own threshold. The hard issue is whether the trajectory is guaranteed to encounter a certifying word, with a threshold and target transition that can be controlled uniformly.

## Why finite residue graphs do not automatically solve coverage

The valuation a=v₂(3n+1) is unbounded. A graph modulo a single fixed power of 2 cannot record all exact valuations as a finite set of labels without grouping infinitely many cases; such grouping must preserve the affine offset and endpoint condition. A finite graph on residue classes therefore needs a proved abstraction relation, not just a finite list of observed transitions.

A sound refinement scheme should track at least: (1) a residue-family predicate; (2) a range or symbolic class for the next valuation; (3) the exact affine coefficient and offset for the block; (4) a proof that every concrete trajectory transition is represented; and (5) a descent threshold or a proof that this block is not a descent certificate.

## New proof obligation: progress, not merely local descent

A global proof needs a ranking argument showing that every nonterminal trajectory either enters the finite core or reaches a certifying block in a bounded, controlled way. A catalogue of blocks each of which descends on its own domain is insufficient unless the domains cover all states and transitions cannot avoid descent certificates indefinitely.

This separates three claims often conflated: a word is arithmetically realizable; a word yields descent above its threshold; and every orbit must eventually realize one of the usable words. Only the first two are local. The third is a global dynamical statement and remains the central open obligation.

## Literature boundary

Tao's logarithmic-density result obtains strong descent-to-small-values information for almost all starting values via approximate transport and harmonic analysis, but it is not a universal orbit theorem. The formal project should not turn an almost-all statement into a universal-for-all-n lemma. A useful formal interface can encode local affine thresholds while leaving the universal progress theorem as a separate, explicit target.