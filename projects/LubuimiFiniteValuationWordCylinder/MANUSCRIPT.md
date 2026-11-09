# Lubuimi's Finite Valuation-Word Cylinder Partition Theorem
## Exact 2-adic residue cylinders for accelerated Syracuse valuation words

**Author:** Ta-Yoshua Lubuimi  
**Date:** 10 November 2026  
**Version:** 1.0 — standalone research manuscript

## Abstract

Every finite exact valuation word of the accelerated odd Syracuse map is represented by exactly one odd residue class modulo a power of two. If \(\alpha=(a_0,\ldots,a_{k-1})\) is a finite word of positive exponents and \(A=\sum_i a_i\), then the set of positive odd starts whose first \(k\) exact exponents equal \(\alpha\) is one unique class modulo \(2^{A+1}\), and its relative natural density among odd starts is \(2^{-A}\). We derive an explicit residue formula from the affine offset cocycle, exact parent/child mass identities, and a finite truncation with one explicit tail cylinder. The all-one initial cylinder theorem is recovered as a special case. These results give an exact finite-prefix probability and incidence structure for Syracuse dynamics, but do not prove global Collatz descent.

## 1. Setup

For a positive odd integer \(n_0\), define
\[
a_j=v_2(3n_j+1),\qquad n_{j+1}=\frac{3n_j+1}{2^{a_j}}.
\]
Then \(a_j\ge1\) and each \(n_j\) is positive and odd. Equivalently,
\[
2^{a_j}n_{j+1}=3n_j+1.
\]
For a finite word \(\alpha=(a_0,\ldots,a_{k-1})\), put \(A(\alpha)=\sum_{j<k}a_j\) and let \(\mathcal C_\alpha\) be the set of positive odd starts realizing exactly those first \(k\) exponents.

## 2. Main theorem

**Theorem 2.1 (Lubuimi's Finite Valuation-Word Cylinder Partition Theorem).**  
For every finite word \(\alpha=(a_0,\ldots,a_{k-1})\) with all \(a_j\ge1\), there is a unique odd residue class \(r_\alpha\pmod {2^{A(\alpha)+1}}\) such that
\[
\boxed{\mathcal C_\alpha=\{n_0>0:n_0\equiv r_\alpha\pmod {2^{A(\alpha)+1}}\}.}
\]
Its relative natural density among positive odd integers is
\[
\boxed{\mu_{\rm odd}(\mathcal C_\alpha)=2^{-A(\alpha)}.}
\]
For the empty word, \(A=0\) and the cylinder is all odd integers, the class \(1\bmod2\).

### Proof

We induct on word length. The empty word is immediate. Write a nonempty word as \(\alpha=(a_0,\beta)\), where the tail \(\beta\) has total exponent \(B\). By induction the tail cylinder is one odd residue \(r_\beta\pmod {2^{B+1}}\).

A start realizes \(\alpha\) precisely when
\[
3n_0+1\equiv2^{a_0}r_\beta\pmod {2^{a_0+B+1}}.
\]
Since \(3\) is invertible modulo every power of two, this determines exactly one residue class modulo \(2^{a_0+B+1}=2^{A(\alpha)+1}\).

Reducing the congruence modulo \(2^{a_0+1}\), the right side is \(2^{a_0}\) times an odd number. Hence \(3n_0+1\) is divisible by \(2^{a_0}\) but not \(2^{a_0+1}\), so its exact valuation is \(a_0\). Division by \(2^{a_0}\) puts the next iterate in the tail residue class. Conversely every start realizing the word satisfies the congruence. This proves existence, uniqueness and exactness.

There are \(2^{A(\alpha)}\) odd residue classes modulo \(2^{A(\alpha)+1}\), and the cylinder is exactly one of them. Its relative density is \(2^{-A(\alpha)}\). \(\square\)

## 3. Explicit residue from the affine offset

For the word define
\[
A_0=0,\quad A_{j+1}=A_j+a_j,\qquad
C_0=0,\quad C_{j+1}=3C_j+2^{A_j}.
\]
The affine identity is
\[
2^{A(\alpha)}n_k=3^kn_0+C_k.
\]
Since \(n_k\) is odd,
\[
3^kn_0+C_k\equiv2^{A(\alpha)}\pmod {2^{A(\alpha)+1}}.
\]
Thus
\[
\boxed{r_\alpha\equiv(2^{A(\alpha)}-C_k)(3^k)^{-1}
\pmod {2^{A(\alpha)+1}}.}
\]
The inverse exists because \(3^k\) is odd. This connects the cylinder partition directly to the affine offset cocycle.

## 4. Prefix tree and exact child masses

If a prefix \(\alpha\) has total exponent \(A\), extending it by a next exponent \(b\ge1\) gives a child with total exponent \(A+b\), contained in the parent. Its relative mass is \(2^{-b}\). Every positive odd terminal state has exactly one next exponent, so the children are disjoint and exhaust the parent:
\[
\boxed{\sum_{b\ge1}2^{-b}=1.}
\]
The finite exact valuation words form a measure-consistent rooted prefix tree.

## 5. Finite truncation and the exact tail cylinder

Fix a prefix of total exponent \(A\) and a cutoff \(B\ge1\). Partition its cylinder into exact children with next exponent \(b=1,\ldots,B\), and the tail event \(a_k\ge B+1\). The tail condition is
\[
3n_k+1\equiv0\pmod {2^{B+1}}.
\]

Write the parent residue as \(n_0=r+2^{A+1}t\). The affine identity gives
\[
n_k=n_k^*+2\cdot3^k t.
\]
As \(3^k\) is invertible modulo \(2^B\), these values run bijectively through odd residue classes modulo \(2^{B+1}\) as \(t\) runs modulo \(2^B\). The tail condition therefore selects exactly one value of \(t\bmod2^B\). The tail is one residue class modulo \(2^{A+B+1}\), not an uncontrolled union.

The relative masses inside the parent are
\[
\mu_\alpha(\mathcal C_{\alpha b})=2^{-b},\qquad
\mu_\alpha(\mathcal T_{\alpha,B})=2^{-B},
\]
and
\[
\boxed{\sum_{b=1}^{B}2^{-b}+2^{-B}=1.}
\]
This is a finite, disjoint, exhaustive weighted refinement with one explicit tail atom.

## 6. Initial all-one cylinder as a special case

For \(\alpha=(1,\ldots,1)\) of length \(N\), \(A_N=N\) and \(C_N=3^N-2^N\). The residue formula reduces to \(r_\alpha\equiv-1\pmod {2^{N+1}}\). Thus the cylinder is exactly \(n_0\equiv-1\pmod {2^{N+1}}\), recovering **Lubuimi's Initial Valuation-One Cylinder Theorem** and the exact initial run length \(v_2(n_0+1)-1\).

## 7. Mathematical contribution and limits

The theorem gives (i) unique residue realization of every finite exact valuation word; (ii) exact density determined by cumulative exponent; (iii) an explicit residue formula from the offset cocycle; (iv) exact child masses; and (v) a finite cutoff with one exact tail cylinder. These are concrete tools for valuation-word trees, stopping-time distributions, affine offset budgets and signed-margin compensation.

A zero-density exceptional family can still contain individual integers. The cylinder density identities alone do not establish an orbitwise finite descent block or prove the global Collatz conjecture.

## 8. The Lubuimi APW4–Syracuse Cylinder–Energy Bridge

The finite valuation-word tree supplies a candidate source structure for an APW4-style transport argument: prefix words are nodes, exact residue cylinders are fibres, containment gives incidence, and \(2^{-b}\) are exact refinement weights. Finite tail cylinders provide a terminal atom at every cutoff. Signed margins can be attached to the same valuation-word indices.

This motivates the named **Lubuimi APW4–Syracuse Cylinder–Energy Bridge**. It is a research programme, not a theorem already established by the cylinder result. A valid bridge requires explicit finite source and target index sets, a concrete index-preserving map, the APW4 diagonal and off-diagonal weights on those indices, and a genuine BIB/Hall capacity inequality. Diagonal mass, off-diagonal mass and pair reserve remain distinct until their exact identifications are proved. APW4 remains an independent mathematical result; no unproved APW4-to-Collatz implication is assumed here.

## 9. Lean status

The all-one special case is formally verified as CollatzSyracuseAudit.lubuimi_initial_valuation_one_cylinder. Two full exact-commit workflows passed:
- Run 42721006544, merge commit 44bb2ac, PR head 013192ce524a4572a9d96c8d4dcb2796830b1f62.
- Run 42721305220, merge commit 3d79761, PR head ad7203f5571d03e5989b9ac935b2103300f02409.

Both compiled the library, iteration/threshold, Syracuse reference/quarter-descent, offset, closed form, stronger lower bound, margin block and valuation-transition modules. Both printed the main theorem's transitive profile as [propext, Classical.choice, Quot.sound]; the complete-log sorryAx scan passed. These checks apply to the named theorem and exact snapshots.

The general finite valuation-word theorem and finite tail partition in this manuscript are mathematically derived but are not yet claimed as Lean-compiled or axiom-audited. They are the next formalization milestone.

## 10. Conclusion

Every finite exact valuation word is one unique odd residue class modulo \(2^{A+1}\), with relative density \(2^{-A}\), where \(A\) is the total exponent. The exact prefix tree has child weights \(2^{-b}\) and a single tail cylinder at every finite cutoff. This is a self-contained local theorem and a foundation for further arithmetic and incidence research, not a proof of global Collatz descent.

**Author:** Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers.


## 8. Terminal exact-residue characterization and formalization route

The finite-word cylinder also admits a direct terminal characterization. With
\[
X_j=3^j n_0+C_j,\qquad A_j=\sum_{t<j}a_t,
\]
the exact word is characterized by the terminal congruence
\[
X_k\equiv2^{A_k}\pmod{2^{A_k+1}}.
\]
Indeed, for every \(j<k\), the suffix expansion
\[
X_k=3^{k-j}X_j+2^{A_j}R_j,
\qquad
R_j=\sum_{t=j}^{k-1}3^{k-1-t}2^{A_t-A_j}
\]
has \(R_j\) odd: its first summand is odd and all later summands are even. The terminal congruence therefore forces \(2^{A_j}\mid X_j\), and after division by \(2^{A_j}\) forces the quotient to be odd. Thus exactness propagates backwards to every prefix. Conversely, an exact realized word has an odd terminal quotient and hence satisfies the terminal congruence.

Solving the terminal congruence for \(n_0\) gives the same explicit residue formula as §3, because \(3^k\) is invertible modulo \(2^{A_k+1}\). This is an alternative proof architecture for Lean: it replaces nested quotient recursion by a finite suffix expansion, an oddness lemma, backward propagation of exact prefix residues, and reconstruction of the quotient orbit. The detailed declaration sequence is recorded separately in `LEAN_FORMALIZATION_ROUTE_TERMINAL_CONGRUENCE.md`.

**Formalization status:** This terminal characterization is a mathematical derivation and a Lean proof route only. It is not yet Lean-compiled or axiom-audited. The four successful CI snapshots continue to certify only the initial all-one special case.
