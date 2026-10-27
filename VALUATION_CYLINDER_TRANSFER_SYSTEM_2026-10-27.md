# Valuation-cylinder transfer system: next exact Collatz research target
Date: 2026-10-27

Status: research design and proof obligations, not a proof of Collatz and not a Lean build claim.

## 1. The bottleneck exposed by the carry audit

For odd Syracuse steps
\[
2^{a_j}n_{j+1}=3n_j+1,\qquad a_j=v_2(3n_j+1),
\]
the exact block identity is
\[
2^{A_N}n_N=3^Nn_0+R_N,\quad
A_N=\sum_{j<N}a_j,\quad
R_{j+1}=3R_j+2^{A_j}.
\]
A statistic such as the average of the \(a_j\) forgets the order-dependent term \(R_N\). The global proof gap is not a missing numerical experiment: it is the lack of a theorem that constrains all *nested, realized* valuation cylinders.

## 2. Proposed structure: a valuation-cylinder transfer graph

For a finite word \(w=(a_0,\ldots,a_{N-1})\) of positive integers, define its exact cylinder recursively:
- start with odd positive integers;
- at stage \(j\), retain only inputs for which the current iterate satisfies \(v_2(3n_j+1)=a_j\);
- record the induced residue constraints and the exact affine state \((A_j,R_j)\).

The state label \((A_j,R_j)\) is updated deterministically by
\[
(A,R)\mapsto(A+a,\;3R+2^A)
\]
when the next valuation is \(a\). This is a transfer graph with arithmetic edge labels, not a probabilistic assumption. A finite enumeration can verify individual cylinders, but no frequency observed in a finite sample is a pointwise theorem about every infinite path.

### Research hypothesis to test, not assume

A potentially useful statement would bound the number or structure of cylinders whose corrected drift stays nonpositive, with a bound uniform in the depth and compatible with nesting. Merely showing that their proportion tends to zero would establish at most a density-one result, not the full conjecture.

## 3. Falsification-first experiment

For increasing depths \(N\):
1. Enumerate valuation words only through exact residue constraints, not by sampling ordinary integers alone.
2. Compute \((A_N,R_N)\) using integers.
3. For each cylinder, test the exact descent condition
   \[
   (2^{A_N}-3^N)n_0-R_N>0.
   \]
4. Search for counterexamples to any proposed *uniform* block bound. Store a failing word, its residue certificate, and the exact arithmetic witness.
5. Keep finite-prefix existence separate from a single infinite path: a different start may realize each longer prefix.

## 4. Candidate theorem hierarchy

**T1 (formal bookkeeping).** Prove the affine block identity by induction from the transition equations.

**T2 (cylinder correctness).** Prove that the recursive residue construction accepts exactly those starting integers whose first \(N\) valuations equal the word.

**T3 (local descent equivalence).** Prove that the integer potential
\[
L_N(n_0)=(2^{A_N}-3^N)n_0-R_N
\]
is positive exactly when the realized block ends below its start.

**T4 (global bridge, still open).** Prove that every odd \(n_0>1\) has some finite realized block with \(L_N(n_0)>0\), or prove a different global potential theorem. T1–T3 do not imply T4.

## 5. Soundness boundary

This is a proposed organization of the search, not a claim of novelty in the literature, a completed formalization, or a solution. The key possible contribution would be a proved uniform nesting/covering theorem for the bad cylinders. If no such theorem is found, the project should record the obstruction rather than promote empirical mixing to a proof.
