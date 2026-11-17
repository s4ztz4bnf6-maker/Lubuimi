# Written Review — Kolaz / Collatz Threshold-Return Archive

**Author:** Ta-Yoshua Lubuimi  
**Review date:** 10 November 2026  
**Review type:** Internal computational and mathematical review; not independent peer review.

## 1. Mathematical object

The archive studies first-return excursions above an odd threshold B for the accelerated map T(n)=(3n+1)/2^v2(3n+1). The source set E_B consists of odd x<B with T(x)>=B. The first image z0=T(x) is the excursion start; m counts subsequent iterates until the first return below B; H is the maximum along that finite segment; R is the first return.

This convention resolves a previous naming ambiguity: for B=31, the source values are x=23,27, while the corresponding escape images are z0=35,41.

## 2. Reproduction results

The exact integer-only implementation reproduces:
- 2 source edges for B=31;
- 5 for B=63;
- 10 for B=127;
- 21 for B=255;
- 42 for B=511;
- 85 for B=1023;
- 170 for B=2047;
- 341 for B=4095;
- 682 for B=8191.

The extended B=511, B=1023, B=2047, B=4095 and B=8191 tables are preserved row-by-row in CSV and checked against fresh enumeration by the regression suite. The B=1023 source x=731 also gives a checked exact valuation word (1,2), cylinder residue 11 mod 16, affine offset identity 8·823=9·731+5, and two signed-margin cap inequalities.

It reproduces every row in the manuscript tables and all five extended CSV files. The maximum excursion lengths at B=31,63,127,255,511,1023,2047,4095,8191 are 36,32,25,18,24,50,50,30,45; the maximum heights are 3077,3077,3077,3077,13121,83501,425645,425645,2717873. These statements are restricted to the enumerated source sets.

## 3. Confluence result

The most substantial structural observation is the nested common suffix:
- the B=63 excursion from z0=71 enters the B=127 excursion from z0=155;
- the latter enters the B=127 z0=167 path;
- that path enters the B=255 z0=377 path;
- the B=255 z0=335 and z0=359 paths join the same terminal route at 425 and 911 respectively.

The shared terminal suffix from 155 to 61 is printed explicitly in the manuscript. The extended B=511 and B=1023 tables add two exact common suffixes of lengths 10 and 7; B=1023 to B=2047 adds exact shared suffixes of lengths 49 and 45; B=4095 to B=8191 adds a 29-term suffix. All are checked by regression tests. This is a genuine finite confluence result, not an extrapolation.

## 4. Limitations

No uniform bound on excursion length or height as B varies has been proved. The finite tables do not establish that all orbits return below every threshold, nor that all orbits reach 1. At B=2047 all 170, at B=4095 all 341, and at B=8191 all 682 enumerated escape sources return below threshold. The maximum observed heights at the last three thresholds are 425645, 425645 and 2717873. The integer 1097 appears as the first image T(731) in the B=1023 table and returns to 823 in one further step; this does not resolve the separate earlier 1097 threshold/count lead, which remains unverified. The data are exact computational observations, not a theorem about all starting values.

## 5. Verification status

The Python script uses integer arithmetic only and no third-party libraries. The project CI checks the four inline exact tables, the complete B=511, B=1023, B=2047, B=4095 and B=8191 CSV tables, the exact source-set characterization, the power-of-two count formula, and the named common suffixes. This is Python reproducibility CI, not Lean kernel verification of the excursion table enumeration.

**Verdict:** The finite threshold tables and confluence suffixes are exact, reproducible, and worth preserving as a numerical research archive. The general mathematical consequences remain open.

**Attribution:** Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers.


## 6. Exact source-set theorem and 1097 bridge

The manuscript now proves that for every positive odd threshold B,
\[
E_B=\{x<B:x\equiv3\pmod4,\ 2B\le3x+1\}.
\]
For B=2^k-1, k>=2, this yields the exact count |E_B|=floor(2^k/12). This explains the complete arithmetic progression of escape sources and the counts 2,5,10,21,42,85,170,341,682. The implementation now enumerates from this criterion; local regression tests compare it with direct evaluation of T.

The B=1023 entry x=731 -> z0=1097 -> R=823 has valuation word (1,2), exact cylinder 731=11 mod16, offset identity 8*823=9*731+5=6584, and signed-margin values D0=0,D1=-2 with local cap inequalities 2<=4 and 2<=8. This is an exact finite bridge to the cylinder and margin machinery. It does not resolve the separate archival “1097 threshold/count” lead.

## 7. CI status

The exact-head expanded workflow 42737593864 passed on source head 710fb173c3006bbf622f6b7b3a67ac69907fc783. All nine regression tests passed, including fresh enumeration against all five extended CSV tables, all nine thresholds, the exact source-set characterization, the power-of-two count formula, and the named confluence suffixes. This is Python integer-arithmetic reproducibility CI, not Lean kernel verification of the threshold-return enumeration.


## Exact-head CI result — 10 November 2026

Expanded reproducibility run 42732032993 on source head `5a01e5e56d203c0ed987f6bb70c1519b107e9f23` passed. Job 129552163491 (`exact-finite-tables`) verified all six thresholds, both complete extended CSV tables, the original and new confluence suffixes, and the B=1023 valuation-word/cylinder/margin certificate. This is finite Python reproducibility CI only; no Lean kernel verification or universal Collatz result is claimed.


## Exact-head expanded reproducibility result — 10 November 2026

Workflow 42732216205 passed on source head `821579ea5555a6f5e2e38fa771f8797dc4650106`. All seven regression tests passed, including the complete B=511 and B=1023 CSV tables, the two new cross-threshold confluence suffixes, and the exact x=731 valuation-word/cylinder/offset/signed-margin certificate. This is Python integer-arithmetic reproducibility only. The current PR head may advance with documentation-only changes; the exact code/test commit above is the verified snapshot.


## Exact-head B=2047 extension result — 10 November 2026

Workflow 42737245099 passed on source head `9081ab4da049f5713dfafa0e7a8fbba6b0b65584`. All eight regression tests passed. The complete B=2047 CSV table contains 170 escape sources; all return below threshold in the finite enumeration. The maximum excursion length is 50 (z0=2111, return 157), and the maximum height is 425645 (z0=2729, 37 steps, return 1067). Two exact B=1023-to-B=2047 common suffixes are verified: length 49 from 2375 to 157, and length 45 from 3007 to 157. This is finite deterministic computation only; no uniform threshold bound or universal Collatz result is claimed.


## Exact-head B=4095/B=8191 extension result — 10 November 2026

Workflow 42737593864 passed on code snapshot 710fb173c3006bbf622f6b7b3a67ac69907fc783. The B=4095 archive has 341 sources, maximum length 30 and maximum height 425645; B=8191 has 682 sources, maximum length 45 and maximum height 2717873. The two paths from z0=4607 and z0=10367 share a 29-term suffix ending at 3371. All nine regression tests passed. This is finite exact computation only.


## Exact finite extension: threshold B = 16383 (10 November 2026)

The exact integer recurrence and source predicate were extended from B = 8191 to B = 16383. The complete table is stored in `threshold_16383.csv` and is generated by the existing integer-only script.

| Quantity | Exact result |
|---|---:|
| Escape sources | 1365 |
| Maximum return count m | 51 |
| Maximum height H (including z0 and R) | 9,038,141 |
| All enumerated excursions return below B | yes |

The maximum return count is attained at source x = 15039, with z0 = 22559, m = 51, H = 3,211,973 and R = 10049. The maximum height is attained at source x = 14495, with z0 = 21743, m = 32, H = 9,038,141 and R = 8947.

Three new exact common-suffix comparisons were added:

- (B,z0) = (8191,11291) and (16383,19055): common suffix length 43, from 19055 through 3533.
- (8191,11291) and (16383,22583): common suffix length 43, from 19055 through 3533.
- (4095,4607) and (16383,23327): common suffix length 27, from 23327 through 3371.

The exact-head finite-table workflow passed on commit `a500bf4003c122c5982ebaff181092b70b73b5b4`: push run 42889816391 and pull-request runs 42889821085 and 42889821224. Each executed the dedicated `exact-finite-tables` job; 10 regression tests passed. The pull-request workflow's Lean-project detector found no Lean project at the repository root, so the Lean 4.34/4.35 jobs were skipped. This is finite computational verification only. It proves no uniform threshold bound, no exclusion of all infinite non-descent paths, and no global Collatz theorem.
