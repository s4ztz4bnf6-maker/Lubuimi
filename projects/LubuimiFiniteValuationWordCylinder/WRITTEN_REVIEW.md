# Written Review — Finite Exact Valuation-Word Cylinder Classification and Tail Partition

**Author:** Ta-Yoshua Lubuimi  
**Review date:** 10 November 2026  
**Review type:** Internal mathematical review; not independent peer review.

## 1. Main theorem

For every finite positive valuation word \(\alpha=(a_0,\ldots,a_{k-1})\), with total exponent \(A=\sum_i a_i\), the set of positive odd starts realizing exactly \(\alpha\) is one unique odd residue class modulo \(2^{A+1}\). Its relative natural density among odd starts is \(2^{-A}\), and its absolute density among all positive integers is \(2^{-(A+1)}\). The residue is
\[
r_\alpha\equiv(2^A-C_k)(3^k)^{-1}\pmod{2^{A+1}}.
\]

## 2. Historical priority and mathematical scope

The one-cylinder classification is a direct reformulation of the classical finite parity-vector coding. Let
\\[
T(n)=
\\begin{cases}
(3n+1)/2,&n\\text{ odd},\\\\
n/2,&n\\text{ even}.
\\end{cases}
\\]
For a valuation word \\(\\alpha\\) with cumulative sums \\(A_j\\), the exact word corresponds to the length-`A+1` parity vector whose entries are one exactly at \\(A_0,\\ldots,A_k\\) and zero at all intervening positions. The finite parity-vector map is a permutation modulo \\(2^{A+1}\\).

The coding originates with Terras (1976) and Everett (1977); Lagarias (1985), Theorem B, is a standard explicit reference. Kontorovich–Lagarias (2009), Theorem 2.1, restates the result and identifies that history. Tao (2022), §4 in the proof of Proposition 1.9, also explicitly notes that fixing a finite Syracuse valuation tuple constrains the starting odd integer to one residue class modulo \\(2^{|\\alpha|+1}\\). Tao's Proposition 1.9 is a conditional approximate-distribution theorem, not merely the exact residue-class statement.

Accordingly, the residue-class classification and density are classical and are not claimed as a new discovery. This manuscript's role is an independent exposition in accelerated-valuation coordinates, with the affine offset formula and explicit finite-tail and margin consequences. No eponymous theorem name or priority claim is used. The novelty of any additional finite-tail or margin corollary is a separate literature question.

## 3. Proof review

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

## 4. Margin and finite-branching consequences

For a prefix with total exponent \(A\) and signed margin \(D\),
\[
D(\alpha b)=3D+(2^b-4)2^A.
\]
If the next extension does not descend below the initial odd start, then necessarily \(D(\alpha b)\le0\), hence
\[
2^{A+b}+3D\le4\cdot2^A.
\]
For fixed \(\alpha\), only finitely many positive \(b\) satisfy this inequality. Therefore every node in a hypothetical least nonterminating orbit has finitely many possible non-descending children. The complementary exact tail cylinder forces descent. This is a state-dependent finite-branching reduction, not a uniform valuation bound and not a proof that an infinite surviving path is impossible.

## 5. Worked examples and scope

The manuscript includes explicit residues for short words, showing that words with the same total exponent have equal cylinder density but can occupy different residue classes. The theorem supplies exact finite-prefix coding, cylinder counting, and a finite arithmetic framework for further questions. No independent priority claim is made for these consequences without a separate literature comparison.

It does not prove that almost every orbit descends, does not eliminate a zero-density exceptional set, and does not establish global Collatz. The state-dependent cap is not uniform across prefixes.

## 6. Formalization status

The initial all-one specialization has seven successful exact-commit compile/audit snapshots: 42721006544, 42721305220, 42721911555, 42722186081, 42724343412, 42725006480, and 42725493567. Those audits do not cover the general finite-word theorem, the finite tail partition, or the state-dependent cap. The general cylinder theorem, exact tail partition and formal maximum B_alpha remain mathematical manuscript results awaiting Lean formalization. The algebraic cap equivalence, nonpositive-margin implication for a nondecreasing exact affine endpoint, and next-exponent cap have since been Lean-compiled on exact commit ca48ec7fdad5e8d6f8aeb82fed8586a1b57c12bc (run 42728049650, Lean 4.34.1), each with profile [propext, Classical.choice, Quot.sound] and no actual sorryAx in the full log.

**Verdict:** The general finite-word cylinder theorem and its exact tail partition are mathematically proved in the manuscript but remain open for Lean formalization. The algebraic/orbit core of the state-dependent non-descent cap is now Lean-verified on exact commit ca48ec7fdad5e8d6f8aeb82fed8586a1b57c12bc (run 42728049650). The formal maximum B_alpha, finite surviving-child structure and exact tail-cylinder partition remain to be formalized.

**Attribution:** Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers.


## References

1. R. Terras, “A stopping time problem on the positive integers,” *Acta Arithmetica* 30 (1976), 241–252. https://doi.org/10.4064/aa-30-3-241-252.
2. C. J. Everett, “Iteration of the number theoretic function f(2n)=n, f(2n+1)=3n+2,” *Advances in Mathematics* 25 (1977), 42–45. https://doi.org/10.1016/0001-8708(77)90087-1.
3. J. C. Lagarias, “The 3x+1 problem and its generalizations,” *The American Mathematical Monthly* 92 (1985), no. 1, 3–23, Theorem B.
4. A. V. Kontorovich and J. C. Lagarias, “Stochastic Models for the 3x+1 and 5x+1 Problems,” arXiv:0910.1944 (2009), Theorem 2.1.
5. T. Tao, “Almost all orbits of the Collatz map attain almost bounded values,” *Forum of Mathematics, Pi* 10 (2022), e12, §4, proof of Proposition 1.9. https://doi.org/10.1017/fmp.2022.8.
