# Written Review — Lubuimi's Finite Valuation-Word Cylinder Partition Theorem

**Author:** Ta-Yoshua Lubuimi  
**Review date:** 10 November 2026  
**Review type:** Internal mathematical review; not independent peer review.

## 1. Main theorem

For every finite positive valuation word \(\alpha=(a_0,\ldots,a_{k-1})\), with total exponent \(A=\sum_i a_i\), the set of positive odd starts realizing exactly \(\alpha\) is one unique odd residue class modulo \(2^{A+1}\). Its relative natural density among odd starts is \(2^{-A}\), and its absolute density among all positive integers is \(2^{-(A+1)}\). The residue is
\[
r_\alpha\equiv(2^A-C_k)(3^k)^{-1}\pmod{2^{A+1}}.
\]

## 2. Proof review

The recursive proof and the terminal-congruence proof are compatible. The terminal condition
\[
X_k\equiv2^A\pmod{2^{A+1}},\qquad X_j=3^jn_0+C_j,
\]
forces exact divisibility and odd quotient at every prefix. The suffix expansion
\[
X_k=3^{k-j}X_j+2^{A_j}R_j
\]
has odd \(R_j\), which gives backward propagation of exact prefix residues. Since \(3^k\) is invertible modulo \(2^{A+1}\), the terminal congruence selects one residue class.

The finite refinement is exact: children \(b=1,\ldots,B\) and one tail event \(b\ge B+1\) partition the parent cylinder, with relative masses \(2^{-b}\) and \(2^{-B}\). The tail is itself one residue class, not a residual countable union.

## 3. New margin and finite-branching consequences

For a prefix with total exponent \(A\) and signed margin \(D\),
\[
D(\alpha b)=3D+(2^b-4)2^A.
\]
If the next extension does not descend below the initial odd start, then necessarily \(D(\alpha b)\le0\), hence
\[
2^{A+b}+3D\le4\cdot2^A.
\]
For fixed \(\alpha\), only finitely many positive \(b\) satisfy this inequality. Therefore every node in a hypothetical least nonterminating orbit has finitely many possible non-descending children. The complementary exact tail cylinder forces descent. This is a state-dependent finite-branching reduction, not a uniform valuation bound and not a proof that an infinite surviving path is impossible.

## 4. Worked examples and scope

The manuscript includes explicit residues for short words, showing that words with the same total exponent have equal cylinder density but can occupy different residue classes. The theorem supplies exact finite-prefix coding, cylinder counting, and a precise input for finite incidence/moment constructions.

It does not prove that almost every orbit descends, does not eliminate a zero-density exceptional set, and does not establish global Collatz. The state-dependent cap is not uniform across prefixes.

## 5. Formalization status

The initial all-one specialization has seven successful exact-commit compile/audit snapshots: 42721006544, 42721305220, 42721911555, 42722186081, 42724343412, 42725006480, and 42725493567. Those audits do not cover the general finite-word theorem, the finite tail partition, or the state-dependent cap. The general theorem and these corollaries remain mathematical manuscript results awaiting Lean formalization and exact-commit axiom audit.

**Verdict:** The general finite-word cylinder theorem and its finite tail partition are mathematically proved in the manuscript. The local tail-margin and finite-branching corollaries follow from the existing signed-margin recurrence. Formal verification of these general results remains open.

**Attribution:** Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers.
