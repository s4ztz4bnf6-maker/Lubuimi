# Literature, attribution, and scope correction

**Author:** Ta-Yoshua Lubuimi  
**Date:** 10 November 2026  
**Applies to:** Initial valuation-one cylinder note and finite exact valuation-word cylinder companion.

## 1. Mathematical statements are retained

The initial valuation-one equivalence, its direct proof, the exact run-length formula, the density computations, the affine-offset identities, and the signed-margin calculations are not withdrawn or weakened by this correction. The finite exact valuation-word residue-class derivation is also retained as an independently written derivation.

## 2. Eponym and novelty correction

The labels “Lubuimi's Initial Valuation-One Cylinder Theorem” and “Lubuimi's Finite Valuation-Word Cylinder Partition Theorem” are removed as mathematical theorem names. Use descriptive names:

- “Initial valuation-one cylinder classification.”
- “Finite exact valuation-word cylinder classification.”

The author's name remains on the manuscript as author of the exposition, independent proof presentation, and Lean formalization. Authorship is not the same as priority for a mathematical statement.

## 3. Historical mathematical position

For the standard 3x+1 map T(n)=(3n+1)/2 on odd integers and T(n)=n/2 on even integers, a finite parity vector determines a unique residue class modulo the corresponding power of two. Lagarias [3, Theorem B] gives the explicit permutation statement. Terras [1] and Everett [2] are part of the classical historical development.

A finite exact Syracuse valuation word alpha=(a_0,...,a_{k-1}), with total exponent A=sum a_j, determines a parity vector of length A+1: concatenate blocks 1,0^(a_j-1) and append a terminal 1. The terminal 1 records that the last accelerated Syracuse state is odd. Thus the unique residue class modulo 2^(A+1) and its relative odd density 2^(-A) are consequences of the classical parity-vector coding. The all-one word gives the class -1 modulo 2^(N+1).

Tao [4, §1.2, Proposition 1.9] is relevant to finite Syracuse valuation vectors and their approximate distribution. The proposition assumes approximate equidistribution of the starting value modulo a sufficiently high power of two and concludes approximate geometric distribution of the valuation vector. It is not itself the exact unique-residue-class theorem. Do not attribute that exact uniqueness statement to Proposition 1.9.

## 4. Correct contribution statement

The defensible contribution is:

- an independent elementary derivation in accelerated-Syracuse valuation coordinates;
- a self-contained presentation of the initial-run formula and exact density calculations;
- explicit affine-offset and signed-margin consequences, with the precise hypotheses and implications stated;
- a Lean formalization of the initial-cylinder equivalence, with declaration-scoped CI evidence at the exact recorded commits.

No novelty or priority claim is made for the parity-vector congruence classification or its finite valuation-word reparameterization.

## 5. Formal verification boundary

The Lean declaration recorded at SyracuseOffsetIdentity.lean:2397 and source commit b1a8599c686c37893a33453b759dee42047c7727 is a source-level formalization of the initial-cylinder statement. The existing successful CI/axiom records apply only to that declaration at the exact checked snapshots. They do not certify the arbitrary finite-word companion, its finite tail partition, the terminal-residue collision-energy note, or global Collatz descent.

The historical source identifier lubuimi_initial_valuation_one_cylinder is retained in the record to identify the exact audited declaration. It is not used as a mathematical eponym. A future neutral source-identifier rename must be a separate source change followed by a fresh exact-commit build and axiom audit; no verification status is transferred automatically.

## 6. Editorial corrections

- Replace “stopping time” when referring to Corollary 4.2 by “initial run length”; in the Collatz literature “stopping time” has a distinct standard meaning.
- State explicitly that D_j>0 implies n_j<n_0, by the affine identity and C_j>=0.
- Remove APW4/weighted-fibre/collision-energy cross-project references from the standalone initial-cylinder note.
- Typeset all formulas as actual display or inline mathematics; retain the multiplication dot in 3·2^(A_j)n_j, and use \mathrm{odd} in density subscripts to avoid Markdown underscore parsing.
- Keep the Lean section concise in the manuscript; retain full workflow chronology in the dedicated status file.
- The published PDF is not modified by this correction. Any revised manuscript source is a separate versioned artifact.

## References

[1] R. Terras, “A stopping time problem on the positive integers,” Acta Arithmetica 30 (1976), 241–252. https://doi.org/10.4064/aa-30-3-241-252

[2] C. J. Everett, “Iteration of the number-theoretic function f(2n) = n, f(2n + 1) = 3n + 2,” Advances in Mathematics 25 (1977), no. 1, 42–45. https://doi.org/10.1016/0001-8708(77)90087-1

[3] J. C. Lagarias, “The 3x + 1 Problem and Its Generalizations,” The American Mathematical Monthly 92 (1985), no. 1, 3–23, Theorem B. https://doi.org/10.1080/00029890.1985.11971528

[4] T. Tao, “Almost all orbits of the Collatz map attain almost bounded values,” Forum of Mathematics, Pi 10 (2022), e12. https://doi.org/10.1017/fmp.2022.8; arXiv:1909.03562, §1.2 and Proposition 1.9.
