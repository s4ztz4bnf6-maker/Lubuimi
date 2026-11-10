# Research continuation: first-passage certificates beyond residue counting

Date: 2026-10-23

## New strategy: separate the universal claim into a first-passage theorem and a finite verification layer

For the accelerated odd Syracuse map, let n_{j+1}=(3 n_j+1)/2^{a_j}, where a_j=v_2(3n_j+1). For a fixed realized word of length k, set A_k=sum_{j<k}a_j and C_0=0, C_{j+1}=3C_j+2^{A_j}. Then 2^{A_k} n_k=3^k n_0+C_k.

Writing D_k=2^{A_k}-3^k, strict descent is equivalent to C_k < D_k n_0. This is useful only for D_k>0 and a genuinely realized word. If D_k<=0, this particular block cannot certify descent by this inequality.

## New proof-engineering strategy

1. For each exact word prefix, carry its modulus, residue representative (if the cylinder is nonempty), and all stagewise exact-valuation side conditions.
2. Define a proposition FirstDescentWithin(n,K): there exists k<=K with n_k<n, with the finite trajectory as witness.
3. Prove certificate-checker soundness: a checked finite certificate implies FirstDescentWithin.
4. Search for a uniform K(N) on a bounded domain 1<n<=N and prove the finite claim by exhaustive computation with a checkable certificate. This remains a bounded theorem; do not extrapolate it to all n.
5. Isolate the global gap as a uniformity question: prove a bound K(n) for every n, or a separate invariant bounding K(n) in terms of n. Testing many n does not establish this uniformity.

## Why this differs from density arguments

A density-one theorem controls all but a small proportion in a specified limiting sense; it does not exclude one exceptional infinite trajectory. The first-passage formulation makes the missing universal quantifier explicit and avoids treating residue-class frequency as a termination proof.

## Formalization targets

- A data type for a finite trajectory certificate.
- A proposition asserting each transition is exact: divisibility by 2^a and nondivisibility by 2^(a+1).
- A theorem connecting certificate validity to the affine identity.
- A sound finite checker for bounded first passage.
- No sorry, no project-specific axiom, and no claim of global termination until the uniformity lemma is proved.

## Literature boundary

Parity/residue trees and 2-adic coding organize finite prefixes; Tao's almost-all result provides distributional information but not a universal stopping-time bound. This is a proof-engineering route for exposing the remaining theorem, not a claim that the open global step has been solved.
