/-
Copyright (c) 2026 Ta-Yoshua Lubuimi.
SPDX-License-Identifier: AGPL-3.0-only

Original project contribution. Third-party imports and dependencies retain
their own licenses. AI assistance is disclosed in the repository notice.
-/

import Lake
open Lake DSL

package «tldrbaudit» where

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.35.0"

lean_lib TLDRB
