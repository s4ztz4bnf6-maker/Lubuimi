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
