# Lubuimi research projects

**Research author:** Ta-Yoshua Lubuimi

## 1. Initial Valuation-One Cylinder Theorem

The exact all-one initial valuation cylinder for the accelerated odd Syracuse map:
\[
(\forall j<N,\ a_j=1)\iff n_0\equiv-1\pmod{2^{N+1}},
\qquad r=v_2(n_0+1)-1.
\]

This theorem has a self-contained manuscript and has passed three full exact-commit Lean CI workflows (42721006544, 42721305220, 42721911555), with transitive axiom profile [propext, Classical.choice, Quot.sound] and no sorryAx in the complete-log scans.

Project directory: LubuimiInitialValuationOneCylinder.

## 2. Finite Valuation-Word Cylinder Partition Theorem

The general finite-word extension: every finite exact exponent word with total exponent A is exactly one odd residue class modulo 2^(A+1), with relative odd-start density 2^(-A). It includes an explicit affine residue formula, exact prefix-tree child weights and a finite cutoff with one exact tail cylinder.

Project directory: LubuimiFiniteValuationWordCylinder.

The general theorem is mathematically derived in its manuscript but is not yet claimed as Lean-compiled or axiom-audited.

## 3. Research continuation

See RESEARCH_UPDATE_2026-11-10_LUBUIMI_CYLINDER_RESULTS_AND_BRIDGE.md for the append-only proof/CI chronology and the proposed Lubuimi APW4–Syracuse Cylinder–Energy Bridge.

All projects are attributed to Ta-Yoshua Lubuimi. AI tools are assistants only. Third-party dependencies retain their own licences.
