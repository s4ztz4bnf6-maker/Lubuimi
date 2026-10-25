import Lake
open Lake DSL

package «collatz-audit» where
  moreLeanArgs := #[ "-DautoImplicit=false" ]

require mathlib from git "https://github.com/leanprover-community/mathlib4.git" @ "v4.35.0"

lean_lib CollatzAudit where
  roots := #[`IterationLemmas, `ThresholdLemmas, `SyracuseQuarterDescent, `SyracuseOffsetIdentity, `SyracuseResidueExtension, `SyracuseLocalDescent, `SyracuseTwoAdicObstruction, `SyracuseStepSign, `SyracuseBlockIdentity]
