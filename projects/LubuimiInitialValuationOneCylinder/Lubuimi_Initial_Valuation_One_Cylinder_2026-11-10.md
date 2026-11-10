# Lubuimi's Initial Valuation-One Cylinder Theorem
## An exact congruence classification for initial valuation blocks in the accelerated Syracuse map

**Author:** Ta-Yoshua Lubuimi  
**Version:** 1.0  
**Date:** 10 November 2026  
**Article type:** Research note / preprint  
**Status:** Complete self-contained proof; formal verification record stated separately below.

### Abstract

Let `n₀` be a positive odd integer and define its accelerated Syracuse orbit by
[
a_j=v_2(3n_j+1),qquad n_{j+1}=rac{3n_j+1}{2^{a_j}}.
]
We prove that, for every integer (N\geq0), the first (N) valuation exponents are all equal to one if and only if
[
n_0\equiv-1\pmod{2^{N+1}}.
]
Thus the exact length of the initial run of valuation-one steps is (v_2(n_0+1)-1). The corresponding sets are single residue-class cylinders, so their natural densities can be computed exactly, both relative to odd starting integers and relative to all positive integers. We also derive an explicit orbit formula during the initial run and an exact signed-offset-margin identity and recovery threshold. The result is a local arithmetic classification; it does not imply global descent and does not solve the Collatz conjecture.

**Keywords:** Syracuse map; Collatz problem; 2-adic valuation; residue classes; cylinder sets; natural density; accelerated iteration.

**2020 Mathematics Subject Classification:** 11B83, 11A07, 11S05.

---

## 1. Introduction

The (3x+1) problem asks about the long-term behaviour of repeated iteration of the Collatz map. Its accelerated odd form is particularly suited to studying the powers of two removed after each odd step. If (n) is positive and odd, then (3n+1) is even; dividing by its full power of two produces the next positive odd integer.

This note isolates one exact finite-prefix question: which odd starting integers have their first (N) accelerated valuation exponents equal to one? The answer is a single congruence class modulo (2^{N+1}). The proof is elementary but gives a complete two-way classification, an exact initial run-length formula, and exact density statements.

The 2-adic viewpoint is natural in the study of the (3x+1) map. Earlier work develops the map on the 2-adic integers and studies its conjugacy with a shift map; see Lagarias [1] and Bernstein–Lagarias [2]. The present note uses only finite congruences and the elementary valuation (v_2). It does not claim that the general 2-adic framework is new. Its focus is the explicit accelerated-valuation cylinder, its stopping-time interpretation, and its signed-offset consequence.

## 2. Definitions and affine identity

For a positive odd integer (n_0), define recursively
[
a_j:=v_2(3n_j+1),qquad
n_{j+1}:=rac{3n_j+1}{2^{a_j}}.
	ag{2.1}
]
Here (v_2(m)) is the largest integer (e\geq0) such that (2^e\mid m). Since (3n_j+1) is even, (a_j\geq1); by construction (n_{j+1}) is again a positive odd integer. Equivalently,
[
2^{a_j}n_{j+1}=3n_j+1.
	ag{2.2}
]

Define the cumulative exponent (A_j) and affine offset (C_j) by
[
A_0=C_0=0,qquad
A_{j+1}=A_j+a_j,qquad
C_{j+1}=3C_j+2^{A_j}.
	ag{2.3}
]

**Lemma 2.1 (Affine orbit identity).** For every (j\geq0),
[
oxed{2^{A_j}n_j=3^j n_0+C_j.}
	ag{2.4}
]

**Proof.** For (j=0), both sides equal (n_0). Suppose (2.4) holds at (j). Multiplying (2.2) by (2^{A_j}) gives
[
2^{A_{j+1}}n_{j+1}
=3\,2^{A_j}n_j+2^{A_j}
=3(3^j n_0+C_j)+2^{A_j}
=3^{j+1}n_0+C_{j+1},
]
by (2.3). Induction proves the identity. (square)

## 3. Main theorem: the initial valuation-one cylinder

**Theorem 3.1 (Lubuimi's Initial Valuation-One Cylinder Theorem).**  
Let (n_0) be any positive odd integer, let ((n_j,a_j)_{j\geq0}) be defined by (2.1), and let (N\geq0). Then
[
oxed{
igl(\forall j<N,\ a_j=1igr)
\quad\Longleftrightarrow\quad
2^{N+1}\mid(n_0+1).
}
	ag{3.1}
]
Equivalently, the first (N) accelerated valuation exponents are all one precisely when
[
oxed{n_0\equiv-1\pmod{2^{N+1}}.}
]

### Proof

We prove both implications.

**((Leftarrow)) Assume the congruence.** Suppose
[
n_0+1=2^{N+1}m
]
for some positive integer (m). For (0\leq j\leq N), define
[
u_j:=3^j2^{N+1-j}m-1.
	ag{3.2}
]
Then (u_0=n_0). If (j<N), direct calculation gives
[
3u_j+1
=3\bigl(3^j2^{N+1-j}m-1igr)+1
=2\bigl(3^{j+1}2^{N-j}m-1igr).
	ag{3.3}
]
Because (N-j\geq1), the term (3^{j+1}2^{N-j}m) is even, so the expression in parentheses in (3.3) is odd. Consequently
[
v_2(3u_j+1)=1
]
and the next accelerated odd iterate is
[
rac{3u_j+1}{2}=3^{j+1}2^{N-j}m-1=u_{j+1}.
]
Starting from (n_0=u_0), induction gives (n_j=u_j) and (a_j=1) for every (j<N).

**((Rightarrow)) Assume the first (N) exponents are one.** Then (A_N=N). The recurrence for (C_j) in (2.3) becomes
[
C_{j+1}=3C_j+2^j.
]
Induction gives
[
C_N=3^N-2^N.
	ag{3.4}
]
Substituting (A_N=N) and (3.4) into Lemma 2.1 yields
[
2^N n_N=3^N n_0+3^N-2^N,
]
hence
[
2^N(n_N+1)=3^N(n_0+1).
	ag{3.5}
]
The integer (n_N) is odd, so (n_N+1) is even. Thus the left-hand side of (3.5) is divisible by (2^{N+1}). Since (3^N) is relatively prime to (2^{N+1}), Euclid's lemma implies
[
2^{N+1}\mid(n_0+1).
]
This proves the converse.

When (N=0), the valuation condition is an empty conjunction and is true; the divisibility condition (2\mid(n_0+1)) is also true because (n_0) is odd. Thus the statement includes (N=0). (square)

## 4. Explicit orbit formula and exact initial run length

The forward implication in the proof gives more than the congruence criterion.

**Corollary 4.1 (Orbit formula).** If (2^{N+1}\mid(n_0+1)) and
[
m=rac{n_0+1}{2^{N+1}},
]
then for every (0\leq j\leq N),
[
oxed{n_j=3^j2^{N+1-j}m-1.}
	ag{4.1}
]

In particular, after (N) initial valuation-one steps,
[
n_N=2\cdot3^N m-1.
]

**Corollary 4.2 (Exact initial run length).** Let (r) denote the number of consecutive valuation-one steps at the beginning of the orbit, stopping immediately before the first exponent that is not one. Then
[
oxed{r=v_2(n_0+1)-1.}
	ag{4.2}
]
Equivalently, the initial run has exactly length (r) if and only if
[
2^{r+1}\mid(n_0+1)
quad\text{and}\quad
2^{r+2}\nmid(n_0+1).
	ag{4.3}
]

**Proof.** By Theorem 3.1, at least (r) initial exponents are one exactly when (2^{r+1}\mid(n_0+1)). At least (r+1) initial exponents are one exactly when (2^{r+2}\mid(n_0+1)). Their difference is (4.3), which is equivalent to (4.2). Since (n_0+1) is a fixed positive integer, its 2-adic valuation is finite. (square)

## 5. Natural densities

Let (mathcal C_N) be the set of positive odd integers whose first (N) accelerated valuation exponents are all one. Theorem 3.1 gives
[
mathcal C_N
={n\in\mathbb Z_{>0}: n\text{ odd and }n\equiv-1\pmod{2^{N+1}}}.
	ag{5.1}
]

**Theorem 5.1 (Cylinder densities).** The natural density relative to the positive odd integers is
[
oxed{\operatorname{dens}_{\rm odd}(\mathcal C_N)=2^{-N}.}
	ag{5.2}
]
The natural density as a subset of all positive integers is
[
oxed{\operatorname{dens}(\mathcal C_N)=2^{-(N+1)}.}
	ag{5.3}
]
The set of starts with exactly (r) initial valuation-one steps has relative density
[
oxed{2^{-(r+1)}}
	ag{5.4}
]
among odd integers, and density (2^{-(r+2)}) among all positive integers.

**Proof.** Modulo (2^{N+1}), there are (2^N) odd residue classes. Equation (5.1) selects exactly one of them, proving (5.2). Among all residue classes modulo (2^{N+1}), it selects one, proving (5.3).

For an exact run of length (r), condition (4.3) selects the single residue class
[
n\equiv2^{r+1}-1\pmod{2^{r+2}}.
]
There are (2^{r+1}) odd residue classes modulo (2^{r+2}), so the relative density among odd integers is (2^{-(r+1)}). Dividing by two gives the density among all positive integers. (square)

The cylinders are nested:
[
mathcal C_{N+1}\subseteq\mathcal C_N,
qquad
\frac{\operatorname{dens}_{\rm odd}(\mathcal C_{N+1})}
{\operatorname{dens}_{\rm odd}(\mathcal C_N)}=\frac12.
	ag{5.5}
]
Thus each additional required valuation-one step halves the relative odd-start mass.

## 6. Signed-offset margin

The initial cylinder also has an exact expression in the affine-offset coordinates of (2.3). Define
[
D_j:=2^{A_j}-C_j-3^j.
	ag{6.1}
]

**Lemma 6.1 (Margin recurrence).** For every (j\geq0),
[
oxed{
D_{j+1}=3D_j+(2^{a_j}-4)2^{A_j}.
}
	ag{6.2}
]

**Proof.** Using (2.3),
[
D_{j+1}
=2^{A_j+a_j}-3C_j-2^{A_j}-3^{j+1}.
]
Substitute (C_j=2^{A_j}-3^j-D_j) and simplify. (square)

**Corollary 6.2 (Margin after an initial run).** If the first (r) exponents are one, then
[
oxed{D_r=-2(3^r-2^r).}
	ag{6.3}
]
If (a_r\geq2) is the next exact valuation, then
[
D_{r+1}
=2^{a_r+r}-6\cdot3^r+2^{r+1}.
	ag{6.4}
]
In particular,
[
oxed{
D_{r+1}>0
\quad\Longleftrightarrow\quad
2^{a_r+r}>6\cdot3^r-2^{r+1}.
}
	ag{6.5}
]

**Proof.** Under (a_0=\cdots=a_{r-1}=1), one has (A_r=r) and (C_r=3^r-2^r). Substitution into (6.1) gives (6.3). Applying (6.2) once more with (A_r=r) gives (6.4), and (6.5) is the equivalent strict inequality. (square)

The threshold (6.5) is exact and depends on the realized initial run length. It is not a universal assertion that the next valuation satisfies the threshold. Nor does positivity of this particular margin, by itself, establish a global Collatz descent theorem.

## 7. Example

Take (n_0=7). Since (7+1=8), one has (v_2(8)=3), and Corollary 4.2 predicts exactly two initial valuation-one steps. Indeed,
[
7\xrightarrow{a_0=1}11
\xrightarrow{a_1=1}17
\xrightarrow{a_2=2}13.
]
The congruence criterion gives the same conclusion: (7\equiv-1\pmod8), but (7\not\equiv-1\pmod{16}). Thus the first two valuations, and not the first three, are equal to one.

The exact-run density of this class among odd starting integers is (2^{-3}=1/8), and its density among all positive integers is (1/16).

## 8. Significance and limitations

Theorem 3.1 completely classifies one family of finite valuation prefixes. At every depth (N), the admissible starting integers form one explicit residue class modulo (2^{N+1}). The theorem therefore supplies:

1. an exact congruence test for any prescribed initial block of valuation-one steps;
2. an explicit formula for every iterate within that block;
3. an exact stopping-time formula for the initial run length;
4. exact natural densities for both “at least” and “exactly” (r) initial steps; and
5. an exact signed-margin formula and next-step recovery threshold.

The result is local. It does not imply that every orbit eventually decreases, that every orbit is bounded, or that every orbit reaches (1). In particular, density information about finite prefixes cannot by itself exclude an exceptional infinite orbit. A global Collatz proof still requires an orbit-by-orbit argument or another theorem that rules out all non-descending trajectories.

The exact cylinders also provide a natural finite-prefix model for comparisons with weighted-fibre and incidence methods in other projects. Such a comparison is not an identification theorem: a cross-project transfer requires a specified map on indices, preservation of the relevant weights, and proof of the corresponding incidence and capacity inequalities. No APW4 transport statement is assumed or used in this paper.

## 9. Formal verification and reproducibility

The main equivalence is formalized in Lean as
`CollatzSyracuseAudit.lubuimi_initial_valuation_one_cylinder`.
The declaration was compiled and its transitive axiom dependencies were printed on seven successful exact-commit GitHub Actions snapshots:

| Run | Checked source / PR snapshot |
|---|---|
| 42721006544 | PR #35 head `013192ce524a4572a9d96c8d4dcb2796830b1f62` |
| 42721305220 | PR #35 head `ad7203f5571d03e5989b9ac935b2103300f02409` |
| 42721911555 | PR #35 head `21829b4dd3b82a73edb19cf0d09ed011f55ef384` |
| 42722186081 | PR #35 head `a36894eefc52e5d28cd43110f5e289805509ad33` |
| 42724343412 | PR #35 head `29b27dc529b9e81a33b5211e9e01a01e19edc256` |
| 42725006480 | exact source commit `b1a8599c686c37893a33453b759dee42047c7727` |
| 42725493567 | exact source commit `a52dffc23b323964f33bc7f6c61c2cb24bcdf708` |

The reported transitive axiom profile for the main declaration in the audited snapshots is
[
[\texttt{propext},\ \texttt{Classical.choice},\ \texttt{Quot.sound}].
]
The completed workflow logs report no actual occurrence of `sorryAx` in the audited theorem. Run 42725493567 was a full exact-commit recheck on a documentation-only descendant of the preceding Lean source snapshot; it did not enlarge the theorem's formal scope.

Earlier failed proof-script attempts are retained in the project chronology. They do not invalidate the later successful audits. Conversely, these audits apply to the named declaration and checked source snapshots only. They do not certify the general finite-word cylinder theorem, the finite tail partition, the terminal-residue collision-energy theorem, the Markov representation, or the global Collatz conjecture.

The separate Syracuse offset/margin programme has its own successful exact-commit audit: workflow 42728049650 on source commit ca48ec7fdad5e8d6f8aeb82fed8586a1b57c12bc verified the named non-descent exponent-cap declarations with the standard profile and no actual sorryAx. That is a distinct formal result. The seven audits listed in this section concern the initial-cylinder declaration specifically; they should not be read as a claim that every displayed signed-margin corollary in this manuscript was separately declared and audited in Lean.

The project source, Lean declaration, workflow history, and review notes are maintained in the author's repository:
`https://github.com/s4ztz4bnf6-maker/Lubuimi/tree/publication/lubuimi-initial-valuation-one-cylinder-2026-11-10`.

## 10. References

[1] J. C. Lagarias, “The 3x + 1 Problem and Its Generalizations,” *The American Mathematical Monthly* **92** (1985), no. 1, 3–23.

[2] D. J. Bernstein and J. C. Lagarias, “The 3x + 1 Conjugacy Map,” *Canadian Journal of Mathematics* **48** (1996), no. 6, 1154–1169.

The references provide the broader Collatz and 2-adic dynamical context. The proof in this note is self-contained and does not rely on either reference.

---

**Authorship:** The mathematical work and theorem are attributed to **Ta-Yoshua Lubuimi**. AI systems, where used, are acknowledged only as assistance tools and are not authors, co-authors, or independent mathematical verifiers.

**Publication note:** This is a self-contained research-note/preprint manuscript. The formal proof record above is reproducible at the stated snapshots. No journal acceptance or independent peer-review status is claimed.
