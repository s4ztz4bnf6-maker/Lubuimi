# Syracuse terminal residue class and finite counting — 13 November 2026

**Author:** Ta-Yoshua Lubuimi  
**Scope:** finite congruence arithmetic; no infinite-orbit conclusion.


## 13 November 2026 — terminal residue class, lifts, and finite density

Fix a finite positive valuation word \(a_0,\ldots,a_{r-1}\), with \(r\geq1\), \(A=\sum_{i<r}a_i\), and affine accumulator
\[
C_0=0,\qquad C_{i+1}=3C_i+2^{A_i},\qquad A_i=\sum_{t<i}a_t.
\]
Consider the terminal congruence
\[
3^r x+C_r\equiv 2^A\pmod{2^{A+1}}. \tag{T}
\]

### SYR-02 — unique residue class: algebraically BELEGT

Since \(3^r\) is odd, it is invertible modulo \(2^{A+1}\). Thus (T) has exactly one solution class
\[
x\equiv (2^A-C_r)(3^r)^{-1}\pmod{2^{A+1}}.
\]
Moreover \(C_1=1\), and for every later index \(i\geq1\), \(A_i\geq1\), so the recurrence adds an even integer to three times an odd integer. Hence \(C_r\) is odd. As \(A\geq1\), \(2^A-C_r\) is odd, and multiplication by the odd inverse preserves oddness. The unique class is therefore an odd residue class.

This proves uniqueness and oddness for the terminal congruence itself. It does **not** prove that the class realizes the prescribed valuation word; that is the separate SYR-01 equivalence.

### SYR-03 — lift count: algebraically BELEGT

For every \(K\geq A+1\), the unique class modulo \(2^{A+1}\) has exactly
\[
2^{K-A-1}
\]
lifts modulo \(2^K\). This follows because the reduction map from residues modulo \(2^K\) to residues modulo \(2^{A+1}\) has fibres of that cardinality.

### SYR-04 — normalized finite density: algebraically BELEGT

There are \(2^{K-1}\) odd residue classes modulo \(2^K\). The proportion of odd residues lying in the lift family is therefore
\[
\frac{2^{K-A-1}}{2^{K-1}}=2^{-A}
=\prod_{i<r}2^{-a_i}.
\]
This is an exact finite density for the unique terminal-congruence class among odd residues. It becomes the density of the exact valuation-word cylinder only after the two-way word-realization statement in SYR-01 is proved. It is not an infinite-orbit density and gives no pointwise descent conclusion.

### Formalization status and dependency boundary

The algebraic statements SYR-02, SYR-03, and SYR-04 are **BELEGT on paper** by the arguments above. Their Lean formalizations remain **OFFEN** unless a later exact-head CI record names and audits the corresponding declarations. PR #81's current quotient-sequence source head 2f7f3e3aabf4b05b8097228f7fe6ae433ae85b3e, workflow [43121953918](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43121953918), verifies the quotient-state factorization, oddness, accelerated transition, and bundled quotient sequence; it does not claim the residue uniqueness, lift count, or product-density declarations.

The full terminal-congruence iff complete-word-realization theorem (SYR-01) remains **OFFEN**. The infinite-path exclusion (SYR-05) and global termination implication (SYR-06) also remain **OFFEN**. In particular, finite branching, finite lift counting, and finite cylinder density do not exclude an infinite path.

**Attribution:** Ta-Yoshua Lubuimi. AI systems are assistants only, not authors or independent mathematical verifiers.
