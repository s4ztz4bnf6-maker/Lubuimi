# Syracuse research frontier: exact valuation-one run obstruction (2026-10-26)

## Goal

Exploit the exact arithmetic consequence of a long block in which every accelerated exponent is one, without incorrectly assuming such blocks have a fixed universal maximum length.

## Exact identity

For odd-to-odd transitions with exponent one,
\[
2n_{j+1}=3n_j+1.
\]
Adding 2 to both sides gives
\[
2(n_{j+1}+1)=3(n_j+1).
\]
Iterating for a block of length k yields
\[
\boxed{2^k(n_k+1)=3^k(n_0+1).}
\]

This is stronger and more directly interpretable than the affine-offset expression alone. Since n_k+1 is an integer and gcd(2^k,3^k)=1, it implies
\[
2^k\mid(n_0+1),
\qquad n_0\equiv -1\pmod{2^k}.
\]
For n_0 >= 1 this in turn gives 2^k <= n_0+1, so
\[
k\le \lfloor\log_2(n_0+1)\rfloor.
\]

Thus exponent-one runs can be arbitrarily long across different starting values, but a run from a fixed n_0 has a logarithmic length bound. This does not prove Collatz termination: it only constrains one particular local pattern.

## Proof of the identity

The one-step equality is exact:
2(n_{j+1}+1) = 3n_j+1+2 = 3(n_j+1).
Induction multiplies the left-hand scale by 2 and the right-hand scale by 3 at each step. No asymptotic estimate or independence assumption about valuations is involved.

The divisibility consequence uses coprimality of 2^k and 3^k. In Lean, formalize it as a separate lemma rather than relying on the linear arithmetic solver to infer a nonlinear divisibility fact from the closed form. Useful interfaces are Nat.Coprime, divisibility cancellation under coprimality, and the exact lemma names available in the pinned Mathlib version; the actual library API must be checked before committing code.

## Research significance

This yields a clean stress-test for proposed block methods:
- A claim that valuation-one blocks have a fixed global length bound is false.
- A claim that one fixed start can have arbitrarily long consecutive valuation-one steps is also false.
- Any block-descent theorem should use the start-dependent congruence/length constraint, then handle mixed-exponent blocks separately.

## Next formal obligations

1. Add a theorem deriving 2^k * (n k + 1) = 3^k * (n 0 + 1) from the first k exponent-one transitions.
2. Prove the divisibility consequence with the pinned Mathlib API and print its transitive axioms.
3. Check the bound on small values by exhaustive computation as a diagnostic, not as proof.
4. Combine the result with the exact general offset identity only where the hypotheses really match.
5. Do not infer global descent: the missing theorem is still a global control on mixed exponent blocks or a well-founded descent measure.

Status: hand proof established; Lean formalization and CI verification are not yet claimed.
