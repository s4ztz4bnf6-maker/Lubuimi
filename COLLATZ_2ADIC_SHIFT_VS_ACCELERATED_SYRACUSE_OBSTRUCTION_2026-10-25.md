# Collatz in Z2: continuous shortcut map versus accelerated Syracuse map (2026-10-25)

## Main correction to the proposed paradigm

There is a classical continuous 2-adic model of Collatz, but it is important to identify the correct map. The non-accelerated shortcut map
[
C(x)=egin{cases}x/2,&xequiv0pmod2,\(3x+1)/2,&xequiv1pmod2end{cases}
]
is defined on (mathbb Z_2) by the parity of (x). Its parity-vector coding conjugates it to the one-sided shift on binary sequences (with the usual identification of binary sequences with (mathbb Z_2)). Finite parity prefixes are determined by finite residue classes, and the conjugacy is continuous.

The accelerated odd Syracuse map
[
S(x)=rac{3x+1}{2^{v_2(3x+1)}}
]
is a different object. Its valuation exponent is unbounded near the 2-adic point (x=-1/3), where (3x+1=0). At that point the valuation is infinite, so the displayed quotient is not a finite-exponent definition of an ordinary map. One must define the domain and exceptional point explicitly before discussing global continuity. It is not correct to assume that the accelerated map is automatically a globally continuous self-map of all of (mathbb Z_2).

## Why continuity and compactness do not prove integer convergence

The shortcut map's conjugacy to a shift is structurally useful, but a shift on binary sequences does not make all sequences eventually periodic or force all corresponding positive integers to reach 1. Compactness yields convergent subsequences, not convergence of every orbit to one specified point. Moreover, the positive integers are a countable subset of (mathbb Z_2) and have 2-adic Haar measure zero; a Haar-almost-everywhere statement can leave every integer in an exceptional set in principle.

Thus the proposed “single global sink by compactness” step is not a valid inference. A successful 2-adic route needs an additional arithmetic/dynamical theorem that rules out the exceptional symbolic sequences when the seed is a positive integer.

## A useful bridge for the current formalization

The existing local finite-cylinder theorem is naturally compatible with symbolic dynamics:
- a finite branch/valuation word specifies a congruence class modulo a power of two;
- each finite prefix defines a clopen cylinder in (mathbb Z_2);
- compatible prefixes define an inverse-limit point;
- the positive-integer problem is not solved merely by constructing that inverse-limit point: one still needs a uniform arithmetic obstruction to a non-descending positive-integer orbit.

For a block of (k) accelerated valuations all equal to one, the local certificate gives
[
n_0equiv-1pmod{2^{k+1}},
]
and the corresponding density among odd starts is exactly (2^{-k}). This is a finite-cylinder fact; it does not bound all possible valuation words of a hypothetical counterexample.

## Research task

Formalize the non-accelerated shortcut map and its finite parity-prefix residue theorem separately from the accelerated Syracuse map. Then formalize the accelerated valuation cylinders as a branch-induced system. Do not transfer continuity claims from the shortcut map to the accelerated map without a theorem. The next global target remains an arithmetic bound on the valuation sequence strong enough to force a strict descent, not compactness alone.

## Source and scope

Classical 2-adic parity-vector coding is described in the literature on the 3x+1 problem, including work on the conjugacy between the 2-adic Collatz map and a shift. This note records a proof-design correction and formalization route; it is not a global Collatz proof.
