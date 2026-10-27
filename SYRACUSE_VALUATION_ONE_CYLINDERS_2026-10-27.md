# Valuation-one runs as 2-adic cylinders

Date: 2026-10-27

Status: exact lemma for the accelerated odd Syracuse map; the Lean formalization is a next task. This is not a Collatz proof.

## Statement

Let
\[
T(n)=\frac{3n+1}{2}
\]
whenever the current odd integer has 2-adic valuation exactly one, so that the next accelerated odd state is again odd. A run of at least k valuation-one transitions means that
\[
n_{j+1}=T(n_j),\qquad n_j\text{ odd},\qquad v_2(3n_j+1)=1
\quad(0\le j<k).
\]

Then the first k transitions all have valuation one if and only if
\[
n_0\equiv -1\pmod {2^{k+1}}.
\]

## Proof sketch from the exact affine iterate

For the map T(n)=(3n+1)/2, induction gives
\[
2^k n_k=3^k n_0+(3^k-2^k)
       =3^k(n_0+1)-2^k.
\]
Thus
\[
n_k=\frac{3^k(n_0+1)}{2^k}-1.
\]
For n_k to be an odd integer, 2^(k+1) must divide 3^k(n_0+1). Since 3^k is invertible modulo every power of two, this is equivalent to
\[
n_0+1\equiv0\pmod {2^{k+1}}.
\]
Conversely, this congruence makes each intermediate quotient integral and odd, and therefore certifies each of the first k valuation-one steps.

## Why this matters for the divergence audit

The existing necessary condition for a hypothetical divergent orbit forces
\[
\liminf_N \frac{P_1(N)-P_{\ge3}(N)}N\ge 2-\log_2 3\approx0.4150.
\]
The cylinder lemma adds a structural fact: a long consecutive run of valuation-one steps occupies a single increasingly narrow 2-adic cylinder around -1. It does not show that valuation-one steps have low density along an integer orbit. Short, separated runs could still occur frequently, and 2-adic measure alone cannot rule out deterministic orbit bias.

## Next formal obligation

Formalize the exact iterate identity and the equivalence in Lean from certified transitions, with no assumptions about statistical independence. Then combine it with the existing weighted correction cocycle. The hard theorem remains a uniform bound on the frequency and placement of these cylinders along one positive-integer orbit, not the finite congruence calculation itself.
