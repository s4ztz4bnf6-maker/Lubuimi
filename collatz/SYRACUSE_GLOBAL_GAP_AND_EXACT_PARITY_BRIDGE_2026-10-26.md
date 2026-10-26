# Syracuse global-proof gap and exact parity bridge — 2026-10-26

## Status boundary and map conventions

This is a proof plan, not a claim that Collatz is proved. Three maps must be kept distinct:

- Raw Collatz R(n): n/2 if n is even, and 3n+1 if n is odd.
- Accelerated one-step map D(n): n/2 if n is even, and (3n+1)/2 if n is odd. This is the map called accelerated in the pinned Lean source `Erdos1135.Terras.Parity.Word`.
- Odd-only Syracuse map T(n)=(3n+1)/2^v₂(3n+1), for positive odd n.

The parityPrefix in the cited Lean source is for D, not directly for the raw map R and not directly for T. A previous informal description that called D the ordinary raw Collatz map was imprecise; this note fixes that terminology.

## Exact block lemma

Let n be positive odd and a=v₂(3n+1)≥1. Write n'=T(n), so 3n+1=2^a n' and n' is odd. Then D(n)=(3n+1)/2=2^(a−1)n'. The next a−1 even-halving steps yield D^[a](n)=n'. The states at times 0,…,a−1 have parity word 1 followed by a−1 zeros; the terminal state at time a contributes a further 1 when the prefix records states rather than transitions.

For a valuation word a₀,…,a_{N−1}, let A=Σaᵢ and B(aᵢ)=1 0^(aᵢ−1). The D-parity prefix including the final odd state is B(a₀)…B(a_{N−1})1, length A+1. The terminal bit is essential under this state-prefix convention. Conversion between D-time and raw R-time must separately count two raw steps for each odd D-step and one raw step for each even D-step.

## Source-level facts verified

The pinned source `Erdos1135/Terras/Parity/Word.lean` defines:
- `accelerated n` as the map whose odd branch is (3*n+1)/2 and even branch is n/2 (through `acceleratedBranchStep`);
- `parityPrefix k n` as the parity of `accelerated^[i] n` for indices i<k;
- `ParityWord k` as a length-indexed bit vector.

The pinned `Residue.lean` proves `same_parityPrefix_iff_modEq_pow_two` and `unique_residue_for_word`: every length-k D-parity word corresponds to a unique residue class modulo 2^k. This is a residue-cylinder theorem for D. It is not by itself a theorem of termination for T or R.

Pinned sources:
- https://github.com/neljaouh/uniform-syracuse-atoms-lean/blob/17e43a340f22ccc0cbd7063a0862a93f72373979/Erdos1135/Terras/Parity/Word.lean
- https://github.com/neljaouh/uniform-syracuse-atoms-lean/blob/17e43a340f22ccc0cbd7063a0862a93f72373979/Erdos1135/Terras/Parity/Residue.lean

## Formal theorem target

Define ValuationWord(n,a) inductively: n is positive odd; each iterate nⱼ is positive odd; aⱼ≥1; 2^aⱼ divides 3nⱼ+1 but 2^(aⱼ+1) does not; and nⱼ₊₁=(3nⱼ+1)/2^aⱼ.

Prove the exact equivalence, matching the pinned source's parityPrefix convention:
ValuationWord(n,a) iff parityPrefix (A+1) n = concatⱼ(1 0^(aⱼ−1)) ++ [1].
The reverse direction must use the next parity bit to establish exact valuation, not merely divisibility by 2^a. Formalize by induction on the list, not finite enumeration. The proof must explicitly relate the iterate of D after each block to the next T-iterate.

Then instantiate `unique_residue_for_word` at exponent A+1. This gives a unique residue class modulo 2^(A+1) for the D-parity word. Transfer the result to valuation words only after the coding equivalence is proved. Handle N=0 explicitly: A=0 and the parity word is [1] under this convention. Check the source definition and theorem statement before fixing the Lean code.

## What current density results do and do not close

ProofAtlas reports Lean-checked results for:
- natural-density-one many starts descending below a growing threshold in logarithmic time (with separate odd-only Syracuse and raw-Collatz formulations);
- a fixed positive fraction of starts reaching 1 within 10.46 ln n raw Collatz steps.

Their own scope statements explicitly leave the full Collatz conjecture open. These results are useful for finding reusable quantitative lemmas and for testing time-conversion formulas, but a density-one or positive-density statement leaves exceptional starts and does not imply universal termination.

Sources:
- https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/
- https://www.proofatlas.ai/formalizations/positive-density-log-time-collatz/

## The true global gap

This bridge is a coding theorem, not a termination proof. A global proof still needs to show every positive odd seed reaches 1 under T, or derive a contradiction from a nonterminating orbit. Unique residue cylinders and finite checks do not yield a uniform descent bound across every cylinder.

A clear sufficient target is: for every odd n>1, there exists k≥1 with T^[k](n)<n. Strong induction would then give termination. This target is not established here. Average drift, density-one descent, and finite verification cannot replace its universal quantifier.

## Independent verification checklist

1. Freeze exact source revision and Lean/Mathlib versions.
2. Compile the bridge and audit its dependency closure; no sorry, admit, custom axioms, or native_decide as a substitute for the general theorem.
3. Compare prefix indexing with the upstream definition.
4. Run small-word and small-seed regressions, labelled as tests rather than proof.
5. Keep global descent separate from the checked coding lemma.
6. When claiming kernel-level confidence, record which kernel/checker version checked the artifact; different checkers are useful but not automatically independent if they share code or design.

## Reliability lesson

The October 2026 discussion by Thomas Hales on Terence Tao's blog stresses both statement fidelity and kernel reliability: a Lean-checked theorem must match the intended mathematical statement, and cross-checking kernels can still fail if a second checker has its own bug. Con-Leche is a valuable additional verification route, but it does not remove the need to audit the theorem statement, dependencies, build provenance, and assumptions.

Reference:
- https://terrytao.wordpress.com/2026/10/09/what-mathematicians-should-know-about-the-lean-theorem-proverquestions-of-reliability-and-ai/
