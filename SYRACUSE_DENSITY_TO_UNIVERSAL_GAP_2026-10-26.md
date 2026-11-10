# Syracuse research note: source-aware density boundary and exact block certificates
Date: 2026-10-26
Branch: `collatz/valuation-cylinders-2026-10-26`

## External frontier incorporated

ProofAtlas publicly reports a Lean-checked result giving density-one descent below every threshold tending to infinity, with an explicit 436 log N raw-step clock in its stated density formulation. Its own scope note explicitly permits a density-zero exceptional set and does not prove convergence for every start. This is a useful benchmark for quantitative descent, not a universal Collatz proof:
https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/

The reliability lesson from Hales/Tao's October 2026 discussion is also operational: kernel checking is necessary, but exact statement alignment, source pinning, axiom inspection, and independent implementations/cross-checks address different failure modes:
https://terrytao.wordpress.com/2026/10/09/what-mathematicians-should-know-about-the-lean-theorem-proverquestions-of-reliability-and-ai/

## Exact block certificate, in a form suitable for Lean

For odd Syracuse iterates n_j and valuations a_j >= 1, put A_0=0, A_j=sum_{i<j} a_i. Induction on N gives
`2^A_N n_N = 3^N n_0 + C_N`,
where `C_N = sum_{j<N} 3^(N-1-j) 2^A_j`.

Consequently, `n_N < n_0` is equivalent to
`C_N < (2^A_N - 3^N)n_0`.
This equivalence includes the necessary positivity of the margin `M_N=2^A_N-3^N`; if M_N <= 0, descent is impossible from this certificate because C_N>0.

The proof should be split into three Lean declarations:
1. the affine identity by induction, with no probability assumptions;
2. the integer-arithmetic equivalence between the identity and strict descent;
3. a separate universal theorem asserting that every positive odd start has some N satisfying the certificate (or a different argument excluding all bad orbits).

Only (1) and (2) are local algebra. Declaration (3) is the genuine global conjectural burden and must not be postulated as an axiom.

## A precise obstruction to the density shortcut

A density-one theorem says the set of exceptions has natural density zero. It does not imply the exceptional set is empty: any singleton has density zero. Therefore the ProofAtlas density theorem cannot close the universal statement without a new arithmetic rigidity lemma that excludes every exceptional orbit.

A candidate research target is a **fixed-orbit rigidity lemma**: combine the exact valuation-cylinder congruences for every prefix with the positive offset C_N and a lower bound for the least positive representative of the compatible residue class. Such a lemma would have to be uniform in N for each fixed n_0; finite-word realizability alone is insufficient.

## Immediate audit checklist

- Correct the valuation-one run bound to k <= v_2(n_0+1); the stronger k+1 exponent is false (3 -> 5 -> 1).
- Use exact Nat/Int arithmetic for M_N and C_N; avoid floating-point estimates in the certificate.
- Inspect the actual theorem target and transitive axioms, not just the build status.
- Pin Lean/mathlib revisions and run the explicit file target.
- Where feasible, replay the final proof with an independently implemented kernel/checker. This reduces, but does not eliminate, foundational/software risk.

## Status

This note proposes a source-aware proof boundary and Lean decomposition. It is not a new proof of the Collatz conjecture, and no compilation claim is made for the declarations proposed here.


## Follow-up audit: why a 2-adic embedding is not yet a descent proof

The compactness of Z_2 does not imply that every orbit of a continuous self-map converges: continuous maps on compact spaces can have periodic or recurrent orbits. Therefore a proposed 2-adic model must identify a specific Lyapunov function, contraction estimate, or invariant-set exclusion theorem; compactness alone supplies none.

There is also a domain issue for the accelerated map T(n)=(3n+1)/2^{v_2(3n+1)}. On odd integers the valuation is finite, but the natural 2-adic exceptional point x=-1/3 satisfies 3x+1=0, and points approaching it 2-adically have unbounded valuations. Any extension to Z_2 must state its domain and prove continuity on that domain rather than assume a global continuous map. The valuation cylinders are clopen away from the exceptional point, so a useful first theorem is local constancy of v_2(3x+1) on each cylinder where it is fixed; this is not global convergence.

Research gate: do not invoke K-theory or a geodesic flow unless a concrete object and a theorem connecting it to integer descent are supplied.
