# Syracuse global descent: surplus obstruction roadmap

## Status and scope

This note is a research plan, not a proof of the Collatz conjecture. The Lean project currently formalizes exact affine identities for certified accelerated-odd transitions and a necessary exponent-growth condition for descending blocks. It does not prove that every odd start has a descending block.

## Exact finite-block invariant

For odd positive iterates
\[
x_{i+1}=(3x_i+1)/2^{a_i},\qquad a_i=v_2(3x_i+1),
\]
put \(A_N=\sum_{i<N}a_i\). The existing Lean affine identity is
\[
2^{A_N}x_N=3^N x_0+C_N,\qquad
C_{i+1}=3C_i+2^{A_i},\ C_0=0.
\]
The identity is exact, but the recurrence only supplies a lower bound on \(C_N\); it does not upper-bound the correction term and therefore cannot force descent.

A useful exact integer-valued margin is
\[
M_N=2^{A_N}x_0-(3^N x_0+C_N).
\]
The affine identity gives \(M_N=2^{A_N}(x_0-x_N)\). Thus \(M_N>0\) is equivalent to strict descent, without logarithms, rounding, or a heuristic average.

A complementary valuation surplus is
\[
S_N=A_N-N\log_2 3
-\sum_{i<N}\log_2(1+1/(3x_i)).
\]
When real logarithms are admitted, the exact identity is \(S_N=\log_2(x_0/x_N)\). This is a diagnostic identity, not a bound: proving \(S_N>0\) for some N on every orbit is the missing global theorem.

## Formalization targets, in dependency order

1. Define the exact block correction recursively and prove its closed finite sum:
   \(C_N=\sum_{i<N}3^{N-1-i}2^{A_i}\).
2. Prove in Lean the integer identity
   \(2^{A_N}(x_0-x_N)=2^{A_N}x_0-3^N x_0-C_N\), with no real analysis.
3. Define the terminal surplus as an integer expression whenever a candidate exponent threshold is supplied; keep the nonintegral logarithmic formulation separate.
4. For a finite valuation word \((a_0,\ldots,a_{N-1})\), formalize its congruence class modulo \(2^{A_N}\) and prove exactness conditions for each step. Then distinguish a realizable finite word from an arbitrary word.
5. Search for a universal finite-prefix obstruction: either prove that every positive odd start has a prefix with \(M_N>0\), or produce a concrete prefix/counterexample to a proposed stronger lemma. Do not promote finite searches to a universal claim.
6. Audit all public theorems with `#print axioms`; no global claim is accepted while a needed descent/valuation hypothesis is assumed.

## Known obstruction

The average multiplier heuristic \(\sqrt 3/2<1\) and probabilistic valuation models do not control every orbit. A proof must handle exceptional valuation words, not just typical density. Recent finite-word papers also explicitly leave terminal obstruction exclusions as open obligations; their architecture can inspire definitions, but is not evidence that those obligations are solved.

## Current CI boundary

CI success means the selected Lean modules compile. It does not prove the global descent statement. The active run on the 4.34.1 toolchain must finish before the latest offset file is described as build-verified.
