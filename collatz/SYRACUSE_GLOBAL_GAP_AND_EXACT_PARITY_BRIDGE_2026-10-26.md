# Syracuse global-proof gap and exact parity bridge — 2026-10-26

## Status boundary
This is a proof plan, not a claim that Collatz is proved. The accelerated odd-only map is T(n)=(3n+1)/2^v₂(3n+1) for positive odd n. The ordinary map C halves even inputs and sends odd n to (3n+1)/2. These maps must not be silently identified.

## Exact block lemma
Let n be positive odd and a=v₂(3n+1)≥1. Write n'=T(n), so 3n+1=2^a n' and n' is odd. Then C(n)=(3n+1)/2=2^(a−1)n'. The next a−1 even-halving steps yield C^[a](n)=n'. States at times 0,…,a−1 have parity word 1 followed by a−1 zeros; the terminal state at time a contributes a further 1 when prefixes encode states rather than transitions.

For a valuation word a₀,…,a_{N−1}, let A=Σaᵢ and B(aᵢ)=1 0^(aᵢ−1). The ordinary parity prefix including the final odd state is B(a₀)…B(a_{N−1})1, length A+1. The terminal bit is essential under this state-prefix convention.

## Formal theorem target
Define ValuationWord(n,a) inductively: n is positive odd; each iterate nⱼ is positive odd; aⱼ≥1; 2^aⱼ divides 3nⱼ+1 but 2^(aⱼ+1) does not; and nⱼ₊₁=(3nⱼ+1)/2^aⱼ.

Prove the exact equivalence, matching the pinned library's parity-prefix convention: ValuationWord(n,a) iff ParityPrefix(C,n,A+1)=concatⱼ(1 0^(aⱼ−1)) ++ [1]. The reverse direction must use the next parity bit to establish exact valuation, not merely divisibility by 2^a. Formalize by induction on the list, not finite enumeration.

Then instantiate the ordinary-map unique-residue theorem at exponent A+1. This gives a unique residue class modulo 2^(A+1) for that ordinary parity word. Transfer the result to valuation words only after the coding equivalence is proved. Handle N=0 explicitly: A=0 and the parity word is [1] under this convention. Check the upstream definition before fixing the Lean statement.

## The true global gap
This bridge is a coding theorem, not a termination proof. A global proof still needs to show every positive odd seed reaches 1 under T, or derive a contradiction from a nonterminating orbit. Unique residue cylinders and finite checks do not yield a uniform descent bound across every cylinder.

A clear sufficient target is: for every odd n>1, there exists k≥1 with T^[k](n)<n. Strong induction would then give termination. This target is not established here. Average drift, density-one descent, and finite verification cannot replace its universal quantifier.

## Independent verification checklist
1. Freeze exact source revision and Lean/Mathlib versions.
2. Compile the bridge and audit its dependency closure; no sorry, admit, custom axioms, or native_decide as a substitute for the general theorem.
3. Compare prefix indexing with the upstream definition.
4. Run small-word and small-seed regressions, labelled as tests rather than proof.
5. Keep global descent separate from the checked coding lemma.

## References
- Pinned parity/residue source: https://github.com/neljaouh/uniform-syracuse-atoms-lean/blob/17e43a340f22ccc0cbd7063a0862a93f72373979/Erdos1135/Terras/Parity/Residue.lean
- Formal Collatz literature and limitations: https://github.com/msharpe248/collatz
- Computational verification to 2^71 (finite evidence only): https://pcbarina.fit.vut.cz/
