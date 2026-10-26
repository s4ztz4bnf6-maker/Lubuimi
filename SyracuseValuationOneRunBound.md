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

## Formalization status

This note is a proved paper argument, not yet a Lean theorem. The existing Lean affine identities and valuation-surplus estimates remain separately CI-checked; they do not formalize this lemma. A follow-up Lean target should prove the recurrence identity and the coprime-divisibility step, then check the sharp examples with exact arithmetic.
