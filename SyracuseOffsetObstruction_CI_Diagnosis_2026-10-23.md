# Collatz CI failure: exact valuation lemma correction

CI run: https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/39909274676

## Verified status

The run passed the Mathlib build, iteration and threshold lemmas, quarter descent, reference tests, second-step lemmas, affine transition design, exact Modulo-64 transitions, isolated valuation module, stopping-time bridge, strict Modulo-64 descent, residue-35 descent, and exact valuation characterization module.

The final step compiling `SyracuseOffsetObstruction.lean` failed at line 131 in `v2_eq_iff_pow_dvd_not_next_pow_dvd`. The reported mismatch is that `hdiv` has type `2^(a+1) ∣ m`, while `hnext.mpr` expects `a+1 ≤ m.factorization 2`.

## Exact local diagnosis

The definition is:

`hnext : 2^(a+1) ∣ m ↔ a+1 ≤ m.factorization 2`.

Therefore the proof line should use the forward direction `hnext.mp hdiv` to turn divisibility into the factorization inequality. The existing line `hnext.mpr hdiv` uses the reverse direction and is ill-typed. The subsequent contradiction should then be obtained from `hnot (hnext.mpr hle)`, as already structured.

This is a small, local direction error, not a flaw in the mathematical criterion. However, Lean reports `sorryAx` for the theorem after this error, so the theorem must not be treated as verified until corrected and CI rerun.

## Mathematical role

For nonzero (m), exact 2-adic valuation (v_2(m)=a) is equivalent to divisibility by (2^a) and non-divisibility by (2^{a+1}). This criterion is the correct bridge from symbolic valuation words to exact congruence/divisibility constraints. It does not itself prove that every Syracuse orbit descends.

No successful rebuild is claimed in this note.
