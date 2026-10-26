# Research frontier — Syracuse/Collatz exact admissibility (2026-10-24)

## Objective
Move from symbolic exponent identities to a theorem about *realizable* valuation words. This note is a research plan and obstruction ledger, not a Collatz proof.

## Established algebraic interface
For certified odd transitions
`2^(a j) * n (j+1) = 3*n j + 1`, with cumulative exponent `A (j+1)=A j+a j` and canonical offset `C (j+1)=3*C j+2^(A j)`, the checked source contains
`2^(A j) * n j = 3^j*n 0 + C j`.
The descent question is exactly
`3^j*n 0 + C j < 2^(A j)*n 0`.
Equivalently, when `3^j ≤ 2^(A j)`,
`C j < (2^(A j)-3^j)*n 0`.
This is an exact reduction, not a proof that the inequality always holds.

## New direction: valuation-word cylinders, not free exponent words
For a finite candidate word `a₀,…,aₙ₋₁`, compute the canonical prefix data `A_i,C_i`. At each prefix, the state is constrained by
`2^(A_i) * n_i = 3^i*n₀ + C_i`.
The admissibility checker must retain, at every prefix:
1. integrality of `n_i`;
2. positivity and oddness of `n_i`;
3. exact valuation, i.e. `2^a_i*n_(i+1)=3*n_i+1` and odd quotient;
4. compatibility of all prefix congruences in the same starting residue class.

A terminal congruence alone is not enough: it can satisfy the final scaling while violating an earlier exact valuation. Likewise, an arbitrary symbolic word need not be realizable.

### Concrete formalization target
Define a finite-word certificate containing the word, prefix sums `A_i`, offsets `C_i`, and actual odd states. Prove:
- certificate validity implies the affine identity at every prefix;
- each certified word induces a set of starts modulo `2^(A_N)` satisfying all exact prefix constraints;
- the set is either empty or a single residue class modulo `2^(A_N)`, **only after** proving the prefix constraints are nested and compatible;
- a finite search may falsify a proposed block inequality, but cannot establish universal convergence.

The uniqueness claim above is a target to prove, not an assumed fact. A sound implementation should first test it against small words and counterexamples; if the prefix conditions split or eliminate the terminal class, state the correct theorem in terms of an intersection of prefix cylinders.

## Margin dynamics and obstruction
For `D_i = 2^(A_i)-C_i-3^i`,
`D_(i+1)=3*D_i+(2^(a_i)-4)*2^(A_i)`.
Exponent 1 contributes a negative correction, exponent 2 contributes zero, and exponent ≥3 contributes a positive correction. Arbitrarily long finite exponent-one runs exist: for any k, starts `n₀=2^(k+1)q-1` realize k such steps. Therefore no uniform run-length cutoff can close the proof. A run forces its next exponent to be at least 2, but not at least 3; the concrete trajectory 7 → 11 → 17 → 13 has exponents 1,1,2.

## Immediate theorem-search priorities
1. Prove a finite-prefix cylinder theorem with explicit congruence compatibility.
2. Derive the exact block correction `W(m,r)` and a bound conditioned on *actual* prefix cylinders.
3. Search for counterexamples to candidate block inequalities over all starts in a bounded range; publish the bound and do not extrapolate.
4. Seek an invariant that controls negative corrections without assuming a uniformly bounded exponent-one run.
5. Audit every result with kernel compilation, `#print axioms`, and human statement-fidelity review.

## Non-claims
No universal Collatz termination theorem is proved. CI success is evidence only for the exact files and commit checked; it is not evidence for the global conjecture.
