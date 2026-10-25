# Syracuse research update: exact valuation cylinders and the tail-bound boundary
Date: 2026-10-25

## Scope and status
This note records elementary deductions for the accelerated odd Syracuse map
T(n)=(3n+1)/2^{v_2(3n+1)}. It is a research note, not a proof of global Collatz termination. The statements below must still be formalized in Lean on the target branch and checked against the exact source definitions.

## 1. Exact finite valuation cylinders
For a prescribed finite valuation word a_0,...,a_{r-1}, write A_j=sum_{i<j} a_i and A_r=sum_{i<r} a_i. The odd starting integers realizing this exact word form one residue class modulo 2^{A_r+1}, hence have natural density 2^{-A_r} among odd integers. Consequently, for any fixed word,
Pr(a_0=k_0,...,a_{r-1}=k_{r-1})=2^{-sum_i k_i}.
This is a statement about finite-prefix cylinder densities; it is not a claim that every individual orbit has typical frequencies.

For the geometric law Pr(a=k)=2^{-k} on k>=1, E[a]=2 and Var(a)=2. For every fixed block length, the cylinder law therefore gives E[A_r]=2r and Var(A_r)=2r in the associated finite-prefix density model.

## 2. Quantitative exceptional-prefix estimate
For 1<lambda<2, Chebyshev gives
Pr(A_r<lambda r) <= 2/(r(2-lambda)^2).
The event is contained in |A_r-2r|>(2-lambda)r. This proves that the proportion of odd starts with a low total valuation in a fixed length-r prefix tends to zero as r tends to infinity. It does not provide a uniform statement for every start or a single orbit's infinite-time behavior.

## 3. Exact affine identity and sufficient descent margin
For certified transitions 2^{a_j} n_{j+1}=3n_j+1, A_{j+1}=A_j+a_j, define C_0=0 and C_{j+1}=3C_j+2^{A_j}. Then
2^{A_r} n_r=3^r n_0+C_r.
Strict descent is equivalent to
n_r<n_0 iff 3^r n_0+C_r<2^{A_r}n_0.
The identity is formalizable from certified transitions; the difficult global obligation is to prove this margin on a sequence of blocks for every relevant trajectory.

A sufficient bound should be derived for C_r relative to 2^{A_r}; do not infer descent merely from A_r>r, because the offset term C_r remains.

## 4. Formal next steps
1. Formalize exact cylinder classification for finite valuation words, including necessity and sufficiency.
2. Formalize finite-prefix probability identities without importing an unjustified infinite independence assumption.
3. Prove the affine identity from the actual transition certificate.
4. Keep the descent margin as an explicit hypothesis until a valid orbit-uniform bound is found.
5. Run the pinned toolchain, then transitively inspect axioms and theorem statement fidelity.

## Non-claims
No global Collatz/Syracuse proof is asserted. Density-one statements and finite residue calculations do not rule out an exceptional nonterminating orbit.
