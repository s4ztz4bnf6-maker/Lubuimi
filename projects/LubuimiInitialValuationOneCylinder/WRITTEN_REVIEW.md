# Written Review — Lubuimi's Initial Valuation-One Cylinder Theorem

**Author:** Ta-Yoshua Lubuimi  
**Review date:** 10 November 2026  
**Review type:** Internal mathematical and formalization review; not independent peer review.

## 1. Statement

For the accelerated odd Syracuse map
\[
2^{a_j}n_{j+1}=3n_j+1,\qquad a_j=v_2(3n_j+1),
\]
the first \(N\) valuations are all one exactly when
\[
n_0\equiv-1\pmod{2^{N+1}}.
\]
Equivalently, the exact initial run length is \(v_2(n_0+1)-1\).

## 2. Mathematical assessment

The equivalence is exact in both directions. Repeated use of the valuation-one recurrence gives the explicit prefix formula
\[
n_j=3^j2^{N+1-j}m-1
\]
when \(n_0+1=2^{N+1}m\), and the converse follows by propagating divisibility of \(n_0+1\) through the recurrence. The density statements follow from counting one odd residue class modulo \(2^{N+1}\): relative density \(2^{-N}\) among odd starts, and absolute density \(2^{-(N+1)}\) among all positive integers. The exact-run density is the difference of two nested cylinders.

The signed margin after \(r\) initial ones is
\[
D_r=-2(3^r-2^r),
\]
and the next valuation threshold for positive margin is
\[
2^{a_r+r}>6\cdot3^r-2^{r+1}.
\]
These formulas are consistent with the general margin recurrence.

## 3. Formal verification

The main declaration is Lean-compiled and axiom-audited on seven successful exact-commit workflows:
42721006544, 42721305220, 42721911555, 42722186081, 42724343412, 42725006480, and 42725493567.

The audited declaration's transitive profile is
[propext, Classical.choice, Quot.sound]. The completed logs for the checked runs contain no actual sorryAx finding. Run 42725493567 is a documentation-only descendant of the code snapshot checked by 42725006480; it re-ran the full compile-drafts suite without changing the Lean source. Earlier failed proof-script attempts remain in the chronology and are superseded for this declaration by the later successful audits.

## 4. Scope and limitations

This theorem classifies the initial valuation-one cylinder exactly. It does not establish global Collatz descent. The arbitrary finite valuation-word cylinder theorem, finite tail partition, state-dependent finite non-descent cap, terminal-residue collision energy, and Markov representation are separate mathematical results or extensions. They are not certified by this declaration's Lean audits.

## 5. Publication assessment

The manuscript is self-contained and suitable as a standalone preprint draft for scholarly circulation. It should be presented as a precise local 2-adic classification theorem, not as a solution or partial proof of global Collatz beyond the stated margin corollaries. No journal acceptance, DOI, or independent peer review is claimed.

**Verdict:** The initial valuation-one cylinder theorem is mathematically established and independently Lean-audited on the listed exact snapshots. The wider Collatz programme remains open.

**Attribution:** Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers.
