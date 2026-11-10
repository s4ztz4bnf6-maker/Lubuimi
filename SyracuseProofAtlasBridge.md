# External route audit: Collatz density results and the universal gap

Date: 2026-10-26

## Scope boundary

This note records an external comparison, not a proof of the Collatz conjecture. The universal target remains: every positive starting value reaches 1 (or, in the accelerated odd formulation, every odd positive orbit eventually reaches 1). A theorem about density-one starts does not imply this because the exceptional set may contain individual integers.

## Stronger existing density routes to reuse, not rediscover

1. Tao's almost-bounded-orbit theorem states that for every real threshold f(N) tending to infinity, the set of starts whose ordinary Collatz orbit minimum is below f(N) has logarithmic density one. It does not assert natural density one, convergence to 1, or a universal result. ProofAtlas exposes the exact Lean wrapper and a long checked dependency chain:
   https://www.proofatlas.ai/formalizations/tao-almost-bounded-orbits/
2. Lech Mazur's ProofAtlas formalization reports a stronger *different* endpoint: natural-density-one many positive starts have a raw Collatz iterate below any diverging threshold within 436 log N raw steps; the odd Syracuse variant uses 145 log N odd-to-odd steps. Its own stated scope explicitly excludes full Collatz and allows a density-zero exceptional set:
   https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/
3. These results are relevant to our cylinder/Chernoff branch because they provide a tested benchmark for density and time bounds. They are not a bridge to the universal theorem.

## Exact bridge still missing

Our finite valuation cylinders have relative odd density 2^{-A_N}; finite valuation words are realizable. The elementary Chernoff calculation shows that the set of starts that fail the threshold at every horizon has density zero, but not that it is empty.

The affine identity is
[
2^{A_N} n_N = 3^N n_0 + C_N,qquad
C_N=\sum_{j<N}3^{N-1-j}2^{A_j}.
]
For a fixed starting value, an infinite bad valuation sequence must satisfy this exact identity at every N, plus all the congruence/valuation constraints. A universal proof must exploit *compatibility across all horizons for one fixed integer*, not just a finite-word probability bound.

## New work target: arithmetic survivor-set filtration

Define
[
E_N(X)=\{n\le X: n\text{ odd and }5A_j(n)<9j\text{ for every }1\le j\le N\}.
]
The existing density argument bounds the infinite exceptional set by every finite-horizon bad set, but the missing result is a deterministic emptiness theorem, or a uniform bound that forces every fixed n out of E_N as N grows.

A precise research programme:
- Define a finite residue-cylinder representation of E_N using the exact valuation-word congruences.
- Track both the cylinder modulus 2^{A_N+1} and its least positive representative r_N.
- Seek an arithmetic lower bound on r_N for *all-prefix-bad* words that contradicts r_N=n once 2^{A_N+1}>n; do not assume such a bound exists.
- Alternatively, use the affine correction C_N and exact divisibility to prove that no single fixed n can lie in every E_N.
- First test the statement against exhaustive exact arithmetic for small N and all odd residues; computations can falsify a proposed lemma but cannot establish the infinite theorem.

## Formal integrity gate

The CI failure on 2026-10-26 exposed a failed proof step in `no_threshold_crossing_gives_bad_prefix`; this must not be accepted as a proof merely because the intended implication is elementary. The corrected source explicitly names the negated hypothesis before arithmetic automation. The next Actions run must be checked before treating the fix as compiled.

The audit must keep:
- no `sorry` or `sorryAx`;
- `#print axioms` output for exact declarations;
- statement fidelity between raw Collatz and accelerated Syracuse time;
- explicit distinction between natural density, logarithmic density, and universal convergence.

## Reliability implications

Thomas Hales' October 2026 discussion of Lean reliability emphasizes that kernel checking and statement-fidelity auditing are separate requirements, and that independent kernels can share defects. For this project, add an independent replay / second-kernel check only after the theorem statement and dependency closure are pinned; never describe a normal CI build as a complete soundness audit.
