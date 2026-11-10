# Lubuimi's Finite Valuation-Word Cylinder Partition Theorem

**Author:** Ta-Yoshua Lubuimi  
**Research date:** 10 November 2026  
**Manuscript status:** Mathematical proof presented in full; Lean formalization remains a separate open verification task.

## Abstract

For the accelerated Syracuse map on positive odd integers, every prescribed finite word of exact 2-adic valuations is realized by precisely one odd residue class modulo a power of two. If the word is \(\alpha=(a_0,\ldots,a_{k-1})\) and \(A=\sum_i a_i\), the modulus is \(2^{A+1}\), and the relative natural density among odd starting values is exactly \(2^{-A}\). The residue is given explicitly by the affine offset cocycle. These cylinders form an exact prefix tree: extending a word by valuation \(b\) multiplies its relative mass by \(2^{-b}\). At every finite cutoff, all valuations above the cutoff combine into one exact tail cylinder, yielding a finite disjoint partition with total mass one. A further signed-margin corollary shows that, for each fixed prefix, a sufficiently high next valuation forces strict descent of the corresponding accelerated odd iterate. The cutoff depends on the prefix, so this local pruning statement does not prove global Collatz descent.

The manuscript gives recursive and affine proofs, exact residue formulas, worked examples, finite tail partition, signed-margin consequences, applications, and a precise account of what remains open for Lean formalization and the global Collatz problem.

**Keywords:** accelerated Syracuse map; Collatz problem; 2-adic valuation; residue classes; exact cylinders; affine cocycle; finite prefix partition; signed margin.

---

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


## 9. Worked residue examples

The explicit formula gives the following small cases. The residue is the unique odd class modulo \(2^{A+1}\); the final column is its relative density among odd starts.

| Exact word \(\alpha\) | \(A\) | \(C_k\) | Modulus | Residue \(r_\alpha\) | Density |
|---|---:|---:|---:|---:|---:|
| \((1)\) | 1 | 1 | 4 | 3 | \(1/2\) |
| \((2)\) | 2 | 1 | 8 | 1 | \(1/4\) |
| \((1,2)\) | 3 | 5 | 16 | 11 | \(1/8\) |
| \((2,1)\) | 3 | 7 | 16 | 9 | \(1/8\) |
| \((1,1,2)\) | 4 | 19 | 32 | 7 | \(1/16\) |
| \((3,1)\) | 4 | 11 | 32 | 29 | \(1/16\) |

For example, the exact word \((1,2)\) is realized precisely by positive odd starts
\[
n_0\equiv11\pmod{16}.
\]
Its least positive representative follows
\[
11\xrightarrow{a_0=1}17\xrightarrow{a_1=2}13,
\]
since \(3\cdot11+1=2\cdot17\) and \(3\cdot17+1=4\cdot13\). Similarly, \((2,1)\) is realized precisely by \(n_0\equiv9\pmod{16}\), with least representative \(9\to7\to11\). Thus two words with the same total exponent have equal cylinder density, but their residue classes need not coincide.

## 10. What the theorem supplies

The result gives a complete finite-prefix arithmetic coding of accelerated Syracuse valuation data:

1. Every finite positive valuation word is realized by a nonempty arithmetic progression of positive odd starts.
2. The progression is unique modulo \(2^{A+1}\).
3. Its residue is explicitly computable from the affine offset \(C_k\) and the inverse of \(3^k\).
4. Its relative measure depends only on the total exponent \(A\), not on the order of the letters.
5. Parent/child cylinders form a disjoint exhaustive refinement with exact edge masses \(2^{-b}\).
6. At every finite cutoff, the unresolved tail is itself one residue cylinder.

This supplies a finite arithmetic model for valuation-prefix trees, exact cylinder counting, finite truncations, and later incidence or moment constructions. It also gives a precise interface with the signed-margin recurrence: the same finite word determines both its residue cylinder and its offset/margin data.

The theorem does not imply that almost every orbit descends, that every orbit descends, or that a zero-density exceptional set is empty. It does not establish a BIB/Hall capacity statement. Those are separate obligations. The result proved here is the exact finite-word classification and its finite tail partition.

## 11. Publication and verification status

This manuscript contains the mathematical proof of the general finite valuation-word cylinder theorem and the finite tail partition. The initial all-one specialization has a separate Lean declaration and six successful exact-commit CI snapshots (42721006544, 42721305220, 42721911555, 42722186081, 42724343412, 42725006480), with the reported standard transitive axiom profile and complete-log absence of \(\texttt{sorryAx}\).

The general finite-word theorem and its finite tail partition are not yet Lean-compiled or axiom-audited. The terminal-congruence note is a formalization route, not verification evidence. No global Collatz theorem is claimed.

**Author:** Ta-Yoshua Lubuimi. AI tools are assistants only and are not authors or independent mathematical verifiers.


## 12. Tail-cylinder margin certificate

The finite tail partition has a direct signed-margin consequence. For a finite word \(\alpha=(a_0,\ldots,a_{k-1})\), let
\[
A=A_k,\qquad C=C_k,\qquad D(\alpha)=2^A-C-3^k.
\]
If the next exact exponent is \(b\), the signed-margin recurrence gives
\[
\boxed{D(\alpha b)=3D(\alpha)+(2^b-4)2^A.}
\]
Fix a cutoff \(B\ge1\). On the single tail cylinder \(\mathcal T_{\alpha,B}\), the next exponent satisfies \(b\ge B+1\). Since \(2^b\ge2^{B+1}\),
\[
D(\alpha b)\ge
3D(\alpha)+(2^{B+1}-4)2^A.
\]
Consequently, whenever
\[
\boxed{3D(\alpha)+(2^{B+1}-4)2^A>0,}
\]
every starting value in the tail cylinder has positive signed margin after the next accelerated step.

A suitable finite cutoff always exists for each fixed prefix \(\alpha\), because \(2^{B+1}\) is unbounded as \(B\to\infty\). Positive signed margin implies strict descent of the corresponding odd iterate: from
\[
2^{A'}n_{k+1}=3^{k+1}n_0+C_{k+1}
\]
and \(D_{k+1}=2^{A'}-C_{k+1}-3^{k+1}>0\), one obtains
\[
3^{k+1}n_0+C_{k+1}
<
2^{A'}n_0,
\]
hence \(n_{k+1}<n_0\).

Thus every finite prefix admits a finite, exact partition into:
- the \(B\) exact child cylinders \(\mathcal C_{\alpha b}\), \(1\le b\le B\), which are the only branches still requiring separate analysis; and
- one exact tail cylinder \(\mathcal T_{\alpha,B}\), which is already certified to descend whenever the displayed cutoff inequality holds.

The tail has relative mass \(2^{-B}\), and the finite partition identity remains
\[
\sum_{b=1}^{B}2^{-b}+2^{-B}=1.
\]

**Scope limitation.** The cutoff \(B\) depends on the current prefix through \(A\) and \(D(\alpha)\). This is a local finite-pruning theorem, not a uniform bound over all prefixes. It does not show that every orbit eventually enters a certified tail, and it does not prove global Collatz descent. The remaining challenge is to control the finite unresolved child branches uniformly along every possible orbit.

For the initial all-one prefix of length \(r\), one has
\[
A=r,\qquad D=-2(3^r-2^r).
\]
The tail cutoff inequality becomes
\[
2^{B+1+r}>6\cdot3^r-2^{r+1},
\]
which is exactly the previously recorded one-step signed-margin recovery threshold when the next exponent is at least \(B+1\). This confirms that the initial-run threshold is the special case of the general tail-cylinder margin certificate.


## Publication summary and scope

The main theorem and finite tail partition are fully proved in this manuscript. The explicit affine residue formula and worked examples make the classification constructive. The local tail-margin corollary gives a finite pruning rule: for each fixed prefix, all sufficiently high next valuations lie in one exact tail cylinder and force descent; only finitely many lower next valuations remain to be analyzed. This is a genuine local arithmetic descent certificate, not a global Collatz proof. The general finite-word theorem, finite partition and tail-margin corollary remain pending Lean formalization and exact-commit kernel audit. The all-one special case retains its six independent successful CI snapshots.