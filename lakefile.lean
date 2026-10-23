import Lake
open Lake DSL

package «collatz-audit» where
  moreLeanArgs := #["-DautoImplicit=false"]

require mathlib from git "https://github.com/leanprover-community/mathlib4.git" @ "v4.34.1"

lean_lib CollatzAudit where
  roots := #[`IterationLemmas, `ThresholdLemmas, `SyracuseQuarterDescent, `SyracuseOffsetIdentity]
