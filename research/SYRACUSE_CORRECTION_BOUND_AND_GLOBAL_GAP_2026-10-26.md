# Syracuse block correction bound and the remaining global obligation

Date: 2026-10-26

## Scope

This note is a mathematical derivation from the checked finite-block identity in
`SyracuseBlockDescent.lean`. The bound below is not yet a Lean theorem and is
not claimed to prove Collatz convergence. It identifies an exact sufficient
condition and pinpoints why exponent averages alone do not close the proof.

## 1. Definitions and exact identity

For a realized odd-only block with exponents \(a_0,\ldots,a_{N-1}\), let
\[
 A=\sum_{i=0}^{N-1}a_i,\qquad
 p_j=\sum_{i<j}a_i,
 \]
and
\[
 C=\sum_{j=0}^{N-1}3^{N-1-j}2^{p_j}.
 \]
The checked identity is
\[
 2^A n_N=3^N n_0+C.
 \]
All \(a_i\ge 1\), hence \(A\ge N\). For every \(j\), the remaining
\(N-j\) exponents are at least one, so
\[
 p_j\le A-(N-j)=A-N+j.
 \]
Consequently
\[
\begin{aligned}
 C
 &\le \sum_{j=0}^{N-1}3^{N-1-j}2^{A-N+j}\\
 &=2^{A-N}\sum_{j=0}^{N-1}3^{N-1-j}2^j\\
 &=2^{A-N}(3^N-2^N).
\end{aligned}
\]
The final equality is the finite geometric identity
\(\sum_{j=0}^{N-1}3^{N-1-j}2^j=(3^N-2^N)/(3-2)\).

## 2. Exact sufficient descent criterion

Using the identity and correction bound,
\[
 2^A n_N\le 3^N n_0+2^{A-N}(3^N-2^N).
\]
Therefore a sufficient condition for strict descent is
\[
 \boxed{(2^A-3^N)n_0>2^{A-N}(3^N-2^N).}
\]
This condition requires \(2^A>3^N\). Equivalently, for \(q=A-N\ge0\),
\[
 2^q2^N>3^N
 \quad\text{and}\quad
 n_0>\frac{2^q(3^N-2^N)}{2^q2^N-3^N}.
\]
This is only a sufficient criterion: the correction bound can be loose.

## 3. Why this does not prove universal descent

The threshold on \(n_0\) is not uniformly small. If \(2^A\) is only slightly
larger than \(3^N\), the denominator is small and the threshold can be large.
Thus even an exponent sum above \(N\log_2 3\) does not, by itself, establish
descent for a given start value. A concrete realized block already shows that
the average-threshold heuristic is false as a universal block rule.

A universal proof needs additional information beyond \(A\) and \(N\), or
a different global potential. The exact realizability constraints are
\[
 2^{a_i}n_{i+1}=3n_i+1,\qquad n_i,n_{i+1}\text{ odd},\quad a_i\ge1.
\]
They impose divisibility and residue restrictions on the exponent word and
the starting state. Arbitrary positive exponent words are not automatically
realizable from an arbitrary start. Promising directions to investigate are:
- residue-class constraints modulo powers of two and three for a fixed word;
- sharper bounds on the prefix sums \(p_j\) using realizability, rather than
  only positivity of the remaining exponents;
- a potential combining the state with a finite memory of recent exponents;
- a finite-state or automata argument for blocks whose exponent sums lie near
  the critical boundary.

Each direction is a research obligation, not an established theorem.

## 4. Formalization target

A first Lean lemma should establish the list-level estimate
\[
 \operatorname{blockCorrection}(as)
 \le 2^{as.sum-as.length}(3^{as.length}-2^{as.length})
\]
under a proof that every exponent in \(as\) is positive. Since natural
subtraction is truncated, the proof must explicitly derive
\(as.length\le as.sum\) before using the exponent \(as.sum-as.length\).
Then derive the sufficient descent criterion without division, using natural
number inequalities. The exact block identity is already available; this new
bound is not yet kernel-checked.

## 5. Status boundary

Checked: finite-block identity and its exact descent equivalence in Lean CI.

Derived here: the correction-term bound and its sufficient descent condition.

Not proved: a uniform argument showing that every positive odd start has a
realized block satisfying the condition, or any alternative global descent
principle. Therefore this note is not a Collatz proof.
