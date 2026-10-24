# Literature-guided next steps: 2-adic Collatz audit

## Established literature to adapt

1. Riho Terras, “A stopping time problem on the positive integers,” *Acta Arithmetica* 30 (1976), 241–252, DOI https://doi.org/10.4064/aa-30-3-241-252. Terras encodes finite parity itineraries by residue classes modulo powers of two. This gives a finite, exact combinatorial layer before any global convergence claim.
2. Terence Tao, “Almost all orbits of the Collatz map attain almost bounded values,” *Forum of Mathematics, Pi* 10 (2022), e12, DOI https://doi.org/10.1017/fmp.2022.8. The proof studies a first-passage statistic and non-Archimedean mixing; its result concerns almost all starting values in logarithmic density, not every orbit.

## Adaptation to this Lean project

The current accelerated odd map is
\[
T(n)=(3n+1)/2^{v_2(3n+1)}.
\]

The immediate target remains a finite counting theorem, not a probabilistic global argument.

### Layer A: exact valuation

Prove and audit:
\[
v_2(m)=j \iff 2^j\mid m \land 2^{j+1}\nmid m
\quad(m>0).
\]
The existing file TwoAdicValuationDistribution.lean contains this target theorem. Its compile status must be established independently of the downstream module graph.

### Layer B: exact finite count

For \(1\le j<K\), among odd residue classes modulo \(2^K\), the condition
\(v_2(3n+1)=j\) selects exactly \(2^{K-j-1}\) classes. The proof route is:

1. Work with the finite type of odd residues modulo \(2^K\), rather than partial lists.
2. Show multiplication by \(3\) is invertible modulo \(2^r\).
3. Identify the unique residue modulo \(2^{j+1}\) satisfying divisibility by \(2^j\) but not \(2^{j+1}\).
4. Count its lifts modulo \(2^K\), taking care of the tail where \(2^K\mid 3n+1\).
5. Derive the proportion \(2^{-j}\) only after the exact count is proved.

### Layer C: finite valuation words and affine iterates

Terras's parity-vector correspondence suggests tracking finite words and their residue classes. For the accelerated odd map, valuation words are the more natural coding, but the affine iterate formula must be proved with exact integer divisibility guards. At a fixed word length, derive exact residue conditions and count them; do not assume independent valuations at successive iterates.

### Layer D: bridge discipline

An average or density statement does not establish that every starting value has a smaller iterate. The existing StoppingTimeBridge.lean remains conditional on a pointwise descent hypothesis. The project must either prove that hypothesis or produce a genuine counterexample; neither follows from the finite distribution alone.

## Formal audit checklist

- Compile the valuation theorem in isolation and inspect #print axioms.
- Keep sorryAx forbidden in CI.
- Count classes using finite types and exact cardinalities, not floating-point probabilities.
- State the truncation/tail class explicitly.
- Separate finite density, almost-all results, and pointwise global descent in names and documentation.

## References

- Terras 1976: https://doi.org/10.4064/aa-30-3-241-252
- Tao 2022: https://doi.org/10.1017/fmp.2022.8
- Open-access article page: https://www.cambridge.org/core/journals/forum-of-mathematics-pi/article/almost-all-orbits-of-the-collatz-map-attain-almost-bounded-values/1008CC2DF91AF87F66D190C5E01C907F


## Additional structural analogue: finite Collatz graphs

A peer-reviewed paper, “The Collatz conjecture and De Bruijn graphs” (Indagationes Mathematicae 24 (2013), 971–983; DOI https://doi.org/10.1016/j.indag.2013.03.003), studies the induced action on congruence classes modulo powers of two and identifies the resulting graphs with binary De Bruijn graphs. This suggests an alternative formal route complementary to counting one valuation at a time:

- Define the transition relation on odd residue classes at fixed precision \(2^K\).
- Prove the transition is well-defined at the chosen precision, or state explicitly when a higher precision is needed.
- Count incoming/outgoing residue cylinders by finite graph combinatorics.
- Treat valuation classes as labelled transitions, not independent random variables.

This graph approach may scale better for finite valuation words because the word is a path in a finite state graph. It still yields only finite-precision statements unless a separate compactness/measure argument and, ultimately, a pointwise descent proof are supplied.

A recent 2026 preprint by Mike Winkler, “Deterministic Structures in the Coefficient Stopping-Time Dynamics,” also studies exact residue classes and a rooted-tree recursion for coefficient stopping times. It is a preprint rather than a peer-reviewed result, so it is a useful candidate for comparison, not an authority to import as a theorem. The key caution in its abstract is directly relevant: coefficient stopping time is not assumed to equal classical stopping time.

- De Bruijn graph paper: https://doi.org/10.1016/j.indag.2013.03.003
- Winkler preprint: https://doi.org/10.13140/RG.2.2.20089.94563


## Exact residue-count identity (derived, before Lean encoding)

For every integer pair with `1 <= j < K`, the condition `v2(3*n+1) = j` is equivalent to
`3*n + 1 ≡ 2^j (mod 2^(j+1))`.

Because 3 is invertible modulo `2^(j+1)`, this congruence has exactly one solution class modulo `2^(j+1)`. Since `2^j - 1` is odd, that class is odd. It has exactly `2^(K-j-1)` lifts modulo `2^K`, and every lift still has valuation exactly j. Thus the count among all residue classes modulo `2^K` is `2^(K-j-1)`, and these classes are all odd. Equivalently, the count among odd residue classes is the same, not half that number.

There are `2^(K-1)` odd classes modulo `2^K`, so the conditional proportion among odd classes is `2^(-j)`. The proof should formalize the congruence equivalence first, then the unique solution class and its lift count. It must not use floating-point probabilities or assume independence across successive iterates.

Status: this is a mathematical derivation and target specification, not yet a Lean theorem or a claimed build result.


## Formalization plan refined after the successful valuation CI (2026-10-22)

The exact valuation characterization now compiles in the code module, but the distribution count remains a separate theorem. To avoid a false counting argument, formalize it in four layers:

1. Divisibility layer: reuse v2_eq_iff_dvd_pow_not_next; prove the equivalent modular statement using Nat.dvd_iff_mod_eq_zero.
2. Congruence layer: for 1 <= j, multiplication by 3 is invertible modulo 2^(j+1). Prove uniqueness of the solution to 3*n + 1 ≡ 2^j (mod 2^(j+1)), rather than appealing to an informal probability argument.
3. Lift layer: show that the unique class modulo 2^(j+1) has exactly 2^(K-j-1) representatives modulo 2^K, and that every representative retains exact valuation j.
4. Sample-space layer: distinguish all residues modulo 2^K from odd residues. All qualifying residues are odd; the absolute count is 2^(K-j-1), the number of odd residues is 2^(K-1), and the conditional proportion is 2^(-j).

The key mathematical invariant is the congruence, not independence of successive valuations. In Lean, prefer Fin (2^K) with explicit membership predicates and Finset.card, or an explicit equivalence between the qualifying set and the finite lift interval. Avoid List.getD defaults, floating point, and a theorem whose sample space is left implicit.

Literature connection: Terras' stopping-time method encodes finite parity itineraries by residue classes; Laarhoven–de Weger relate the finite Collatz graph modulo powers of two to a binary De Bruijn graph. The adaptation here is to prove the one-step valuation distribution exactly first, then build finite multi-step transitions as an explicit finite graph. This is a local distribution theorem only; it cannot alone imply global descent.


## Cross-check against other Lean Collatz developments (2026-10-22)

A useful audit warning from other public Lean Collatz work is that a finite parity itinerary is encoded by a residue class modulo a power of two, with exponent determined by the itinerary. It must not be silently replaced by a class modulo a power of three. Other formalization notes also distinguish the original Collatz map from the accelerated Syracuse map and warn that density hypotheses for one map do not automatically imply a result for the other.

The blueprint for formalizing Tao's almost-all-orbits theorem is also useful for its explicit dependency graph. Its logarithmic-density conclusion is not a pointwise theorem for every starting value, so it cannot be imported as a universal descent argument.

Implementation consequence: after the exact mod-four lemma, construct a finite transition table for parity/valuation itineraries modulo 2^K. Each transition must carry its precise modulus and map variant. Prove coverage and uniqueness before deriving any density or drift statement. This guards against switching between the original and accelerated maps mid-proof.

These external formalization resources are audit references, not a proof of the global Collatz conjecture.


## 2026-10-23 research extension: exact finite-word transition system

### Motivation from the literature

Terras-style parity-vector arguments encode finite trajectories by congruence classes; Tao's 2022 result goes beyond a naive average-multiplier heuristic by proving stabilization of first-passage statistics through 3-adic distribution and Fourier decay. Tao explicitly does not prove a universal bound for every orbit. The formal project must preserve this distinction: a finite-word count or a density estimate cannot by itself imply universal descent.

### Proposed finite-state bridge

For a word of accelerated valuations a = (a_0, ..., a_{k-1}), define
\[
A_j=\sum_{i<j}a_i,\qquad
C_0=0,\quad C_{j+1}=3C_j+2^{A_j}.
\]
The exact numerator identity is
\[
2^{A_j}n_j=3^j n_0+C_j.
\]
For each prefix length j, a word is arithmetically admissible only if the divisibility conditions implied by
\[
2^{a_i}n_{i+1}=3n_i+1
\]
hold, including exactness of each valuation (the right side is divisible by 2^{a_i}, but not by 2^{a_i+1}). Therefore a raw list of nonnegative exponents is not a trajectory certificate.

The next formal layer should define a prefix state containing:
- the cumulative exponent A_j;
- the affine offset C_j;
- the residue class of the starting value modulo a sufficient power of two;
- an exactness predicate for each valuation in the prefix.

A transition appends one valuation only when its congruence/exactness predicate is satisfied. This supports a finite search for short counterexamples to proposed inequalities and a proof that the state transition preserves the exact affine identity.

### New necessary filter

For a strictly descending block of length k+1, the existing offset bound gives
\[
3^{k+1}n_0+3^k < 2^{A_{k+1}}n_0.
\]
This should be used as a pruning filter after arithmetic admissibility is checked, not as a substitute for that check. It is necessary but not sufficient.

### Research boundary and alternative route

Tao's method uses fine-scale mixing on a 3-adic cyclic group and a first-passage stabilization argument. Reproducing that machinery is substantially different from proving the elementary affine identities in Lean. A realistic alternative milestone is to formalize exact finite valuation-word counts and transition congruences first, then investigate whether a quantitative discrepancy statement can be proved for the finite state system. Any extrapolation from finite depth to all depths must be a separate theorem, not an informal limit argument.

### Acceptance criteria

1. A kernel-checked transition lemma preserves exact valuation and affine-state data.
2. A finite enumerator reports an actual counterexample if a proposed universal finite-word inequality is false.
3. The axiom report for each new theorem is recorded; no sorryAx is accepted.
4. No finite-state or average-case result is described as a proof of global Collatz termination.
