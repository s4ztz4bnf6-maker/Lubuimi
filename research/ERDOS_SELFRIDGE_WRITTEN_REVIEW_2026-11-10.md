# Written Review — Erdős–Selfridge Lean Audit

**Author:** Ta-Yoshua Lubuimi  
**Review date:** 10 November 2026  
**Review type:** Internal source-fidelity and formalization review; not independent peer review.

## 1. Current audited snapshot

The audit branch is at exact commit b27765f601a46ad103ea020d9fc246a5bb6693ec. Workflow 40438579953 completed successfully under Lean 4.34.1 and built the configured project modules. The run is a successful compilation/audit workflow, but it is not a proof of the unrestricted Erdős–Selfridge theorem.

The principal conditional declaration is
erdos_selfridge_conditional_on_admitted_sieve_interfaces.
Its transitive axiom profile is:
[admitted_sf_sieve_certificate_exists, admitted_sieve_criterion, propext, Classical.choice, Quot.sound].

## 2. Explicit admitted interfaces

The source contains two named admitted interfaces:

1. admitted_sieve_criterion — supplies the sieve criterion under the declared positive/length-validity conditions.
2. admitted_sf_sieve_certificate_exists — supplies existence of a finite certificate with positive valid delta parameters and the matching length condition.

These are mathematical obligations, not harmless Lean conveniences. The conditional Erdős–Selfridge theorem depends on both. Therefore the main theorem is not yet independently proved in Lean under the target standard axiom profile.

## 3. Degenerate-delta audit

The previously identified degeneracy is real at the level of the raw definitions: an empty delta list can make a product over no factors equal one, and totalized rational division has a defined value even when a denominator is zero. Such behavior must never be mistaken for a positive sieve certificate.

The current admitted interfaces explicitly return:
- positivity and strict upper bounds for the delta parameters;
- equality of the delta-list length with the nonsquarefree block-size list.

These hypotheses guard the empty/misaligned-list path for uses covered by those interfaces. They do not prove that a valid certificate exists. The certificate-existence axiom is precisely where the mathematical work remains.

## 4. Source-fidelity obligations

The next audit must reconstruct the original Balister–Bollobás–Morris–Sahasrabudhe–Tiba definitions and proof chain, especially the exact sieve criterion, finite certificate construction, parameter ranges, and all endpoint/zero-mass cases. No free noCodimOne premise, getD fallback, or totalized rational division may substitute for the original mathematical existence argument.

The historical theorem, its source reconstruction, and the current conditional Lean formalization must remain distinct. A successful build of a conditional theorem is not a proof of the original theorem.

## 5. Local formalization status

The CI log also reports standard-profile local declarations for the finite probability, fibre, moment, and stage components that were included in this snapshot. These are useful verified components, but their local success does not remove the two admitted global interfaces.

The separate BBMST dependent-stage PR chain #42–#49 is tracked independently in repository Lubuimi-. Its exact-commit results must not be silently merged into the status of this audit branch.

## 6. Next proof obligations

1. Replace admitted_sieve_criterion with a theorem derived from the original sieve definitions and hypotheses.
2. Construct the finite positive delta certificate explicitly and prove admitted_sf_sieve_certificate_exists without an axiom.
3. Prove all list-length, positivity, endpoint and zero-mass conditions from the source definitions rather than returning them as part of an admitted witness.
4. Audit getD and rational-division branches under the exact source hypotheses.
5. Re-run the exact Lean 4.34.1/Mathlib build, print the main theorem's full transitive axiom profile, and require the standard profile only.

**Verdict:** the configured Lean project compiles successfully on the listed commit, but the main Erdős–Selfridge declaration remains conditional on two explicit admitted axioms. This is not a completed formal proof of the theorem.

**Attribution:** Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers.
