# Carry-barrier Lyapunov candidate: exact block criterion and audit gate

Date: 2026-10-27  
Status: research note; algebraic identities are proved on paper, not Lean-compiled. This is not a Collatz proof.

## 1. Exact block equation

For an odd Syracuse orbit
\[
n_{j+1}=\frac{3n_j+1}{2^{k_j}},\qquad k_j=v_2(3n_j+1)\ge 1,
\]
put
\[
A_j=\sum_{i<j}k_i,\qquad A=A_N,\qquad
C_N=\sum_{j=0}^{N-1}3^{N-1-j}2^{A_j}.
\]
Repeated substitution gives the exact identity
\[
2^A n_N=3^N n_0+C_N.
\]
Define the carry barrier
\[
B_N:=2^A-3^N.
\]
Then, without approximation,
\[
n_N<n_0\quad\Longleftrightarrow\quad n_0 B_N>C_N.
\]
If \(B_N\le0\), strict descent is impossible on that block. If \(B_N>0\), descent is equivalent to the start-dependent inequality above. This sharpens the coarse necessary condition \(2^A>3^N\): having enough total 2-adic valuation is not by itself sufficient because the positive carry term \(C_N\) must also be paid.

## 2. Candidate potential and why it is not yet a Lyapunov proof

When \(B_N>0\), define the dimensionless margin
\[
\Lambda_N(n_0):=\frac{n_0B_N-C_N}{n_0B_N}
=1-\frac{C_N}{n_0B_N}.
\]
Then descent is exactly \(\Lambda_N>0\); equality is a block return, and a negative value means growth. This is an exact block certificate, not a monotone potential: both \(A\) and \(C_N\) depend on the orbit's valuation word, and nothing here proves that \(\Lambda_N\) eventually becomes positive.

A useful research target is a uniform carry-barrier theorem: find a fixed block length \(N\), or a rigorously controlled adaptive stopping rule, such that every odd starting value outside a finite explicitly checked set has a block with \(n_0(2^{A_N}-3^N)>C_N\). A proof must control the actual orbitwise valuation word, not merely its density among residue classes.

## 3. Entropy/carry refinement

The valuation cylinder lemma says a finite word \((k_0,\ldots,k_{N-1})\) occupies one odd residue class modulo \(2^{A+1}\), hence density \(2^{-A}\) among odd classes. This is an exact combinatorial fact, but it does not make successive valuations independent and does not rule out an exceptional infinite orbit.

A more faithful state than a raw bit-count is the pair
\[
(A_N, C_N)\quad\text{or equivalently}\quad
\left(A_N,\;\sum_{j<N}3^{N-1-j}2^{A_j-A_N}\right).
\]
It records both accumulated 2-adic removal and the ordered carry contribution. Two blocks with the same number of valuation bits can have different carry barriers because the order of the k_j changes C_N. This is the key audit test for any proposed entropy potential: it must retain enough order information to predict the barrier.

A musical/acoustic analogy can suggest a representation (valuation word as rhythm; carry terms as weighted echoes), but it contributes no proof unless the representation yields a theorem such as a bound on C_N from the word and orbit state.

## 4. Falsification gates before formalization

1. Test all valuation words up to a fixed length against exact integer arithmetic; never use floating-point logarithms as proof.
2. Search for words with \(2^A\le 3^N\); these are automatically non-descending blocks.
3. For words with \(2^A>3^N\), compute the exact threshold \(n_0>C_N/(2^A-3^N)\), then intersect it with the word's valid residue cylinder. This checks whether the word itself forces descent, allows growth, or permits both depending on the start.
4. Any claimed universal fixed-length descent lemma must immediately be tested against small counterexamples; it is not an acceptable target unless it survives those tests.
5. In Lean, prove the block identity first, then the iff criterion by arithmetic normalization. Only after that formalize a candidate uniform bound. Run an axioms scan on the final theorem and inspect dependencies; CI alone is not the axiom audit.

## 5. The actual bottleneck

The hard step is not defining a Lyapunov-like quantity. It is proving that the orbit cannot indefinitely choose valuation words whose carry barrier is nonpositive or whose positive barrier is overwhelmed by C_N. Residue-cylinder densities, 2-adic continuity, average drift, and finite experiments do not close this orbitwise gap. The next meaningful result is either:
- a proved structural bound on carry sums for all admissible words in a class, or
- a concrete counterexample to a proposed bound, which eliminates that approach.

No global Collatz/Syracuse claim is made here.
