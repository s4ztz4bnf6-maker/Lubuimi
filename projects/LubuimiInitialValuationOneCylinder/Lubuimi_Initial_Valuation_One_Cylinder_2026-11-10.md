# Initial Valuation-One Cylinders in the Accelerated Syracuse Map
## An exact congruence classification for initial valuation blocks in the accelerated Syracuse map

**Author:** Ta-Yoshua Lubuimi  
**Version:** 1.1 (corrected scholarly framing)  
**Date:** 10 November 2026  
**Article type:** Research note / preprint

### Abstract

Let \(n_0\) be a positive odd integer and define its accelerated Syracuse orbit by
\[
a_j=v_2(3n_j+1),\qquad
n_{j+1}=\frac{3n_j+1}{2^{a_j}}.
\]
We prove that, for every integer \(N\geq0\), the first \(N\) valuation exponents are all equal to one if and only if
\[
n_0\equiv-1\pmod{2^{N+1}}.
\]
Thus the exact length of the initial run of valuation-one steps is \(v_2(n_0+1)-1\). The corresponding sets are single residue-class cylinders, so their natural densities can be computed exactly, both relative to odd starting integers and relative to all positive integers. We also derive an explicit orbit formula during the initial run and an exact signed-offset-margin identity and recovery threshold. The result is a local arithmetic classification; it does not imply global descent and does not solve the Collatz conjecture.

**Keywords:** Syracuse map; Collatz problem; 2-adic valuation; residue classes; cylinder sets; natural density; accelerated iteration.

**2020 Mathematics Subject Classification:** 11B83, 11A07, 11S05.

---

## 1. Introduction

The \(3x+1\) problem asks about the long-term behaviour of repeated iteration of the Collatz map. Its accelerated odd form is particularly suited to studying the powers of two removed after each odd step. If \(n\) is positive and odd, then \(3n+1\) is even; dividing by its full power of two produces the next positive odd integer.

This note isolates one exact finite-prefix question: which odd starting integers have their first \(N\) accelerated valuation exponents equal to one? The answer is a single congruence class modulo \(2^{N+1}\). The proof gives a complete two-way classification, an exact initial run-length formula, and exact density statements.

The finite congruence classification in this note is a classical consequence of parity-vector coding for the \(3x+1\) map. Lagarias [3, Theorem B] gives the explicit finite permutation statement; Terras [1] and Everett [2] belong to the classical historical development. This note gives an independent elementary proof in accelerated-Syracuse valuation coordinates and records the author's Lean formalization. It makes no claim that the congruence classification is new. Tao [4, §1.2, Proposition 1.9] studies the approximate distribution of finite Syracuse valuation vectors under an equidistribution hypothesis; that proposition is related context, not the exact uniqueness theorem used here.

The derivation proceeds from the affine identity in Lemma 2.1. Under an initial valuation-one block, the cumulative exponent is exactly the block length and the offset recurrence collapses to \(C_N=3^N-2^N\). Substitution into the terminal orbit identity produces a factor \(2^N\); the oddness of the terminal iterate supplies the additional factor \(2\), yielding the modulus \(2^{N+1}\). The converse is constructive: a starting value in the residue class is written as \(2^{N+1}m-1\), and the candidate iterates \(3^j2^{N+1-j}m-1\) show directly that each of the first \(N\) valuations is exactly one.

## 2. Definitions and affine identity

For a positive odd integer \(n_0\), define recursively
\[
a_j:=v_2(3n_j+1),\qquad
n_{j+1}:=\frac{3n_j+1}{2^{a_j}}.
\tag{2.1}
\]
Here \(v_2(m)\) is the largest integer \(e\geq0\) such that \(2^e\mid m\). Since \(3n_j+1\) is even, \(a_j\geq1\); by construction \(n_{j+1}\) is again a positive odd integer. Equivalently,
\[
2^{a_j}n_{j+1}=3n_j+1.
\tag{2.2}
\]

Define the cumulative exponent \(A_j\) and affine offset \(C_j\) by
\[
A_0=C_0=0,\qquad
A_{j+1}=A_j+a_j,\qquad
C_{j+1}=3C_j+2^{A_j}.
\tag{2.3}
\]

**Lemma 2.1 (Affine orbit identity).** For every \(j\geq0\),
\[
\boxed{2^{A_j}n_j=3^j n_0+C_j.}
\tag{2.4}
\]

**Proof.** For \(j=0\), both sides equal \(n_0\). Suppose (2.4) holds at \(j\). Multiplying (2.2) by \(2^{A_j}\) gives
\[
2^{A_{j+1}}n_{j+1}
=3\cdot2^{A_j}n_j+2^{A_j}
=3(3^j n_0+C_j)+2^{A_j}
=3^{j+1}n_0+C_{j+1},
\]
by (2.3). Induction proves the identity. \(\square\)

## 3. Main theorem: the initial valuation-one cylinder

**Theorem 3.1 (Initial valuation-one cylinder classification).**  
Let \(n_0\) be any positive odd integer, let \((n_j,a_j)_{j\geq0}\) be defined by (2.1), and let \(N\geq0\). Then
\[
\boxed{
\bigl(\forall j<N,\ a_j=1\bigr)
\quad\Longleftrightarrow\quad
2^{N+1}\mid(n_0+1).
}
\tag{3.1}
\]
Equivalently, the first \(N\) accelerated valuation exponents are all one precisely when
\[
\boxed{n_0\equiv-1\pmod{2^{N+1}}.}
\]

### Proof

We prove both implications.

**(\(\Leftarrow\)) Assume the congruence.** Suppose
\[
n_0+1=2^{N+1}m
\]
for some positive integer \(m\). For \(0\leq j\leq N\), define
\[
u_j:=3^j2^{N+1-j}m-1.
\tag{3.2}
\]
Then \(u_0=n_0\). If \(j<N\), direct calculation gives
\[
3u_j+1
=3\bigl(3^j2^{N+1-j}m-1\bigr)+1
=2\bigl(3^{j+1}2^{N-j}m-1\bigr).
\tag{3.3}
\]
Because \(N-j\geq1\), the term \(3^{j+1}2^{N-j}m\) is even, so the expression in parentheses in (3.3) is odd. Consequently
\[
v_2(3u_j+1)=1
\]
and the next accelerated odd iterate is
\[
\frac{3u_j+1}{2}=3^{j+1}2^{N-j}m-1=u_{j+1}.
\]
Starting from \(n_0=u_0\), induction gives \(n_j=u_j\) and \(a_j=1\) for every \(j<N\).

**(\(\Rightarrow\)) Assume the first \(N\) exponents are one.** Then \(A_N=N\). The recurrence for \(C_j\) in (2.3) becomes
\[
C_{j+1}=3C_j+2^j.
\]
Induction gives
\[
C_N=3^N-2^N.
\tag{3.4}
\]
Substituting \(A_N=N\) and (3.4) into Lemma 2.1 yields
\[
2^N n_N=3^N n_0+3^N-2^N,
\]
hence
\[
2^N(n_N+1)=3^N(n_0+1).
\tag{3.5}
\]
The integer \(n_N\) is odd, so \(n_N+1\) is even. Thus the left-hand side of (3.5) is divisible by \(2^{N+1}\). Since \(3^N\) is relatively prime to \(2^{N+1}\), Euclid's lemma implies
\[
2^{N+1}\mid(n_0+1).
\]
This proves the converse.

When \(N=0\), the valuation condition is an empty conjunction and is true; the divisibility condition \(2\mid(n_0+1)\) is also true because \(n_0\) is odd. Thus the statement includes \(N=0\). \(\square\)

## 4. Explicit orbit formula and exact initial run length

The forward implication in the proof gives more than the congruence criterion.

**Corollary 4.1 (Orbit formula).** If \(2^{N+1}\mid(n_0+1)\) and
\[
m=\frac{n_0+1}{2^{N+1}},
\]
then for every \(0\leq j\leq N\),
\[
\boxed{n_j=3^j2^{N+1-j}m-1.}
\tag{4.1}
\]
In particular, after \(N\) initial valuation-one steps,
\[
n_N=2\cdot3^N m-1.
\]

**Corollary 4.2 (Exact initial run length).** Let \(r\) denote the number of consecutive valuation-one steps at the beginning of the orbit, stopping immediately before the first exponent that is not one. Then
\[
\boxed{r=v_2(n_0+1)-1.}
\tag{4.2}
\]
Equivalently, the initial run has exactly length \(r\) if and only if
\[
2^{r+1}\mid(n_0+1)
\quad\text{and}\quad
2^{r+2}\nmid(n_0+1).
\tag{4.3}
\]

**Proof.** By Theorem 3.1, at least \(r\) initial exponents are one exactly when \(2^{r+1}\mid(n_0+1)\). At least \(r+1\) initial exponents are one exactly when \(2^{r+2}\mid(n_0+1)\). Their difference is (4.3), which is equivalent to (4.2). Since \(n_0+1\) is a fixed positive integer, its 2-adic valuation is finite. \(\square\)

## 5. Natural densities

Let \(\mathcal C_N\) be the set of positive odd integers whose first \(N\) accelerated valuation exponents are all one. Theorem 3.1 gives
\[
\mathcal C_N
=\{n\in\mathbb Z_{>0}: n\text{ odd and }n\equiv-1\pmod{2^{N+1}}\}.
\tag{5.1}
\]

**Theorem 5.1 (Cylinder densities).** The natural density relative to the positive odd integers is
\[
\boxed{\operatorname{dens}_{\mathrm{odd}}(\mathcal C_N)=2^{-N}.}
\tag{5.2}
\]
The natural density as a subset of all positive integers is
\[
\boxed{\operatorname{dens}(\mathcal C_N)=2^{-(N+1)}.}
\tag{5.3}
\]
The set of starts with exactly \(r\) initial valuation-one steps has relative density
\[
\boxed{2^{-(r+1)}}
\tag{5.4}
\]
among odd integers, and density \(2^{-(r+2)}\) among all positive integers.

**Proof.** Modulo \(2^{N+1}\), there are \(2^N\) odd residue classes. Equation (5.1) selects exactly one of them, proving (5.2). Among all residue classes modulo \(2^{N+1}\), it selects one, proving (5.3).

For an exact run of length \(r\), condition (4.3) selects the single residue class
\[
n\equiv2^{r+1}-1\pmod{2^{r+2}}.
\]
There are \(2^{r+1}\) odd residue classes modulo \(2^{r+2}\), so the relative density among odd integers is \(2^{-(r+1)}\). Dividing by two gives the density among all positive integers. \(\square\)

The cylinders are nested:
\[
\mathcal C_{N+1}\subseteq\mathcal C_N,
\qquad
\frac{\operatorname{dens}_{\rm odd}(\mathcal C_{N+1})}
{\operatorname{dens}_{\rm odd}(\mathcal C_N)}=\frac12.
\tag{5.5}
\]
Thus each additional required valuation-one step halves the relative odd-start mass.

## 6. Signed-offset margin

The initial cylinder also has an exact expression in the affine-offset coordinates of (2.3). Define
\[
D_j:=2^{A_j}-C_j-3^j.
\tag{6.1}
\]

**Lemma 6.1 (Margin recurrence).** For every \(j\geq0\),
\[
\boxed{
D_{j+1}=3D_j+(2^{a_j}-4)2^{A_j}.
}
\tag{6.2}
\]

**Proof.** Using (2.3),
\[
D_{j+1}
=2^{A_j+a_j}-3C_j-2^{A_j}-3^{j+1}.
\]
Substitute \(C_j=2^{A_j}-3^j-D_j\) and simplify. \(\square\)

**Corollary 6.2 (Margin after an initial run).** If the first \(r\) exponents are one, then
\[
\boxed{D_r=-2(3^r-2^r).}
\tag{6.3}
\]
If \(a_r\geq2\) is the next exact valuation, then
\[
D_{r+1}
=2^{a_r+r}-6\cdot3^r+2^{r+1}.
\tag{6.4}
\]
In particular,
\[
\boxed{
D_{r+1}>0
\quad\Longleftrightarrow\quad
2^{a_r+r}>6\cdot3^r-2^{r+1}.
}
\tag{6.5}
\]

**Proof.** Under \(a_0=\cdots=a_{r-1}=1\), one has \(A_r=r\) and \(C_r=3^r-2^r\). Substitution into (6.1) gives (6.3). Applying (6.2) once more with \(A_r=r\) gives (6.4), and (6.5) is the equivalent strict inequality. \(\square\)

The threshold (6.5) is exact and depends on the realized initial run length. It is not a universal assertion that the next valuation satisfies the threshold. Nor does positivity of this particular margin, by itself, establish a global Collatz descent theorem.

**Corollary 6.3 (Positive margin forces descent below the start).** For any orbit prefix, \(D_j>0\) implies \(n_j<n_0\).

**Proof.** The affine identity gives \(2^{A_j}n_j=3^j n_0+C_j\). Since \(C_j\geq0\) and \(D_j=2^{A_j}-C_j-3^j>0\), we have \(2^{A_j}-3^j>C_j\). As \(n_0\geq1\),
\[
(2^{A_j}-3^j)n_0>C_j.
\]
Therefore \(2^{A_j}n_0>3^j n_0+C_j=2^{A_j}n_j\), hence \(n_j<n_0\). QED.


## 7. Example

Take \(n_0=7\). Since \(7+1=8\), one has \(v_2(8)=3\), and Corollary 4.2 predicts exactly two initial valuation-one steps. Indeed,
\[
7\xrightarrow{a_0=1}11
\xrightarrow{a_1=1}17
\xrightarrow{a_2=2}13.
\]
The congruence criterion gives the same conclusion: \(7\equiv-1\pmod8\), but \(7\not\equiv-1\pmod{16}\). Thus the first two valuations, and not the first three, are equal to one.

The exact-run density of this class among odd starting integers is \(2^{-3}=1/8\), and its density among all positive integers is \(1/16\).

## 8. Significance and limitations

Theorem 3.1 completely classifies one family of finite valuation prefixes. At every depth \(N\), the admissible starting integers form one explicit residue class modulo \(2^{N+1}\). The theorem therefore supplies:

1. an exact congruence test for any prescribed initial block of valuation-one steps;
2. an explicit formula for every iterate within that block;
3. an exact formula for the initial run length;
4. exact natural densities for both “at least” and “exactly” \(r\) initial steps; and
5. an exact signed-margin formula and next-step recovery threshold.

The result is local. It does not imply that every orbit eventually decreases, that every orbit is bounded, or that every orbit reaches \(1\). In particular, density information about finite prefixes cannot by itself exclude an exceptional infinite orbit. A global Collatz proof still requires an orbit-by-orbit argument or another theorem that rules out all non-descending trajectories.

The exact cylinder identities are stated entirely within the accelerated Syracuse dynamics. No cross-project identification or transfer claim is part of this note.

## 9. Lean formalization record

The source declaration is in SyracuseOffsetIdentity.lean, line 2397 at exact source commit b1a8599c686c37893a33453b759dee42047c7727. Its Lean signature is:

    theorem lubuimi_initial_valuation_one_cylinder
        (n a : ℕ → ℕ) (N : ℕ)
        (hodd : ∀ j, n j % 2 = 1)
        (hstep : ∀ j, 2 ^ (a j) * n (j + 1) = 3 * n j + 1) :
        (∀ j, j < N → a j = 1) ↔ 2 ^ (N + 1) ∣ n 0 + 1 := by

The identifier is retained as the literal source-level name needed to locate the historical audited declaration; it is not used as the mathematical name of the result. The documented successful exact-commit workflows report the transitive profile [propext, Classical.choice, Quot.sound] and no actual sorryAx finding for that declaration. The dedicated formalization-status file preserves the complete workflow chronology, including earlier failed proof-script attempts. These audits certify only this declaration at the checked snapshots. They do not certify the arbitrary finite-word statement, the finite tail partition, the collision-energy identity, the Markov representation, or the global Collatz conjecture.

The mathematical proof, historical attribution, and Lean/CI verification are separate claims. A successful audit of this declaration is not evidence of novelty.

### Current neutral Lean declaration — 10 November 2026

The historical declaration above remains part of the source and audit chronology. A later source change introduced the neutral declaration name

    theorem initial_valuation_one_cylinder_iff_dyadic_divisibility
        (n a : ℕ → ℕ) (N : ℕ)
        (hodd : ∀ j, n j % 2 = 1)
        (hstep : ∀ j, 2 ^ (a j) * n (j + 1) = 3 * n j + 1) :
        (∀ j, j < N → a j = 1) ↔ 2 ^ (N + 1) ∣ n 0 + 1 := by

It is located in `SyracuseOffsetIdentity.lean:2603` at exact source commit `5f6e46de8bed7061f8336089857143c54e997af5`. Workflow [42809750956](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42809750956) passed all three exact-head jobs: Lean 4.34.1 kernel-check, `compile-drafts`, and Lean 4.35.0 paranoid kernel-check. The named transitive axiom profile is `[propext, Classical.choice, Quot.sound]`; the no-`sorryAx` guard passed.

This is a separate verification record for the neutral declaration. The seven earlier successful snapshots remain evidence for the historical identifier at their exact source snapshots; they are not transferred to the renamed declaration. The mathematical proposition is unchanged. This formalization still proves only the finite initial-cylinder classification, not global Collatz descent or the arbitrary finite valuation-word theorem.

## 10. References

[1] R. Terras, “A stopping time problem on the positive integers,” *Acta Arithmetica* **30** (1976), 241–252. https://doi.org/10.4064/aa-30-3-241-252

[2] C. J. Everett, “Iteration of the number-theoretic function f(2n) = n, f(2n + 1) = 3n + 2,” *Advances in Mathematics* **25** (1977), no. 1, 42–45. https://doi.org/10.1016/0001-8708(77)90087-1

[3] J. C. Lagarias, “The 3x + 1 Problem and Its Generalizations,” *The American Mathematical Monthly* **92** (1985), no. 1, 3–23, especially Theorem B. https://doi.org/10.1080/00029890.1985.11971528

[4] T. Tao, “Almost all orbits of the Collatz map attain almost bounded values,” *Forum of Mathematics, Pi* **10** (2022), e12. https://doi.org/10.1017/fmp.2022.8; arXiv:1909.03562, §1.2 and Proposition 1.9.

Lagarias's Theorem B gives the explicit finite parity-vector permutation statement. Terras and Everett are part of the classical historical development. Tao's Proposition 1.9 concerns approximate distribution of finite Syracuse valuation vectors under a residue-equidistribution hypothesis; it is not cited as the source of the exact one-residue-class theorem.

---

**Authorship:** The mathematical work and theorem are attributed to **Ta-Yoshua Lubuimi**. AI systems, where used, are acknowledged only as assistance tools and are not authors, co-authors, or independent mathematical verifiers.

**Publication note:** This is an independent exposition and formalization of a classical finite congruence consequence, not a novelty or priority claim. No journal acceptance or independent peer-review status is claimed.
