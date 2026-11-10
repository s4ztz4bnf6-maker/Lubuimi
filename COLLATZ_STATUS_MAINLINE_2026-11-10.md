# Collatz / Syracuse — konsolidierter Fortschritts- und Exact-Head-Status

**Stichtag:** 10. November 2026, 22:54 CET. **Autor:** Ta-Yoshua Lubuimi.

## Integritätsregel

Mathematische Resultate, historische Rekonstruktion, Lean-Elaboration und integrierte CI-Verifikation bleiben getrennt. Ein fehlgeschlagener späterer Build stuft frühere, exakt commitgebundene Resultate nicht zurück. Keine lokale Abstiegsungleichung wird als universeller Collatz-Beweis ausgegeben. KI-Systeme sind Assistenzwerkzeuge, keine Autoren oder unabhängigen mathematischen Prüfer.

## 1. Exakte Offset-Schnittstelle

Für a_j = v₂(3n_j+1), 2^(a_j)n_(j+1)=3n_j+1 und
A₀=C₀=0, A_(j+1)=A_j+a_j, C_(j+1)=3C_j+2^(A_j) gilt

2^(A_k)n_k = 3^k n₀ + C_k,
C_k = Σ_(j=0)^(k−1) 3^(k−1−j)2^(A_j).

Der Offset ist vollständig durch die Bewertungsfolge bestimmt. Die globale Abstiegsfrage verlangt zusätzlich 3^k n₀+C_k < 2^(A_k)n₀. Die Offsetidentität allein beweist diese Ungleichung nicht.

## 2. Erhaltene Fortschritte

Bei ihrem jeweils dokumentierten Geltungsbereich bleiben erhalten:

- Initialer Bewertungs-eins-Zylinder und seine neutrale Einordnung in die klassische Paritätsvektor-Codierung.
- Publizierter mathematischer Satz über endliche exakte Bewertungswort-Zylinder: eindeutige ungerade Restklasse modulo 2^(A+1), relative Dichte 2^-A, exakte Kindmassen und endliche Tail-Partition.
- Separat Lean-verifizierte Spezialfälle und Übergänge, darunter Bewertungsfolge (1,2) mit Restklasse 11 mod 16.
- Exakte affine Offsetidentität, geschlossene Offsetformel und signierte Margenlemmata.
- Lokale Viertelabstiegs- und Modulo-8-Übergänge.
- Endliche dyadische Uniform-Fibre-Kardinalitätsidentität auf ihrem eigenen exakten Quellstand.
- Endliche Terminal-Residue-Energie bei k=2: Massevektor (8,16,11,4,2,22)/63 und Energie 5/21; separater Lean-4.35.0-Paranoid-Nachweis.
- Endliche Kolaz-Return-Tabellen und Regressionen bis zu den dokumentierten Schwellenwerten; reproduzierbare endliche Berechnungen, keine uniforme Schranke.
- Endliche Cap-Tree-Einbettung eines hypothetischen, anfangswert-untenbeschränkten Pfades.

Diese Resultate werden nicht erneut geöffnet, nur weil eine spätere Integrationsstufe scheitert.

## 3. Commitgebundene Verifikationsbeispiele

**PR #59 — Shifted-tail / Minimalitätsbrücke:** Head 5f6e46de8bed7061f8336089857143c54e997af5; Workflow [42809750956](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42809750956). compile-drafts, Lean 4.34.1 Build-/Kernel-Job und Lean 4.35.0 Paranoid-Job bestanden. Benannte Profile: [propext, Classical.choice, Quot.sound]; no-sorryAx-Guard erfolgreich. Das ist eine formale Minimalitäts-/Suffixreduktion, keine Infinite-Branch-Exklusion.

**PR #53:** Head 7d17d7111946b328421f9046f95b03c939dfddb1; Workflow 42805867475 bestanden für Oddness-/Exponenten-Exaktheit.

**PR #55:** Head d5c32aba3e9e767cb1051d7aac6b54ff1196ea2d; Workflow 42807396471 bestanden für den deterministischen Ein-Schritt-Übergang.

**PR #48:** Head e1fb06eaa07190d8abfb3fc7368f3dc0663a5a66; Workflow 42754461228: Lean 4.35.0 Paranoid und compile-drafts bestanden. Lean 4.34.1 scheiterte nur am dort nicht unterstützten lake check-Befehl. Die vier endlichen Pfad-/Terminal-Unit-Deklarationen haben Standardprofil und bestanden den no-sorryAx-Guard. Der endliche Cap-Tree schließt keinen unendlichen Ast aus.

**PR #71:** in main gemergt; Merge-Head eddc02a186a168040c4fad3dbe094387a3b81c58. Workflow 42817093578 bestand für die Audit-Infrastrukturinstallation; dies ist kein neuer Collatz-Satz.

## 4. Aktuelle offene Kandidaten

**PR #9:** Branch collatz/offset-margin-roadmap-2026-10-23, Head a532578d271f3ee32c4634d89b21ce253f826bb4, Draft/offen. Die letzte Workflow-Abfrage für diesen exakten Head lieferte keine zugeordneten PR-Workflow-Runs. Keine neue Exact-Head-Verifikation behaupten.

**PR #72:** Branch collatz/terminal-exact-backward-step-2026-11-10, Head bf7dddac1c3197ad5fa1ae889fc711ec30c4cf3b, Draft/offen. Keine zugeordneten PR-Workflow-Runs für diesen Head. Ziel ist aus Terminal-Exaktheit bei k+1 und a_k ≥ 1 die Kongruenz C_k ≡ 2^(A_k) mod 2^(A_k+1) abzuleiten. Ein erster Proof-Script-Lauf meldete No goals to be solved nach einer bereits schließenden simp-Taktik; Commit b9a89872e39b6688f7c7ef567755beceb0c1e5f9 entfernt nur die redundante Taktik. Die neue Theoremaussage ist noch nicht als elaborierte Lean-Deklaration verifiziert.

## 5. Offene globale Collatz-Verpflichtungen

1. Bewertungszylinder, Carry-/Offsetrekursion und lokale Restklassenlemmata in einer gemeinsamen exakten Schnittstelle verbinden.
2. Die Suffix-Rückkehrbedingung aus der deterministischen Syracuse-Dynamik und der Minimalitätsdefinition herleiten.
3. Eine universelle positive signierte Marge auf einem tatsächlich realisierten endlichen Block beweisen oder einen anderen gültigen globalen Abstiegs-/Wohlbegründetheitsmechanismus finden.
4. Bei Verwendung des endlichen Cap-Trees eine echte Infinite-Branch-Exklusion beweisen. Punktweise endliche Verzweigung allein reicht nicht.
5. Exakte transitive Axiomprofile, vollständigen no-sorryAx-Scan, vollständigen Build und Lean-4.35.0 lake check --paranoid auf demselben unveränderlichen Head durchführen.

**Globaler Collatz-Status: OFFEN.** Offsetidentität, endliche Bewertungszylinder, lokale Abstiegsschritte, endliche Cap-Trees und Return-Tabellen beweisen für sich nicht die Terminierung aller positiven Startwerte.

## 6. APW4-Verbindung — strikt bedingt

Die Syracuse-Finite-Fibre-Konstruktion ist eine Schnittstelle für endliche Tiefe, nicht automatisch die historische APW4-Hyperflächen-Covered-Menge oder BIB-Reserve. Für echte APW4-Verwendung bleiben konkrete indexerhaltende Atom-/Ereignisabbildung, Multiplizitäten, Originalgewichte, Diagonal- und Off-Diagonalidentität, BIB-Plätze/Kapazitäten, gewichtete Hall-Ungleichung und Verbindung zur realisierten Syracuse-Abstiegsmarge zu beweisen.

Bis dahin bleiben APW4 und Syracuse mathematisch getrennt.

## 7. Parallele Arbeitsplanung

**Syracuse:** PR #72 diagnostisch prüfen; Offset-/Carry-/Zylinderresultate verbinden; universelle Margin-/Infinite-Branch-Verpflichtung als Hauptziel behalten.

**APW4:** separat im Repository Lubuimi- historische Event/BIB-Abbildung, Gewichts- und Kapazitätstransporte, allgemeine geordnete t-Tupel-Schattenabschätzung und abhängige Präfix-/Momentenrekursion bearbeiten.

Projektübergreifende Schlussfolgerungen sind erst zulässig, wenn die konkrete Abbildung und alle Gewicht-/Kapazitätsidentitäten bewiesen sind.
