# Syracuse offset project: admissibility versus realizability (2026-10-23)

## New formalization invariant

The existing file proves the exact affine identity for certified transitions and the closed-form offset sum. It also proves that the canonical offset is positive for every nonempty block and that descent is equivalent to a strict offset margin.

The next theorem should not claim a universal descent. Instead, build a *block certificate* whose fields distinguish:
- recurrence-generated offset;
- exact transition equations for every intermediate step;
- oddness of every intermediate quotient;
- exact valuation (maximality of the removed power of two);
- the terminal affine identity;
- the strict descent margin.

The existing `SyracuseBlockArithmeticCertificate` records only the affine identity and a coarse offset floor. It does not contain intermediate states or prove that its data came from an orbit. Therefore its name and comments must be read as an arithmetic certificate, not a complete orbit certificate.

## A useful exact theorem already available

For a block of length j with positive canonical offset, the code proves

`n_j < n_0 -> 3^j < 2^A`.

This implication is rigorous but only necessary. The exact criterion is

`n_j < n_0 ↔ 3^j*n_0 + C_j < 2^A*n_0`.

If `3^j ≤ 2^A`, the margin is equivalently

`C_j < (2^A - 3^j)*n_0`.

Thus the real missing ingredient is an upper bound on the *realizable* offset relative to the available multiplicative gap. The recurrence gives lower bounds on C, but lower bounds do not establish this upper margin.

## Proposed certificate-checking pipeline

1. Reject immediately if any necessary local residue condition fails.
2. Verify the exact valuation equation at each step, including oddness of the quotient.
3. Compute the canonical offset from the exponent word.
4. Verify terminal divisibility and the affine identity.
5. Evaluate the strict margin exactly in naturals.
6. Label the result as either rejected, arithmetic-block-valid, or orbit-certified. Only the last label may assert the block came from certified transitions.

This architecture can produce a sound finite checker without claiming that all possible words descend. A global Collatz proof would still need to establish descent or termination for every positive odd starting value.

## Literature boundary

Computational verification up to approximately `2^71` is substantial evidence but remains finite verification, not a universal proof. The published 2025 update reports that bound, while the full conjecture remains open. A 2026 working paper on a restricted valuation set is explicitly not peer reviewed; it can be examined as a research lead, not treated as a settled theorem.

## Status

This file records a proof architecture and mathematical boundary. It does not claim a new Lean theorem or global proof.
