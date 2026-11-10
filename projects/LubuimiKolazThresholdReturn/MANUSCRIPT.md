# Kolaz / Collatz Threshold-Return Excursions: Exact Finite Archive

**Author:** Ta-Yoshua Lubuimi  
**Date:** 10 November 2026  
**Status:** Reproducible finite computation for thresholds B=31,63,127,255; no universal theorem is claimed.

## 1. Map and excursion definition

For positive odd n, define the accelerated Syracuse map
\[
T(n)=\frac{3n+1}{2^{v_2(3n+1)}}.
\]
For an odd threshold B, define the escape-source set
\[
E_B=\{x\in\mathbb N: x\text{ odd},\ 1\le x<B,\ T(x)\ge B\}.
\]
For x in E_B, set z0=T(x). Define
\[
m_B(z_0)=\min\{m\ge1:T^m(z_0)<B\},
\]
\[
H_B(z_0)=\max_{0\le j\le m_B(z_0)}T^j(z_0),
\qquad
R_B(z_0)=T^{m_B(z_0)}(z_0).
\]
The initial edge x to z0 is not included in m. The maximum H includes both z0 and the first return R.

## 2. Exact finite tables

The rows below are (source x, first image z0, excursion length m, maximum H, first return R).

### Threshold B=31

| x | z0 | m | H | R |
|---:|---:|---:|---:|---:|
| 23 | 35 | 2 | 53 | 5 |
| 27 | 41 | 36 | 3077 | 23 |

Thus the first images, sometimes informally called the escape values, are 35 and 41. The corresponding source values are 23 and 27.

### Threshold B=63

| x | z0 | m | H | R |
|---:|---:|---:|---:|---:|
| 43 | 65 | 1 | 65 | 49 |
| 47 | 71 | 32 | 3077 | 61 |
| 51 | 77 | 1 | 77 | 29 |
| 55 | 83 | 2 | 125 | 47 |
| 59 | 89 | 3 | 101 | 19 |

### Threshold B=127

| x | z0 | m | H | R |
|---:|---:|---:|---:|---:|
| 87 | 131 | 2 | 197 | 37 |
| 91 | 137 | 1 | 137 | 103 |
| 95 | 143 | 4 | 485 | 91 |
| 99 | 149 | 1 | 149 | 7 |
| 103 | 155 | 25 | 3077 | 61 |
| 107 | 161 | 1 | 161 | 121 |
| 111 | 167 | 18 | 3077 | 61 |
| 115 | 173 | 1 | 173 | 65 |
| 119 | 179 | 2 | 269 | 101 |
| 123 | 185 | 4 | 209 | 59 |

### Threshold B=255

| x | z0 | m | H | R |
|---:|---:|---:|---:|---:|
| 171 | 257 | 1 | 257 | 193 |
| 175 | 263 | 4 | 593 | 167 |
| 179 | 269 | 1 | 269 | 101 |
| 183 | 275 | 2 | 413 | 155 |
| 187 | 281 | 1 | 281 | 211 |
| 191 | 287 | 6 | 1457 | 205 |
| 195 | 293 | 1 | 293 | 55 |
| 199 | 299 | 3 | 449 | 253 |
| 203 | 305 | 1 | 305 | 229 |
| 207 | 311 | 7 | 701 | 167 |
| 211 | 317 | 1 | 317 | 119 |
| 215 | 323 | 2 | 485 | 91 |
| 219 | 329 | 1 | 329 | 247 |
| 223 | 335 | 18 | 3077 | 61 |
| 227 | 341 | 1 | 341 | 1 |
| 231 | 347 | 6 | 881 | 31 |
| 235 | 353 | 2 | 353 | 199 |
| 239 | 359 | 11 | 3077 | 61 |
| 243 | 365 | 1 | 365 | 137 |
| 247 | 371 | 2 | 557 | 209 |
| 251 | 377 | 16 | 3077 | 61 |

### Extended thresholds B=511 and B=1023

The exact integer-only enumerator and regression tests have now been extended to two further thresholds. The complete row-by-row tables are archived as `threshold_511.csv` and `threshold_1023.csv`; the tests compare every computed row against those files.

| Threshold | Escape sources | Maximum excursion length | Maximum height | All first returns found? |
|---:|---:|---:|---:|:---:|
| 511 | 42 | 24 | 13,121 | Yes |
| 1023 | 85 | 50 | 83,501 | Yes |

At B=1023, the source x=731 has first image z0=1097 and returns below the threshold in one further step, at 823. This is an exact entry in the B=1023 table. It does **not** verify or identify the earlier separate “1097 threshold/count” lead, whose definition remains unresolved.

### Worked valuation-cylinder and signed-margin certificate

The B=1023 excursion with source x=731 is a concrete cross-check against the exact valuation-cylinder and offset-margin framework:
\[
731\xrightarrow{a_0=1}1097\xrightarrow{a_1=2}823.
\]
The valuation word is \((1,2)\), so \(A_2=3\) and the affine offset recurrence gives \(C_0=0,C_1=1,C_2=5\). Hence
\[
2^3\cdot823=3^2\cdot731+5=6584.
\]
The unique initial cylinder residue for this word is
\[
r\equiv(2^3-5)(3^2)^{-1}\equiv3\cdot9\equiv11\pmod{16},
\]
and indeed \(731\equiv11\pmod{16}\).

The signed margins are \(D_0=0\), \(D_1=2-1-3=-2\), and \(D_2=8-5-9=-6\). The two local non-descent cap inequalities are
\[
2^1+3D_0=2\le4,
\qquad
2^{1+2}+3D_1=2\le8.
\]
This is an exact finite example where the threshold-return path, its valuation cylinder, affine offset, and signed-margin cap agree. It is a consistency check of the three frameworks, not a proof of the general cylinder theorem or a global Collatz statement. The corresponding Python regression test recomputes the word, residue, offset identity, and both cap inequalities.

## 3. Exact confluence and common suffixes

The excursions display exact confluence, not merely similar maxima.

### A. B=63 to B=127

The z0=71 path at B=63 contains the z0=155 path at B=127 as a suffix. The common suffix begins at 155:
\[
\begin{aligned}
155&\to233\to175\to263\to395\to593\to445\to167\\
&\to251\to377\to283\to425\to319\to479\to719\\
&\to1079\to1619\to2429\to911\to1367\to2051\\
&\to3077\to577\to433\to325\to61.
\end{aligned}
\]
The B=127 z0=167 path is the suffix beginning at 167; it reaches 61 in 18 steps.

### B. B=127 to B=255

The B=127 path starting at 167 and the B=255 path starting at 377 share the suffix beginning at 377:
\[
377\to283\to425\to319\to479\to719\to1079\to1619
\to2429\to911\to1367\to2051\to3077\to577\to433\to325\to61.
\]
The B=255 path from z0=335 joins this common route at 425. The path from z0=359 joins at 911.

### C. Additional B=255 confluence

The z0=263 and z0=311 excursions share the suffix
\[
263\to395\to593\to445\to167.
\]

### D. B=511 to B=1023 confluence

Two further exact common suffixes appear between the new threshold tables:
\[
1151\to1727\to2591\to3887\to5831\to8747\to13121
\to9841\to7381\to173,
\]
shared by the B=511 path from z0=671 and the B=1023 path from z0=1151 (10 terms), and
\[
1403\to2105\to1579\to2369\to1777\to1333\to125,
\]
shared by the B=511 path from z0=623 and the B=1023 path from z0=1403 (7 terms).

These are exact path identities under the deterministic map T. They show that several threshold excursions feed into a small number of long suffixes. They do not show that every orbit does so.

## 4. Observed finite bounds

For the tested thresholds:
- the maximum observed excursion lengths are 36, 32, 25, 18, 24 and 50 at B=31, 63, 127, 255, 511 and 1023 respectively;
- the maximum observed heights are 3077, 3077, 3077, 3077, 13121 and 83501 respectively;
- B=255 includes the direct return z0=341 to 1;
- all 42 B=511 and all 85 B=1023 escape sources have a recorded first return below their threshold.

These are finite-sample facts about the specified escape-source sets. They do not establish a uniform bound as B grows, nor do they classify all Syracuse orbits.

## 5. Reproducibility

The exact integer-only script threshold_return.py enumerates E_B and computes every row. The tests in test_threshold_return.py verify the four inline tables, all rows in threshold_511.csv and threshold_1023.csv, the first-return convention, the direct return to 1, and the named common suffixes. The workflow kolaz-threshold-return.yml runs those tests.

The integer 1097 is recorded above as the B=1023 first image T(731), returning to 823 in one further step. The separate earlier “1097 threshold/count” lead has no recovered definition and remains OFFEN – NICHT VERIFIZIERT; the finite table entry does not resolve that distinct claim.

## 6. Open mathematical questions

1. Determine whether the observed common-suffix structure persists for larger B, beginning with B=2047.
2. Classify which terminal returns recur and whether a finite set of suffix attractors emerges.
3. Relate the threshold excursion tree to the exact valuation cylinders and signed-margin cap, without treating finite data as a universal statement.
4. Prove or refute any proposed uniform bound on m_B or H_B; no such bound is currently established.

**Conclusion:** This archive is a reproducible finite computational result and a source of conjectures. It is not a proof of global Collatz and is not Lean-verified.


## 7. Exact source-set characterization and power-of-two count

The source values that escape a positive odd threshold admit a closed-form description. Let
\[
E_B=\{x\in\mathbb N:x\text{ odd},\ 1\le x<B,\ T(x)\ge B\},
\quad
T(x)=\frac{3x+1}{2^{v_2(3x+1)}}.
\]
For every positive odd B,
\[
\boxed{
E_B=\{x:1\le x<B,\ x\equiv3\pmod4,\ 2B\le3x+1\}.
}
\]

**Proof.** Put \(a=v_2(3x+1)\ge1\). If \(T(x)\ge B\), then
\[
2^aB\le3x+1\le3(B-1)+1=3B-2<4B.
\]
Since B is positive, this forces \(2^a<4\), hence \(a=1\). Therefore \(3x+1\equiv2\pmod4\), which is equivalent to \(x\equiv3\pmod4\). The threshold condition becomes \(2B\le3x+1\). Conversely, \(x\equiv3\pmod4\) forces \(v_2(3x+1)=1\), so the same inequality gives \(T(x)\ge B\). This proves the equality.

For \(B=2^k-1\), \(k\ge2\), one has \(B\equiv3\) or \(7\pmod{12}\). Writing B as \(12m+3\) or \(12m+7\), the source set is respectively
\[
\{8m+3+4j:0\le j<m\}
\quad\text{or}\quad
\{8m+7+4j:0\le j<m\}.
\]
In either case its cardinality is m. Hence
\[
\boxed{|E_{2^k-1}|=\left\lfloor\frac{2^k}{12}\right\rfloor
=\left\lfloor\frac{(2^k-1)+1}{12}\right\rfloor.}
\]
For k=5,6,7,8,9,10 this gives the observed counts 2,5,10,21,42,85. The script now enumerates the source set using this exact criterion; regression tests compare it with direct evaluation of T.

## 8. The B=1023 value 1097 and its exact valuation-cylinder certificate

The B=1023 table contains source x=731 with first image z0=1097 and first return 823:
\[
731\longmapsto1097\longmapsto823.
\]
The exact valuation word is \(\alpha=(1,2)\). Its total exponent and offset are
\[
A_2=3,\qquad C_2=5,
\]
and the affine identity is
\[
2^3\cdot823=3^2\cdot731+5=6584.
\]
The exact cylinder modulus and residue are
\[
2^{A_2+1}=16,\qquad
r_\alpha\equiv(2^3-C_2)(3^2)^{-1}\equiv11\pmod{16}.
\]
Indeed \(731\equiv11\pmod{16}\). The signed margins at the two prefix positions are \(D_0=0\) and \(D_1=-2\); the corresponding local cap inequalities are \(2\le4\) and \(2\le8\).

The regression test recomputes the valuation word, endpoint, offset identity, cylinder residue and both cap inequalities. This is an exact finite bridge between the threshold table, the general valuation-word cylinder formula and the Lean-verified margin-cap core. It does not by itself formalize the general finite-word cylinder theorem. The earlier archival “1097 threshold/count” lead remains distinct unless its original definition is recovered.
