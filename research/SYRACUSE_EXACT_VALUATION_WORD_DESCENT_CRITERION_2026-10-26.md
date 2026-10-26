# Exact valuation-word descent criterion (2026-10-26)

This note records a small but useful exact reduction for the accelerated Syracuse map
S(n)=(3n+1)/2^{v_2(3n+1)} on positive odd integers. It is an algebraic identity, not a Collatz proof.

Fix a valuation word a_0,...,a_{k-1} of positive integers and define
A_0=0, A_{j+1}=A_j+a_j, c_0=0, c_{j+1}=3c_j+2^{A_j}.
Repeated substitution gives
  n_j=(3^j n_0+c_j)/2^{A_j}
whenever the first j exact Syracuse valuations equal the prescribed word.

For a fixed word, the endpoint inequality n_k<n_0 is equivalent to
  (2^{A_k}-3^k)n_0 > c_k.
Consequences:
* If 2^{A_k} <= 3^k, this word cannot yield strict descent for any positive n_0, because c_k >= 0.
* If 2^{A_k} > 3^k, strict descent is equivalent to the explicit threshold
  n_0 > c_k/(2^{A_k}-3^k).
  Since n_0 is integral, the exact threshold is floor(c_k/(2^{A_k}-3^k))+1.
* This endpoint test is conditional on the word being realizable as the **exact** valuation word. The divisibility condition modulo 2^{A_k} alone is insufficient: at each stage one must also establish that v_2(3n_j+1)=a_j, not merely >= a_j.

This gives a finite, exact pruning rule for searches over valuation words. It does not establish that every orbit eventually enters a descending word, nor does it bound the time to do so. Those are the global missing steps.

Suggested tests:
1. Check the recurrence for c_j against direct integer iteration for all odd starts in a bounded range.
2. For each generated exact word, verify the endpoint formula by cross-multiplication, without floating point.
3. Treat a word as realizable only after checking every intermediate valuation exactly.
4. Export any counterexample with start, word, A_k, c_k and both sides of the descent inequality.
