# Syracuse research continuation — evidence triage (2026-10-26)

## New source-level finding

ProofAtlas publishes a Lean-checked power-saving bound for logarithmic-time accelerated Collatz descent. The exact public claim is:

For every natural N >= 15552, the proportion of n < N for which no accelerated iterate T^[k](n) < n occurs with k <= log n is at most 10^7 N^(-1/100).

Pinned evidence record:
https://www.proofatlas.ai/proofs/artifact.known-terras-log-time-power.bound.v001.html
Source commit recorded there: 379cf63bbe657fd0cb5d824e7785d747fd0fc946; Lean toolchain leanprover/lean4:v4.30.0-rc2; recorded build passed, no unfinished proof steps, standard axiom profile Classical.choice, Quot.sound, propext.

## Exact scope / non-implication

This is a finite-cutoff counting estimate. It does NOT establish that every positive integer descends, reaches 1, or that the exceptional set is empty. Its bound may exceed 1 at moderate N. It is not the same map convention as the accelerated odd-only Syracuse map: the displayed ProofAtlas map is n/2 for even n and (3n+1)/2 for odd n.

## Best next bridge for our project

Do not re-prove parity-prefix/residue uniqueness. Reuse the pinned Terras parity-word infrastructure and prove a source-faithful translation lemma from odd-only exact valuations a_j = v2(3n_j+1) to ordinary accelerated parity blocks (1,0^(a_j-1)). For N odd-only steps, the expanded word has length A_N+1 with A_N = sum a_j, including terminal parity. State explicitly positive odd inputs, exact valuation hypotheses, and endpoint convention.

A second, distinct ProofAtlas page advertises a positive-fraction reach-1 result within 10.46 ln(n) ordinary Collatz steps, but its independent paper-to-statement alignment / acceptance review is listed as pending. Treat it as a formalization candidate, not an accepted resolution of Collatz:
https://www.proofatlas.ai/

## Audit gate before claiming progress

1. Fetch exact pinned Lean source and toolchain manifest.
2. Check statement against paper and distinguish ordinary, accelerated, and odd-only maps.
3. Compile our bridge in the pinned toolchain.
4. Run transitive #print axioms and unfinished-proof scan.
5. Keep density, positive density, almost-boundedness, and universal convergence as separate propositions.

No new Lean build or CI result is claimed by this note.
