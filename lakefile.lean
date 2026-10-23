import Lake
open Lake DSL

package «erdos-selfridge-audit» where
  -- Source-faithful audit project; keep dependencies pinned by lean-toolchain.

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.34.1"

lean_lib ErdosSelfridgeAudit where
  globs := #[.one `ErdosSelfridge_v17_fixed]


-- Compile the concrete fiber core and its normalized probability interface as
-- actual Lean library modules, so imports resolve to generated .olean files.
lean_lib BBMSTFiberMassCore where
  globs := #[.one `BBMSTFiberMassCore]

lean_lib BBMSTProbabilityInterface where
  globs := #[.one `BBMSTProbabilityInterface]
