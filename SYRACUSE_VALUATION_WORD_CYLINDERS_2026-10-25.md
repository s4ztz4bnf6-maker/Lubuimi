# Research update: valuation-word cylinders and signed-margin accounting (2026-10-25)

## Scope
This note records a next route for the accelerated odd Syracuse map
\[
T(n)=\frac{3n+1}{2^{v_2(3n+1)}},\qquad n\text{ odd}.
\]
It does not claim a proof or disproof of the global Collatz conjecture. Existing code proves exact affine and signed-margin identities for a certified exponent sequence; the outstanding issue is a global theorem controlling weighted positive and negative terms along every realized orbit.

## Exact accounting
Write \(a_j=v_2(3n_j+1)\), \(A_0=0\), and \(A_{j+1}=A_j+a_j\). Then
\[
2^{A_N}n_N=3^N n_0+C_N,\qquad C_{j+1}=3C_j+2^{A_j}.
\]
The signed margin satisfies
\[
M_{j+1}=3M_j+2^{A_j}(2^{a_j}-4).
\]
Thus exponent 1 contributes negatively, exponent 2 contributes zero, and exponents at least 3 contribute positively. Define
\[
P_N=\sum_{\substack{j<N\\a_j\ge3}}3^{N-1-j}2^{A_j}(2^{a_j}-4),\quad
D_N=\sum_{\substack{j<N\\a_j=1}}2\,3^{N-1-j}2^{A_j}.
\]
The exact finite-sum target is \(M_N=3^N M_0+P_N-D_N\). This is bookkeeping, not a sign estimate. Any bound must retain the weights \(3^{N-1-j}2^{A_j}\); average valuation alone does not control the signed sum.

## New route: realized exponent words as 2-adic cylinders
Separate abstract words \((a_0,\ldots,a_{N-1})\) from realized words, for which there exists an odd positive start \(n_0\) whose exact successive valuations equal the word.

Define a predicate **RealizesValuationWord** using exact divisibility
\[
2^{a_j}\mid 3n_j+1,\qquad 2^{a_j+1}\nmid 3n_j+1,
\]
the transition equation \(2^{a_j}n_{j+1}=3n_j+1\), and oddness of every \(n_j\).

Prove the bridge from a realized word to its exact affine identity and margin split. Then investigate which finite-word inequalities transfer to actual orbits. A stronger route is to describe each finite valuation prefix as a congruence cylinder in the 2-adic integers and prove the correspondence between cylinders and admissible finite words. Do not assert that correspondence until its modulus, parity, and exact-valuation conditions are formalized.

This separation allows algebraic inequalities to be tested on all words while requiring explicit realizability for orbit claims. It prevents silently assuming that a favorable exponent pattern occurs often enough.

## Local lemma and limitation
The local correction is positive for \(a_j\ge3\), zero at \(a_j=2\), and negative at \(a_j=1\). The newest Lean bridge from \(a_j\ge3\) to positive margin correction has no confirmed CI result and must not be described as kernel-checked until the pinned build passes.

A finite run of exponent-one steps has the exact loss formula already recorded in the code:
\[
M_{m+r}=3^r M_m-2\,2^{A_m}(3^r-2^r).
\]
No argument may assume every orbit avoids long runs of exponent one. The threshold is exact, but a global proof still needs to show positive corrections dominate weighted losses on every orbit, or produce a counterexample.

## External evidence and scope discipline
ProofAtlas distinguishes accepted results, Lean-checked candidates, and open review questions. Its Collatz entries include density/logarithmic-time results with explicit limits; these are comparison points, not universal convergence. See https://www.proofatlas.ai/ and https://www.proofatlas.ai/formalizations/.

Keep separate: (i) exact theorem statement, (ii) kernel-check evidence, (iii) source/claim alignment, and (iv) mathematical acceptance. Independent checkers add evidence but do not make all soundness risk logically impossible.

## Immediate formal obligations
1. Prove the exact finite-sum split \(M_N=3^N M_0+P_N-D_N\) in Lean, partitioning indices into all three valuation cases.
2. Define realized valuation words from exact divisibility and transition equations.
3. Prove the word-to-affine-identity bridge.
4. Search residue-class constraints on realizable words, not an unconstrained average-exponent model.
5. For any claimed descent, cite the exact affine identity and prove the required strict inequality.
6. Run the pinned build, transitive axiom audit, and statement-fidelity review before upgrading evidence status.

The global Collatz conjecture remains open in this project. Compactness of \(\mathbb Z_2\), a mean multiplier, a density-one theorem, or a local positive correction does not imply that every orbit reaches 1.


## Strengthened cylinder lemma: exact finite-word realizability

An independent research note on accelerated Collatz itineraries records the following precise statement, which is a strong candidate for our next formal theorem: for every finite word of positive exponents
\[
\mathbf a=(a_0,\ldots,a_{m-1}),\qquad K=\sum_{j<m}a_j,
\]
there is exactly one odd residue class modulo \(2^{K+1}\) whose positive odd representatives realize that exact valuation prefix. Thus every finite positive exponent word has a positive integer realizer; finite-word realizability is not the obstacle. The difficult issue is controlling infinite trajectories or obtaining a uniform global bound.

Proof sketch for the modular induction: the empty prefix is the odd class modulo 2. Suppose a prefix of total exponent K has affine numerator
\[
2^K n_m=3^m n_0+C_m.
\]
Appending exponent b requires the exact congruence
\[
3n_m+1\equiv 2^b\pmod{2^{b+1}},
\]
equivalently
\[
3(3^m n_0+C_m)+2^K\equiv 2^{K+b}\pmod{2^{K+b+1}}.
\]
The coefficient \(3^{m+1}\) of \(n_0\) is odd and hence invertible modulo \(2^{K+b+1}\). This gives one residue class modulo the new power of two. The proof must also show that this class reduces to the previous cylinder, thereby preserving the whole prefix. Positive representatives exist by adding multiples of the modulus.

This is a mathematical proof sketch, not yet a theorem added to our Lean project. The independent itinerary note is at https://github.com/sneakyweasel/btlab/blob/main/docs/collatz_itinerary_compatibility.md. The next implementation should formalize the congruence induction and prove prefix nesting before connecting cylinders to any global descent claim.
