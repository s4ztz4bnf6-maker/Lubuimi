# Mixed-exponent margin: next formal target (2026-10-25)

## Verified CI state

Workflow run 40147868041 completed successfully on branch
`collatz/offset-margin-roadmap-2026-10-23`. The job reports success for the library build, IterationLemmas, ThresholdLemmas, SyracuseReferenceTest, SyracuseQuarterDescent, the offset identity, strict-margin consequence, closed-form offset theorem, stronger offset lower bound, exact valuation-one block margin, and the valuation-one-to-two transition.

The successful job is evidence for those listed files and checks only. It is not a proof of the global Collatz conjecture.

## Exact algebraic interface

For the accelerated odd map, a certified exponent word has
\[
A_{j+1}=A_j+a_j,\qquad
C_{j+1}=3C_j+2^{A_j},
\]
and the affine identity
\[
2^{A_j}n_j=3^j n_0+C_j.
\]
The signed margin satisfies
\[
M_{j+1}=3M_j+2^{A_j}(2^{a_j}-4).
\]
Its weighted expansion is already formalized as `signedOffsetMargin_eq_weighted_sum`.

For a finite word of length \(N\), define
\[
P_N=\sum_{\substack{j<N\\a_j\ge3}}
3^{N-1-j}2^{A_j}(2^{a_j}-4),\qquad
D_N=\sum_{\substack{j<N\\a_j=1}}
2\cdot3^{N-1-j}2^{A_j}.
\]
Since exponent 2 contributes zero, the intended exact split is \(M_N=M_0 3^N+P_N-D_N\). With the canonical initial margin \(M_0=0\), it reduces to \(M_N=P_N-D_N\).

## Next formal proof obligations

1. Formalize the positive/negative contribution split as an identity over finite sums.
2. Add a realizability predicate for exponent words derived from exact valuation equations, rather than treating arbitrary words as actual trajectories.
3. Search for a local residue-class theorem that constrains the positive and negative contributions for realizable words.
4. Any proposed block bound must account for the weights \(3^{N-1-j}2^{A_j}\); a plain average exponent or a density heuristic is insufficient.
5. Convert any successful finite-word statement into a descent theorem only with the exact affine identity and positivity hypotheses in scope.

## Explicit limitation

Long finite runs of exponent 1 are realizable, so a universal short-run assumption is invalid. The margin identities provide exact local thresholds but do not by themselves prove that every orbit eventually descends.
