# Research continuation: exact two-step Syracuse descent criterion

Date: 2026-10-25  
Scope: Syracuse/Collatz workspace only. No files in the Erdős–Selfridge workspace are changed.

## Exact recurrence identity

Let \(n_0=n\), and for successive odd Syracuse states write
\[
n_{i+1}=\frac{3n_i+1}{2^{a_i}},\qquad a_i=v_2(3n_i+1)\ge 1.
\]
Put \(s_0=0\) and \(s_j=a_0+\cdots+a_{j-1}\). Iterating the recurrence gives the exact identity
\[
2^{s_k}n_k=3^k n_0+\sum_{j=0}^{k-1}3^{k-1-j}2^{s_j}.
\]
This is a bookkeeping identity, not an asymptotic or probabilistic claim. It should be formalized independently of any conjectural statement about average valuations.

For two steps, with \(a=a_0\), \(b=a_1\), \(m=n_1\), and \(k=n_2\), it specializes to
\[
2^{a+b}k=9n+3+2^a.
\]

## Deterministic descent lemma to isolate

If \(n>1\), \(a,b\ge1\), \(a+b\ge4\), and the exact two-step identity above holds, then \(k<n\).

Proof by cases on \(a\):

- If \(a=1\), then \(b\ge3\), so \(2^{a+b}n\ge16n>9n+5\).
- If \(a=2\), then \(b\ge2\), so \(2^{a+b}n\ge16n>9n+7\) for \(n>1\).
- If \(a=3\), then \(b\ge1\), so \(2^{a+b}n\ge16n>9n+11\) for \(n>1\).
- If \(a\ge4\), then \(2^{a+b}n\ge2^{a+1}n\), and \(2^a n>9n+3\) for \(a\ge4\), \(n>1\). Hence \(2^{a+b}n>9n+3+2^a\).

Combining the strict bound with \(2^{a+b}k=9n+3+2^a\) yields \(k<n\).

## Research significance and limitation

This gives a deterministic local descent certificate whenever two consecutive odd-step valuations sum to at least four. It does **not** prove that every orbit eventually encounters such a pair often enough to force global termination; the unresolved problem is the global control of valuation blocks and exceptional trajectories. The next useful formal target is the exact recurrence identity, followed by the descent lemma and then a separate theorem about valuation-block recurrence. Any claim about a negative drift or typical behavior must remain explicitly probabilistic until converted into a uniform orbit-wise bound.

## Verification status

This is a mathematical research note, not a claim that a Lean file compiled. Formalize on the active Lean 4 toolchain, test the integer/natural-number coercions explicitly, run `#print axioms` on the resulting lemmas, and keep this workspace isolated from the BBMST repository.
