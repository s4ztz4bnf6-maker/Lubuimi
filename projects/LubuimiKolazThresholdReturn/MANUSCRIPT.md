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

These are exact path identities under the deterministic map T. They show that several threshold excursions feed into a small number of long suffixes. They do not show that every orbit does so.

## 4. Observed finite bounds

For the tested thresholds:
- the maximum observed excursion length is 36 at B=31, 32 at B=63, 25 at B=127, and 18 at B=255;
- the maximum observed height is 3077 at all four thresholds;
- B=255 includes the direct return z0=341 to 1.

These are finite-sample facts about the specified escape-source sets. They do not establish a uniform bound as B grows, nor do they classify all Syracuse orbits.

## 5. Reproducibility

The exact integer-only script threshold_return.py enumerates E_B and computes every row. The tests in test_threshold_return.py verify all four tables, the first-return convention, the repeated maximum 3077, and the named common suffixes. The workflow kolaz-threshold-return.yml runs those tests.

The archival “1097” lead has no recovered definition or verified relation to these threshold tables. It remains OFFEN – NICHT VERIFIZIERT and is not used.

## 6. Open mathematical questions

1. Determine whether the observed common-suffix structure persists for larger B, beginning with B=511.
2. Classify which terminal returns recur and whether a finite set of suffix attractors emerges.
3. Relate the threshold excursion tree to the exact valuation cylinders and signed-margin cap, without treating finite data as a universal statement.
4. Prove or refute any proposed uniform bound on m_B or H_B; no such bound is currently established.

**Conclusion:** This archive is a reproducible finite computational result and a source of conjectures. It is not a proof of global Collatz and is not Lean-verified.
