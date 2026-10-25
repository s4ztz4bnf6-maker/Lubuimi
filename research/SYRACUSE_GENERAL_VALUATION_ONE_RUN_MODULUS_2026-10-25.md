# General valuation-one run obstruction: the closed-form modulus target (2026-10-25)

## New exact statement (mathematical, not yet Lean-certified)

Suppose an odd Syracuse segment has exactly r consecutive valuation-one transitions:
\[
2n_{j+1}=3n_j+1,\qquad j=0,\ldots,r-1,
\]
and every state, including \(n_r\), is odd. Then
\[
n_0\equiv -1\pmod{2^{r+1}}.
\]

This generalizes the already formalized finite cases (three steps imply 15 mod 16, four imply 31 mod 32, five imply 63 mod 64). It does **not** bound the possible run length: for every finite r, the congruence class contains a candidate start.

## Short proof by exact affine identity

Iterating \(2n_{j+1}=3n_j+1\) gives
\[
2^r n_r=3^r n_0+(3^r-2^r),
\]
because the correction sum is
\[
\sum_{j=0}^{r-1}3^{r-1-j}2^j=3^r-2^r.
\]
Rearranging,
\[
2^r(n_r+1)=3^r(n_0+1).
\]
Since \(n_r\) is odd, \(n_r+1\) is even, so the left side is divisible by \(2^{r+1}\). The odd number \(3^r\) is coprime to \(2^{r+1}\); therefore \(2^{r+1}\mid n_0+1\), which is the claimed congruence.

Conversely, the explicit family
\[
n_i=3^i2^{r+1-i}-1,\quad 0\le i\le r,
\]
has odd states, satisfies each transition equation for \(i<r\), and has \(n_i\equiv3\pmod4\) before the terminal state. Thus every finite run length is arithmetically realizable. This is an obstruction to arguments that assume a uniform maximum run length, not a counterexample to convergence.

## Formalization target

1. Generalize the finite-state transition data to a length-indexed sequence.
2. Prove the affine identity for the all-exponent-one word by induction, or reuse the general block identity with \(A_r=r\).
3. Prove divisibility cancellation using \(\gcd(3^r,2^{r+1})=1\), not a floating-point or density argument.
4. Retain oddness of the terminal state as an explicit premise; without it the extra factor of 2 is not justified.
5. Run the compiler and transitive axiom audit on the new general theorem.

## Why this matters for the global problem

The theorem gives an exact cylinder condition: a length-r valuation-one prefix can only begin in the single residue class \(-1\pmod{2^{r+1}}\). Its natural density among odd integers is \(2^{-r}\), but this shrinking density does not exclude a particular orbit from having long finite runs. To prove global descent, the next task is to combine these cylinder restrictions with the signed block margin and show that every individual orbit eventually has a positive margin, or else produce a concrete nonterminating orbit. Neither conclusion follows from this lemma alone.

## Four-pillar role

- **Meta-structure:** replace a long list of finite congruence lemmas with one length-parametric theorem.
- **2-adic view:** the run is one increasingly thin residue cylinder around \(-1\).
- **Formal verification:** prove the exact divisibility chain in Lean.
- **Experimental use:** search residue cylinders to falsify any proposed uniform run bound; experiments cannot establish the universal theorem.
