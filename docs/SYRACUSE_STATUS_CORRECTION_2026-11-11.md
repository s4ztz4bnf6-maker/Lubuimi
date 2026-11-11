# Syracuse / Collatz – datierte Statuskorrektur

**Datum:** 11. November 2026  
**Typ:** Append-only Statuskorrektur; formale Hochstufung eines bereits verifizierten endlichen Rückwärtsbausteins, ohne globale Collatz-Aussage.

## 1. Korrektur des Rückwärtslemma-Status

Die frühere Einstufung „Rückwärtslemma mathematisch geschlossen, Lean-Formalisierung offen“ ist zu korrigieren.

In `SyracuseAffineCore.lean` sind bereits formalisiert:

- `terminalExact_backward_step`
- `terminalExact_backward_prefix`
- `finite_prefix_affine_identity`

Der exakte Workflow-Lauf **43076503425** verifizierte den betreffenden Source-Stand mit dem Standardprofil

\[
[\texttt{propext},\texttt{Classical.choice},\texttt{Quot.sound}]
\]

und bestand die explizite `sorryAx`-Prüfung. Damit ist das Rückwärtslemma **mathematisch und formal geschlossen** – für genau diese endliche affine-/Kongruenzbehauptung und den dort geprüften Source-Stand.

Zusätzlich ist `affineCompositionRhs_closed_form` in `SyracuseAffineCorrectionSum.lean` mit Profil `[propext]` verifiziert. Diese Aussage wird nicht mit einem globalen Collatz-Ergebnis gleichgesetzt.

## 2. Tatsächlich nächste Formalisierungslücke

Die nächste Lücke liegt nach dem Rückwärtslemma. Noch zu formalisieren und exakt zu verifizieren sind:

1. die konstruktive Quotientenfolge
   \[
   x_k=N_k(x)/2^{A_k}
   \]
   einschließlich Ganzzahligkeit und Oddheit aller Zwischenzustände;
2. die Äquivalenz zwischen terminaler Endkongruenz und vollständiger Realisierung des vorgegebenen positiven Bewertungswortes;
3. Eindeutigkeit der terminalen Restklasse modulo \(2^{A+1}\), unter Nutzung der Invertierbarkeit von \(3^r\);
4. Hebungszählung dieser Klasse modulo \(2^K\), für \(K\ge A+1\);
5. die daraus folgende normierte Dichte
   \[
   2^{-A}=\prod_{i<r}2^{-a_i}.
   \]

Diese Schritte sind nicht durch den erfolgreichen Rückwärtslemma-Lauf automatisch formal verifiziert. Die allgemeine endliche Wortrealisierung, Restklassenzählung und Produktformel bleiben daher als Lean-Ziele getrennt.

## 3. Verifizierungsgrenze

Der erfolgreiche Lauf 43076503425 belegt nur die genannten Deklarationen auf dem zugehörigen exakten Source-Stand. Er beweist weder:

- die allgemeine Produktformel für beliebige endliche positive Bewertungswörter,
- Unabhängigkeit als vorausgesetzte Eigenschaft,
- eine Übertragung endlicher Zylinderdichten auf unendliche Bahnen,
- noch globale Collatz-Terminierung.

Die endlichen Resultate aus PR #76 (Child/Tail-Partition), PR #78 (Ein-Schritt-Massenidentität) und PR #79 (exakte Anfangsbewertung) bleiben separat und commitgebunden. Sie werden durch diese Statuskorrektur weder ersetzt noch über ihren jeweiligen Geltungsbereich hinaus erweitert.

**Korrigierter Status:** Rückwärtslemma mathematisch und formal geschlossen; Quotientenfolge, vollständige Wortrealisierung, eindeutige Restklasse und Hebungszählung als nächste Formalisierungsschritte offen; globaler Collatz-Satz weiterhin offen.

Keine Lean-Datei geändert, kein Build oder CI-Lauf ausgelöst, kein PR gemergt.


## 12 November 2026 — konstruktive Quotientensequenz: exakter CI-Abschluss

Der append-only [Quotientensequenz-CI-Checkpoint vom 12. November 2026](docs/SYRACUSE_QUOTIENT_SEQUENCE_CI_CHECKPOINT_2026-11-12.md) sichert PR #81, Commit `44b7ce6e991e6b975a5f85fe3a34babe4bec68d5`, Workflow [43115942497](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43115942497), Lean-Job 130843833193: **SUCCESS**.

Das neue Modul `SyracuseQuotientSequence.lean` wurde kompiliert; der explizite Workflow-Axiombericht weist für `terminalExact_factor` das Profil `[propext]` und für `quotientState_factor`, `quotientState_odd`, `quotientState_transition_of_exact` sowie `quotientSequence_from_terminal` jeweils `[propext, Classical.choice, Quot.sound]` aus. Die explizite `sorryAx`-Prüfung bestand.

Dies formalisiert die Quotientenzustände, ihre Ungeradheit und die beschleunigte Übergangsrelation auf genau diesem Commit. Die vollständige terminale-Kongruenz-iff-Wortrealisierung, Restklassen-Eindeutigkeit, Lift-Zählung und Produktdichte bleiben offen. PR #81 bleibt Draft/offen/ungemergt. Keine globale Collatz-Terminierung wird behauptet.
