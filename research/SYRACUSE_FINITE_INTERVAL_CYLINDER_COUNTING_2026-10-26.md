# Syracuse: exact interval counting from valuation cylinders (2026-10-26)

## Purpose

This note isolates a rigorous bridge from the 2-adic valuation-cylinder picture to counting ordinary positive integer starts. It does not claim a global Collatz result.

Let S(n)=(3n+1)/2^{v_2(3n+1)} for positive odd n, and write
a_j=v_2(3n_{j-1}+1), A_k=a_1+...+a_k.
For a prescribed positive word w=(a_1,...,a_k), put A=|w|_1 and q=2^{A+1}.

The standard cylinder congruence construction associates to w a unique odd residue class r_w modulo q whose members have precisely that first k-step valuation word. This correspondence should be checked against the implementation in `syracuse_valuation_cylinder_certificate.py`; the theorem below is conditional only on that exact-cylinder lemma.

## Exact finite-interval count

For a residue class r modulo q, the number of integers n in [1,X] congruent to r modulo q differs from X/q by at most 1 (with a fixed convention for the representative r and integer X; equivalently use floor functions for the exact count).

Therefore, for a fixed word w with total valuation A, its cylinder has natural density 2^{-(A+1)} among all positive integers, and its count in [1,X] has absolute error at most 1 from X/2^{A+1}.

Now fix k>=1 and a>=k. The number of positive compositions of a into k positive parts is binomial(a-1,k-1). The corresponding length-k valuation cylinders are disjoint. Summing their individual count errors gives the rigorous bound
[
left|,#{1le nle X:n	ext{ odd and }A_k(n)=a}
-rac{X}{2^{a+1}}inom{a-1}{k-1},ight|
le inom{a-1}{k-1}.
]
Here A_k(n) is defined only while the first k accelerated odd steps are taken; every positive odd n has such a finite valuation word.

This is an explicit finite-X estimate, not just a Haar-measure statement. It has an important limitation: the additive boundary error grows with the number of words. For fixed k,a, dividing by X and sending X to infinity gives the natural-density formula. If k and a grow with X, the error need not be negligible without a separate uniform range condition.

## Exact density consequence

For fixed k and a, the natural density among all positive integers of odd starts with A_k=a is
[
2^{-(a+1)}inom{a-1}{k-1}.
]
Conditioning on odd starts divides by their density 1/2, giving
[
Pr_{	ext{odd Haar}}(A_k=a)=2^{-a}inom{a-1}{k-1}.
]
The latter is the negative-binomial law previously used in the large-deviation note. This derivation identifies precisely why the Haar formula agrees with natural density for each fixed finite cylinder: each word is one residue class modulo a power of two, and the interval discrepancy is bounded by one per word.

## What this does and does not buy

It gives a finite-interval bridge for a fixed valuation threshold and a transparent error term. It does **not** yet prove a density-one descent theorem at a growing time horizon, because that requires uniform control when k and the threshold depend on X. It also does not turn density-one descent into pointwise descent.

The affine identity remains
[
2^{A_k}n_k=3^k n_0+c_k,
qquad
log(n_k/n_0)=klog 3-A_klog 2+
sum_{j<k}log(1+1/(3n_j)).
]
To infer n_k<n_0, the valuation term must beat both k log 3 and the positive correction. The cylinder count alone supplies neither a uniform pointwise lower bound on A_k nor control of that correction for every orbit.

## Next formal targets

1. Formalize the one-word residue-class lemma with an explicit modulus (2^{A+1}).
2. Prove the finite-interval discrepancy lemma using floor/quotient arithmetic.
3. Prove disjointness of distinct word cylinders at a common depth.
4. State a uniform theorem with an explicit admissible relation between k, a and X; do not hide the boundary error in asymptotic notation.
5. Only then compare the resulting natural-density estimate with any external density-one descent theorem, checking the exact clock (raw steps versus accelerated odd steps).

## Audit status

This is a mathematical derivation and proposed formalization plan. It is not yet a Lean-checked theorem in this repository, and it is not a proof of the Collatz conjecture.
