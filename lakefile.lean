import Lake
open Lake DSL

package «erdos-selfridge-audit» where
  -- Source-faithful audit project; keep dependencies pinned by lean-toolchain.

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.28.0"

lean_lib ErdosSelfridgeAudit where
  globs := #[.one `ErdosSelfridge_v17_fixed]
