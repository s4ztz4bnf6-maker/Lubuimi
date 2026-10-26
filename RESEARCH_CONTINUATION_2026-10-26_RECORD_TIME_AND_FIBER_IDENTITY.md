# Research continuation: record-time structure for Syracuse and exact BBMST fiber interface
Date: 2026-10-26

This note records two exact reductions. They are mathematical derivations, not claims of a compiled Lean proof. The global Erdős–Selfridge and Syracuse/Collatz problems remain unresolved in this work.

## 1. Syracuse: suffix drift is a record-time condition

Let a realized valuation block have exponents a_0,...,a_{N-1}, cumulative sums A_0=0 and A_{k+1}=A_k+a_k. Define the integer-valued drift
D_k = 5 A_k - 9 k.

The previously derived suffix condition
  5(A_N-A_j) >= 9(N-j) for every j<N
is exactly equivalent, by rearrangement, to
  D_N >= D_j for every j<N.

Thus a suffix-drift certificate occurs precisely at a (weak) record time of D. This is useful because it changes a condition quantified over every suffix into a record-max condition on a one-dimensional integer process. The increment is
  D_{k+1}-D_k = 5 a_k - 9.
Since a_k is a positive integer, increments are at least -4, and a_k >= 2 produces a positive increment (at least +1), while a_k=1 produces -4.

The equivalence is exact and elementary; it does not imply that a future record has the needed block length or that records occur with the required valuation pattern. In particular, an exponent word consisting of many 1s can descend in D, and actual Syracuse valuations are not arbitrary independent choices.

### Formal target

For any integer sequence A and natural indices j <= N, define D(k)=5*A(k)-9*k in ℤ. Prove:
  (∀ j<N, 5*(A(N)-A(j)) ≥ 9*(N-j))
  ↔ (∀ j<N, D(j) ≤ D(N)).
Then connect A to prefixExponentSum only after proving the recurrence and index conventions. Prefer ℤ for the subtraction and comparison; avoid silently relying on truncated Nat subtraction.

### How this advances the global search

A useful next research question is not simply whether D has infinitely many records. Every finite sequence has a maximum, and records alone are too weak. The question is whether a record time N can be selected so that:
1. N>=1;
2. the corresponding block is an actual Syracuse orbit segment;
3. the finite correction-sum certificate applies;
4. the endpoint n_N is strictly below n_0.

A possible alternate route is to prove that every sufficiently long realized orbit segment either has such a record certificate or satisfies another explicit descent inequality. This disjunction must be proved, not inferred from the heuristic mean valuation E[v_2(3n+1)]≈2.

## 2. BBMST: exact fiber identity before summation

Let a finite fiber have old total mass W and removed subset of old mass αW, with 0<=α<=1. For 0<δ<1, the source-style update scales each removed point by
  max(0, (α-δ)/(α*(1-δ)))
when α>0. Therefore its total removed mass is
  αW * max(0, (α-δ)/(α*(1-δ)))
  = W * max(0, (α-δ)/(1-δ))
  = W*g_δ(α).
The α=0 case must be handled separately: the removed subset has zero mass, and no cancellation by α is permitted. For α=1, the complementary subset has zero mass; the update must preserve the source's endpoint convention rather than divide by a zero complement mass.

The scalar inequalities already encoded as candidates in BBMSTScalarMoment.lean imply
  W*g_δ(α) <= W*α
and
  W*g_δ(α) <= W*α²/(4δ(1-δ))
for W>=0. Summing these exact fiber identities yields the two moment bounds only if the fiber masses W and α are defined from the same stage measure as the source paper.

### Formal proof obligations

1. Define the finite stage measure as a point-mass sum over the source's finite sample space.
2. Prove disjoint fiber partition and total-mass conservation at the update.
3. Prove the fiber identity by cases α=0 and α>0; preserve α=1 behavior explicitly.
4. Prove the weighted sums are exactly the source-defined M_k^(1) and M_k^(2), not merely similarly named quantities.
5. Only then derive the source Lemma 2.1 inequalities and the downstream sieve criterion.

A proof of the scalar bound or its weighted form is not by itself a proof of the geometric covering theorem. No algebraic-variety or transversality language is needed unless it supplies a concrete missing finite-fiber lemma.

## 3. Validation boundary

- The record-time equivalence is an algebraic reformulation, not a global Collatz result.
- The fiber identity is conditional on the exact source update and finite-measure definitions.
- Lean CI and transitive axiom scans must be checked against the exact commit that contains each theorem.
- No claim of successful compilation or an empty axiom list is made by this note.
