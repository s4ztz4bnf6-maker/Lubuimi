# Syracuse / Collatz — Quotientensequenz: CI- und Forschungscheckpoint

**Datum:** 12. November 2026  
**Autor und Forschungsleitung:** Ta-Yoshua Lubuimi  
**Repository:** https://github.com/s4ztz4bnf6-maker/Lubuimi  
**Dokumentationszweig:** `docs/syracuse-dated-status-correction-2026-11-11`  
**Zweck:** Append-only Sicherung der ersten konstruktiven Quotientensequenz-Formalisierung und ihres exakten CI-/Axiomstatus.

## 1. Exakter Source- und PR-Stand

- PR [#81](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/81): **OPEN / DRAFT / UNMERGED**.
- Branch: `formalize/syracuse-quotient-sequence-source-2026-11-11`.
- Commit: `44b7ce6e991e6b975a5f85fe3a34babe4bec68d5`.
- Neue Datei: `SyracuseQuotientSequence.lean`; in `lakefile.lean` registriert.
- Workflow [43115942497](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43115942497), Lean-Job 130843833193: **SUCCESS**.

## 2. Formalisierte Aussagen

Das Modul konstruiert die natürlichen Quotientenzustände
[
q_k=N_k(x)/2^{A_k}
]
aus der exakten terminalen Kongruenz und formalisiert:

- den Faktor-/Divisionszusammenhang `terminalExact_factor`;
- die Quotientenzustandsdarstellung `quotientState_factor`;
- die Ungeradheit der Quotientenzustände `quotientState_odd`;
- den beschleunigten Übergang `quotientState_transition_of_exact`;
- die daraus gebündelte Folge `quotientSequence_from_terminal`.

Der Workflow hat die deklarierte Lean-Bibliothek kompiliert und die explizite `sorryAx`-Ablehnung bestanden.

## 3. Exakte Axiomprofile

Der explizite Axiombericht gibt aus:

| Deklaration | Transitives Axiomprofil |
|---|---|
| `SyracuseAudit.terminalExact_factor` | `[propext]` |
| `SyracuseAudit.quotientState_factor` | `[propext, Classical.choice, Quot.sound]` |
| `SyracuseAudit.quotientState_odd` | `[propext, Classical.choice, Quot.sound]` |
| `SyracuseAudit.quotientState_transition_of_exact` | `[propext, Classical.choice, Quot.sound]` |
| `SyracuseAudit.quotientSequence_from_terminal` | `[propext, Classical.choice, Quot.sound]` |

Kein `sorryAx` wurde durch die explizite Workflow-Prüfung akzeptiert. Die genannten Profile sind die im exakten Workflow für diese Deklarationen ausgegebenen Profile; sie werden nicht auf andere Source-Heads übertragen.

## 4. Was damit bewiesen ist — und was nicht

**Formal geschlossen auf genau diesem Commit:** die konstruktive Quotientenzustandsfolge aus der terminalen Kongruenz, ihre Ungeradheit und die beschleunigte Übergangsrelation.

**Noch nicht formalisiert:**

1. vollständige Äquivalenz „terminale Kongruenz genau dann, wenn das gesamte vorgegebene positive Bewertungswort realisiert wird“;
2. die Rückrichtung als absteigende Induktion über alle Zwischenbewertungen, soweit sie über die bereits vorhandenen Rückwärtslemma-Deklarationen hinausgeht;
3. die Vorwärtsrichtung von vollständiger Realisierung zur Endkongruenz als eigenes Äquivalenzglied;
4. Eindeutigkeit der Restklasse modulo (2^{A+1});
5. Hebungszählung modulo (2^K);
6. normierte Produktdichte (2^{-A}=\prod_{i<r}2^{-a_i}).

Die mathematische Herleitung der endlichen Wortkongruenz ist nicht mit ihrer vollständigen Lean-Formalisierung gleichzusetzen. PR #81 formalisiert die Quotientenfolge als Zwischenstufe, nicht die gesamte Wortrealisierung.

## 5. Grenzen und unabhängige Ergebnisse

- Die bereits verifizierten Deklarationen `terminalExact_backward_step`, `terminalExact_backward_prefix` und `finite_prefix_affine_identity` behalten ihren exakten früheren Source-/Workflow-Geltungsbereich.
- PR #76 (Child/Tail-Partition), PR #78 (Ein-Schritt-Massenidentität) und PR #79 (exakte Anfangsbewertung) bleiben getrennte, commitgebundene Ergebnisse.
- Endliche Präfix-/Zylinderresultate beweisen keine globale Ausschließung unendlicher Bahnen.
- **Keine globale Collatz-Terminierung wird behauptet.**

## 6. Integritätsgrenze

Nur Dokumentation. Keine Änderung an Lean-Quelldateien, mathematischen Theorem-Aussagen, Lizenztexten oder einer veröffentlichten Manuskript-PDF. PR #81 bleibt offen, Draft und ungemergt.

**Attribution:** Ta-Yoshua Lubuimi. KI-Systeme sind Assistenzwerkzeuge, keine Autoren und keine unabhängigen mathematischen Verifizierer.


## Superseding exact-head result — 12 November 2026

The initial checkpoint above records the earlier PR #81 commit `44b7ce6e991e6b975a5f85fe3a34babe4bec68d5` and workflow 43115942497. The current PR #81 head has since advanced to `2f7f3e3aabf4b05b8097228f7fe6ae433ae85b3e`. Its exact-head workflow [43121953918](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/43121953918), Lean job 130864363776, completed **SUCCESS**. The log reports `Build completed successfully (8933 jobs)` and prints these exact profiles:

| Declaration | Profile |
|---|---|
| `SyracuseAudit.terminalExact_factor` | `[propext]` |
| `SyracuseAudit.quotientState_factor` | `[propext, Classical.choice, Quot.sound]` |
| `SyracuseAudit.quotientState_odd` | `[propext, Classical.choice, Quot.sound]` |
| `SyracuseAudit.quotientState_transition_of_exact` | `[propext, Classical.choice, Quot.sound]` |
| `SyracuseAudit.quotientSequence_from_terminal` | `[propext, Classical.choice, Quot.sound]` |

The explicit `sorryAx` rejection gate passed on this exact-head workflow. This is the current PR #81 verification record; the earlier 44b7ce6/431159 record is retained as a historical intermediate snapshot, not silently overwritten.

PR #81 remains OPEN/DRAFT/UNMERGED. The full terminal-congruence iff complete-word-realization theorem, unique residue class, lift count, and product density remain open. No global Collatz termination or infinite-path exclusion is claimed. No Lean source, theorem statement, or licensing text changed in this documentation update.
