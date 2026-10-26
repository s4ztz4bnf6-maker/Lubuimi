import Lake
open Lake DSL

package «syracuse-audit» where
  moreLeanArgs := #[ "-DautoImplicit=false" ]

require mathlib from git "https://github.com/leanprover-community/mathlib4.git" @ "v4.28.0"

lean_lib SyracuseAudit where
  roots := #[`SyracuseAuditCore, `SyracuseAffineCore, `SyracuseAxiomAudit]
