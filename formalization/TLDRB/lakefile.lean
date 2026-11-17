import Lake
open Lake DSL

package «tldrbaudit» where

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.35.0"

lean_lib TLDRB
