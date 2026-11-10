# Exact constraint on consecutive valuation-one steps

Date: 2026-10-26
Branch: collatz/valuation-cylinders-2026-10-26

## Lemma

Let x_0, x_1, ..., x_k be positive odd integers and suppose that the first k accelerated Syracuse steps all have valuation exactly one:
[
3x_i+1=2x_{i+1},qquad x_{i+1}	ext{ odd},quad 0le i<k.
]
Then
[
oxed{2^{k+1}mid x_0+1.}
]

Equivalently, a fixed positive start x_0 cannot have more than v_2(x_0+1)-1 consecutive valuation-one steps at the beginning of its orbit (when v_2(x_0+1) is finite). The bound is sharp as a finite-prefix statement: x_0=2^{k+1}-1 supports k consecutive valuation-one steps.

## Proof

The recurrence (x_{i+1}=(3x_i+1)/2) gives, by induction,
[
2^i x_i=3^i(x_0+1)-2^i.
]
At i=k this is
[
2^k x_k=3^k(x_0+1)-2^k,
]
hence
[
3^k(x_0+1)=2^k(x_k+1).
]
Since (x_k) is odd, (x_k+1) is even, so (2^{k+1}mid 3^k(x_0+1)). Because (3^k) is coprime to (2^{k+1}), it follows that (2^{k+1}mid x_0+1).

For sharpness, starting at (x_0=2^{k+1}-1), the recurrence preserves oddness for the first k outputs; this also follows by applying the displayed divisibility characterization successively to each prefix. For instance, (15	o23	o35	o53) has three consecutive valuation-one steps, so claims that two such steps can never occur are false.

## Why this matters, and what it does not prove

This gives a state-dependent obstruction to long runs of the worst local valuation (a_i=1). It does **not** bound those run lengths uniformly over all starting values, because (v_2(x_0+1)) can be arbitrarily large. Nor does it force global descent: the state changes at every step, and later low-valuation blocks may begin at new values.

The useful next question is whether this exact congruence constraint can be combined with the affine correction sum or a different descent potential to produce a global, state-sensitive inequality. Any such argument must account for the changing value (x_i), not treat valuation-one steps as independent random events.

## Formalization status (updated 2026-10-26)

The full divisibility statement above is still a paper proof, not yet a Lean theorem. A key algebraic sublemma is now formalized in `SyracuseAffineCore.lean` as `SyracuseAudit.constant_valuation_one_identity`:

`2^k * n k + 2^k = 3^k * (n 0 + 1)`

under the recurrence `2 * n (i + 1) = 3 * n i + 1`. CI run [40374070669](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/40374070669) passed on commit `0e1e90b19f2c26db0da86ac436a7020d75865d4e`. Its transitive `#print axioms` output for this theorem is exactly `[propext]`; no `sorryAx` or project-admitted premise was reported. This formalizes the affine identity, not the final divisibility inference. The remaining Lean target is to combine oddness of `n k` with coprimality of `3^k` and `2^(k+1)` to prove `2^(k+1) ∣ n 0 + 1`, then verify the sharp examples with exact arithmetic.
