# Collatz–Syracuse research workspace

**Author and research lead: Ta-Yoshua Lubuimi**

This repository records Ta-Yoshua Lubuimi's Collatz/Syracuse mathematical research and Lean formalization. AI tools are assistants only and are not authors or independent verifiers.

## Research record

- [Consolidated Collatz–Syracuse research record](COLLATZ_SYRACUSE_RESEARCH_RECORD_TA_YOSHUA_LUBUIMI_2026-11-10.md)
- [Lubuimi's Initial Valuation-One Cylinder Theorem](SyracuseInitialValuationOneCylinder_2026-11-09.md)
- [Syracuse affine offset and signed margin source](SyracuseOffsetIdentity.lean)
- [Closed-form offset](SyracuseOffsetClosedForm.lean)
- [Offset lower bound](SyracuseOffsetLowerBound.lean)
- [Valuation-one margin block](SyracuseMarginBlock.lean)
- [Exact valuation transitions](SyracuseValuationTransition.lean)

## Verification

[GitHub Actions run 42717134267](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42717134267) passed on the Lean 4.34.1 / Mathlib v4.34.1 snapshot at merge commit 28003791738900f6dc456bc71d37151c1f3f8a78. It compiled the CollatzAudit library and the listed Syracuse offset, margin, and valuation modules; the offset and valuation-transition audit steps rejected sorryAx if present and completed successfully.

The global Collatz conjecture is not claimed as proved. The current central obligation is to prove a positive signed margin on some finite realized block for every positive odd starting value.

## Copyright and license

Copyright © 2026 Ta-Yoshua Lubuimi. No repository license has yet been selected; see Section 11 of the research record. Do not infer an open-source license from the presence of this repository.
