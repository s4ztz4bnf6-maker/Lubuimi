import Mathlib

namespace CollatzSyracuseAudit

/-- The ordinary (unaccelerated) Collatz map on natural numbers. -/
def cocycleStep (n : ℕ) : ℕ :=
  if n % 2 = 0 then n / 2 else (3 * n + 1) / 2

/-- Multiplicative coefficient selected by the current parity. -/
def cocycleCoeff (n : ℕ) : ℕ :=
  if n % 2 = 0 then 1 else 3

/-- Additive correction selected by the current parity. -/
def cocycleCorrection (n : ℕ) : ℕ :=
  if n % 2 = 0 then 0 else 1

/-- The k-th ordinary Collatz iterate, with the step count as recursion index. -/
def cocycleIter (n : ℕ) : ℕ → ℕ
  | 0 => n
  | k + 1 => cocycleStep (cocycleIter n k)

/-- The multiplicative coefficient in the exact affine representation
of the k-step orbit. It is the product of the parity-dependent coefficients. -/
def cocycleA (n : ℕ) : ℕ → ℕ
  | 0 => 1
  | k + 1 => cocycleCoeff (cocycleIter n k) * cocycleA n k

/-- The additive cocycle in the exact affine representation
of the k-step orbit. -/
def cocycleB (n : ℕ) : ℕ → ℕ
  | 0 => 0
  | k + 1 =>
      cocycleCoeff (cocycleIter n k) * cocycleB n k
        + cocycleCorrection (cocycleIter n k) * 2 ^ k

/-- Exact one-step affine identity: twice the next value is either n
or 3*n+1, according to the parity of n. -/
theorem twice_cocycleStep_affine (n : ℕ) :
    2 * cocycleStep n =
      cocycleCoeff n * n + cocycleCorrection n := by
  unfold cocycleStep cocycleCoeff cocycleCorrection
  by_cases h : n % 2 = 0 <;> simp [h] <;> omega

/-- Exact parity-cocycle identity for every finite iterate:
  2^k * C^k(n) = A_k(n) * n + B_k(n).
This is an algebraic identity for the actual orbit, not an asymptotic estimate
and not a claim that the orbit descends or terminates. -/
theorem cocycleIter_affine_identity (n k : ℕ) :
    2 ^ k * cocycleIter n k = cocycleA n k * n + cocycleB n k := by
  induction k with
  | zero =>
      simp [cocycleIter, cocycleA, cocycleB]
  | succ k ih =>
      calc
        2 ^ (k + 1) * cocycleIter n (k + 1)
            = 2 ^ k * (2 * cocycleStep (cocycleIter n k)) := by
                simp [cocycleIter, pow_succ]
                ring
        _ = 2 ^ k *
              (cocycleCoeff (cocycleIter n k) * cocycleIter n k
                + cocycleCorrection (cocycleIter n k)) := by
                rw [twice_cocycleStep_affine]
        _ = cocycleCoeff (cocycleIter n k) *
              (2 ^ k * cocycleIter n k)
              + cocycleCorrection (cocycleIter n k) * 2 ^ k := by
                ring
        _ = cocycleCoeff (cocycleIter n k) *
              (cocycleA n k * n + cocycleB n k)
              + cocycleCorrection (cocycleIter n k) * 2 ^ k := by
                rw [ih]
        _ = cocycleA n (k + 1) * n + cocycleB n (k + 1) := by
                simp [cocycleA, cocycleB]
                ring

#print axioms twice_cocycleStep_affine
#print axioms cocycleIter_affine_identity

end CollatzSyracuseAudit
