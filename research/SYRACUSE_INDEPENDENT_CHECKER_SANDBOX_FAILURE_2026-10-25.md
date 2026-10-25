# Audit note: independent Lean checker infrastructure

Date: 2026-10-25

The Syracuse audit run 40233927833 completed the Lean compilation steps, including the block identity and offset lower-bound modules. The final independent checker step failed when `lake check` attempted to start bubblewrap and the runner returned `bwrap: setting up uid map: Permission denied`.

Interpretation: this is an infrastructure/sandbox failure, not evidence that the theorem is false, and not a successful independent check. Keep the result classified as compiled by Lean but independently unchecked until the checker runs in an environment that permits its sandbox.

Follow-up: configure the CI job to detect whether bubblewrap user namespaces are available. If unavailable, run the independent checker in a supported container/runner or export declarations for checking elsewhere. Do not silently mark the independent audit as passed.
