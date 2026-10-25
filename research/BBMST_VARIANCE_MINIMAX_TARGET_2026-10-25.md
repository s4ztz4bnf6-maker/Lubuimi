# BBMST research update: variance obstruction and finite minimax target
Date: 2026-10-25

## Scope
The target is the source-faithful BBMST square-free-moduli argument and, separately, the unrestricted odd distinct covering-system conjecture. They must not be conflated. This note specifies a quantitative interface for the moment argument; it does not establish the missing geometric estimate.

## 1. Exact variance decomposition
Let p_i>=0, sum_i p_i=1, 0<=alpha_i<=1, and
mu=sum_i p_i alpha_i, V=sum_i p_i(alpha_i-mu)^2.
Expansion gives
Q:=sum_i p_i alpha_i(1-alpha_i)=mu(1-mu)-V.
Therefore a target bound Q>=delta is equivalent to
V<=mu(1-mu)-delta.
This isolates the exact missing obligation: a mean bound alone cannot yield a positive lower bound on Q.

## 2. Sharp obstruction to a mean-only argument
Take two points with weights p_1=p_2=1/2, and alpha_1=0, alpha_2=1. Then mu=1/2, but Q=0 and V=1/4. Thus even the central mean mu=1/2 does not by itself imply positive removed mass. Any proof that derives a uniform positive Q must use additional geometry, support restrictions, or a quantitative variance bound.

## 3. Alternative interior-mass route
For a set S with epsilon<=alpha_i<=1-epsilon,
Q>=epsilon(1-epsilon) sum_{i in S} p_i.
This is a valid route only if the lower bound on sum_{i in S} p_i is derived from the original BBMST finite probability space and hyperplane/fiber definitions. It must not be inserted as a free assumption.

## 4. Finite minimax/LP route (research proposal, not theorem)
For each finite configuration, encode admissible weights and incidence constraints as a rational polytope. Minimize Q (or a linearized auxiliary variable with constraints bounding alpha_i(1-alpha_i)) over that polytope. Then:
- use exact rational arithmetic to obtain a candidate extremizer;
- obtain a dual LP certificate for the proposed lower bound;
- translate the certificate into a finite Lean theorem;
- prove a source-faithful reduction from the BBMST geometric configuration to that polytope;
- only then attempt induction in rank or a uniform family argument.

Caution: Q is quadratic in the alpha_i; an LP encoding is not automatic. A correct linearization needs additional variables and constraints that preserve the intended lower bound, or one must use a quadratic/semidefinite certificate instead. A numerical optimizer or finite configurations alone are not a proof of the uniform theorem.

## 5. Formal audit gates
1. Build on the declared toolchain.
2. Prove exact finite partition and mass conservation lemmas.
3. Audit transitive axioms, including project-specific placeholders such as sieve_criterion and sf_sieve_lt_one.
4. Check that the Lean statement matches the original BBMST definitions and includes nonempty-space / nonzero-denominator side conditions.
5. Keep square-free moduli and arbitrary odd distinct moduli as separate theorem targets.

## Non-claims
This note does not prove the BBMST quantitative geometric estimate or the unrestricted Erdős–Selfridge conjecture. It identifies a sharp obstruction to mean-only arguments and a certificate-oriented research route.
