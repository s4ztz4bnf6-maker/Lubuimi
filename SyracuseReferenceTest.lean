import Mathlib

namespace CollatzSyracuseAudit

/-- Exponent of the prime 2 in the factorization of a natural number. -/
def v2 (m : ℕ) : ℕ :=
  m.factorization 2

/-- Syracuse step, defined by removing all powers of two from 3*n+1. -/
def syracuse (n : ℕ) : ℕ :=
  (3 * n + 1) / 2 ^ v2 (3 * n + 1)

/-- If n is odd, then 3*n+1 is even. -/
theorem three_mul_add_one_even
    (n : ℕ) (h : n % 2 = 1) :
    (3 * n + 1) % 2 = 0 := by
  omega

/-- Smoke test: the factorization-based reference definition elaborates. -/
example (n : ℕ) : syracuse n = (3 * n + 1) / 2 ^ v2 (3 * n + 1) := by
  rfl

end CollatzSyracuseAudit
