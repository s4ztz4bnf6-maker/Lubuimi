# Syracuse / Collatz — Forschungsnachtrag

**Stand:** 11. November 2026  
**Forschungsleitung:** Ta-Yoshua Lubuimi  
**Repository:** https://github.com/s4ztz4bnf6-maker/Lubuimi  
**Zweck:** append-only Ergänzung des Forschungsstands vom 10.11.2026.

## 1. Verifizierte Teilresultate

### 1.1 Rückwärtspropagation terminaler Exaktheit

Unabhängig verifizierter Commit:

`e44eb4331cc1481e10d6f60780d695412c47a726`

Geprüfte Deklarationen:

- `SyracuseAudit.terminalExact_backward_step`
- `SyracuseAudit.terminalExact_backward_prefix`

Die dokumentierten Workflows `42844423707` und `42845962042` bestanden. Das gemeldete transitive Profil war `[propext, Classical.choice, Quot.sound]`; im geprüften Bericht wurde kein `sorryAx` ausgewiesen.

### 1.2 Endliche Child/Tail-Partition

PR #76: https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/76

- exakter Source-Commit: `cc63565dd55859a0e6ae8514173967e7d52334d9`;
- Workflow: [43026427449 — PASS](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43026427449);
- deklarierter Lean-Library-Build: PASS;
- finite-depth uniform-fibre partition audit: PASS;
- explizite `sorryAx`-Ablehnung: PASS.

Die geprüften Deklarationen umfassen:

- `childBlock_disjoint`;
- `childBlock_disjoint_tail`;
- `childBlocks_disjoint_tail`;
- `childBlocks_disjoint_next`;
- `childBlocks_tail_partition_at_surviving_prefix`.

Das transitive Axiomprofil der geprüften Deklarationen liegt in `[propext, Classical.choice, Quot.sound]`.

PR #76 ist weiterhin ein offener Draft-PR. Der verifizierte Commit und der CI-Lauf sind exakt benannt; ein Merge wird nicht behauptet.

## 2. Mathematische Reichweite

Die Partition liefert eine endliche disjunkte Zerlegung der betrachteten dyadischen Intervallmenge in Child-Blöcke und einen terminalen Tail. Sie beweist weder die Realisierbarkeit jedes beliebigen endlichen Bewertungsworts noch einen globalen Abstieg.

Insbesondere bleiben getrennt:

- endliche Intervallpartition;
- exakte iterierte Bewertungszylinder-Masse;
- Realisierung und Eindeutigkeit tatsächlicher Syracuse-Orbits;
- quantitative Abstiegsabschätzung;
- Transfer von Dichteaussagen zu jedem positiven ganzzahligen Startwert.

Eine Aussage „für fast alle 2-adischen Startwerte“ schließt einzelne Ausnahmebahnen nicht aus.

## 3. Chernoff-Rechnung — bedingtes unabhängiges Modell

Für unabhängige Zufallsvariablen \(X_i\) mit geometrischer Verteilung

\[
\Pr(X_i=j)=2^{-j},\qquad j\ge1,
\]

und \(q=8/9\) gilt

\[
\mathbb E(q^{X_i})
=\sum_{j\ge1}(4/9)^j=4/5.
\]

Für \(S_N=\sum_{i=1}^N X_i\) liefert Markov

\[
\Pr(S_N<9N/5)
\le
\left(\frac45\right)^N(9/8)^{9N/5}
=\beta^N,
\]

wobei

\[
\beta=\frac45(9/8)^{9/5},
\qquad
\beta^5=(9/10)^5(9/8)^4<1.
\]

**Wichtige Grenze:** Diese Modellrechnung ist noch kein Satz über tatsächliche Syracuse-Orbits. Dafür ist die exakte iterierte Zylinderformel zu beweisen:

\[
\Pr(X_0=a_0,\ldots,X_{N-1}=a_{N-1})
=2^{-(a_0+\cdots+a_{N-1})}.
\]

Die Einzelfaser-Partition reicht nicht aus, um diese Produktformel zu erhalten. Die bedingten Faserverteilungen, Abhängigkeiten, Realisierung und die Eindeutigkeit müssen aus der konkreten Syracuse-Rekursion hergeleitet werden.

Selbst eine bewiesene Dichte-eins-Aussage liefert noch keine punktweise universelle Abstiegsbehauptung. Für die beschleunigte Syracuse-Abbildung auf positiven ungeraden Zahlen ist die Aussage

\[
\forall n>1\ \exists k\ge1:\ S^{[k]}(n)<n
\]

im Wesentlichen äquivalent zur Collatz-Vermutung. Sie darf nicht als bloßes technisches Restlemma behandelt werden.

## 4. Offene mathematische Aufgaben

1. Die exakte Präfixzylinder-Produktformel aus der iterierten Faserrekursion ableiten.
2. Die Zuordnung zwischen Bewertungspräfixen und tatsächlichen Syracuse-Orbits beweisen.
3. Die Chernoff-Schranke auf die realisierte Zylinderfamilie übertragen, ohne Unabhängigkeit vorauszusetzen, die nicht bewiesen wurde.
4. Eine echte punktweise Abstiegsbrücke oder eine andere universelle Ranking-Funktion finden.
5. Zyklusfreiheit und Ausschluss divergenter Bahnen getrennt behandeln.

## 5. Lizenzierung und Manuskriptintegrität

Die vorhandenen `LICENSE-PROPRIETARY.md` und `LICENSE-COMMERCIAL-USE-AND-REMUNERATION.md` bleiben unverändert maßgeblich. Dieser Nachtrag erteilt keine zusätzliche Lizenz und ändert keine Rechte. Drittsoftware, Lean, Mathlib und fremde Quellen bleiben ihren jeweiligen Lizenzbedingungen unterworfen.

Die Forschungsresultate und Originalmaterialien werden Ta-Yoshua Lubuimi zugerechnet. KI-Unterstützung ist Assistenz, keine Autorschaft und keine unabhängige mathematische Verifikation.

## 6. Nächste Arbeitsschritte

- Child/Tail-Partition mit einer abhängigen Präfix-Faserstruktur verbinden;
- bedingte Faserverteilung und Zylindermaß explizit formulieren;
- die iterierte Produktformel zuerst mathematisch beweisen und danach in Lean formalisieren;
- alle Aussagen auf exakte Commits und benannte Axiomprofile binden;
- keine globale Collatz-Aussage aus Dichte, endlichen Restklassen oder lokalen Abstiegsschritten ableiten.

---

**Append-only-Vermerk:** Der Forschungscheckpoint vom 10.11.2026 bleibt unverändert. Dieser Nachtrag dokumentiert ausschließlich die zusätzlichen Ergebnisse und Grenzen vom 11.11.2026.


## 7. One-step uniform-mass formalization candidate — PR #78

PR [#78](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/78) adds the finite counting identity `childBlock_uniform_mass` on top of the exact verified Child/Tail source commit `cc63565dd55859a0e6ae8514173967e7d52334d9`.

The proposed lemma states that the normalized cardinality of a single child block in the ambient dyadic interval is exactly $2^{-b}$. This is the one-step geometric mass already suggested by the interval cardinality formula.

**Status: OPEN — NOT VERIFIED.** Exact-head Lean CI and the named transitive axiom/sorryAx audit have not yet been observed for this candidate. It does not establish independence or the iterated valuation-cylinder product formula.


## 8. Exact-head CI observation — 11 November 2026

The GitHub workflow lookup for PR #78 head `59b5920d0dac35a0594b8f7c445418cce50c00b8` returned no workflow runs. This is **not** a test failure and not a pass: no exact-head Lean result is currently available from Actions. The one-step lemma `childBlock_uniform_mass` remains **OPEN — NOT VERIFIED**. Do not infer an axiom profile or sorryAx-freedom without an actual exact-head run.

## 9. Measure-theoretic next step

The existing Syracuse finite-depth module currently works with finite sets of natural-number residues, `childBlock Bstar b`, and `tailBlock Bstar B`; it does not yet define a prefix-state fibre or its conditional probability kernel. The next formalization must first specify the fibre type over a fixed prefix state, equip that finite type with its discrete measurable space (all subsets measurable), define cylinder events as subsets of that fibre, and define the normalized finite counting measure. Then prove event measurability, total mass one, and the transition restriction/extension maps are measurable. Only after these definitions and compatibility lemmas are in place should conditional distributions and the iterated cylinder formula be stated. A one-step cardinality identity alone does not imply independence or a product law.


## 10. Explicit fibre convention — decision, 11 November 2026

For a fixed finite valuation prefix \(w=(a_0,\ldots,a_{N-1})\), write
\(A(w)=\sum_{i<N}a_i\). The first finite fibre used for counting is to be
defined as an **arithmetic residue fibre**: a subset of the finite quotient
\(\mathbb Z/(2^{A(w)}\mathbb Z)\) (equivalently, a finite type of canonical
residue representatives), selected by the exact congruence conditions
induced by the Syracuse transition relation.

This is a modelling convention, not yet a theorem about actual positive
integer orbits. The corresponding **orbit fibre** consists of positive
odd integers whose actual Syracuse iterates realize the prefix. It remains
a separate object. The residue-to-orbit map, its compatibility with the
transition relation, and any required surjectivity/bijectivity or
representative theorem must be proved separately. No equality between the
two fibres is assumed.

The finite quotient is preferred for the first counting and measurable-space
layer because finiteness is intrinsic to the type. The orbit-realization
bridge is deliberately postponed rather than hidden in a choice of
representatives. In Lean, the concrete encoding must be aligned with the
existing Fin/natural-residue definitions before implementation; this
paragraph records the mathematical convention, not a claim that the current
source already implements it.

## 11. Child/Tail partition: source boundary and independent verification

The statement in the Lubuimi manuscript PDF §9 that the PDF audit does not
certify the finite tail partition is correct as a statement about that PDF.
It does **not** erase the separate, later PR #76 source-and-CI evidence:
https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/76, exact source
commit cc63565dd55859a0e6ae8514173967e7d52334d9, and
workflow 43026427449:
https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43026427449.
That run passed the finite-depth partition build/audit and explicit
sorryAx rejection for the named declarations listed in §1.2 above.
Thus the finite Child/Tail partition is Lean-verified **on that exact PR #76
commit and workflow**, independently of what the PDF §9 covers. It is not
certified by the PDF, and the PR remains an open draft. No claim beyond the
listed finite-depth declarations is made.

## 12. Chernoff hypothesis made explicit

The Chernoff/Markov calculation in §3 is conditional on the model assumption
that \(X_0,\ldots,X_{N-1}\) are mutually independent and identically
distributed with \(\Pr(X_i=j)=2^{-j}\) for every \(j\ge1\). The factorization
of the joint law is part of that independent geometric model. It is not
derived from the Syracuse recurrence, the Child/Tail partition, or PR #76.
Consequently the calculation is a valid model estimate but cannot be used as
evidence for the Syracuse cylinder product formula; deriving that formula
for actual orbit fibres remains an independent open obligation.

## 13. Exact-head CI diagnostic — PR #78

The workflow definition on the base branch main has a pull_request
trigger without a branch restriction and only paths-ignore: "**.md".
PR #78 changes a Lean source file, not only Markdown. Therefore the visible
workflow filters do not explain the absence of an exact-head run. The
workflow lookup for head 59b5920d0dac35a0594b8f7c445418cce50c00b8
returned no PR-triggered workflow run. The cause is **undetermined** from
the available evidence (for example, Actions/event delivery or a run not
registered by the queried endpoint); it must not be described as a test
failure or as a passing CI result. Status remains **CI NOT VERIFIED**.


## 14. Modulus-exponent correction to §10 — 11 November 2026

The residue-quotient convention in §10 is accepted, but the displayed exponent
\(2^{A(w)}\) is **provisional and must not be treated as established**.
There is an indexing/parity-offset issue: for the all-ones run of length \(N\),
the cited Lubuimi Theorem 3.1 describes a residue class modulo
\(2^{N+1}\), whereas \(A(w)=\sum_{i<N}a_i=N\). Thus the naive formula
\(2^{A(w)}\) misses one power of two in that case.

The corrected convention is:

- define the finite arithmetic fibre in a quotient modulo \(2^{E(s,N)}\);
- derive \(E(s,N)\) from the exact transition/congruence recursion and the
  chosen encoding of odd initial values;
- prove separately how \(E(s,N)\) relates to the valuation sum \(A(w)\);
- in particular, recover the \(N+1\) exponent for the all-ones run before
  asserting a general closed formula.

A candidate relation such as \(E=A+1\) may be investigated, but is not
adopted without proof for arbitrary prefixes. The quotient-first decision
therefore stands; the modulus exponent is **OPEN — TO BE DERIVED FROM THE
ACTUAL RECURRENCE**. This correction supersedes the provisional modulus
notation in §10, not the choice of a finite residue quotient.


## 15. Arithmetic-fibre convention and cardinality scope — 11 November 2026

The quotient-first modelling decision is now explicit:

\[
A_N=\sum_{i=0}^{N-1}a_i,
\qquad
F^{\mathrm{arith}}_{s,N}\subseteq\mathbb Z/2^{A_N}\mathbb Z.
\]

This is a **definition/model convention**, not a theorem that the quotient is sufficient to encode every orbit condition. The defining congruence predicate must be taken from the actual finite transition recursion. The additional parity information, when required, is not silently built into this general definition.

The actual orbit fibre remains a separate object. The map from actual positive odd starting values (or a rigorously chosen finite set of representatives) to the quotient, its compatibility with the prefix conditions, and the inclusion of the orbit image in the arithmetic fibre are separate **open lemmas**. Surjectivity onto the full arithmetic fibre is also open. No equality or bijection is assumed.

### Run-of-ones comparison: precise scope

For the all-ones prefix of length \(N\), the cited Lubuimi Theorem 3.1 states
\[
n_0\equiv-1\pmod{2^{N+1}}
\iff
\text{the first }N\text{ valuations are }1.
\]
This is an external cited result for this ledger entry, not a newly proved internal Lean theorem.

Reduction modulo \(2^N\) sends the qualifying class to the single residue \(-1\pmod{2^N}\). That residue has two lifts modulo \(2^{N+1}\), and exactly one is \(-1\pmod{2^{N+1}}\). Thus the extra bit distinguishes the two lifts of the same residue modulo \(2^N\).

**Counting caution:** The theorem does not imply that half of all classes in \(\mathbb Z/2^N\mathbb Z\) satisfy the stronger modulus-\(2^{N+1}\) condition. A condition modulo \(2^{N+1}\) is not a predicate on a class modulo \(2^N\) until a lift is specified. The actual qualifying integers have density \(2^{-(N+1)}\) among integers modulo \(2^{N+1}\); their reduction modulo \(2^N\) is one residue class. Any claimed cardinality such as \(2^{N-1}\) for the arithmetic fibre requires the exact definition of its congruence predicate and a separate count. It is not inferred from Theorem 3.1 alone.

### Order of formalization

1. Define the arithmetic fibre as a finite subset/type of the chosen quotient and prove finiteness.
2. Prove its cardinality as a separate, currently open theorem; do not assume a product or power-of-two formula.
3. State the Run-of-ones comparison as a cited external theorem and prove the reduction/lift bookkeeping separately.
4. Define the orbit fibre and prove the residue compatibility/inclusion map.
5. Only then define conditional counting measures, retain the explicit tail as an absorbing part, and derive the chain rule.
6. A geometric product law requires separate proof of every state-conditioned transition probability; it is not supplied by the chain rule.

PR #78 currently adds only the one-step finite child-block mass identity and has no exact-head workflow. It must not be treated as depending on, or having implemented, this prefix-fibre convention. The convention is recorded here before any future PR #78 extension.
