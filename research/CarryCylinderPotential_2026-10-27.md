# Carry-cylinder potential: exact facts and the missing deterministic bridge

Date: 2026-10-27  
Status: research note; no claim of a Collatz proof.

## 1. Exact block identity

For odd Syracuse iterates
\[
T(n)=\frac{3n+1}{2^{v_2(3n+1)}},
\]
write \(k_i=v_2(3n_i+1)\), \(n_{i+1}=T(n_i)\), and
\(A_N=\sum_{i=0}^{N-1}k_i\). Iterating the affine relation gives
\[
2^{A_N}n_N=3^Nn_0+
\sum_{j=0}^{N-1}3^{N-1-j}2^{A_j},
\qquad A_0=0.
\]
The correction term is positive. Therefore a block descent \(n_N<n_0\)
forces \(3^N<2^{A_N}\). This is a necessary condition, not a sufficient one.

## 2. Exact valuation cylinders

For every integer \(r\ge1\), the condition
\(v_2(3n+1)=r\) selects exactly one odd residue class modulo
\(2^{r+1}\). Reason: multiplication by 3 is invertible modulo \(2^{r+1}\);
the congruence \(3n\equiv-1\pmod {2^r}\) has one solution modulo \(2^r\),
and its two lifts modulo \(2^{r+1}\) split into one with valuation exactly
\(r\) and one divisible by \(2^{r+1}\). Among odd residues this cylinder
has density \(2^{-r}\).

Thus the valuation label \(r\) has information cost \(r\) bits. For a
prescribed finite valuation word \((k_0,\ldots,k_{N-1})\), the natural
candidate cylinder has information cost \(A_N=\sum k_i\); this finite-word
claim should be proved in Lean by induction from the affine block identity
and the inverse residue map, rather than assumed from a probabilistic model.

## 3. The proposed potential

Use the logarithmic size change as the primary Lyapunov observable:
\[
\Delta(n)=\log_2 T(n)-\log_2 n
=\log_2(3+1/n)-v_2(3n+1).
\]
For a block,
\[
\log_2(n_N/n_0)=N\log_2 3+
\sum_{i=0}^{N-1}\log_2(1+1/(3n_i))-A_N.
\]
The correction sum is positive and explicitly bounded above by
\(N\log_2(4/3)\) for odd \(n_i\ge1\); for large states it is much
smaller. A strict descent follows whenever the exact valuation sum exceeds
the corresponding logarithmic growth term. This is an exact deterministic
criterion.

A useful *carry-cylinder potential* is the pair
\[
\mathcal P_N(n_0)=(A_N,\;C_N),\qquad
C_N=\sum_{j=0}^{N-1}3^{N-1-j}2^{A_j}.
\]
The first coordinate measures accumulated 2-adic information; the second
records the exact affine carry correction. Unlike Shannon entropy of a
randomized bit model, both coordinates are defined on each actual orbit.

## 4. What this does not prove

The fact that valuation cylinders have geometric densities does not imply
that every individual orbit sees the typical valuation frequency. A measure-one
statement cannot simply be upgraded to a statement for every integer.
The unresolved bridge is a uniform, orbitwise lower bound on \(A_N\) (or
another potential) strong enough to force a descent block for every start.
No such bound is established here.

## 5. Lean work items

1. Formalize the unique exact-valuation residue class for each \(r\).
2. Prove the finite-word cylinder lemma with an explicit modulus.
3. Formalize the logarithmic block identity over positive reals, keeping
   the exact integer identity as the kernel of the argument.
4. Search for a deterministic bound on long low-valuation words; treat
   computational data only as counterexample search, never as proof.
5. Audit every final theorem with the Lean command #print axioms; separately record
   the imported axioms and the theorem statement's exact correspondence to
   the classical Collatz conjecture.
