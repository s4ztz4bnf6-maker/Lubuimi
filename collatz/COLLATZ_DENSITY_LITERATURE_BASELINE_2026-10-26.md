# Syracuse / Collatz: literature baseline and exact scope boundaries — 2026-10-26

## Why this note exists
The goal is the universal Collatz conjecture, not another density-one theorem. Existing formalized results should be used as baselines, while their exact quantifiers and density notions remain distinct.

## Public ProofAtlas results relevant to the project
The following public pages report formalized results, with their own stated verification scope:

1. **Natural-density logarithmic-time descent**:
   https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/
   The page reports odd-relative-density-one Syracuse descent within 145 log N steps for odd starts and ordinary-natural-density-one raw Collatz descent within 436 log N steps for positive starts, under the page's threshold hypotheses.

2. **Explicit positive-density convergence**:
   https://www.proofatlas.ai/formalizations/positive-density-log-time-collatz/
   The page reports a fixed positive lower-density bound for starts reaching 1 within 10.46 ln n raw Collatz steps, with a fixed explicit cutoff. The page explicitly says this does not solve the full conjecture and that the numerical range is not practically small. The main page marks the formalization as Lean-checked while independent paper-to-statement alignment and acceptance review remain pending.

3. **Tao's logarithmic-density almost-bounded orbits**:
   https://www.proofatlas.ai/formalizations/tao-almost-bounded-orbits/
   The page states that for every diverging threshold f, logarithmically almost every positive start has an orbit minimum below f(N). This is logarithmic density, not natural density; it does not imply ReachesOne or universal convergence.

4. **Power-saving logarithmic-time descent bound**:
   The current ProofAtlas catalog reports a bound of at most 10,000,000·N^(-1/100) on the proportion of starts below N that do not fall below their start within k≤log n accelerated steps, for N≥15,552. This is a quantitative exceptional-set bound for a short descent event, not a proof that every individual orbit converges.

5. **Positive-density results beyond a fixed logarithmic coefficient**:
   A September 2026 preprint by Idris Ali Shaik claims positive-density convergence for every fixed coefficient c>3/log(4/3), and says a qualitative core is formalized in Lean while coefficient-size comparisons and complete optimized density bounds remain paper proofs. Treat this as a recent preprint, not as a fully kernel-verified end-to-end theorem. Before using it, inspect the paper's exact theorem, assumptions, and source revision.

These are literature baselines to inspect and pin, not results independently rechecked in this note. Before importing any theorem into our project, archive the exact Lean declaration, source revision, Lean/mathlib versions, dependency closure, build/check evidence, and an independent statement-fidelity comparison.

## New leads on valuation cylinders and pointwise descent
The 2026 literature search surfaced several very recent papers/preprints that use vocabulary close to our current program. They are leads for an audit, not accepted theorems in this repository:

- Seyma Yaman Kayadibi, *Canonical Shells and Valuation-Cylinder Covers for Delayed First Descent in Accelerated Odd Collatz Dynamics* (SSRN, July 2026), DOI 10.2139/ssrn.7564459. Its abstract describes exact residue cylinders, canonical size shells, and a finite audit up to 10^7. Crucially, it says universal closure of the cylinder trees is equivalent to universal first descent; that equivalence reformulates the open global step rather than proving its unbounded closure. This is directly relevant to how we should state our own stopping point.
- Miguel Cerdá Bennassar, *Structural reduction of the Collatz conjecture: segments, portals and 2-adic survival sets*, Zenodo preprint series, including version 1.2 of Part VI (DOI 10.5281/zenodo.18879225). The record claims a reduction to a remaining question about mixed orbit classes and unbounded growth. It is a preprint, not an established resolution; the exact reduction and its assumptions must be checked line by line before reuse.
- Other 2026 SSRN papers claim exact valuation residual bounds and cylinder-counting results. They should be evaluated by extracting the precise theorem, checking every quantifier, and looking for whether the claimed global conclusion is only equivalent to the Collatz conjecture or is actually proved.

Audit protocol for these leads:
1. Download and pin the exact version; do not cite an abstract as proof.
2. Identify the exact map (raw, accelerated, or odd-only), state space, and time convention.
3. Re-derive the finite affine identity independently and test the first nontrivial lengths N=1,2.
4. Separate finite shell coverage from a theorem that closes all shells uniformly for unbounded N.
5. Search for the exact pointwise quantifier: does the result prove a descent block for every n>1, or only for almost all n, a positive-density set, or a bounded range?
6. If the last step is merely shown equivalent to universal descent, record it as the remaining open obligation, not as a solution.

## Quantifier and density audit
Do not conflate:
- positive lower natural density of starts reaching 1;
- natural-density-one descent within a specified time bound;
- logarithmic-density-one orbit minima below a diverging threshold;
- a power-saving upper bound on a finite-scale exceptional fraction;
- a finite verification through a cutoff;
- every positive integer eventually reaching 1.

The first five can hold while a zero-density exceptional set remains. Universal Collatz requires eliminating every possible exceptional positive integer, not merely showing that the exceptional set has density zero. A quantitative density bound may shrink the exceptional set at finite scales, but unless it gives a pointwise bound for every input, it still leaves the universal problem open.

## New integration target: exact drift with additive correction
The companion note now records the exact identity for a realized word a₀,…,a_{N−1}, A=Σaᵢ, pⱼ=Σ_{i<j}aᵢ and C=Σ3^(N−1−j)2^(pⱼ):

    n_N = (3^N n₀ + C)/2^A
    log(n_N/n₀) = N log 3 − A log 2 + log(1 + C/(3^N n₀)).

Thus a block descends in ordinary size exactly when
`A log 2 > N log 3 + log(1+C/(3^N n₀))`.
The positive additive correction is why the average valuation condition `A/N>log₂(3)` alone does not prove descent. From aᵢ≥1 we also have the exact bound `C ≤ 2^(A−N)(3^N−2^N)`, but it still depends on A and n₀ and does not supply the missing uniform pointwise inequality. The next proof target is to control this correction and the cumulative valuation excess for every orbit that has not descended, not merely for a density-one family.

The exact cycle condition is `(2^A-3^N)n₀ = C > 0`, hence `2^A>3^N`. For a proposed word, also require `(2^A-3^N) | C` and verify every actual valuation. This is a finite necessary-condition filter, not a sufficient cycle construction and not a global descent proof.

## Formal reliability update
The Lean FRO's August 2026 kernel-bug postmortems document more than one layer of failure: a genuine official-kernel soundness bug accepted a bogus Collatz disproof, and an independent checker had an unrelated bug that allowed that particular forged proof to pass. Later kernel-bug-hunt reporting says further kernel/runtime issues were found and describes plans for exported-proof rechecking and multiple checker backends. Therefore:
- A successful `lake build` is not by itself an adversarial-proof audit.
- `#print axioms` cannot expose a runtime/kernel exploit; a bogus proof can report no axioms.
- An independent checker helps only if its version is current and its implementation is sufficiently independent; record its version and known defects.
- Pin a patched Lean release and mathlib commit, and if adversarial or supply-chain robustness is in scope, export and recheck the proof with a current external checker. Do not assume the project's old Lean 4.28.0 pin is an adequate security baseline merely because ordinary CI passes.
- A kernel audit establishes trust in the proof artifact's type-checking pipeline; it does not establish that the formal proposition matches the intended Collatz conjecture. Statement fidelity remains a separate human review.

Official background:
https://leodemoura.github.io/blog/2026-8-1-postmortem-for-kernel-soundness-bug-14576/
https://leodemoura.github.io/blog/2026-8-24-postmortem-for-the-kernel-soundness-bug-hunt/
https://lean-lang.org/doc/reference/latest/releases/v4.32.2/

## Formal integrity protocol
- Use no `sorry`, `admit`, or unapproved axioms in our own theorem declarations.
- Run `#print axioms` transitively on exported theorems.
- Keep the exact standard raw Collatz map, accelerated map, and odd-only Syracuse map separate.
- Pin source commits and dependency versions; report only checks actually run.
- Treat a formal artifact as evidence for precisely its declared proposition, after a human statement-fidelity audit.
- Independent kernels/checkers improve assurance but do not establish infallibility; their versions and known defects must also be recorded.

## Source context
The recent discussion of Lean reliability stresses both kernel checking and human statement fidelity, and documents that cross-kernel checking alone did not catch every soundness issue:
https://terrytao.wordpress.com/2026/10/09/what-mathematicians-should-know-about-the-lean-theorem-proverquestions-of-reliability-and-ai/

AI-assisted Erdős breakthroughs also illustrate that changing representations and actively searching for counterexamples can be more productive than brute force, but results still require human mathematical interpretation and precise verification:
https://www.quantamagazine.org/why-the-legendary-erdos-problems-are-falling-to-ai-20260803/
https://maa.org/math-values/ai-solves-an-80-year-old-erdos-problem/
