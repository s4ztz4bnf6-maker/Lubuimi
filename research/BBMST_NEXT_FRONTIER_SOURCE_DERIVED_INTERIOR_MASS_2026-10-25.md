# Next frontier: source-derived strict interior mass (2026-10-25)

## Why this is the next theorem, not another algebra lemma

The formal core already proves the finite weighted variance identity
\[
Q=\sum_i p_i\alpha_i(1-\alpha_i)=\mu(1-\mu)-V.
\]
It also contains the sharp two-point endpoint obstruction: \(p=(1/2,1/2)\), \(\alpha=(0,1)\), hence \(\mu=1/2\) but \(Q=0\). Re-proving conservation or positivity under \(0\leq\alpha_i\leq1\) will not close the gap.

The exact next obligation is to construct the BBMST \(\alpha_k\) from the paper's finite probability space and prove that the geometry/update rule excludes the endpoint-only distribution whenever the target lower bound requires it. No abstract predicate such as `isNontrivial` or assumed variance gap is admissible as a substitute.

## A falsifiable proof-obligation split

1. **Representation:** define the finite sample space and its probability weights exactly as in the source; state whether weights are uniform or induced by a prior update.
2. **Fiber construction:** define the relevant hyperplane/coordinate label map and derive each fiber mass from the map, not from unrelated variables.
3. **Endpoint classification:** characterize \(\alpha=0\) and \(\alpha=1\) directly from the source definitions. Identify the exact source hypothesis that rules out an all-endpoint configuration, if one exists.
4. **Quantitative step:** only after (1)-(3), derive either a positive-weight interior witness \(0<\alpha_i<1\), or a strict variance estimate \(V<\mu(1-\mu)\). These are alternatives, not assumptions.
5. **Tail/statement bridge:** separately formalize the finite certificate, large-prime recurrence, and the precise square-free covering-system statement. Do not transfer a theorem to arbitrary distinct odd moduli without a proved bridge.

## Immediate adversarial tests

- Empty finite sample space; zero total mass; singleton fiber; all \(\alpha_i=0\); all \(\alpha_i=1\); mixed endpoint-only proportions; repeated labels; and a fiber with zero mass.
- Check whether any denominator appears before its strict positivity is proved.
- Check that the paper's symbols \(R_k,N_k,B_k,\alpha_k\) have source-matching meanings, not merely matching names.

## Four-pillar interpretation

The useful meta-structure here is a *fiber-measure interface*: combinatorial geometry supplies a finite map; the map induces fibers; the probability measure supplies weights; the algebraic identity transfers fiber proportions to global mass. This is a precise interface, not a claim that a higher-dimensional or algebraic-variety reformulation automatically gives positivity.

## Exit criterion

The next milestone is a Lean theorem deriving the required interior-mass/variance bound from explicit source-faithful hypotheses, with no admitted helper and with transitive axiom output recorded. Until that theorem and the separate sieve/tail obligations are closed, the Erdős–Selfridge result remains unproved.
