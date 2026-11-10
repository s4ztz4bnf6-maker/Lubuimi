# Collatz literature audit: logarithmic-time natural-density descent

Date: 2026-10-24
Status: external result reviewed at the statement level; our repository has not imported or independently rebuilt it.

## Source and exact scope

The ProofAtlas page for Lech Mazur's 21 July 2026 formalization states two distinct conclusions:

- For odd starting values, odd-relative natural density one reaches below a threshold f(N) tending to infinity within at most 145 log N Syracuse steps.
- For all positive starting values, ordinary natural density one reaches below a threshold f(N) tending to infinity within at most 436 log N raw Collatz steps.

The Reddit post links this ProofAtlas page. The page reports a passed Lean build and independent review of the formal evidence, theorem statement alignment, scope, and public wording. This is a materially stronger review status than the separate Nashida fixed-barrier power-saving preprint listed on the Collatz Conjecture Challenge, which explicitly says it has not yet been reviewed by human experts. These are distinct results and must not be conflated.

## What this means for our branch

The theorem is a strong benchmark and a potential reusable external result, but it does not establish pointwise convergence: a density-zero exceptional set may remain. Its clock is measured in raw Collatz steps for the 436 bound and odd-to-odd Syracuse steps for the 145 bound. Those domains and clocks cannot be silently interchanged.

It also does not directly prove the branch's affine offset inequality for every realizable valuation word. The theorem controls a density-one family via quantitative analytic inputs; our local offset route asks for a pointwise statement about individual finite words.

## Concrete continuation tasks

1. Follow the ProofAtlas exact theorem link and record the precise Lean declaration names, pinned commit, Lean version, imported source closure, and axiom report.
2. Compare the theorem's threshold quantifiers and density definition with our definitions before considering any import or adaptation.
3. Treat the theorem as a possible corollary target for our raw/Syracuse definitions, not as a proof of global Collatz.
4. Keep the finite valuation-word congruence characterization independent: it may aid exhaustive local audits, but cannot replace the analytic density argument.
5. For the Nashida fixed-barrier result, audit its separate exact source and Matveev/Bugeaud-related hypotheses independently; do not infer review acceptance from the Mazur page.

## Sources

- ProofAtlas, Natural-Density Collatz Descent in Logarithmic Time: https://www.proofatlas.ai/formalizations/natural-density-log-time-collatz/
- Collatz Conjecture Challenge, formalization and review workflow: https://ccchallenge.org/method
- Collatz Conjecture Challenge, Nashida fixed-barrier result: https://ccchallenge.org/
- Reddit post that surfaced the ProofAtlas page: https://www.reddit.com/r/singularity/comments/1v2sgwa/ai_agents_strengthened_terence_taos_landmark/

This report is a literature and scope audit, not a Lean theorem and not an independent reproduction of the external build.
