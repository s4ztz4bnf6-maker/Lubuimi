# Exact residue cylinders versus orbit frequency: Syracuse audit (2026-10-25)

## New reusable reduction

For an exact accelerated odd transition
\[
2^a n' = 3n+1,\qquad n'\text{ odd},
\]
the existing theorem `exact_exponent_residue` proves
\[
3n+1\equiv 2^a\pmod {2^{a+1}}.
\]
Since 3 is invertible modulo every power of two, this pins down **one residue class** of starting odd integers modulo \(2^{a+1}\):
\[
n\equiv 3^{-1}(2^a-1)\pmod {2^{a+1}}.
\]
Examples already represented by the fixed-exponent lemmas:
- \(a=1\): \(n\equiv3\pmod4\);
- \(a=2\): \(n\equiv1\pmod8\);
- \(a=3\): \(n\equiv13\pmod{16}\);
- \(a=4\): \(n\equiv5\pmod{32}\);
- \(a=5\): \(n\equiv53\pmod{64}\);
- \(a=6\): \(n\equiv21\pmod{128}\);
- \(a=7\): \(n\equiv213\pmod{256}\).

Among odd residue classes modulo \(2^{a+1}\), there are \(2^a\) possibilities and exactly one has exact valuation \(a\). Thus the **one-step Haar/uniform-cylinder law** is \(\Pr(v_2(3n+1)=a)=2^{-a}\) for Haar-random odd 2-adic input. This is a precise finite-cylinder statement, not an empirical claim about the successive states of a single integer orbit.

## Critical obstruction to the continuous-embedding pillar

The accelerated map \(S(n)=(3n+1)/2^{v_2(3n+1)}\) does not automatically become a globally continuous self-map of all odd \(\mathbb Z_2\) merely by changing the ambient space. The point \(n_*=-1/3\in\mathbb Z_2\) satisfies \(3n_*+1=0\); on odd inputs approaching \(n_*\), the valuation tends to infinity. The quotient uses a valuation-dependent division, so continuity and even a well-defined extension at \(n_*\) require a separate argument. Compactness alone does not imply that integer orbits converge to 1.

A viable formal route is therefore:
1. formalize the inverse residue-class map for each fixed exponent;
2. prove disjointness and exact cylinder measures;
3. separately analyze the exceptional 2-adic point and continuity of any proposed extension;
4. only then attempt a dynamical theorem connecting 2-adic cylinders to ordinary integer-orbit termination.

## Falsification tests for the next Lean step

- Verify the inverse class modulo \(2^{a+1}\) for arbitrary \(a\), without assuming an unproved modular inverse.
- Check that the classes for different exact exponents are disjoint.
- Do not infer temporal independence or orbit-frequency estimates from Haar measure of one-step cylinders.
- Keep the existing weighted-offset identity separate from any unproved global balance of positive and negative corrections.

## Status

This note gives a general proof target and an explicit obstruction to a naïve continuous-flow argument. It is not a proof of the Collatz conjecture. The existing modulo-16 theorem remains subject to its CI result; the branch's last visible run was for the earlier commit and does not certify the corrected commit.
