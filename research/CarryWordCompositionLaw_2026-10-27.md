# Carry-word composition law and Lyapunov falsification tests (2026-10-27)

Status: exact algebraic lemma proposal; not Lean-compiled. This is a project-developed interface, not a claim of historical novelty.

## 1. Composition law

For a finite valuation word w=(k_0,...,k_{N-1}), put A(w)=sum k_i and define C(w) recursively by C(empty)=0 and, when appending k to a word of accumulated exponent A, C(new)=3 C(old)+2^A. Its block matrix is

P(w) = [[3^N,C(w)],[0,2^{A(w)}]].

If u is followed by v, matrix multiplication gives the exact concatenation rules

A(uv)=A(u)+A(v),
N(uv)=N(u)+N(v),
C(uv)=3^{N(v)} C(u)+2^{A(u)} C(v).

The order is important. This is the algebraic reason that a symbol-count entropy alone cannot be the full state: two words with the same length and the same sum of valuations can have different C(w).

## 2. Carry pressure and its domain

For an actual starting odd integer n and a block w of length N, define the signed descent margin

G(n,w)=n(2^{A(w)}-3^N)-C(w).

Then G(n,w)>0 iff the block endpoint is strictly smaller than n. This margin is integer-valued and avoids logarithms, floating-point error, and division by zero.

The concatenation law gives a block-composition update. If u is first and v second, the endpoint after u is n_u=(3^{N(u)}n+C(u))/2^{A(u)} when u is the actual valuation prefix. For the whole block, G(n,uv)>0 is the exact final descent test. It is generally invalid to add G(n,u)+G(n_u,v): their scales differ. A correct Lyapunov candidate must include the multiplicative scale in its state.

## 3. A non-circular certificate target

The quantity G itself is an exact certificate, not yet a Lyapunov function. To avoid circularity, a proposed potential V must satisfy all three conditions:

1. It is computable from the current state and a bounded amount of block data, not from the unknown future endpoint.
2. Its update inequality is proved for every admissible valuation transition, not only on average over random words.
3. Repeated use forces a well-founded descent or rules out an orbit whose values tend to infinity.

An entropy-based proposal must be strengthened with carry-state information. A promising falsification harness is to compare words having the same (N,A) but different C, and test whether the proposed compressed state predicts the exact sign of G.

## 4. Regression counterfamily

For every N>=1 and m>=1, n_0=2^(N+1)m-1 has N consecutive valuations equal to 1 and n_N=2*3^N*m-1>n_0. Therefore any claim that every sufficiently long block strictly descends, uniformly over all odd starting values, is false. This is a finite-prefix obstruction only; it is not a divergent orbit.

## 5. Lean target order

- Define the word summary (N,A,C) recursively.
- Prove the concatenation equations by induction on v.
- Prove the matrix/product formula from those equations.
- Prove the integer equivalence G(n,w)>0 iff endpoint<n, with integrality hypotheses explicit.
- Prove the all-ones regression family.
- Do not introduce a global drift theorem until it survives these countertests and has a proof independent of G's definition.

## Current obstruction

The open mathematical task is no longer “find a formula for a block.” It is to constrain the set of valuation words realizable along an unbounded orbit strongly enough to force a global conclusion. Neither a spectral analogy nor finite-word frequencies currently provide that constraint.
