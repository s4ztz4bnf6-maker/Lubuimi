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


## 12 November 2026 — exact-head CI correction for PR #81

This entry supersedes the earlier checkpoint's status as the **current** PR #81 head. The earlier source commit `44b7ce6e991e6b975a5f85fe3a34babe4bec68d5` and workflow `43115942497` remain preserved as historical evidence.

Current exact source:
- PR [#81](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/81), **OPEN / DRAFT / UNMERGED**.
- Branch `formalize/syracuse-quotient-sequence-source-2026-11-11`.
- Current head `2f7f3e3aabf4b05b8097228f7fe6ae433ae85b3e`.
- File `SyracuseQuotientSequence.lean`, registered in `lakefile.lean`.

Exact-head workflow [43121953918](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43121953918), job `lean` 130864363776: **SUCCESS**. The log reports `Build completed successfully (8933 jobs)`, prints the following named transitive axiom profiles, and the workflow's explicit `sorryAx` rejection gate did not fail:

| Declaration | Exact-head profile |
|---|---|
| `SyracuseAudit.terminalExact_factor` | `[propext]` |
| `SyracuseAudit.quotientState_factor` | `[propext, Classical.choice, Quot.sound]` |
| `SyracuseAudit.quotientState_odd` | `[propext, Classical.choice, Quot.sound]` |
| `SyracuseAudit.quotientState_transition_of_exact` | `[propext, Classical.choice, Quot.sound]` |
| `SyracuseAudit.quotientSequence_from_terminal` | `[propext, Classical.choice, Quot.sound]` |

**Current-head conclusion:** the constructive quotient states, their oddness, the exact accelerated transition, and the bundled finite quotient sequence are Lean-compiled and audited at commit `2f7f3e3aabf4b05b8097228f7fe6ae433ae85b3e`, with the named profiles above and no accepted `sorryAx`.

Still open:
1. the full terminal-congruence iff complete positive valuation-word realization theorem;
2. the full equivalence directions as a single packaged theorem;
3. uniqueness of the terminal residue class modulo `2^(A+1)`;
4. lift counting modulo `2^K`;
5. the product-density conclusion `2^(-A) = ∏ 2^(-a_i)`.

This is a finite-word/finite-state formalization result only. It does not prove an infinite-path exclusion, density-to-orbit transfer, or global Collatz termination.

No Syracuse source file, theorem statement, or license was changed by this documentation synchronization. PR #81 remains Draft/open/unmerged.




## 13 November 2026 — SYR-02/03/04 algebraic closure

The finite terminal-congruence calculation is now written out in [the residue-class counting note](SYRACUSE_RESIDUE_CLASS_COUNTING_2026-11-13.md):
- **SYR-02 — BELEGT algebraically:** the terminal congruence has one residue class modulo \(2^{A+1}\), and that class is odd.
- **SYR-03 — BELEGT algebraically:** it has exactly \(2^{K-A-1}\) lifts modulo \(2^K\), for \(K\geq A+1\).
- **SYR-04 — BELEGT algebraically:** among odd residues the finite normalized density is \(2^{-A}=\prod_{i<r}2^{-a_i}\).

The Lean formalizations of these three statements remain **OFFEN** until named declarations are compiled and audited at an exact source head. This calculation concerns the terminal congruence class; it is not yet the density of the exact valuation-word cylinder unless SYR-01 (the two-way word-realization equivalence) is proved. SYR-01, the infinite-path exclusion SYR-05, and global termination SYR-06 remain **OFFEN**. PR #81's current source head and workflow 43121953918 verify only the quotient-state sequence and its named transitions.




## 13 November 2026 — Lean candidate for SYR-02

PR [#82](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/82) adds the declaration terminalCongruence_unique_residue_class to SyracuseQuotientSequence.lean. Exact source head: bf814a9e7ee30b23e3c90d10ee3553cb4fb71f8c. Workflow [43410857139](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43410857139), Lean job 131836620024, was **IN PROGRESS** at this update. No compile, axiom-profile, or sorryAx conclusion is claimed yet.

The declaration targets uniqueness of the solution class in ZMod (2^(A+1)) only. It does not yet formalize the oddness of the canonical representative, the lift count, or the density formula. Those remain separate obligations. The paper-level SYR-02/03/04 statements remain algebraically BELEGT as recorded in the residue-class counting note; their formal status is not promoted until exact-head CI and named axiom output are inspected.
