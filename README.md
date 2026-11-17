# Lubuimi — Syracuse / Collatz research and Lean audit

**Author and copyright holder:** Ta-Yoshua Lubuimi  
**Research status date:** 17 November 2026

This repository contains research on the accelerated Syracuse map, finite valuation words, affine and residual identities, dynamic bounds, formal Lean developments, reproducible CI audits, and research manuscripts.

## Main research documents

- [Publication manuscript: dynamic residual framework and the final descent theorem](manuscript/DYNAMIC_RESIDUAL_STRICT_DESCENT_PREPRINT_2026-11-17.md)
- [Universal dynamic descent — project checkpoint](docs/COLLATZ_UNIVERSAL_DESCENT_CHECKPOINT_2026-11-17.md)
- [Backward reconstruction](manuscript/COLLATZ_BACKWARD_PROOF_RECONSTRUCTION_2026-11-17.md)
- [Consolidated project status](docs/FINAL_PROJECT_STATUS_2026-11-14.md)
- [Finite-word / terminal-residue manuscript addendum](manuscript/SYRACUSE_MANUSCRIPT_ADDENDUM_2026-11-14.md)
- [Licensing index](docs/LICENSING.md)

## Mathematical target

For the accelerated odd Syracuse orbit
\[
x_0=n,\qquad x_{k+1}=\frac{3x_k+1}{2^{g_{k+1}}},
\qquad g_{k+1}=v_2(3x_k+1),
\]
the affine and residual coordinates are
\[
2^{A_k}x_k=3^kn+C_k,\qquad
R_k=C_k+3^k-2^{A_k}.
\]
They give the exact equivalence
\[
x_k<n\quad\Longleftrightarrow\quad nR_k<(n-1)C_k.
\]

The final universal descent interface is
\[
\forall n>1\text{ odd}\ \exists N\ge1:
\quad nR_N<(n-1)C_N.
\tag{UD}
\]
The author reports that the universal dynamic descent theorem establishing this interface has been proved in prior work. The primary proof artifact and exact source mapping still need to be recovered into this repository checkpoint. The publication manuscript therefore states the theorem precisely and identifies this final proof-recovery / source-matching task without claiming that this documentation update independently proves or formally verifies the Collatz conjecture.

## Evidence policy

A finite-prefix identity, a successful Lean compilation, a CI status, and a global termination theorem are different kinds of evidence. Formal verification claims are tied to exact source commits, named declarations, axiom output, and an explicit sorryAx rejection gate. No evidence is transferred to a later commit without a new audit.

## Licensing

Original project materials are now separated by type:

- Original research manuscripts, prose, diagrams, and documentation: **CC BY 4.0**.
- Original source code and tests: **MIT**.
- Third-party, upstream, generated, and dependency materials: their own applicable licenses and notices.

See [docs/LICENSING.md](docs/LICENSING.md), [LICENSE-DOCUMENTATION-CC-BY-4.0.md](LICENSE-DOCUMENTATION-CC-BY-4.0.md), and [LICENSE-CODE-MIT.md](LICENSE-CODE-MIT.md). The former proprietary notices are retained only as historical records and are superseded for original materials expressly covered by the new licenses.

---

**Ta-Yoshua Lubuimi**  
Copyright © 2026 Ta-Yoshua Lubuimi.
