# Lubuimis Zylindersatz für anfängliche Bewertungs-Einsen
## Eine exakte Kongruenzklassifikation anfänglicher Bewertungsblöcke der beschleunigten Syracuse-Abbildung

**Autor:** Ta-Yoshua Lubuimi  
**Version:** 1.0-DE  
**Datum:** 10. November 2026  
**Arbeitstyp:** Wissenschaftliche Forschungsnotiz / Preprint  
**Status:** Vollständiger eigenständiger Beweis; der Formalisierungsstatus wird gesondert ausgewiesen.

### Zusammenfassung

Sei \(n_0\) eine positive ungerade ganze Zahl, und sei ihre beschleunigte Syracuse-Bahn definiert durch
\[
a_j=v_2(3n_j+1),\qquad n_{j+1}=\frac{3n_j+1}{2^{a_j}}.
\]
Wir beweisen, dass für jede ganze Zahl \(N\geq0\) die ersten \(N\) Bewertungs-Exponenten genau dann sämtlich gleich eins sind, wenn
\[
n_0\equiv-1\pmod{2^{N+1}}.
\]
Die exakte Länge des anfänglichen Blocks von Schritten mit Bewertung eins ist somit \(v_2(n_0+1)-1\). Die zugehörigen Mengen sind einzelne Restklassen-Zylinder, sodass sich ihre natürlichen Dichten sowohl relativ zu ungeraden Startwerten als auch relativ zu allen positiven ganzen Zahlen exakt bestimmen lassen. Zusätzlich leiten wir eine explizite Bahnformel während des anfänglichen Blocks sowie eine exakte Identität für die vorzeichenbehaftete Offset-Margin und eine Schwelle für die nächste Bewertung her. Das Ergebnis ist eine lokale arithmetische Klassifikation; es impliziert keinen globalen Abstieg und löst nicht die Collatz-Vermutung.

**Schlagwörter:** Syracuse-Abbildung; Collatz-Problem; 2-adische Bewertung; Restklassen; Zylindermengen; natürliche Dichte; beschleunigte Iteration.

**Mathematische Klassifikation (2020):** 11B83, 11A07, 11S05.

---

## 1. Einleitung

Das \(3x+1\)-Problem fragt nach dem Langzeitverhalten der wiederholten Iteration der Collatz-Abbildung. Ihre beschleunigte Form auf ungeraden Zahlen eignet sich besonders zur Untersuchung der Zweierpotenzen, die nach jedem ungeraden Schritt herausdividiert werden. Ist \(n\) positiv und ungerade, so ist \(3n+1\) gerade; die Division durch die vollständige Zweierpotenz liefert die nächste positive ungerade Zahl.

Diese Arbeit isoliert eine exakte Frage über endliche Präfixe: Welche ungeraden Startzahlen haben die Eigenschaft, dass ihre ersten \(N\) beschleunigten Bewertungs-Exponenten sämtlich gleich eins sind? Die Antwort ist eine einzige Kongruenzklasse modulo \(2^{N+1}\). Der Beweis ist elementar, liefert aber eine vollständige Äquivalenz in beiden Richtungen, eine exakte Formel für die Länge des anfänglichen Blocks und exakte Dichteaussagen.

Die 2-adische Perspektive ist für die Untersuchung der \(3x+1\)-Abbildung naheliegend. Frühere Arbeiten entwickeln die Abbildung auf den 2-adischen ganzen Zahlen und untersuchen ihre Konjugation mit einer Shift-Abbildung; siehe Lagarias [1] und Bernstein–Lagarias [2]. Die vorliegende Arbeit verwendet ausschließlich endliche Kongruenzen und die elementare Bewertung \(v_2\). Sie beansprucht nicht, den allgemeinen 2-adischen Rahmen neu einzuführen. Ihr Schwerpunkt liegt auf dem expliziten Zylinder beschleunigter Bewertungen, seiner Interpretation als Stoppzeit und seiner Konsequenz für den vorzeichenbehafteten Offset.

## 2. Definitionen und affine Identität

Für eine positive ungerade ganze Zahl \(n_0\) definieren wir rekursiv
\[
a_j:=v_2(3n_j+1),\qquad
n_{j+1}:=\frac{3n_j+1}{2^{a_j}}.
\tag{2.1}
\]
Dabei bezeichnet \(v_2(m)\) den größten ganzzahligen Exponenten \(e\geq0\), für den \(2^e\mid m\) gilt. Da \(3n_j+1\) gerade ist, gilt \(a_j\geq1\); definitionsgemäß ist \(n_{j+1}\) wiederum eine positive ungerade ganze Zahl. Äquivalent dazu gilt
\[
2^{a_j}n_{j+1}=3n_j+1.
\tag{2.2}
\]

Wir definieren den kumulierten Exponenten \(A_j\) und den affinen Offset \(C_j\) durch
\[
A_0=C_0=0,\qquad
A_{j+1}=A_j+a_j,\qquad
C_{j+1}=3C_j+2^{A_j}.
\tag{2.3}
\]

**Lemma 2.1 (Affine Bahnidentität).** Für jedes \(j\geq0\) gilt
\[
\boxed{2^{A_j}n_j=3^j n_0+C_j.}
\tag{2.4}
\]

**Beweis.** Für \(j=0\) sind beide Seiten gleich \(n_0\). Angenommen, (2.4) gilt für \(j\). Multiplizieren wir (2.2) mit \(2^{A_j}\), so erhalten wir
\[
\begin{aligned}
2^{A_{j+1}}n_{j+1}
&=3\cdot2^{A_j}n_j+2^{A_j}\\
&=3(3^j n_0+C_j)+2^{A_j}\\
&=3^{j+1}n_0+C_{j+1},
\end{aligned}
\]
wobei wir (2.3) verwendet haben. Induktion beweist die Identität. \(\square\)

## 3. Hauptsatz: der Zylinder anfänglicher Bewertungs-Einsen

**Satz 3.1 (Lubuimis Zylindersatz für anfängliche Bewertungs-Einsen).**  
Sei \(n_0\) eine beliebige positive ungerade ganze Zahl, sei \((n_j,a_j)_{j\geq0}\) durch (2.1) definiert, und sei \(N\geq0\). Dann gilt
\[
\boxed{
\bigl(\forall j<N,\ a_j=1\bigr)
\quad\Longleftrightarrow\quad
2^{N+1}\mid(n_0+1).
}
\tag{3.1}
\]
Äquivalent dazu sind die ersten \(N\) beschleunigten Bewertungs-Exponenten genau dann sämtlich gleich eins, wenn
\[
\boxed{n_0\equiv-1\pmod{2^{N+1}}.}
\]

### Beweis

Wir beweisen beide Implikationen.

**(Kongruenz impliziert Bewertungsblock.)** Es gelte
\[
n_0+1=2^{N+1}m
\]
für eine positive ganze Zahl \(m\). Für \(0\leq j\leq N\) setzen wir
\[
u_j:=3^j2^{N+1-j}m-1.
\tag{3.2}
\]
Dann ist \(u_0=n_0\). Für \(j<N\) ergibt eine direkte Rechnung
\[
\begin{aligned}
3u_j+1
&=3\bigl(3^j2^{N+1-j}m-1\bigr)+1\\
&=2\bigl(3^{j+1}2^{N-j}m-1\bigr).
\end{aligned}
\tag{3.3}
\]
Da \(N-j\geq1\), ist \(3^{j+1}2^{N-j}m\) gerade; folglich ist der Ausdruck in der Klammer in (3.3) ungerade. Daher gilt
\[
v_2(3u_j+1)=1,
\]
und der nächste beschleunigte ungerade Iterierte ist
\[
\frac{3u_j+1}{2}=3^{j+1}2^{N-j}m-1=u_{j+1}.
\]
Ausgehend von \(n_0=u_0\) liefert Induktion \(n_j=u_j\) und \(a_j=1\) für jedes \(j<N\).

**(Bewertungsblock impliziert Kongruenz.)** Es seien die ersten \(N\) Exponenten gleich eins. Dann gilt \(A_N=N\). Die Rekursion für \(C_j\) aus (2.3) vereinfacht sich zu
\[
C_{j+1}=3C_j+2^j.
\]
Durch Induktion folgt
\[
C_N=3^N-2^N.
\tag{3.4}
\]
Setzen wir \(A_N=N\) und (3.4) in Lemma 2.1 ein, erhalten wir
\[
2^N n_N=3^N n_0+3^N-2^N,
\]
also
\[
2^N(n_N+1)=3^N(n_0+1).
\tag{3.5}
\]
Die ganze Zahl \(n_N\) ist ungerade, daher ist \(n_N+1\) gerade. Somit ist die linke Seite von (3.5) durch \(2^{N+1}\) teilbar. Da \(3^N\) teilerfremd zu \(2^{N+1}\) ist, folgt aus dem Lemma von Euklid
\[
2^{N+1}\mid(n_0+1).
\]
Damit ist die Umkehrung bewiesen.

Für \(N=0\) ist die Bewertungsbedingung eine leere Konjunktion und somit wahr; auch die Teilbarkeitsbedingung \(2\mid(n_0+1)\) gilt, weil \(n_0\) ungerade ist. Die Aussage umfasst also auch \(N=0\). \(\square\)

## 4. Explizite Bahnformel und exakte Länge des anfänglichen Blocks

Die Kongruenzimplikation im Beweis liefert mehr als das Kongruenzkriterium.

**Korollar 4.1 (Bahnformel).** Wenn \(2^{N+1}\mid(n_0+1)\) gilt und
\[
m=\frac{n_0+1}{2^{N+1}},
\]
dann gilt für jedes \(0\leq j\leq N\)
\[
\boxed{n_j=3^j2^{N+1-j}m-1.}
\tag{4.1}
\]
Insbesondere gilt nach \(N\) anfänglichen Schritten mit Bewertungs-Exponent eins
\[
n_N=2\cdot3^N m-1.
\]

**Korollar 4.2 (Exakte Länge des anfänglichen Blocks).**  
Sei \(r\) die Anzahl aufeinanderfolgender Bewertungs-Exponenten gleich eins am Anfang der Bahn; der Block endet unmittelbar vor dem ersten Exponenten, der nicht eins ist. Dann gilt
\[
\boxed{r=v_2(n_0+1)-1.}
\tag{4.2}
\]
Äquivalent dazu hat der anfängliche Block genau die Länge \(r\), wenn und nur wenn
\[
2^{r+1}\mid(n_0+1)
\quad\text{und}\quad
2^{r+2}\nmid(n_0+1).
\tag{4.3}
\]

**Beweis.** Nach Satz 3.1 sind mindestens \(r\) anfängliche Exponenten genau dann gleich eins, wenn \(2^{r+1}\mid(n_0+1)\) gilt. Mindestens \(r+1\) anfängliche Exponenten sind genau dann gleich eins, wenn \(2^{r+2}\mid(n_0+1)\) gilt. Die Differenz dieser beiden Bedingungen ist (4.3), was äquivalent zu (4.2) ist. Da \(n_0+1\) eine feste positive ganze Zahl ist, ist ihre 2-adische Bewertung endlich. \(\square\)

## 5. Natürliche Dichten

Sei \(\mathcal C_N\) die Menge der positiven ungeraden ganzen Zahlen, deren erste \(N\) beschleunigte Bewertungs-Exponenten sämtlich eins sind. Satz 3.1 liefert
\[
\mathcal C_N
=\{n\in\mathbb Z_{>0}: n\text{ ungerade und }n\equiv-1\pmod{2^{N+1}}\}.
\tag{5.1}
\]

**Satz 5.1 (Zylinderdichten).** Die natürliche Dichte relativ zu den positiven ungeraden ganzen Zahlen ist
\[
\boxed{\operatorname{dens}_{\rm ungerade}(\mathcal C_N)=2^{-N}.}
\tag{5.2}
\]
Die natürliche Dichte als Teilmenge aller positiven ganzen Zahlen ist
\[
\boxed{\operatorname{dens}(\mathcal C_N)=2^{-(N+1)}.}
\tag{5.3}
\]
Die Menge der Startwerte mit genau \(r\) anfänglichen Bewertungs-Exponenten gleich eins hat unter den ungeraden ganzen Zahlen die relative Dichte
\[
\boxed{2^{-(r+1)}}
\tag{5.4}
\]
und unter allen positiven ganzen Zahlen die Dichte \(2^{-(r+2)}\).

**Beweis.** Modulo \(2^{N+1}\) gibt es \(2^N\) ungerade Restklassen. Gleichung (5.1) wählt genau eine davon aus und beweist damit (5.2). Unter allen Restklassen modulo \(2^{N+1}\) wird ebenfalls genau eine ausgewählt; daraus folgt (5.3).

Für einen exakten Block der Länge \(r\) wählt Bedingung (4.3) die einzelne Restklasse
\[
n\equiv2^{r+1}-1\pmod{2^{r+2}}.
\]
Modulo \(2^{r+2}\) gibt es \(2^{r+1}\) ungerade Restklassen. Daher ist die relative Dichte unter den ungeraden ganzen Zahlen \(2^{-(r+1)}\). Eine Division durch zwei ergibt die Dichte unter allen positiven ganzen Zahlen. \(\square\)

Die Zylinder sind geschachtelt:
\[
\mathcal C_{N+1}\subseteq\mathcal C_N,\qquad
\frac{\operatorname{dens}_{\rm ungerade}(\mathcal C_{N+1})}
{\operatorname{dens}_{\rm ungerade}(\mathcal C_N)}=\frac12.
\tag{5.5}
\]
Jeder zusätzlich geforderte Schritt mit Bewertungs-Exponent eins halbiert somit die relative Masse unter ungeraden Startwerten.

## 6. Vorzeichenbehaftete Offset-Margin

Der anfängliche Zylinder besitzt auch einen exakten Ausdruck in den affinen Offset-Koordinaten aus (2.3). Wir definieren
\[
D_j:=2^{A_j}-C_j-3^j.
\tag{6.1}
\]

**Lemma 6.1 (Margin-Rekursion).** Für jedes \(j\geq0\) gilt
\[
\boxed{D_{j+1}=3D_j+(2^{a_j}-4)2^{A_j}.}
\tag{6.2}
\]

**Beweis.** Unter Verwendung von (2.3) erhalten wir
\[
D_{j+1}
=2^{A_j+a_j}-3C_j-2^{A_j}-3^{j+1}.
\]
Wir setzen \(C_j=2^{A_j}-3^j-D_j\) ein und vereinfachen. \(\square\)

**Korollar 6.2 (Margin nach einem anfänglichen Block).**  
Wenn die ersten \(r\) Exponenten gleich eins sind, dann gilt
\[
\boxed{D_r=-2(3^r-2^r).}
\tag{6.3}
\]
Ist \(a_r\geq2\) die nächste exakte Bewertung, so gilt
\[
D_{r+1}=2^{a_r+r}-6\cdot3^r+2^{r+1}.
\tag{6.4}
\]
Insbesondere gilt
\[
\boxed{
D_{r+1}>0
\quad\Longleftrightarrow\quad
2^{a_r+r}>6\cdot3^r-2^{r+1}.
}
\tag{6.5}
\]

**Beweis.** Unter der Voraussetzung \(a_0=\cdots=a_{r-1}=1\) gelten \(A_r=r\) und \(C_r=3^r-2^r\). Einsetzen in (6.1) ergibt (6.3). Eine weitere Anwendung von (6.2) mit \(A_r=r\) liefert (6.4), und (6.5) ist die äquivalente strikte Ungleichung. \(\square\)

Die Schwelle (6.5) ist exakt und hängt von der tatsächlich realisierten Länge des anfänglichen Blocks ab. Sie behauptet nicht universell, dass die nächste Bewertung diese Schwelle erfüllt. Ebenso begründet die Positivität dieser einzelnen Margin für sich genommen keinen globalen Collatz-Abstiegssatz.

## 7. Beispiel

Wir wählen \(n_0=7\). Da \(7+1=8\) gilt, ist \(v_2(8)=3\), und Korollar 4.2 sagt genau zwei anfängliche Schritte mit Bewertungs-Exponent eins voraus. Tatsächlich gilt
\[
7\xrightarrow{a_0=1}11
\xrightarrow{a_1=1}17
\xrightarrow{a_2=2}13.
\]
Das Kongruenzkriterium liefert dasselbe Ergebnis: \(7\equiv-1\pmod8\), aber \(7\not\equiv-1\pmod{16}\). Somit sind die ersten beiden Bewertungen, nicht aber die ersten drei, gleich eins.

Die Dichte dieser Klasse mit exakt zwei anfänglichen Einsen beträgt unter ungeraden Startwerten \(2^{-3}=1/8\) und unter allen positiven ganzen Zahlen \(1/16\).

## 8. Bedeutung und Grenzen

Satz 3.1 klassifiziert eine Familie endlicher Bewertungspräfixe vollständig. In jeder Tiefe \(N\) bilden die zulässigen Startzahlen genau eine explizite Restklasse modulo \(2^{N+1}\). Der Satz liefert damit:

1. einen exakten Kongruenztest für jeden vorgeschriebenen anfänglichen Block von Bewertungs-Exponenten gleich eins;
2. eine explizite Formel für jeden Iterierten innerhalb dieses Blocks;
3. eine exakte Stoppzeitformel für die Länge des anfänglichen Blocks;
4. exakte natürliche Dichten sowohl für „mindestens“ als auch für „genau“ \(r\) anfängliche Schritte; und
5. eine exakte Formel für die signierte Margin und eine Schwelle für die nächste Bewertung.

Das Ergebnis ist lokal. Es impliziert weder, dass jede Bahn irgendwann abnimmt, noch dass jede Bahn beschränkt ist oder jede Bahn die Zahl \(1\) erreicht. Insbesondere kann eine Dichteinformation über endliche Präfixe für sich allein keine außergewöhnliche unendliche Bahn ausschließen. Ein globaler Beweis der Collatz-Vermutung erfordert weiterhin ein Argument für jede einzelne Bahn oder einen anderen Satz, der sämtliche nicht absteigenden Trajektorien ausschließt.

Die exakten Zylinder liefern außerdem ein natürliches endliches Präfixmodell für Vergleiche mit gewichteten Faser- und Inzidenzmethoden in anderen Projekten. Ein solcher Vergleich ist jedoch kein Identifikationssatz: Eine projektübergreifende Übertragung erfordert eine spezifizierte Abbildung der Indizes, die Erhaltung der relevanten Gewichte sowie den Beweis der entsprechenden Inzidenz- und Kapazitätsungleichungen. In dieser Arbeit wird keine APW4-Transportaussage vorausgesetzt oder verwendet.

## 9. Formale Verifikation und Reproduzierbarkeit

Der Hauptsatz ist in Lean formalisiert als
CollatzSyracuseAudit.lubuimi_initial_valuation_one_cylinder.

Die Deklaration wurde kompiliert und ihre transitiven Axiomabhängigkeiten wurden in sieben erfolgreichen GitHub-Actions-Snapshots für exakt bezeichnete Commits ausgegeben:

| Lauf | Geprüfter Quellstand / PR-Snapshot |
|---|---|
| 42721006544 | PR #35 Head 013192ce524a4572a9d96c8d4dcb2796830b1f62 |
| 42721305220 | PR #35 Head ad7203f5571d03e5989b9ac935b2103300f02409 |
| 42721911555 | PR #35 Head 21829b4dd3b82a73edb19cf0d09ed011f55ef384 |
| 42722186081 | PR #35 Head a36894eefc52e5d28cd43110f5e289805509ad33 |
| 42724343412 | PR #35 Head 29b27dc529b9e81a33b5211e9e01a01e19edc256 |
| 42725006480 | Exakter Quell-Commit b1a8599c686c37893a33453b759dee42047c7727 |
| 42725493567 | Exakter Quell-Commit a52dffc23b323964f33bc7f6c61c2cb24bcdf708 |

Das für die Hauptdeklaration in den geprüften Snapshots berichtete transitive Axiomprofil lautet
\[
[\texttt{propext},\ \texttt{Classical.choice},\ \texttt{Quot.sound}].
\]
Die abgeschlossenen Workflow-Protokolle berichten keinen tatsächlichen Fund von sorryAx im geprüften Satz. Lauf 42725493567 war eine vollständige erneute Prüfung eines dokumentationsbezogenen Nachfolge-Commits des vorherigen Lean-Quellstands; er erweiterte nicht den formalen Umfang des Satzes.

Frühere fehlgeschlagene Versuche bei der Entwicklung der Beweisskripte bleiben in der Projektchronologie erhalten. Sie entwerten nicht die späteren erfolgreichen Audits. Umgekehrt gelten diese Audits nur für die benannte Deklaration und die tatsächlich geprüften Quellstände. Sie zertifizieren weder den allgemeinen Zylindersatz für endliche Bewertungswörter noch die endliche Tail-Partition, den Satz über Terminal-Residue-Kollisionsenergie, die Markovdarstellung oder die globale Collatz-Vermutung.

Projektquellen, Lean-Deklaration, Workflow-Historie und Review-Aufzeichnungen werden im Repository des Autors gepflegt:
https://github.com/s4ztz4bnf6-maker/Lubuimi/tree/publication/lubuimi-initial-valuation-one-cylinder-2026-11-10.

## 10. Literatur

[1] J. C. Lagarias, „The 3x + 1 Problem and Its Generalizations“, The American Mathematical Monthly 92 (1985), Nr. 1, 3–23.

[2] D. J. Bernstein und J. C. Lagarias, „The 3x + 1 Conjugacy Map“, Canadian Journal of Mathematics 48 (1996), Nr. 6, 1154–1169.

Die Literaturangaben stellen den breiteren Collatz- und 2-adischen dynamischen Kontext bereit. Der Beweis in dieser Arbeit ist eigenständig und stützt sich auf keine der beiden Referenzen.

---

**Autorschaft:** Die mathematische Arbeit und der Satz werden Ta-Yoshua Lubuimi zugeschrieben. KI-Systeme werden, sofern eingesetzt, ausschließlich als Hilfsmittel anerkannt und sind weder Autoren noch Mitautoren oder unabhängige mathematische Verifikatoren.

**Publikationshinweis:** Dies ist ein eigenständiges Forschungsnotiz-/Preprint-Manuskript. Der oben angegebene Formalisierungsnachweis ist an den genannten Snapshots reproduzierbar. Eine Annahme durch eine Fachzeitschrift oder ein unabhängiges Peer Review wird nicht behauptet.
