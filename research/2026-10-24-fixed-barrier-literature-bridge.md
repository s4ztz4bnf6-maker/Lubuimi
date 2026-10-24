# Collatz literature bridge: fixed-barrier exceptional counts (2026-10-24)

Status: research note, not a new theorem in this repository.

A newly surfaced formalization reports a bound E(X,N0) <= K N0^(-c') X, uniform in X and N0, for the count of starting values below X whose ordinary Collatz orbit stays above a fixed barrier N0. Its stated corollary is natural-density-one descent below every threshold f(N) tending to infinity. The reported exponent is very small and K ineffective; the page also says the work is not yet reviewed by human experts. Treat the statement as a research lead requiring source, theorem-declaration, and dependency audit, not as independently certified mathematics.

Potential reusable architecture: combine (i) a fixed-barrier failure-count estimate, (ii) a one-step recursion for natural-density exceptional sets, and (iii) a moving-endpoint argument. This is a route to quantitative density results, not to every orbit converging. It does not directly resolve our affine offset inequality C_k < (2^A_k - 3^k)n_0 for every admissible valuation word.

Audit tasks: pin the exact commit and Lean toolchain; map each paper theorem to its Lean declaration; inspect the claimed imported Diophantine input; run a transitive #print axioms audit on the exported theorem; compare the exceptional-count bound and quantifiers with our own definitions before porting any lemma.

Source lead: Collatz Conjecture Challenge, entry Nashida2026b, https://ccchallenge.org/ .