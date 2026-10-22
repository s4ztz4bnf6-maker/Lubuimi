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
