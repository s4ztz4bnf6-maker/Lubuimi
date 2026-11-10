# Syracuse exact residue lift refinement

Status: mathematical target, not a verified Lean theorem.

For a finite word of positive accelerated valuations a₀,…,aₖ₋₁, write Sⱼ = a₀+…+aⱼ₋₁. The exact condition v₂(3nⱼ+1)=aⱼ is equivalent to 3nⱼ+1 ≡ 2^{aⱼ} (mod 2^{aⱼ+1}). The correct modulus for the initial value after k steps is expected to be 2^{Sₖ+1}, not merely 2^{Sₖ}; the extra bit already matters for a₀=1, where n₀ ≡ 3 (mod 4).

Induction strategy: the prefix fixes one odd class modulo 2^{S+1}. Its lifts to modulus 2^{S+a+1} vary the next odd state across odd residues modulo 2^{a+1}, because the affine coefficient is odd. Exactly one lift satisfies the next exact-valuation congruence. Formalize the lift bijection and the equivalence between the congruence and exact valuation; do not bake the conclusion into the definition.

This yields finite symbolic realizability, not descent. For any representative, strict descent still requires 3^k n₀ + Cₖ < 2^{Sₖ} n₀. The 2-adic conjugacy of Bernstein–Lagarias motivates the coding but does not prove positive-integer termination: https://websites.umich.edu/~lagarias/doc/bernstein.pdf
