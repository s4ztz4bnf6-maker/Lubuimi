# Collatz audit note: external Lean-checked density results and the valuation-run bridge (2026-10-25)

## External baseline inspected
ProofAtlas publicly describes two Lean-checked results that are relevant as comparison baselines, not as solutions of the full conjecture:
- A Terras-style finite-cutoff bound: for N >= 15,552, the proportion of n < N with no accelerated iterate below n within k <= log n accelerated steps is at most 10,000,000 * N^(-1/100).
- A natural-density-one theorem: for thresholds tending to infinity, density-one sets of starts descend below the threshold within explicit logarithmic clocks (145 Syracuse steps among odd starts, and 436 raw steps among positive starts).
The published scope explicitly allows a density-zero exceptional set and does not claim every orbit reaches 1. The exact Lean statement, source pin, axiom profile, and imported dependencies must be independently checked before importing these results as project dependencies.

## Exact density of a valuation-one run
For odd positive n, the first k accelerated Syracuse valuations are all one exactly when n = -1 modulo 2^(k+1). Among odd residue classes modulo 2^(k+1), there are 2^k classes and exactly one such class. Therefore the relative density among odd integers of starts with at least k consecutive valuation-one steps is exactly 2^(-k). This is an exact cylinder-counting identity, not an asymptotic heuristic.

### Proof of the count
The odd residue classes modulo 2^(k+1) are 1,3,...,2^(k+1)-1, so there are 2^k of them. The congruence class -1 modulo 2^(k+1) is odd and unique. Each residue class has natural density 1/2^(k+1) among all integers and relative density 1/2^k among odd integers. Thus the conditional density is 1/2^k.

## Potential bridge, and the exact gap
The density theorem and this cylinder lemma can be used to split an odd-start population by initial valuation-one run length before applying a quantitative stopping-time argument. The cylinder tail is geometric and exact. However, controlling the first run does not control later valuation blocks: after the first non-one valuation, new residue constraints depend on the evolving affine offset. A valid global-density argument must account for the full sequence of parity/valuation words and their exact residue-class counts.

## Concrete next experiment
1. Extract the external result's exact Lean theorem, all imports, source commit, build command, and transitive axioms from its evidence record.
2. Re-prove the valuation-one cylinder count locally in this repository, without assuming the density theorem.
3. Define disjoint strata by the exact initial run length L=v2(n+1)-1 and calculate their finite-cutoff counts with explicit floor/remainder errors.
4. Compare that stratification against the existing parity-word/binomial-tail route. Retain it only if it improves a proved constant or yields a sharper exceptional-set bound.
5. Keep the universal Collatz conjecture separate: any density-zero exceptional set remains a real logical gap.

## Sources reviewed
- ProofAtlas, “Power-Saving Bound for Logarithmic-Time Collatz Descent”: https://www.proofatlas.ai/formalizations/terras-log-time-power-saving/
- ProofAtlas, “Natural-Density Collatz Descent in Logarithmic Time”: https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/
- Tao/Hales, “What mathematicians should know about the Lean Theorem Prover: questions of reliability and AI” (2026-10-09): https://terrytao.wordpress.com/2026/10/09/what-mathematicians-should-know-about-the-lean-theorem-proverquestions-of-reliability-and-ai/

## Audit caveat
A successful Lean build checks the exact formal proposition relative to the trust base and imports. It does not establish that the proposition is the intended conjecture unless statement fidelity is separately audited, and it does not convert density-one conclusions into a theorem about every positive integer.