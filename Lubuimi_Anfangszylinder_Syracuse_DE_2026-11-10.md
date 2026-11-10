# Klassifikation des anfänglichen Valuierungs-eins-Zylinders der beschleunigten Syracuse-Abbildung

**Autor:** Ta-Yoshua Lubuimi  
**Benennung:** Es wird ausschließlich eine beschreibende mathematische Bezeichnung verwendet. Die Aussage ist eine klassische endliche Paritätsvektor-Zylinderklassifikation; es wird weder ein eponymischer Satzname noch ein Prioritätsanspruch erhoben. Die eigenständige Herleitung und diese Formalisierung werden Ta-Yoshua Lubuimi zugeschrieben.  
**Ursprüngliche Herleitung:** 9. November 2026  
**Deutscher Dokumentationsstand:** 10. November 2026

**Status:** Eigenständige mathematische Herleitung und Lean-Formalisierung von Ta-Yoshua Lubuimi für eine klassische endliche Paritätsvektor-Zylinderklassifikation. Die historische Lean-Deklaration `lubuimi_initial_valuation_one_cylinder` bestand zwei vollständige CI-Läufe auf exakt festgelegten Quellständen: [42721006544](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721006544) auf Merge-Commit `44bb2ac` und [42721305220](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721305220) auf Merge-Commit `3d79761`. Beide Läufe meldeten `[propext, Classical.choice, Quot.sound]`; die vollständigen Log-Prüfungen fanden kein `sorryAx`. PR #56 führt den neutralen internen Namen `initial_valuation_one_cylinder_iff_dyadic_divisibility` ein; dessen exakte CI-Prüfung steht noch aus. Die historischen Audits werden nicht auf die umbenannte Deklaration übertragen. Der allgemeinere Satz über beliebige endliche Valuierungswörter bleibt ein separates Formalisierungsziel.

## 1. Ausgangslage

Sei (n_0,n_1,ldots) eine Bahn positiver ungerader Zahlen unter der beschleunigten Syracuse-Abbildung. Die exakten Zweierbewertungen seien (a_j\geq1), sodass

\[
2^{a_j}n_{j+1}=3n_j+1,
\qquad n_j\text{ ungerade}.
\]

Wir definieren die aufsummierte Bewertung und den affinen Offset durch

\[
A_0=C_0=0,\qquad
A_{j+1}=A_j+a_j,\qquad
C_{j+1}=3C_j+2^{A_j}.
\]

Die bereits formalisierte Identität für zertifizierte Schritte lautet

\[
\boxed{2^{A_N}n_N=3^Nn_0+C_N.}
\]

## 2. Exakter anfänglicher Zylinder

Für jede ganze Zahl (N\geq0) gilt

\[
\boxed{
(\forall j<N,\ a_j=1)
\quad\Longleftrightarrow\quad
2^{N+1}\mid(n_0+1).
}
\]

### Beweisrichtung 1: Restklassenbedingung impliziert die ersten (N) Bewertungen eins

Sei

\[
n_0+1=2^{N+1}m,\qquad m\geq1.
\]

Für (0\leq j\leq N) setzen wir

\[
u_j=3^j2^{N+1-j}m-1.
\]

Dann ist (u_0=n_0). Für (j<N) gilt

\[
3u_j+1
=2\bigl(3^{j+1}2^{N-j}m-1\bigr).
\]

Da (N-j\geq1), ist der Ausdruck in der Klammer ungerade. Somit ist die exakte Zweierbewertung dieses Schrittes gleich eins, und der nächste ungerade Iterationswert ist (u_{j+1}). Induktion liefert

\[
a_j=1\qquad(0\leq j<N).
\]

### Beweisrichtung 2: Die ersten (N) Bewertungen eins implizieren die Restklassenbedingung

Gelten (a_j=1) für alle (j<N), so ist (A_N=N). Aus der Offsetrekursion folgt

\[
C_N=3^N-2^N.
\]

Einsetzen in die affine Identität ergibt

\[
2^Nn_N=3^Nn_0+3^N-2^N,
\]

also

\[
2^N(n_N+1)=3^N(n_0+1).
\]

Da (n_N) ungerade ist, ist die linke Seite durch (2^{N+1}) teilbar. Außerdem ist (3^N) teilerfremd zu (2^{N+1}). Nach dem euklidischen Lemma folgt

\[
2^{N+1}\mid(n_0+1).
\]

Der Fall (N=0) ist eingeschlossen; dann ist die Aussage gerade die Parität von (n_0).

## 3. Exakte Länge des anfänglichen Eins-Laufs

Für (r\geq0) hat der anfängliche Lauf **genau** (r) Schritte mit Bewertung eins genau dann, wenn

\[
\boxed{
2^{r+1}\mid(n_0+1)
\quad\text{und}\quad
2^{r+2}\nmid(n_0+1).
}
\]

Äquivalent dazu ist

\[
\boxed{r=v_2(n_0+1)-1.}
\]

Denn aus (n_0+1=2^{r+1}m) folgt nach dem Zylindersatz zunächst, dass die ersten (r) Bewertungen eins sind. Ferner gilt

\[
n_r+1=2\cdot3^r m.
\]

Die nächste Bewertung ist genau dann mindestens zwei, wenn (n_r\equiv1\pmod4). Dies ist äquivalent dazu, dass (m) ungerade ist, also (2^{r+2}\nmid(n_0+1)).

Damit besitzt jede positive ungerade Startzahl einen endlichen anfänglichen Eins-Lauf der Länge

\[
r=v_2(n_0+1)-1.
\]

Unter den ungeraden Startrestklassen beträgt die Dichte der Zahlen mit mindestens (N) anfänglichen Einsen (2^{-N}); die Dichte der Zahlen mit genau (N) anfänglichen Einsen beträgt (2^{-(N+1)}).

## 4. Konsequenz für den signierten Offset-Margin

Die Identität für einen Lauf von Einsen liefert am Anfang mit (A_0=0) und Anfangsmargin null

\[
D_r=-2(3^r-2^r).
\]

Ein nichtleerer anfänglicher Eins-Lauf erzeugt somit einen strikt negativen Margin. Der Zylindersatz allein ist jedoch keine Abstiegsbehauptung.

Sei (a_r\geq2) die nächste exakte Bewertung nach diesem Lauf. Die Ein-Schritt-Marginrekursion ergibt

\[
D_{r+1}
=3D_r+(2^{a_r}-4)2^r
=-6(3^r-2^r)+(2^{a_r}-4)2^r.
\]

Der Margin wird nach diesem Schritt genau dann positiv, wenn

\[
\boxed{
2^{a_r+r}>6\cdot3^r-2^{r+1}.
}
\]

Dies ist eine exakte, von der Startzahl abhängige Erholungsschwelle. Es wird nicht behauptet, dass diese Schwelle für jede Bahn erfüllt ist.

## 5. Lean-Formalisation und Reproduzierbarkeit

Die Aussage wurde in `SyracuseOffsetIdentity.lean` historisch unter dem internen Bezeichner

`lubuimi_initial_valuation_one_cylinder`

formalisiert. Sie verwendet die vorhandene Rekursion für zertifizierte Schritte und dieselbe Konvention der beschleunigten ungeraden Syracuse-Bahn. PR #56 ersetzt diesen internen Namen durch `initial_valuation_one_cylinder_iff_dyadic_divisibility`; für den neuen Bezeichner ist ein eigener exakter CI- und Axiom-Audit erforderlich.

Die beiden erfolgreichen vollständigen CI-Läufe für den historischen Bezeichner sind:

- [42721006544](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721006544), Merge-Commit `44bb2ac`;
- [42721305220](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42721305220), Merge-Commit `3d79761`.

Beide melden das transitive Axiomprofil

`[propext, Classical.choice, Quot.sound]`

und beide vollständigen Log-Prüfungen finden kein `sorryAx`.

Diese Verifikation ist auf die genannte Deklaration und ihren transitiven Abhängigkeitsabschluss beschränkt. Sie verifiziert weder den allgemeinen Zylindersatz für beliebige endliche Valuierungswörter noch die globale Collatz-Vermutung.

## 6. Verallgemeinerungen und nächste Inzidenzebene

Der anfängliche Eins-Zylinder ist der Spezialfall von [Klassifikation endlicher exakter Valuierungswort-Zylinder](Lubuimi_Finite_Valuation_Word_Cylinder_Partition_2026-11-10.md). Dieser ordnet jedem endlichen positiven exakten Valuierungswort eine eindeutige ungerade Restklasse modulo (2^{A+1}) mit relativer Dichte (2^{-A}) unter den ungeraden Startzahlen zu.

Eine weitere mathematische Entwicklung ist [terminale Restklassen-Kollisionsenergie](Lubuimi_Terminal_Residue_Collision_Energy_2026-11-10.md). Sie bildet Wörter der Länge (k) auf terminale Einheitsrestklassen modulo (3^k) ab; das zweite Moment besitzt Diagonalmasse (3^{-k}) und Off-Diagonal-Kollisionsmasse mindestens (1/(2\cdot3^k)). Hinzu kommt eine endliche rationale Markov-Darstellung. Diese Verallgemeinerungen sind von der bereits erfolgreich formalisierten Anfangszylinder-Aussage getrennte Resultate und Formalisierungsziele.

**Autorschaft:** Ta-Yoshua Lubuimi. KI-Systeme dienen ausschließlich als Hilfsmittel und sind weder Autoren noch unabhängige mathematische Verifikatoren.


## 7. Dritter späterer Auditlauf auf dem aktuellen Quellstand

Ein dritter, zeitlich späterer Auditlauf ist ebenfalls erfolgreich: Workflow [42738528207](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42738528207) kompilierte den aktuellen Quell-Commit `a1becbc8e837f10abcd952a2e03832cb057fb2b8` und gab für `lubuimi_initial_valuation_one_cylinder` sowie `dyadicUniformFibre_partition_card` dasselbe Standardprofil der transitiven Axiome aus. Die explizite `sorryAx`-Prüfung bestand. Dieser spätere Lauf stärkt den Nachweis für den exakten Quellstand, erweitert aber nicht den mathematischen Geltungsbereich der beiden Aussagen.


## Literatur- und Namenskorrektur — Version 1.1

Dieses Manuskript dokumentiert die eigenständige Beweisführung und Lean-Formalisierung von Ta-Yoshua Lubuimi für die Klassifikation des anfänglichen Valuierungs-eins-Zylinders. Die endliche Kongruenzaussage ist eine klassische Konsequenz der Paritätsvektor-Kodierung; einschlägig sind Terras (1976), Everett (1977) und Lagarias (1985), Theorem B. Es wird kein nach dem Autor benannter Satz und kein Prioritätsanspruch behauptet. Tao (2022), Proposition 1.9, wird nicht als Beleg für den exakten Eindeutigkeits-/Restklassensatz zitiert; die Proposition betrifft die angenäherte Verteilung endlicher Syracuse-Valuierungsvektoren unter einer Gleichverteilungsvoraussetzung. Die mathematische Aussage und der Beweistext oben werden durch diese Namens- und Literaturkorrektur nicht verändert.
