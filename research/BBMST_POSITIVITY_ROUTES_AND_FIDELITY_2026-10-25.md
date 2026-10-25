# Research continuation: BBMST positivity and source fidelity
Date: 2026-10-25

## Core algebra
For a finite index set S with weights p_i, sum p_i = 1, and alpha_i in [0,1], define
  mu = sum_i p_i alpha_i,
  V = sum_i p_i (alpha_i - mu)^2,
  Q = sum_i p_i alpha_i (1-alpha_i).
Then
  Q = mu(1-mu) - V.
Consequently Q>0 iff V<mu(1-mu). This identity is a reduction, not a proof of strict positivity.

Counterexample to any normalization-only argument: p=(1/2,1/2), alpha=(0,1) gives mu=1/2, V=1/4 and Q=0.

## Two non-equivalent proof routes
A. Variance route: prove a strict upper bound V < mu(1-mu) from the actual geometric/probabilistic hypotheses.
B. Interior-witness route: prove there is an index i with p_i>0 and 0<alpha_i<1, while all weights are nonnegative and all alpha_j lie in [0,1]. Then the i-th summand is positive and every other summand is nonnegative, so Q>0.

The Lean theorem finite_weighted_interior_mass_pos_of_interior_point encodes route B. It does not prove that the BBMST construction supplies the required witness. The variance equivalence theorem encodes route A's exact algebraic endpoint but does not prove the strict variance bound.

## Source-fidelity and open obligations
The project must recover the original source's definitions and hypotheses for the finite probability spaces, hyperplanes, R_k/N_k/B_k and alpha_k, and the relevant lemma/equations. Do not replace the source's geometric claim with an invented assumption such as a free noCodimOne, isNontrivial, isParallel, or codimOne premise.

The following obligations remain distinct:
1. prove the combinatorial partition and cardinality identity;
2. prove nonnegative weights and exact normalization, including degenerate/empty cases;
3. derive interior mass positivity from source hypotheses;
4. derive the strict sieve implication with zero denominators and empty delta cases handled;
5. audit all transitive axioms and compare the formal theorem statement to the source theorem.

The existing project draft still contains project-level assumptions such as sieve_criterion / sf_sieve_lt_one; while these remain in the dependency graph, the original conjecture must not be described as proved. Also verify that the formal definition of the covering system matches the source's square-free-modulus hypotheses.

## Current verification boundary
The variance identity and interior-witness theorem are present in BBMSTFiberMassCore.lean. The CI run for the recent revision was still in progress at the time this note was written, so the latest changes must not yet be described as compiled successfully. Standard Lean foundations such as propext, Classical.choice, and Quot.sound are different from project-specific unproved assumptions.

## Useful external methodological sources
- Terence Tao / Thomas Hales, What mathematicians should know about the Lean theorem prover: questions of reliability and AI (2026-10-09): https://terrytao.wordpress.com/2026/10/09/what-mathematicians-should-know-about-the-lean-theorem-proverquestions-of-reliability-and-ai/
- Quanta Magazine, Why the Legendary Erdős Problems Are Falling to AI (2026-08-03): https://www.quantamagazine.org/why-the-legendary-erdos-problems-are-falling-to-ai-20260803/

The methodological takeaway is to separate kernel checking from statement fidelity and literature novelty checking. A checked formal proof can prove a statement weaker or different from the intended theorem; conversely, a plausible argument does not become a proof until checked.
