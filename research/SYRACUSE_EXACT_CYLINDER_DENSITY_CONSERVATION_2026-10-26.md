# Syracuse valuation cylinders: exact density conservation target

Date: 2026-10-26

## Status

This is a new mathematical deduction and a formalization target, not yet a Lean theorem and not a Collatz proof. It extends the existing exact-word cylinder note by identifying a mass-conservation identity that is strong enough to test the whole finite-word encoding.

## 1. One cylinder per exponent word

Fix a word a=(a_0,...,a_{N-1}) of positive integers. Put A_0=0, A_{k+1}=A_k+a_k, and C_0=n, C_{k+1}=3C_k+2^{A_k}. Write

C_N = 3^N n + S_a,  S_a = sum_{j<N} 3^{N-1-j} 2^{A_j}.

The endpoint exactness condition is

C_N = 2^{A_N} (mod 2^{A_N+1}).

Since 3^N is a unit modulo 2^{A_N+1}, this condition defines exactly one residue class for n modulo 2^{A_N+1}. The prefix congruence argument in the existing exact-word cylinder note shows every prefix valuation is exact. Thus this class is the cylinder of starts whose first N accelerated Syracuse exponents are exactly a.

For N=0, treat the empty word separately: its cylinder is simply the odd starts, with density 1/2.

## 2. New identity: exact density conservation

For a fixed word a, the cylinder is one residue class modulo 2^{A_N+1}, hence has natural density

  dens(Cyl(a)) = 2^{-(A_N+1)}.

For fixed N>=1, the number of positive exponent words with total A_N=A is the number of compositions of A into N positive parts:

  #{a in (Z_{>0})^N : sum a_i=A} = binom(A-1,N-1).

Consequently,

  sum_{a in (Z_{>0})^N} dens(Cyl(a))
  = sum_{A=N}^infinity binom(A-1,N-1) 2^{-(A+1)}
  = 1/2.

The last equality follows from the generating function
  sum_{A=N}^infinity binom(A-1,N-1)x^A = (x/(1-x))^N
at x=1/2.

Interpretation: at every fixed accelerated time N, the valuation cylinders account for exactly all odd starting integers in density. This is a consistency/conservation law for the coding, not a descent estimate. It does not imply that any orbit reaches 1; it does not control the sizes of representatives in the cylinders.

## 3. Why this is useful

1. It gives a global checksum for the exact-word model: a missing word, duplicated cylinder, wrong modulus exponent, or parity mistake should break the mass identity.
2. It cleanly separates two problems:
   - combinatorial coverage: all odd starts are partitioned by exact exponent words;
   - arithmetic descent: show a sufficiently large or sufficiently numerous portion of cylinders has a small representative or a useful endpoint bound.
3. It suggests a Lean-friendly sequence: first prove the finite composition count; then prove the finite truncation identity; then prove the infinite generating-function identity in a separate real-analysis lemma. For a completely formal proof, do not infer an infinite sum identity from finite tests.
4. It suggests a rigorous computational test: enumerate words with total exponent bounded by B, sum exact rational masses, and compare the missing tail to the exact negative-binomial tail bound. Keep this diagnostic separate from the formal theorem.

## 4. Next Lean targets

A. Define positive compositions of A into N parts and prove their cardinality is Nat.choose (A-1) (N-1).

B. Prove the exact rational finite sum over A=N,...,B of choose(A-1,N-1) / 2^(A+1), then derive a closed form or a monotone tail bound.

C. Prove the residue-class cylinder theorem with ZMod (2^(A_N+1)), including the N=0 branch, and the prefix-exactness lemma.

D. Define the actual accelerated Syracuse step only after proving divisibility, positivity, and oddness of each quotient state.

E. Add an axiom audit and adversarial statement audit. In light of 2026 Lean kernel/runtime incidents, retain ordinary lake build, export/recheck the proof artifact, and run a current independent checker/comparator when available. #print axioms is necessary but not a kernel-soundness certificate by itself.

## 5. External formalized results to use as boundaries, not substitutes

ProofAtlas reports a Lean-checked natural-density-one theorem: for growing thresholds, almost all starts descend below the threshold in logarithmic time (145 accelerated Syracuse steps for odd-relative density; 436 raw Collatz steps for ordinary density). It explicitly leaves a density-zero exceptional set and does not prove convergence of every start or arrival at 1. See https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/ and the formalization catalog https://www.proofatlas.ai/formalizations/.

The present cylinder identity is compatible with those results, but does not imply them. The promising bridge is to express the density theorem's valuation-prefix counts in the same cylinder language and compare the exact cylinder masses with the paper's quantitative descent bounds.

## Acceptance status

- Algebraic identity: derived on paper.
- Exact cylinder density: derived, conditional on the unique-residue-class theorem.
- Mass-conservation identity: derived via the negative-binomial generating function.
- Lean proof: not yet added or checked.
- Global Collatz conjecture: open in this project.
