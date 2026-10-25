# Syracuse admissible-word audit: exact criterion and a failed no-escape heuristic

Status: research note, not a Collatz proof. This note records a precise finite-word criterion and rejects a tempting but false local claim before it enters Lean.

## 1. Exact finite-word realizability

Fix an odd positive start n₀ and a finite word a₀,…,a_{N−1} of positive integers. Define

- A₀ = 0 and A_{j+1} = A_j + a_j;
- C₀ = 0 and C_{j+1} = 3 C_j + 2^{A_j};
- X_j = 3^j n₀ + C_j;
- Y_j = 3^{j+1} n₀ + 3 C_j + 2^{A_j} = 3 X_j + 2^{A_j}.

The affine block identity is 2^{A_j} n_j = X_j. Consequently
[
2^{A_j}(3n_j+1)=Y_j.
]
The word is realized by the odd Syracuse map n ↦ (3n+1)/2^{v₂(3n+1)} exactly when, for each j < N,

[
v_2(Y_j)=A_j+a_j.
]

Equivalently, since Y_j is positive, the exact valuation condition can be written as the pair
[
2^{A_j+a_j}mid Y_j,qquad
2^{A_j+a_j+1}\nmid Y_j.
]
This is the useful finite arithmetic criterion: it checks the actual valuation at every step, not merely a divisibility condition. It also forces the next quotient n_{j+1} to be odd. A Lean development should first formalize this criterion for finite words and prove both directions against the recursive Syracuse transition.

## 2. Important correction: no growing forced exponent after a long run of ones

Do **not** assert a local theorem of the form “after k consecutive exponents equal to 1, the next exponent must be at least Ψ(k), where Ψ(k) grows.” That assertion is false.

For any L ≥ 1 and any positive q, take
[
n_0=2^{L+1}q-1.
]
This is positive and odd. Under each of the first L steps, while the exponent is 1,
[
n_{j+1}=(3n_j+1)/2.
]
An induction gives
[
n_j equiv -1 pmod {2^{L+1-j}}
quad (0le jle L).
]
Thus n_j ≡ 3 (mod 4) for j < L, which implies v₂(3n_j+1)=1. Hence there are actual positive integer starts with arbitrarily long finite runs of exponents all equal to 1. Choosing L one larger than any proposed k shows that the next exponent after k ones can also equal 1. There is no forced growing lower bound on that next exponent based only on the length of the preceding run.

This does not construct an infinite natural-number orbit consisting of ones: the start n₀ changes with L. It does, however, disprove the proposed *uniform local forcing mechanism*. The 2-adic point −1 is consistent with the same obstruction, since 3(−1)+1=−2 and the accelerated odd map fixes −1 on that branch.

## 3. What remains a viable target

A valid global argument must use more than the length of a run of ones. Candidate targets are:

1. formalize the exact finite-word criterion above;
2. prove a weighted inequality using all admissibility constraints, not just run lengths;
3. derive a descent certificate for each actual start, or isolate a precise counterexample if one exists.

The weighted margin identity is already present in `SyracuseOffsetIdentity.lean`; this note does not claim it proves the missing global inequality. No global Collatz/Syracuse theorem is claimed here.

## 4. Verification boundary

A successful Lean build checks the encoded proposition, not whether the proposition is the desired global conjecture. The final audit must include statement fidelity, a transitive axiom report for the relevant theorems, and a check of the kernel/toolchain version. This note itself is not a Lean-checked theorem.
