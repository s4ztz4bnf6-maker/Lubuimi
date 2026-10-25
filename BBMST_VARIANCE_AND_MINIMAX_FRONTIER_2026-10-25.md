# BBMST moment gap and current covering-system frontier

Date: 2026-10-25

Status: algebraic identity and proof-plan update. No global Erdős–Selfridge theorem is claimed; this note is not a Lean-checked proof.

## 1. Exact moment-gap identity

Let (p_i) be a finite probability distribution, p_i>=0 and sum_i p_i=1, and let alpha_i in [0,1]. Put
  mu = sum_i p_i alpha_i,
  Var_p(alpha) = sum_i p_i (alpha_i-mu)^2.
Then
  sum_i p_i alpha_i(1-alpha_i) = mu(1-mu) - Var_p(alpha).

Proof: sum p_i alpha_i(1-alpha_i)=mu-sum p_i alpha_i^2, while Var=sum p_i alpha_i^2-mu^2. Substitute.

This identity is useful diagnostically: controlling only the mean mu does not provide a positive lower bound on the BBMST moment gap. Dispersion can consume the full mu(1-mu) term. A proof needs a geometric restriction on the fiber parameters, or a lower bound on mass in an interior interval.

For any S with epsilon<=alpha_i<=1-epsilon on S,
  sum_i p_i alpha_i(1-alpha_i) >= epsilon(1-epsilon) sum_{i in S} p_i.
The algebra is elementary. The hard step is to prove that the source-defined hyperplane/fiber geometry forces a quantitatively positive interior mass, while treating zero-mass fibers and alpha=0,1 correctly.

## 2. Preserve theorem scope

The peer-reviewed BBMST paper proves the square-free-moduli special case of the Erdős–Selfridge odd distinct covering-system conjecture. It does not by itself settle the unrestricted conjecture for arbitrary distinct odd moduli. Primary references:
- Published article record: https://ora.ox.ac.uk/objects/uuid:3c55267c-60be-4652-89a7-db3db5f62c25
- Publisher-hosted paper PDF: https://par.nsf.gov/servlets/purl/10300177
- BBMST supplemental source code and certificates: https://people.maths.ox.ac.uk/balister/Erdos-Selfridge.html

## 3. New external frontier lead, not yet independently reproduced

The ProofAtlas collaboration page for the unrestricted odd distinct covering-system conjecture currently reports two separate blockers in its own working route:
- a universal full-p depth-two minimax inequality for all placements of twenty mixed shallow depth types;
- an arbitrary-rank continuation / rank-stable normalized potential.

It also reports a failed scalar H=2 functional and an exact integer dual obstruction, but those computations have not been independently run or checked in this repository. Treat these as source-reported research leads, not established lemmas:
https://www.proofatlas.ai/collaboration/odd-distinct-covering-system-conjecture/

This route concerns the unrestricted conjecture and must not be conflated with the BBMST square-free theorem's source-faithful proof chain. The definitions of its profile state, measure, exponent padding, and dual certificate must be recovered before any of it is used in Lean.

## 4. Concrete next proof milestones

1. Keep the algebraic moment identity independent from geometry and formalize it over finite sums.
2. Audit the actual BBMST paper definitions and exact theorem statements against the current Lean declarations.
3. Make the finite partition/fiber normalization and mass-conservation lemmas explicit, including empty and zero-mass cases.
4. Derive the required interior-mass lower bound from the paper's actual hyperplane setup. Do not postulate it as an axiom or hide it in a sieve criterion.
5. If investigating the ProofAtlas minimax route, first formalize its exact state space and constraints, then reproduce its claimed dual obstruction with rational/integer arithmetic and a replayable certificate.
6. Run Lean compilation and transitive axiom auditing on the exact target theorem. Accept legitimate foundational axioms only under an explicit trust policy; reject project-specific unproved axioms, sorry, and hidden placeholders.

## 5. Evidence boundary

The moment identity is an elementary proved algebraic fact. The ProofAtlas route is an external lead that needs reproduction. Neither item solves the unrestricted conjecture. The current project must continue to distinguish: (i) source theorem validity, (ii) formal statement fidelity, (iii) kernel-checked proof term, and (iv) completeness of the overall theorem assembly.
