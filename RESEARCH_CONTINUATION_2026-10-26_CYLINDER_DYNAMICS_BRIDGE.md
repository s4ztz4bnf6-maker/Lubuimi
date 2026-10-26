# Research continuation — 2026-10-26: cylinder dynamics, exact certificates, and the density bridge

## Status and purpose

This note advances the Collatz/Syracuse research plan. It does not claim universal convergence, a counterexample, or a successful Lean build. The project must distinguish the ordinary Collatz map, the one-halving odd map, and the fully accelerated Syracuse map.

## A precise 2-adic correction

For odd x in ℤ₂ with 3x+1 ≠ 0, let k = v₂(3x+1). The valuation stratum

`C_k = {x ∈ ℤ₂ : v₂(3x+1)=k}`

is a residue cylinder: it is specified by `3x+1 ≡ 0 mod 2^k` and `3x+1 ≢ 0 mod 2^(k+1)`. Since 3 is invertible in ℤ₂, this is a clopen residue class modulo `2^(k+1)`. On this stratum, the accelerated map is the affine expression

`T(x) = (3x+1)/2^k`.

Thus the accelerated map is locally continuous on each finite-valuation stratum. But the strata do not give a uniform finite partition: valuations are unbounded, and `x = -1/3` is the exceptional 2-adic point where `3x+1=0` and the accelerated formula has no finite exponent. The correct domain must explicitly exclude this point or define separate exceptional behavior. This local continuity statement does not yield a global attracting point or ordinary-integer descent.

## Exact finite-orbit certificate

For a genuine odd-to-odd Syracuse step, store n, m, a with `a > 0`, m positive and odd, and

`2^a * m = 3*n + 1`.

These conditions imply that `a = v₂(3n+1)`: divisibility by `2^a` follows from the equality, and oddness of m rules out divisibility by `2^(a+1)`. A separately stored non-divisibility proof is redundant; if retained for readability, derive it from these fields rather than leaving it as an unconstrained extra assumption.

For a certified chain with exponents a_j, define `A_j = sum_{i<j} a_i` and `C_0=0`, `C_{j+1}=3*C_j+2^(A_j)`. Induction over the actual chain gives

`2^(A_N) * n_N = 3^N * n_0 + C_N`.

This is an exact algebraic invariant and a suitable Lean target. It does not prove descent. The descent margin

`M_N = 2^(A_N)*n_0 - (3^N*n_0 + C_N)`

equals `2^(A_N)*(n_0-n_N)`, so `M_N > 0` is equivalent to `n_N < n_0`. Do not derive the margin by assuming an equivalent descent inequality.

## Falsification-first density bridge

The ProofAtlas density statements are useful only after exact definitions are reconciled. The half-step odd map `(3n+1)/2` is not the fully accelerated Syracuse map. Before combining an exceptional-set lower bound with a power-saving upper bound:

1. Write down the exact map, time clock, interval convention, and bad-set predicate on both sides.
2. Derive an explicit conversion lemma between the maps or keep the estimates separate.
3. State the needed implication from hypothetical nonconvergence to a positive-density set of starts failing the specified descent test.
4. Search for counterexamples to that implication over finite ranges as a falsification tool.
5. Prove the implication for all starts and align both density bounds at the same cutoff before comparing exponents.

A finite search can refute a proposed bridge, but cannot prove it universally. A power-saving estimate that allows a zero-density exceptional set does not imply that the exceptional set is empty.

## Audit firewall

- **Arithmetic layer:** prove the chain identity from exact transition certificates.
- **Realizability layer:** prove the exponent chain comes from a genuine orbit; arbitrary positive exponent words are not automatically realizable.
- **Global layer:** prove a uniform descent mechanism or another theorem excluding all nontrivial cycles and divergent trajectories.
- **Formal layer:** pin Lean/Mathlib versions, compile the exact target, and separately inspect transitive `#print axioms` output.

The p-adic representation can organize residue classes and local dynamics. The missing theorem is a global bridge from that structure to ordinary-order descent for every positive integer.
