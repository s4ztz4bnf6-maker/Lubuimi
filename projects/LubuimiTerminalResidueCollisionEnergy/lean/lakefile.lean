import Lake
open Lake DSL

package «terminal-residue-k2» where
  moreLeanArgs := #[ "-DautoImplicit=false" ]

require mathlib from git "https://github.com/leanprover-community/mathlib4.git" @ "v4.35.0"

lean_lib TerminalResidueK2 where
  roots := #[`LubuimiTerminalResidueEnergyK2]
