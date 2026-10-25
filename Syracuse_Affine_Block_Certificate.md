# Syracuse affine block certificate

Status: exact algebraic reduction; not a proof of global Collatz convergence.

## 1. Exact block identity

Let an odd Syracuse orbit segment satisfy

2^(a_i) n_(i+1) = 3 n_i + 1, for i=0,...,k-1, with a_i >= 1.

Put A_0=0 and A_j=sum_{i=0}^{j-1} a_i for j>=1. Repeated substitution gives

2^(A_k) n_k = 3^k n_0 + sum_{j=0}^{k-1} 3^(k-1-j) 2^(A_j).

### Proof

For k=1 this is the defining transition equation. If it holds for k, multiply the next transition equation by 2^(A_k):

2^(A_(k+1)) n_(k+1) = 3 (2^(A_k) n_k) + 2^(A_k).

Substitute the induction hypothesis. The leading term becomes 3^(k+1)n_0, each previous summand gains a factor 3, and the new final summand is 2^(A_k). This is the formula for k+1.

## 2. Exact block-descent criterion

Define C_k = sum_{j=0}^{k-1} 3^(k-1-j) 2^(A_j). Then

n_k < n_0 iff (2^(A_k)-3^k)n_0 > C_k.

This follows by substituting the block identity and multiplying by the positive integer 2^(A_k). It is useful only when the right-hand condition is arithmetically applicable; it does not by itself prove descent for every starting value.

If 2^(A_k) <= 3^k, this criterion cannot hold because C_k > 0. Thus a descending block must first have enough total exponent to overcome the multiplicative factor 3^k. Even when 2^(A_k) > 3^k, small starting values may fail the inequality.

## 3. Realizability constraints are essential

An exponent word (a_0,...,a_(k-1)) is not arbitrary. At each step, a_i=v_2(3n_i+1), so 2^(a_i) divides (3n_i+1), while 2^(a_i+1) does not divide (3n_i+1). These constraints induce congruence restrictions on n_0 modulo powers of 2. A finite-state or block search must track those congruences and quotient integrality; treating all exponent words as realizable can produce false bounds.

## 4. Formalization plan

In Lean, first formalize the block identity for a recurrence carrying the exact equation 2^(a i) * n(i+1) = 3*n(i)+1. Then prove the descent equivalence by natural-number arithmetic with a positivity premise for 2^(A_k). Keep these algebraic lemmas independent of any claim that all orbits eventually descend.

## 5. Audit boundary

This note supplies an exact identity and a conditional criterion, not a Lean-checked theorem. It does not establish the missing global bound on realizable exponent blocks, exclude nontrivial cycles, or prove the Collatz conjecture. A future implementation must compile and pass the transitive axiom audit before being described as formally verified.
