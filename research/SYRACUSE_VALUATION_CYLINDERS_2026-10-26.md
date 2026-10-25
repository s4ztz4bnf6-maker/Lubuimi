# Syracuse research update: exact valuation cylinders
Date: 2026-10-26

Status: new mathematical specification and proof plan. No claim that the Collatz conjecture is solved.

## Why this is a useful change of representation

A list of positive exponents is not automatically a realizable Syracuse trajectory. The missing object is a finite cylinder of starting values that realizes exactly the prescribed valuation word.

For the accelerated odd map T(n)=(3n+1)/2^{v₂(3n+1)} for positive odd n, write a finite word a=(a₀,…,a_{N−1}), with each aⱼ≥1, and let Aⱼ=Σᵢ<ⱼ aᵢ. The exact transition requirement at step j is

    3nⱼ+1 ≡ 2^{aⱼ} (mod 2^{aⱼ+1}),

not merely divisibility by 2^{aⱼ}. This congruence enforces the exact valuation and the oddness of the next state.

## Cylinder theorem target

Prove by induction on word length that every finite positive exponent word determines one residue class modulo 2^{A_N+1} of odd initial values, and that the positive integers in this class (with the natural positivity condition on all intermediate values) realize the exact word. Conversely, every realized word belongs to that class.

The induction step should not divide in Z/2^kZ by 2. Instead, lift a previously admissible residue class by its two representatives modulo the next power of 2 and use the exact-valuation congruence to select precisely one lift. Since 3 is invertible modulo every power of 2, the relevant linear congruences have unique solutions.

The modulus is 2^{A_N+1}, not 2^{A_N}: each exact valuation a fixes the next binary digit beyond the divisibility threshold. This off-by-one is a common source of incorrect cylinder counts.

## What the theorem gives, and what it does not

1. It converts an arbitrary exponent word into a checkable finite congruence certificate.
2. It separates realizability from the affine identity 2^{A_N} n_N = 3^N n_0 + C_N, where C_{j+1}=3C_j+2^{A_j}.
3. It enables exhaustive searches over valuation cylinders without confusing arbitrary exponent sequences with actual orbits.
4. It does not give a global upper bound for A_N, prove a positive descent margin, or rule out exceptional trajectories. Those remain separate obligations.

## Exact descent ledger

For each realized block, store M_N=2^{A_N}n_0−(3^N n_0+C_N)=2^{A_N}(n_0−n_N). Thus M_N>0 is equivalent to n_N<n_0. The equality is an audit identity, not an independent descent estimate. A search should report the cylinder residue, modulus, start value, exponent word, offset C_N, and margin M_N.

## Lean implementation order

- Define the exact step condition using natural-number divisibility and a remainder condition; avoid totalized division as the specification.
- Prove a residue-lifting lemma for one additional exponent.
- Prove uniqueness of the lifted residue class.
- Prove soundness and completeness of the finite-word certificate against the recursive transition relation.
- Only then connect the certificate to the existing affine-offset and descent-margin lemmas.
- Run the pinned CI and a transitive axiom audit on the exported theorem.

## Topological caution

The accelerated map is not globally continuous on all of Z₂ under the usual 2-adic topology: valuation changes at the singular locus 3x+1=0 in Z₂. The finite cylinder construction is a safe local replacement for pretending that the discontinuity disappears. Any future 2-adic dynamical argument must state its domain and prove that its orbit avoids or controls this locus.

## Research sources

- Tao, “What mathematicians should know about the Lean theorem prover: questions of reliability and AI” (9 Oct 2026): https://terrytao.wordpress.com/2026/10/09/what-mathematicians-should-know-about-the-lean-theorem-proverquestions-of-reliability-and-ai/
- Lean soundness bug postmortem: https://leodemoura.github.io/blog/2026-8-1-postmortem-for-kernel-soundness-bug-14576/
- Verified finite computation range (not a universal proof): https://pcbarina.fit.vutbr.cz/

Acceptance rule: this note is a proof target and representation change, not a compiled theorem. Mark it formalized only after a successful pinned-toolchain build and source/axiom audit.

## Sharpened constructive recursion (2026-10-26 follow-up)

The cylinder proof can be made constructive without searching among all residues. Let
\(B_j=\sum_{i=j}^{N-1}a_i\), so \(B_N=0\). Start with the terminal odd-state class
\(r_N=1\pmod {2}\). Given the unique suffix class
\(r_{j+1}\pmod {2^{B_{j+1}+1}}\), define
\[
 r_j\equiv 3^{-1}(2^{a_j}r_{j+1}-1)
 \pmod {2^{a_j+B_{j+1}+1}}
 =\pmod {2^{B_j+1}}.
\]
Here \(3^{-1}\) is the inverse of 3 modulo the displayed power of 2; it exists because 3 is odd. This is well-defined on residue classes: changing the representative of \(r_{j+1}\) by a multiple of \(2^{B_{j+1}+1}\) changes \(2^{a_j}r_{j+1}\) by a multiple of \(2^{B_j+1}\). It is unique because multiplication by 3 is a bijection modulo every power of 2.

The defining congruence gives
\[
 3r_j+1\equiv 2^{a_j}r_{j+1}\pmod {2^{B_j+1}}.
\]
Since \(r_{j+1}\) is odd, the right side is divisible by \(2^{a_j}\) but not by \(2^{a_j+1}\). Thus the valuation at step \(j\) is exactly \(a_j\), while the quotient lies in the prescribed suffix class. Induction proves both realizability and uniqueness of the cylinder class. This recursion is the key Lean target: it reduces the global finite-word statement to modular-inverse and congruence lemmas, without division by 2 in a quotient ring.

Important boundary: the congruence argument certifies the finite valuation word for positive starting values in the class; it gives no bound forcing the terminal value below the initial value. The descent problem remains genuinely separate.
