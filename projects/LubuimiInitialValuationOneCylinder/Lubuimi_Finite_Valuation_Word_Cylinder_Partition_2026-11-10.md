# Finite Exact Valuation-Word Cylinders for the Accelerated Syracuse Map

**Author:** Ta-Yoshua Lubuimi  
**Research date:** 10 November 2026  
**Status:** Independent derivation of a classical parity-vector consequence; Lean formalization target, not yet a compiled Lean theorem. No novelty or priority claim is made.

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

**Finite valuation-word cylinder classification:** There is a unique odd residue class
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
which is exactly the initial valuation-one cylinder classification in the companion note.

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

## 6. Relation to classical parity-vector coding

Let \(T\) be the standard map \(T(n)=(3n+1)/2\) for odd \(n\) and \(T(n)=n/2\) for even \(n\). An exact Syracuse valuation word \(\alpha=(a_0,\ldots,a_{k-1})\) with total exponent \(A\) determines a parity vector of length \(A+1\): concatenate the blocks \(1,0,\ldots,0\), with \(a_j-1\) zeros in the block corresponding to \(a_j\), and append the final \(1\) recording that the terminal Syracuse state is odd. Conversely, this parity pattern determines the valuation word by reading the gaps between successive odd positions.

The finite parity-vector permutation theorem therefore gives exactly one residue class modulo \(2^{A+1}\) for this prescribed pattern. Restricting to odd starting values gives relative density \(2^{-A}\). The recursive proof above is an independent derivation in accelerated-valuation coordinates of this classical consequence; it is not a new partition theorem.

Lagarias [3, Theorem B] gives the explicit finite parity-vector permutation statement. Terras [1] and Everett [2] are part of the classical historical development. Tao [4, §1.2, Proposition 1.9] studies approximate distributions of finite Syracuse valuation vectors under a residue equidistribution hypothesis. That proposition should not be described as the exact unique-residue-class theorem.

## 7. Formalization target

Formalize the finite-word corollary as a separate Lean declaration with a neutral mathematical name, and record the exact source commit and declaration-scoped axiom profile. No compile or axiom-audit success is currently claimed. Prove it recursively using:
1. invertibility of \(3\) modulo \(2^m\);
2. exactness of the first valuation from the odd tail residue;
3. the affine offset identity for the explicit residue formula;
4. exact relative cylinder mass and parent/child partition.

No Lean compile or axiom-audit success is claimed for this new theorem yet.

---

**Ta-Yoshua Lubuimi**  
Copyright © 2026 Ta-Yoshua Lubuimi. All rights reserved for the original text and formalization materials, subject to the repository's proprietary license and third-party rights.


## 8. Finite truncation with an exact tail cylinder

Fix a finite prefix word \(\alpha\) of total exponent \(A\), and let \(B\ge1\). The parent cylinder \(\mathcal C_\alpha\) is partitioned into the \(B\) exact child cylinders
\[
\mathcal C_{\alpha b},\qquad 1\le b\le B,
\]
and the single tail cylinder
\[
\mathcal T_{\alpha,B}=\{n_0\in\mathcal C_\alpha:a_k\ge B+1\},
\]
where \(k\) is the length of \(\alpha\). The tail condition is the congruence
\[
3n_k+1\equiv0\pmod{2^{B+1}}.
\]
Write the parent residue as \(n_0=r+2^{A+1}t\). The affine identity shows that, along this parent cylinder, the terminal value has the form \(n_k=n_k^*+2\cdot3^k t\). As \(t\) ranges modulo \(2^B\), these values run bijectively through all odd residue classes modulo \(2^{B+1}\), because \(3^k\) is invertible modulo \(2^B\). The tail condition therefore selects exactly one value of \(t\) modulo \(2^B\), hence one residue class of starting values modulo \(2^{A+B+1}\). Thus the tail is itself one cylinder, not an uncontrolled union.

The relative measures inside the parent are
\[
\mu_\alpha(\mathcal C_{\alpha b})=2^{-b},\qquad
\mu_\alpha(\mathcal T_{\alpha,B})=2^{-B}.
\]
They sum exactly to one:
\[
\boxed{\sum_{b=1}^{B}2^{-b}+2^{-B}=1.}
\]
The partition is disjoint and exhaustive because the next exact exponent is either one of \(1,\ldots,B\) or is at least \(B+1\). This gives a genuinely finite weighted refinement at every cutoff, with an explicit tail atom. It is a useful finite interface for later incidence and moment constructions; it does not by itself provide an APW4 BIB capacity or an orbitwise descent theorem.


## 9. References

[1] R. Terras, “A stopping time problem on the positive integers,” *Acta Arithmetica* **30** (1976), 241–252. https://doi.org/10.4064/aa-30-3-241-252

[2] C. J. Everett, “Iteration of the number-theoretic function f(2n) = n, f(2n + 1) = 3n + 2,” *Advances in Mathematics* **25** (1977), no. 1, 42–45. https://doi.org/10.1016/0001-8708(77)90087-1

[3] J. C. Lagarias, “The 3x + 1 Problem and Its Generalizations,” *The American Mathematical Monthly* **92** (1985), no. 1, 3–23, Theorem B. https://doi.org/10.1080/00029890.1985.11971528

[4] T. Tao, “Almost all orbits of the Collatz map attain almost bounded values,” *Forum of Mathematics, Pi* **10** (2022), e12. https://doi.org/10.1017/fmp.2022.8; arXiv:1909.03562, §1.2 and Proposition 1.9.
