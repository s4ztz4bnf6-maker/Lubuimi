# Carry-cocycle Lyapunov route: research note (2026-10-27)

Status: candidate framework, not a proof of Collatz. No Lean compilation is claimed for this note.

## 1. Exact block arithmetic

For odd Syracuse iterates, write
\[
2^{e_i}x_{i+1}=3x_i+1,\qquad e_i=v_2(3x_i+1)\ge1.
\]
Let \(E_r=\sum_{i<r}e_i\). Iterating gives the exact identity
\[
2^{E_r}x_r=3^r x_0+C_r,
\]
where \(C_r>0\) is the accumulated contribution of the additive \(+1\) terms. Hence
\[
\log(x_r/x_0)=r\log3-E_r\log2+
\log\left(1+\frac{C_r}{3^r x_0}\right).
\]
This separates the valuation budget from the positive affine-offset correction. It is an identity, not a descent theorem.

## 2. New candidate structure: carry-state cocycle

Instead of assigning a block a scalar “entropy” from its Hamming weight alone, attach a finite carry trace to the binary multiplication-by-3 computation. For a word \(w\) and its compatible carry path \(c\), consider a potential
\[
\Phi(w,c)=\lambda |w|_1+\sum_j\psi(c_j,w_j)+B(c_{\rm in},c_{\rm out}),
\]
where \(|w|_1\) counts one-bits and \(B\) is an explicit boundary correction. This is only a candidate design: coefficients must be discovered and then proved to satisfy a concatenation inequality.

## 3. Proof obligations that expose the actual bottleneck

1. Exact transducer correctness, including leading and terminal carries.
2. A concatenation law with a rigorously bounded boundary term.
3. A coupling between potential change and the exact logarithmic growth identity above.
4. A deterministic worst-case bound for every admissible carry trace. Average-case randomness is insufficient.
5. A theorem turning that bound into a strict descent certificate, then strong induction to termination.

The hardest obligation is item 4. Multiplication by 3 has congruence structure; visual bit mixing or empirical entropy cannot rule out exceptional infinite paths. A finite-state potential is useful only if its universal inequality survives exhaustive search for counterexamples and then receives a proof.

## 4. Falsification protocol

For each proposed finite-state potential, enumerate all compatible carry words up to length L and search for a violating concatenation or drift inequality. A counterexample rejects the candidate. Passing finite tests only supports the conjecture; it does not prove the infinite statement.

## 5. Scope warning: divergence is stronger than nontermination

The statement \(x_k\to\infty\) means every bounded interval is eventually avoided. An unbounded trajectory need not tend to infinity; it could return below a fixed bound infinitely often. For a deterministic map on positive integers, a bounded infinite orbit is eventually periodic. Thus a proof of Collatz termination needs a universal descent argument (or equivalent exclusion of every nontrivial cycle and nonterminating unbounded orbit), not just a claim that trajectories “usually grow” or “usually shrink.”

## Acceptance gate

Do not claim success until the exact definitions, the universal drift/descent theorem, the implication to termination, and the final theorem's transitive axioms audit are checked in Lean with no proof placeholders. This note itself is not compiled Lean code.
