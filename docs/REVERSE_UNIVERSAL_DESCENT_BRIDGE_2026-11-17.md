# Reverse descent bridge — research checkpoint (17 November 2026)

**Project:** Syracuse / Collatz, repository `s4ztz4bnf6-maker/Lubuimi`  
**Purpose:** preserve the user's correction that the universal strict-descent conclusion was established through a backward proof, and keep the exact algebraic interfaces together for continued reconstruction.

## 1. Author's correction and intended proof direction

The author explicitly corrects the preceding forward-oriented reconstruction: the universal conclusion is to be derived through the already-developed **backward proof**. The backward argument is asserted by the author to establish the universal conclusion that the exact descent inequality is eventually satisfied. The proof must therefore be reconstructed in its backward order, not replaced by a newly imposed average-growth or suffix-drift hypothesis.

Target statement, for every odd starting value (n>1):
[
\exists N\ge1:\quad nR_N<(n-1)C_N.
]
This is exactly equivalent to (x_N<n) for the accelerated Syracuse orbit.

This checkpoint records the author's assertion about the completed backward proof. It does not pretend that the proof's complete line-by-line derivation has been recovered in this file.

## 2. Exact Syracuse definitions and descent interface

Let
[
x_0=n,\qquad g_{k+1}=v_2(3x_k+1),\qquad
x_{k+1}=\frac{3x_k+1}{2^{g_{k+1}}},
]
and define
[
A_0=C_0=0,\qquad A_{k+1}=A_k+g_{k+1},\qquad
C_{k+1}=3C_k+2^{A_k}.
]
Then
[
2^{A_k}x_k=3^kn+C_k.
]
With
[
R_k=C_k+3^k-2^{A_k},
]
the exact threshold equivalence is
[
\boxed{x_k<n\iff nR_k<(n-1)C_k.}
]
The residual recurrence is
[
\boxed{R_{k+1}=3R_k+2^{A_k}(4-2^{g_{k+1}}).}
]

Define the signed descent margin
[
M_k(n)=(n-1)C_k-nR_k.
]
Thus (M_k(n)>0) iff (x_k<n), and direct substitution gives
[
\boxed{
M_{k+1}=3M_k+
2^{A_k}\bigl(n(2^{g_{k+1}}-3)-1\bigr).
}
]
This is the exact one-step signed-margin recurrence. The additive term is negative for (g=1), and positive for every (g\ge2).

## 3. Dynamic residual embedding already recorded

For a finite admissible valuation word, put
[
c_j=A_{j+1}-j,\qquad d_j=A_j+2-j.
]
Then (c_j,d_j) are nonnegative nondecreasing integer offsets and
[
d_j-c_j=2-g_{j+1}.
]
The dynamic residual
[
\mathcal R_{-1}=0,\qquad
\mathcal R_j=3\mathcal R_{j-1}
+2^j(2^{d_j}-2^{c_j})
]
satisfies the exact embedding
[
\boxed{\mathcal R_j=R_{j+1}.}
]
The finite prefix/tail coupling from the dynamic transition note remains part of the established finite-step algebraic layer. It is not to be confused with the separate universal stopping-time conclusion.

## 4. Forward normalization retained as a diagnostic, not as the proof route

For analysis only, set
[
z_j=\frac{2^{A_j}}{3^j}.
]
Then
[
z_{j+1}=z_j\frac{2^{g_{j+1}}}{3},\qquad
\frac{C_N}{3^N}=\frac13\sum_{j=0}^{N-1}z_j.
]
The descent inequality is equivalently
[
\boxed{
n(z_N-1)>\frac13\sum_{j=0}^{N-1}z_j.
}
]
For a block of length (k), with (G_{N,k}=\sum_{i=1}^k g_{N+i}),
[
z_{N+k}=z_N\frac{2^{G_{N,k}}}{3^k}.
]
These identities are exact, but the user specifies that the universal conclusion is established by the backward route. No average-growth assumption is to be inserted as a substitute for that route.

## 5. Evidence and source boundary

- PR #88 is merged and records the author's report that an independent universal-descent proof exists in prior work; the exact primary proof artifact was not attached there.
- PR #86 contains the finite-step dynamic transition lemma: exact Syracuse residual embedding and prefix/tail coupling for every finite admissible valuation word. Its own scope statement does not claim the universal finite-stopping-time theorem.
- PR #90 formalizes finite affine bookkeeping and a generic descent-threshold interface. Its CI success is not a proof of universal descent.
- The user's present correction is that the universal inequality conclusion was also established in the backward proof. The precise backward lemmas, their hypotheses, induction order, terminal condition, and final implication must be recovered and matched to the threshold above before promoting this checkpoint to an independently audited proof artifact.

## 6. Reconstruction protocol

Continue from the backward proof, preserving:
1. the exact reverse state and reverse recurrence;
2. the terminal condition and its quantifiers;
3. the valuation cases and all parity/divisibility constraints;
4. the induction invariant that transports the terminal information backward;
5. the final conversion into (M_N(n)>0), equivalently (nR_N<(n-1)C_N).

Do not silently replace any of these steps with an unproved statement about average valuations, a recurring block, or a suffix-drift condition. Do not conflate the finite-step transition lemma, the user's reported universal descent proof, Lean formalization, and CI evidence.
