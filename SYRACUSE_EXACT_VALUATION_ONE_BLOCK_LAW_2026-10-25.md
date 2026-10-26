# Exact valuation-one block law for the Syracuse offset margin
Date: 2026-10-25

## Purpose and status

This note records an exact block identity that isolates consecutive valuation-one steps. It is a derived arithmetic lemma, not a proof of Collatz termination. It must be formalized and checked in Lean before being treated as a machine-checked project result.

## Setup

For a certified accelerated odd Syracuse orbit, let
\[
2^{a_j} n_{j+1}=3n_j+1,\qquad A_{j+1}=A_j+a_j,
\]
and let the canonical offset satisfy
\[
C_0=0,\qquad C_{j+1}=3C_j+2^{A_j}.
\]
Define the signed margin
\[
M_j=2^{A_j}-C_j-3^j.
\]
The existing recurrence is
\[
M_{j+1}=3M_j+2^{A_j}(2^{a_j}-4).
\]

## Exact block identity

Suppose a block of length r starts at j and all its exponents equal one:
\[
\forall t<r,\quad a_{j+t}=1.
\]
Then \(A_{j+t}=A_j+t\) throughout the block and
\[
\boxed{M_{j+r}=3^r M_j-2^{A_j+1}(3^r-2^r).}
\]

Derivation: iterating the one-step recurrence gives
\[
M_{j+r}=3^rM_j-
\sum_{t=0}^{r-1}3^{r-1-t}2^{A_j+t+1}.
\]
Factor out \(2^{A_j+1}\). The remaining finite geometric sum is
\[
\sum_{t=0}^{r-1}3^{r-1-t}2^t=3^r-2^r,
\]
which yields the boxed identity.

Consequently, the block ends with positive margin exactly when
\[
M_j>2^{A_j+1}\left(1-(2/3)^r\right).
\]
This is an exact threshold for this particular adverse block, not a universal lower bound on the margin entering the block.

## Why this helps

It replaces r separate negative corrections with a single closed-form debit. A future block argument can combine:
- the exact debit above for maximal runs of exponent one;
- the zero additive correction at exponent two;
- the positive correction for exponents at least three.

The unresolved question is whether realizability constraints on valuation words force enough positive contribution between adverse blocks to pay these debits. An arbitrary exponent word need not be realizable by a natural-number Syracuse orbit, so no argument may silently replace orbit constraints with an unconstrained word model.

## Lean acceptance criteria

1. Formalize the block identity using the existing definitions and the assumptions \(A_{k+1}=A_k+a_k\), \(a_{j+t}=1\) for \(t<r\).
2. Compile with the repository's pinned Lean/Mathlib.
3. Inspect transitive axioms of the theorem.
4. Separately prove orbit-realizability conditions for any word-level bound used later.

No global Collatz conclusion follows from this note.
