# Syracuse weighted-correction frontier (2026-10-25)

## Verified source facts

The branch's `SyracuseWeightedCorrection.lean` contains a formal weighted-sum identity for the accumulated affine block correction and a complete local residue partition for certified odd-to-odd transitions:

- (a=1) iff (n \equiv 3 \pmod 4); on odd residues this covers (3,7 \pmod 8).
- (a=2) iff (n \equiv 1 \pmod 8).
- (a\ge 3) iff (n \equiv 5 \pmod 8).
- The local correction ((2^a-4)2^A) is negative, zero, or positive in these respective regimes.

These are local arithmetic classifications. They do not show how often an orbit visits any residue class.

## Exact obstruction

For certified odd transitions (2^{a_j}n_{j+1}=3n_j+1), the accumulated correction has the exact weighted form
[
C_r-C_r^{(0)}=\sum_{j<r}3^{r-1-j}(2^{a_j}-4)2^{A_j},
]
with the repository's exact indexing defined in `signedOffsetBlockCorrection_eq_weighted_sum`. The open step is not algebraic expansion: it is a trajectory-uniform lower bound on this signed sum, or an equivalent strict offset margin.

A finite residue partition alone cannot provide that bound. A proof must control correlations between successive residues and the weights (3^{r-1-j}2^{A_j}). Assuming independent random residues would be heuristic, not a proof about every orbit.

## Next falsifiable Lean targets

1. Define a finite-block certificate carrying the actual transition equations and exact valuations, rather than arbitrary exponent sequences.
2. Prove a residue-transition graph for moduli (2^k), recording both the next residue and the valuation.
3. For each finite graph, derive exact path-weight and correction bounds by finite computation, then formalize the finite certificate in Lean.
4. Search for a uniform inductive invariant that survives refinement from modulus (2^k) to (2^{k+1}). If no invariant survives, record a concrete counterexample to that proposed invariant rather than upgrading a finite result to a global claim.

## Acceptance gate

No global Collatz conclusion unless the required offset margin is proved for every admissible trajectory (or a valid counterexample is produced). Record the compiler result, transitive axioms, absence of `sorryAx`, and exact correspondence between the formal statement and the standard Collatz/Syracuse map separately.
