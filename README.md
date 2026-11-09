# Collatz–Syracuse research workspace

**Author and research lead: Ta-Yoshua Lubuimi**

This repository records Ta-Yoshua Lubuimi's Collatz/Syracuse mathematical research and Lean formalization. AI tools are assistants only and are not authors or independent verifiers.

## Research record

The affine-offset and signed-margin framework and the initial valuation-one cylinder theorem are attributed to Ta-Yoshua Lubuimi. The APW4–Syracuse cylinder–energy bridge is tracked as a named research programme, not asserted as an established theorem.

- [Consolidated Collatz–Syracuse research record](COLLATZ_SYRACUSE_RESEARCH_RECORD_TA_YOSHUA_LUBUIMI_2026-11-10.md)
- [Lubuimi's Initial Valuation-One Cylinder Theorem](SyracuseInitialValuationOneCylinder_2026-11-09.md)
- [Syracuse affine offset, signed margin, and Lubuimi cylinder theorem source](SyracuseOffsetIdentity.lean)
- [Closed-form offset](SyracuseOffsetClosedForm.lean)
- [Offset lower bound](SyracuseOffsetLowerBound.lean)
- [Valuation-one margin block](SyracuseMarginBlock.lean)
- [Exact valuation transitions](SyracuseValuationTransition.lean)

## Verification

[GitHub Actions run 42717134267](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42717134267) passed on the Lean 4.34.1 / Mathlib v4.34.1 snapshot at merge commit 28003791738900f6dc456bc71d37151c1f3f8a78. It compiled the CollatzAudit library and the listed Syracuse offset, margin, and valuation modules; the offset and valuation-transition audit steps rejected sorryAx if present and completed successfully.

The Lubuimi initial-cylinder theorem has been added as a Lean declaration. Its helper lemma compiled in run 42719689591 with standard axiom profile, but the main theorem failed at the finite affine induction and terminal parity proof steps. Commit 7cbb49c694bf2812c730e2214a66989b4c9ae961 contains the next proof refinement; its CI is pending. The global Collatz conjecture is not claimed as proved. The current central obligation is to prove a positive signed margin on some finite realized block for every positive odd starting value.

## Copyright and license

Copyright © 2026 Ta-Yoshua Lubuimi. All rights reserved for original Collatz/Syracuse materials owned by the author. The repository includes [LICENSE-PROPRIETARY.md](LICENSE-PROPRIETARY.md) and [commercial licensing and remuneration terms](LICENSE-COMMERCIAL-USE-AND-REMUNERATION.md). Lean, Mathlib, and all third-party materials remain subject to their own licenses. No general open-source or commercial reuse license is granted for the author's original materials.
