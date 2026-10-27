# Research continuation — 2026-10-26: typed sieve interface and exact transition certificates

## Why this note exists

The current work has reached an interface boundary: generic finite-sum lemmas compile independently of the source-specific theorem, but they cannot justify the missing geometric hypotheses. The next improvement is to make invalid parameter packages unrepresentable and to make orbit evidence carry exact arithmetic obligations.

## BBMST: prevent degenerate sieve inputs by construction

Do not pass a free list of parameters and later recover missing entries with `getD`. Index the parameter family by the actual finite target type. Require that target type to be nonempty when the source theorem requires at least one prime/block. Keep denominator positivity as a proof field, not a runtime check.

A Lean design sketch (not yet compiler-verified):

```lean
structure SieveParameterData (ι : Type*) [Fintype ι] where
  delta : ι → ℚ
  delta_lower : ∀ i, 0 < delta i
  delta_upper : ∀ i, delta i ≤ 1 / 2
  denominator_pos : 0 < ca1 + ca3
  ca1 : ℚ
  ca3 : ℚ
```

This is only a shape sketch; the actual bounds and denominator must be taken from the pinned BBMST source, not assumed from this sketch. In particular, the fields should be reordered and specialized to the source formula once that formula is transcribed exactly. Add `[Nonempty ι]` only where the theorem's actual index set is known to be nonempty; do not use it to hide a source-level edge case.

The theorem should consume the typed package directly. It should not accept an unrelated `List ℚ`, a default value for missing coordinates, or an axiom asserting the desired sieve criterion. The old axiom-based path remains quarantined until replaced by a theorem derived from the actual fiber/moment bounds.

## BBMST proof dependency firewall

Keep the following claims separate in both names and imports:

1. finite mass conservation and zero-mass fibers;
2. source-derived one-step distortion for the actual stage measures;
3. first-/second-moment or hyperplane-incidence bounds;
4. the sieve criterion and the final covering conclusion.

A proof of (1) must not import or depend on (4). This makes the low-level kernel check informative and prevents circular support through a high-level axiom.

## Syracuse: exact realizability certificate for a valuation word

For an odd transition from positive odd n to positive odd m with exponent a, use the exact certificate

`2^a m = 3n + 1`, `a > 0`, `m` odd, and `¬ (2^(a+1) ∣ 3n + 1)`.

The equality alone gives the quotient relation; the final non-divisibility condition is what certifies that a is exactly v₂(3n+1), rather than merely a lower bound. For a block, store the chain of such transitions, not just the exponent list. An arbitrary positive exponent word is not automatically realizable.

Induction over the certified chain yields
`2^(a₀+⋯+a_{N−1}) n_N = 3^N n₀ + C_N`,
with `C₀ = 0` and `C_{j+1} = 3 C_j + 2^(a₀+⋯+a_{j−1})`.
This identity is a safe algebraic target for Lean. It does not prove descent: the strict inequality `n_N < n₀` is equivalent to the positive margin and must be derived independently.

## Validation status

This is a proof-design note, not a compiler or CI claim. The next implementation step is to formalize the transition certificate and prove the affine identity by induction; independently, BBMST must replace the axiom-based criterion with the source-faithful fiber and moment arguments. The global Collatz conjecture and the unrestricted Erdős–Selfridge conjecture remain open in this work.
