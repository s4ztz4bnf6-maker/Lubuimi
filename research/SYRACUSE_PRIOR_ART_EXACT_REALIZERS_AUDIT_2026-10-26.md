Prior-art audit: exact valuation cylinders and finite-word realizers

Date: 2026-10-26

## Newly identified related work

A public Lean 4 repository, innerlightr-wq/eoc-lean-verification, describes formalization of finite-word, realizer, confinement, and single-window results through Proposition 5.9 in an accelerated 3x+1 framework. Its linked manuscript is titled A Global Occupation Conjecture for the Accelerated 3x+1 Map: Divergent-Orbit Sparsity, Exact Realizers, and the Moving-Anchor Problem (Zenodo record 21895060; all-versions DOI reported as 10.5281/zenodo.20569293). The repository description explicitly says the global occupation conjecture remains open and that some claims depend on a Tao-style valuation-mixing interface.

This is a material prior-art overlap. Finite-word realization and the gap between a finite realizer and a global divergent-orbit theorem are already active research topics. Therefore the project's terminal-cylinder realization theorem must not be described as novel merely because it constructs a residue class for a valuation word.

## Current mathematical claim to compare

For positive exponents a_0,...,a_(N-1), define A_0=0, A_(k+1)=A_k+a_k and C_0=n, C_(k+1)=3*C_k+2^A_k. The terminal congruence C_N = 2^A_N modulo 2^(A_N+1) has a unique residue class because the coefficient of n is 3^N, a unit modulo a power of two. The terminal condition propagates backward and gives exact valuations at every prefix. For the positive odd representative, division by 2^A_k yields an actual finite accelerated Syracuse orbit with exactly the prescribed exponents.

This is a clean finite theorem, but the prior-art comparison must determine whether the cited realizer results imply the same statement or a stronger version. The current web/GitHub metadata inspection has not yet established the exact theorem-by-theorem overlap, and no priority claim is made.

## The actual unresolved bridge

The residue class for a word is unique modulo 2^(A_N+1), but its least positive representative may be as large as that modulus. A finite word therefore does not automatically yield a small starting integer. The central global difficulty remains controlling the size/placement of realizers across growing windows strongly enough to rule out a positive integer orbit with non-descending behavior. Density identities and 2-adic cylinder measures do not supply this integer-scale control by themselves.

## Next audit tasks

1. Obtain the source manuscript and Lean files for the EOC project and compare their exact realization/confinement statements line by line.
2. Identify the precise realizer-size bound needed for global integer-orbit consequences.
3. Prove or refute that bound independently, with exact counterexamples at finite lengths where possible.
4. Only after this comparison should the terminal-cylinder lemma be presented as a new contribution; until then, treat it as an independently derived formulation and possible formalization route.
5. Keep any assumptions about valuation mixing explicit; do not silently replace an unproved interface with a theorem.

## Scope

No global Collatz proof, new Lean compilation, or novelty priority is claimed in this note.