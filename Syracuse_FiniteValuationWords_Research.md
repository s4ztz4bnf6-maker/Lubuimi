# Syracuse finite valuation words: exact-realizability research plan

Status: research/design note. This is not a proof of the Collatz conjecture.

## Dynamical convention and affine margin

For odd n, the accelerated Syracuse map is T(n) = (3n+1)/2^{v₂(3n+1)}. For a finite trajectory n₀,...,nₖ with exponents aⱼ, the transition equation is
\[
2^{a_j}n_{j+1}=3n_j+1.
\]
Writing Sⱼ = a₀+...+a_{j-1}, iteration gives
\[
2^{S_k}n_k=3^k n_0+C_k,
\]
where C₀=0 and C_{j+1}=3Cⱼ+2^{Sⱼ}. Strict descent is equivalent to
\[
3^k n_0+C_k < 2^{S_k}n_0.
\]
The multiplier inequality alone is not sufficient.

## Exact valuation predicate

For m ≠ 0, v₂(m)=a is equivalent to
\[
2^a\mid m \quad\text{and}\quad 2^{a+1}\nmid m.
\]
The generic Lean lemma in SyracuseOffsetObstruction.lean packages this criterion instead of repeating separate proofs for a=1,2,3,4. CI compilation is still the authority on whether the Lean proof type-checks.

## Stronger finite-word claim: one exact residue class

A useful refinement is available for a prescribed finite word of positive exponents a₀,...,aₖ₋₁. Let Sⱼ = a₀+...+aⱼ₋₁. The exact word should be represented by **one odd residue class modulo 2^{Sₖ+1}**, not merely modulo 2^{Sₖ}.

Reason for the extra bit: v₂(3n+1)=a requires the numerator to be divisible by 2^a but not by 2^{a+1}; for a=1 this distinguishes n ≡ 3 (mod 4), rather than just an odd class modulo 2. Inductively, after a prefix of total exponent S, lifting the initial residue through the next S+a+1 modulus varies the next odd state across its odd residues modulo 2^{a+1}; exactly one lift has valuation a. This suggests a clean induction:
1. Base prefix length zero: the admissible starts are the odd class modulo 2.
2. Given the unique prefix class modulo 2^{S+1}, parameterize its lifts modulo 2^{S+a+1}.
3. Show the next state runs bijectively through the odd residues modulo 2^{a+1}, since its affine coefficient is odd.
4. Exactly one lift satisfies 3nⱼ+1 ≡ 2^a (mod 2^{a+1}); that congruence is equivalent to exact valuation a.
5. Conclude the extended word has one class modulo 2^{S+a+1}.

This is a mathematical induction target, not yet a proved Lean theorem. It corrects the overly cautious earlier note: the non-divisibility condition does not inherently split the class; with the correct modulus and lift argument it should select a unique lift. Formalization must establish the bijection/lift step, rather than assume it.

Once proved, this gives an exact symbolic coding layer: every finite positive valuation word has a 2-adic cylinder and infinitely many positive odd integer representatives. It still does **not** imply that a representative descends or reaches 1. The separate affine-margin inequality decides strict descent for each representative.

## Literature comparison and limitation

Bernstein and Lagarias study a 2-adic conjugacy between the classical 3x+1 map and the 2-adic shift. Their finite congruence structure motivates symbolic coding, but 2-adic dynamics includes points outside the positive integers and does not by itself establish global positive-integer termination. See Daniel J. Bernstein and Jeffrey C. Lagarias, “The 3x + 1 Conjugacy Map,” *Canadian Journal of Mathematics* 48 (1996), 1154–1169; manuscript: https://websites.umich.edu/~lagarias/doc/bernstein.pdf.

A second route is a finite-state block descent system: certify blocks by exact source residues and a rational affine upper bound, compose certificates, and prove that the uncovered source residues are either handled by another block or satisfy a separate decreasing potential. A finite residue graph by itself does not exclude arbitrarily large positive trajectories; a global argument needs a proved ranking/termination measure or a complete descent theorem.

## Verification boundary

The CI workflow was observed in progress when checked. No claim is made that the new generic valuation lemma or the proposed residue-class induction has compiled or been formalized. No global termination or Collatz theorem is claimed.
