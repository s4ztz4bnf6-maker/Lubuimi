# Syracuse valuation cylinders: an explicit finite-interval discrepancy bound

Date: 2026-10-26
Status: elementary cylinder-counting lemma, conditional on the standard unique-cylinder lemma for accelerated Syracuse valuations; no global Collatz conclusion.

## Setup

Let n range over positive odd integers. Write the accelerated Syracuse map as
T(n) = (3n+1)/2^{v_2(3n+1)}
and let a_1,...,a_k be the first k positive 2-adic valuations. Put
A_k = a_1+...+a_k.
Under Haar measure on odd 2-adic integers, each finite valuation word (a_1,...,a_k) has probability 2^{-A_k}; equivalently, the digits are independent with P(a_j=r)=2^{-r}, r>=1.

A standard induction on k gives the cylinder property: a fixed word with total A defines one residue class of odd starting integers modulo 2^{A+1}. Its Haar probability among odd 2-adic integers is 2^{-A}. This is the key structural fact that must itself be checked against the exact chosen Syracuse convention.

## Truncation and explicit error

Fix integers k>=1 and M>=k. Let E be any event determined by the first k valuations, for example {C_k >= t}. Let E_M be its truncation to words with A_k<=M:
E_M = E intersect {A_k<=M}.

There are exactly
sum_{A=k}^M binomial(A-1,k-1) = binomial(M,k)
valuation words of length k with total at most M. Therefore E_M is a union of at most binomial(M,k) cylinder classes. Each cylinder is a single residue class modulo a power of two, so its count among O_X odd positive integers <=X differs from its Haar-predicted count O_X 2^{-A} by at most 1. Consequently,

| freq_X(E_M) - P_Haar(E_M) | <= binomial(M,k)/O_X,

where freq_X uses uniform counting over the O_X odd integers <=X.

The omitted event {A_k>M} is determined by the starting residue modulo 2^{M+1}: whether the accumulated valuation reaches more than M within the first k steps is decided by the valuation cylinder tree through depth M. It is therefore a union of at most 2^M odd residue classes modulo 2^{M+1}. This gives

| freq_X(A_k>M) - P_Haar(A_k>M) | <= 2^M/O_X.

Combining the truncated event and the tail yields the safe bound

| freq_X(E) - P_Haar(E) |
 <= binomial(M,k)/O_X + 2 P_Haar(A_k>M) + 2^M/O_X.

The exact Haar tail is the negative-binomial sum

P_Haar(A_k>M) = sum_{A=M+1}^infinity binomial(A-1,k-1) 2^{-A}.

Thus the discrepancy is explicit in X,k,M. The statement is useful only when M is chosen so that both binomial(M,k)/X and 2^M/X are small while the negative-binomial tail is small. For example, M must remain below (1-epsilon) log_2 X to make the 2^M/X term vanish; k must be chosen jointly, not independently.

## Proof obligations and caution

1. Formalize and verify the unique-residue-cylinder lemma for the exact accelerated map convention, including all off-by-one powers of two.
2. Prove that the event A_k>M is measurable from residue modulo 2^{M+1} under that same convention.
3. Formalize the cylinder count and the discrepancy bound.
4. Choose k(X), M(X) and prove all three error terms vanish. This is not automatic; the binomial term may prevent a useful choice.
5. Only after this transfer is established may a Haar tail estimate for C_k be used in an integer-density argument. Descent additionally requires joint control of C_k and A_k.

This note does not assert that a useful asymptotic choice k(X),M(X) has been found, and it does not prove natural-density descent or the Collatz conjecture.