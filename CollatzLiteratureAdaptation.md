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
