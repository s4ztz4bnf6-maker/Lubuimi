# Research roadmap: affine prefixes, stopping times, and valuation cylinders

Status: research design, not a proof of the global Collatz conjecture. This note separates published results from proposed formalization work.

## 1. Literature and the boundary of existing methods

- R. Terras, “A stopping time problem on the positive integers,” Acta Arithmetica 30 (1976). The stopping-time viewpoint organizes trajectories by the first time they fall below their starting value. This is a natural match for the existing finite-prefix descent certificates.
- T. Tao, “Almost all orbits of the Collatz map attain almost bounded values,” Forum of Mathematics, Pi 10 (2022), e12; preprint arXiv:1909.03562, https://arxiv.org/abs/1909.03562. The proof uses an approximate transport property for a first-passage random variable, 3-adic distribution information, and Fourier decay for a skew random walk. The conclusion is an almost-all-orbits result in logarithmic density, not termination of every orbit.
- The important logical boundary: a density-one or logarithmic-density-one theorem does not rule out an exceptional individual orbit. Likewise, a finite modular check cannot exclude an orbit that escapes all tested moduli and lengths.

## 2. Exact finite-prefix interface already available

For a realized accelerated trajectory with exponents a(i) = v₂(3 nᵢ + 1), define
Aₖ = Σ_{i<k} a(i) and recursively C₀ = 0, Cₖ₊₁ = 3 Cₖ + 2^{Aₖ}.
The kernel-facing affine identity is
2^{Aₖ} nₖ = 3^k n₀ + Cₖ.
When Dₖ = 2^{Aₖ} - 3^k > 0, strict descent is equivalent to
Cₖ < Dₖ n₀; non-descent implies Dₖ n₀ ≤ Cₖ, hence
n₀ ≤ floor(Cₖ / Dₖ). These are exact statements for a realized prefix.

## 3. Proposed new bridge: valuation words as 2-adic cylinders

For a fixed finite exponent word (a₀,…,aₖ₋₁), the affine identity implies the necessary congruence
3^k n₀ + Cₖ ≡ 0 (mod 2^{Aₖ}).
Because 3^k is invertible modulo 2^{Aₖ}, this congruence selects one residue class for n₀ modulo 2^{Aₖ}. Important caveat: this congruence alone does not guarantee the exact valuation word; each step also requires divisibility by 2^{aᵢ} and non-divisibility by 2^{aᵢ+1} at its actual state.

Suggested Lean work, in order:
1. Prove that 3^k is odd and coprime to 2^A for all k,A.
2. From affine_prefix_divisibility, prove that two starting states realizing the same exponent word are congruent modulo 2^{Aₖ}. Keep the exact-valuation conditions separate from the affine congruence.
3. Define a finite valuation cylinder as the set of starts realizing a prescribed exact word; prove cylinder nesting under word extension and disjointness of incompatible words.
4. Build a finite prefix tree whose nodes carry (i) exact realizability, (ii) the unique residue class constraint, and (iii) either a descent certificate or an offset obstruction.
5. Search for a uniform theorem bounding the surviving non-descent cylinders, or a concrete compatible infinite branch. Do not infer that a measure-zero set contains no infinite path: that inference is invalid without an additional compactness/uniform-exclusion argument.

## 4. Alternative routes if a uniform offset bound fails

- Stopping-time / block route: use residue-class block transitions with affine bounds T^m(n) ≤ λ n + b, λ < 1, and prove coverage of all relevant residue classes or an invariant finite family of classes. The existing BlockTransition composition lemma is a suitable interface, but the coverage theorem is the hard part.
- Congruence-tree route: use exact 2-adic cylinders to eliminate impossible valuation words and test whether every infinite compatible path is ruled out by a finite obstruction. This needs a genuine finite-branching argument and cannot rely only on small-modulus experiments.
- Probabilistic route: Tao's transport/Fourier framework explains why almost all starts descend. To reach all starts, one would need a new uniform mechanism excluding the exceptional set, not simply a stronger density statement.
- Counterexample-oriented route: any candidate non-descending orbit must satisfy all prefix inequalities Dₖ n₀ ≤ Cₖ whenever Dₖ > 0, alongside exact valuation congruences. These necessary conditions can prune searches, but a finite search is not a proof of nonexistence.

## 5. Acceptance criteria

- Compile every new theorem and inspect its #print axioms output.
- Keep local descent, almost-all-orbits results, and global termination as three distinct claim levels.
- No global conclusion follows until either a uniform all-start descent mechanism is proved or a concrete counterexample is rigorously certified.
