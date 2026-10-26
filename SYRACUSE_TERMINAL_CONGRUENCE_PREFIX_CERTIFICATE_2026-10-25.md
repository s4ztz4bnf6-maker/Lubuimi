# Terminal congruence as a candidate exact-prefix certificate

Status: algebraic derivation and formalization target; not yet a Lean theorem and not a global Collatz result.

Let a_0,...,a_{N-1} be positive integers, A_0 = 0, A_{j+1}=A_j+a_j, and C_0=0, C_{j+1}=3C_j+2^{A_j}. Define X_j = 3^j n_0 + C_j. The affine recurrence gives

X_{j+1} = 3X_j + 2^{A_j}.

For every j ≤ N, repeated expansion gives

X_N = 3^{N-j} X_j + 2^{A_j} R_{j,N},

where R_{j,N} = Σ_{t=j}^{N-1} 3^{N-1-t} 2^{A_t-A_j}. Since A_t-A_j ≥ 0 and the first summand (t=j) is 3^{N-1-j}, which is odd, R_{j,N} is odd.

Suppose the terminal congruence holds:

X_N ≡ 2^{A_N} (mod 2^{A_N+1}).

This says X_N / 2^{A_N} is an odd integer. Because A_N > A_j for j<N, the displayed decomposition implies X_j is divisible by 2^{A_j}; moreover, after dividing the decomposition by 2^{A_j}, the left side is even, R_{j,N} is odd, and 3^{N-j} is odd. Hence X_j / 2^{A_j} is odd as well. Consequently every prefix quotient n_j := X_j / 2^{A_j} is an odd integer, and

2^{a_j} n_{j+1} = 3 n_j + 1.

So the terminal congruence is a candidate compact certificate for realizing the entire prescribed positive-exponent word, provided n_0 is positive and the indexing/recurrences are set up as above. The reverse implication is immediate from the affine identity if n_N is odd.

## Why this matters

Instead of proving prefix integrality and oddness independently at every step, Lean could formalize one terminal divisibility/congruence condition and derive all prefix transition certificates by backward divisibility. That may simplify the bridge between arbitrary exponent words and actual Syracuse trajectories.

## Important boundary

This only characterizes realizability of a finite exponent word. It does not prove that every word descends, that all infinite trajectories reach 1, or that a global descent margin stays positive. A valid Lean development must carefully prove the decomposition, the oddness of R_{j,N}, and the prefix quotient claims; none is claimed as kernel-checked by this note.
