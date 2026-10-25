# Terminal congruence criterion for finite Syracuse exponent words

Date: 2026-10-25
Status: mathematical derivation for formalization; not yet Lean-checked.

## Definitions

Let a : {0,...,N-1} -> positive integers be a proposed finite valuation word. Define cumulative exponents A_0=0 and A_{j+1}=A_j+a_j. Define C_0=0 and C_{j+1}=3 C_j + 2^{A_j}. Put
X_j = 3^j n_0 + C_j.
Then X_{j+1}=3 X_j + 2^{A_j}.

## Exact criterion

For a positive integer n_0, the proposed word a_0,...,a_{N-1} is the exact accelerated odd-Syracuse valuation prefix if and only if

X_N ≡ 2^{A_N} (mod 2^{A_N+1}).

Equivalently, v_2(X_N)=A_N.

The criterion is for a fixed starting value and a fixed word. It does not assert that every abstract positive word is realizable by some positive n_0; realizability is exactly the existence of an n_0 satisfying this terminal congruence.

## Proof sketch for the forward direction

If the word is realized, the affine identity gives X_N=2^{A_N} n_N, where n_N is odd. Hence X_N ≡ 2^{A_N} mod 2^{A_N+1}.

## Proof sketch for the reverse direction

Assume X_N ≡ 2^{A_N} mod 2^{A_N+1}. Thus X_N is divisible by 2^{A_N}, with odd quotient. Proceed backwards. If 2^{A_{j+1}} divides X_{j+1}, then

3 X_j = X_{j+1} - 2^{A_j}

is divisible by 2^{A_j}; since 3 is invertible modulo every power of 2, 2^{A_j} divides X_j. Moreover, because A_{j+1} >= A_j+1, X_{j+1} ≡ 0 mod 2^{A_j+1}, and therefore

3 X_j ≡ -2^{A_j} (mod 2^{A_j+1}).

Dividing by 2^{A_j} shows that X_j / 2^{A_j} is odd. Define n_j=X_j/2^{A_j}. The recurrence then yields

3 n_j + 1 = 2^{a_j} n_{j+1},

and n_{j+1} is odd, so v_2(3n_j+1)=a_j exactly. Backward induction establishes all prefix valuations, including n_0 odd. Positivity follows from n_0>0 and the positive recurrence.

## Why this is useful

This replaces an informal admissible-word question with a single finite congruence test on n_0. It provides a clean interface for Lean:

1. prove X_{j+1}=3 X_j+2^{A_j};
2. prove the terminal congruence implies divisibility and odd quotient at every prefix by backward induction;
3. recover each exact valuation from 3 n_j+1=2^{a_j} n_{j+1};
4. only then connect the word to the signed-margin cocycle and strict descent.

The terminal condition is a characterization, not a descent bound. It does not prove that the signed margin is positive, and does not imply global Collatz convergence without an additional argument controlling all realizable words.

## Audit boundary

This is a proof sketch only. No Lean compile, axiom audit, or global Collatz conclusion is claimed in this note. The existing affine identity and signed-margin recurrence remain the formalization targets; this note proposes the next realizability lemma without changing the existing code.
