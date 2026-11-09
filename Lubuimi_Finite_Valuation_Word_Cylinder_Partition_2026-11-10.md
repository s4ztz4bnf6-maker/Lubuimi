# Lubuimi's Finite Valuation-Word Cylinder Partition Theorem

**Author:** Ta-Yoshua Lubuimi  
**Research date:** 10 November 2026  
**Status:** Exact mathematical derivation; Lean formalization target, not yet a compiled Lean theorem.

## 1. Statement

Let
\[
\alpha=(a_0,\ldots,a_{k-1}),\qquad a_i\ge1,
\]
be a finite word of exact accelerated Syracuse exponents, and let
\[
A(\alpha)=a_0+\cdots+a_{k-1}.
\]
For a positive odd starting value \(n_0\), write
\[
n_{j+1}=\frac{3n_j+1}{2^{a_j}},
\qquad a_j=v_2(3n_j+1).
\]

Define the exact valuation-word cylinder
\[
\mathcal C_\alpha
=\{n_0\in\mathbb N_{>0}: n_0\text{ odd and its first }k
\text{ exact exponents are }\alpha\}.
\]

**Lubuimi's Finite Valuation-Word Cylinder Partition Theorem:** There is a unique odd residue class
\[
r_\alpha\pmod {2^{A(\alpha)+1}}
\]
such that
\[
\boxed{
\mathcal C_\alpha
=\{n_0>0:n_0\equiv r_\alpha\pmod {2^{A(\alpha)+1}}\}.
}
\]
Consequently, among positive odd residue classes, the exact cylinder has relative natural density
\[
\boxed{\mu(\mathcal C_\alpha)=2^{-A(\alpha)}.}
\]

The empty word has \(A=0\) and its cylinder is the single odd residue class modulo \(2\).

## 2. Proof by recursive residue construction

Proceed by induction on the word length.

For the empty word, every positive odd integer belongs to the cylinder, which is exactly the class \(1\bmod2\).

Suppose the word is \(\alpha=(a_0,\beta)\), where the tail word \(\beta\) has total exponent \(B\). By induction there is a unique odd residue \(r_\beta\) modulo \(2^{B+1}\) describing the tail cylinder.

The first step has exact exponent \(a_0\) and its next odd value is
\[
n_1=(3n_0+1)/2^{a_0}.
\]
The requirement that \(n_1\) belong to the tail cylinder is exactly
\[
3n_0+1\equiv 2^{a_0}r_\beta
\pmod {2^{a_0+B+1}}.
\]
Since \(3\) is invertible modulo every power of \(2\), this congruence determines a unique residue class for \(n_0\) modulo \(2^{a_0+B+1}\).

Because \(r_\beta\) is odd, the right side has exact 2-adic valuation \(a_0\) modulo \(2^{a_0+1}\). Thus every \(n_0\) in the constructed residue class has exact first exponent \(a_0\), and its next iterate lies in the tail cylinder. Conversely, every start realizing the full word satisfies this congruence. This proves both existence and uniqueness.

There are \(2^{A(\alpha)}\) odd residue classes modulo \(2^{A(\alpha)+1}\), and the cylinder is exactly one of them. Its relative density among odd classes is therefore \(2^{-A(\alpha)}\).

## 3. Explicit residue from the affine offset

For the word \(\alpha\), define
\[
A_0=0,\qquad A_{j+1}=A_j+a_j,
\]
\[
C_0=0,\qquad C_{j+1}=3C_j+2^{A_j}.
\]
The certified affine identity is
\[
2^{A(\alpha)}n_k=3^kn_0+C_k.
\]
Since \(n_k\) is odd,
\[
3^kn_0+C_k\equiv2^{A(\alpha)}
\pmod {2^{A(\alpha)+1}}.
\]
Therefore the unique residue has the explicit form
\[
\boxed{
r_\alpha\equiv
(2^{A(\alpha)}-C_k)(3^k)^{-1}
\pmod {2^{A(\alpha)+1}}.
}
\]
The inverse exists because \(3^k\) is odd.

This formula connects the recursive cylinder construction directly to the already formalized affine offset cocycle.

## 4. The initial valuation-one cylinder as a special case

For \(\alpha=(1,\ldots,1)\) of length \(N\),
\[
A_N=N,\qquad C_N=3^N-2^N.
\]
Hence
\[
r_\alpha\equiv
(2^N-(3^N-2^N))(3^N)^{-1}
\equiv -1\pmod {2^{N+1}}.
\]
Thus
\[
\mathcal C_{(1,\ldots,1)}
=\{n_0>0:n_0\equiv-1\pmod {2^{N+1}}\},
\]
which is exactly Lubuimi's Initial Valuation-One Cylinder Theorem.

## 5. Prefix tree and exact child masses

If \(\alpha\) has total exponent \(A\), then extending it by a next exponent \(b\ge1\) gives a child cylinder with total exponent \(A+b\). The child is contained in the parent, and its relative mass is
\[
\frac{2^{-(A+b)}}{2^{-A}}=2^{-b}.
\]
Every positive odd terminal state has one and only one exact next exponent, so the children partition the parent. The exact mass identity is
\[
\boxed{\sum_{b\ge1}2^{-b}=1.}
\]
Thus the finite valuation words form an exact, measure-consistent prefix tree of residue cylinders.

## 6. APW4 interface and the next proof obligation

This result gives an exact finite source family for an APW4-style incidence analysis:
- prefix nodes are finite valuation words;
- each node has a unique residue-class cylinder and exact mass \(2^{-A}\);
- parent/child incidences have exact relative weights \(2^{-b}\);
- terminal states and block margins are attached to the same index-preserving word.

The next step is to define a finite incidence matrix between prefix cylinders and terminal-state/collision events, then separate diagonal mass from off-diagonal overlap and identify a genuine BIB/Hall capacity. The APW4 transport theorem can only be applied after an explicit index-preserving map and all its hypotheses have been proved.

A zero-measure exceptional family alone would not exclude an individual integer orbit. The Collatz application must produce a quantitative finite obstruction or a uniform arithmetic lower bound for every hypothetical non-descending integer path.

## 7. Formalization target

Add a Lean theorem, named for the author, asserting that for every finite positive exponent word the set of positive odd starts realizing that exact word is one residue class modulo \(2^{A+1}\). Prove it recursively using:
1. invertibility of \(3\) modulo \(2^m\);
2. exactness of the first valuation from the odd tail residue;
3. the affine offset identity for the explicit residue formula;
4. exact relative cylinder mass and parent/child partition.

No Lean compile or axiom-audit success is claimed for this new theorem yet.

---

**Ta-Yoshua Lubuimi**  
Copyright © 2026 Ta-Yoshua Lubuimi. All rights reserved for the original text and formalization materials, subject to the repository's proprietary license and third-party rights.
