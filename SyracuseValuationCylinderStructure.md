# Syracuse valuation cylinders: exact residue-class structure

Status: mathematical note; **not yet Lean-kernel checked**.

## Exact statement

Let n be odd and k >= 1. Then

    v₂(3n+1)=k iff 3n+1 ≡ 2^k (mod 2^(k+1)).

Since 3 is invertible modulo 2^(k+1), there is a unique residue

    r_k ≡ 3⁻¹(2^k−1) (mod 2^(k+1))

such that the valuation-k cylinder among odd integers is exactly

    n ≡ r_k (mod 2^(k+1)).

The residue r_k is odd because both the inverse of 3 modulo a power of two and 2^k−1 are odd.

## Why this helps

This replaces the vague idea of a continuous global extension by a precise, countable partition of the odd integers into valuation cylinders. On each cylinder, the accelerated map T(n)=(3n+1)/2^k uses one fixed exponent k, and its arithmetic is affine before restricting back to odd integers.

For a formal development, the useful interfaces are:

1. valuation_eq_iff_congruence: valuation exactly k iff the stated congruence holds.
2. valuation_cylinder_unique_residue: uniqueness of the residue class modulo 2^(k+1).
3. syracuse_step_on_cylinder: the division equation and oddness of the next state.
4. cylinder_transition: characterize which valuation cylinder contains the next state.

The first two are elementary modular arithmetic. The fourth is where orbit information enters and where a global descent argument would have to gain genuine leverage. A partition into cylinders alone does not imply descent or convergence.

## Critical limitation

The statement is about positive odd integers and their exact 2-adic valuations. It does not assert that arbitrary sequences of valuation labels are realizable. Nor does it prove that every orbit reaches a suffix satisfying the existing record-time certificate. Any future Lean theorem must keep these distinctions explicit.
