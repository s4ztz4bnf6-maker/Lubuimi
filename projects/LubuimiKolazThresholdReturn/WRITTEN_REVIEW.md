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
- 85 for B=1023.

The two extended tables are preserved row-by-row in CSV and checked against fresh enumeration by the regression suite. The B=1023 source x=731 also gives a checked exact valuation word (1,2), cylinder residue 11 mod 16, affine offset identity 8·823=9·731+5, and two signed-margin cap inequalities.

It reproduces every row in the manuscript tables and both extended CSV files. The maximum excursion lengths at B=31,63,127,255,511,1023 are 36,32,25,18,24,50; the maximum heights are 3077,3077,3077,3077,13121,83501. These statements are restricted to the enumerated source sets.

## 3. Confluence result

The most substantial structural observation is the nested common suffix:
- the B=63 excursion from z0=71 enters the B=127 excursion from z0=155;
- the latter enters the B=127 z0=167 path;
- that path enters the B=255 z0=377 path;
- the B=255 z0=335 and z0=359 paths join the same terminal route at 425 and 911 respectively.

The shared terminal suffix from 155 to 61 is printed explicitly in the manuscript. The extended B=511 and B=1023 tables add two exact common suffixes of lengths 10 and 7, also checked by regression tests. This is a genuine finite confluence result, not an extrapolation.

## 4. Limitations

No uniform bound on excursion length or height as B varies has been proved. The finite tables do not establish that all orbits return below every threshold, nor that all orbits reach 1. The integer 1097 appears as the first image T(731) in the B=1023 table and returns to 823 in one further step; this does not resolve the separate earlier 1097 threshold/count lead, which remains unverified. The data are exact computational observations, not a theorem about all starting values.

## 5. Verification status

The Python script uses integer arithmetic only and no third-party libraries. The project includes a CI workflow that checks the four inline exact tables, the complete B=511 and B=1023 CSV tables, and the named common suffixes. This is reproducibility CI, not Lean kernel verification. No Lean proof is claimed.

**Verdict:** The finite threshold tables and confluence suffixes are exact, reproducible, and worth preserving as a numerical research archive. The general mathematical consequences remain open.

**Attribution:** Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers.


## 6. Exact source-set theorem and 1097 bridge

The manuscript now proves that for every positive odd threshold B,
\[
E_B=\{x<B:x\equiv3\pmod4,\ 2B\le3x+1\}.
\]
For B=2^k-1, k>=2, this yields the exact count |E_B|=floor(2^k/12). This explains the complete arithmetic progression of escape sources and the counts 2,5,10,21,42,85. The implementation now enumerates from this criterion; local regression tests compare it with direct evaluation of T.

The B=1023 entry x=731 -> z0=1097 -> R=823 has valuation word (1,2), exact cylinder 731=11 mod16, offset identity 8*823=9*731+5=6584, and signed-margin values D0=0,D1=-2 with local cap inequalities 2<=4 and 2<=8. This is an exact finite bridge to the cylinder and margin machinery. It does not resolve the separate archival “1097 threshold/count” lead.

## 7. CI status

The integer-only script and regression assertions have been locally checked, including all six threshold tables, the CSV data, the source-set characterization, the power-of-two count, and the common-suffix identities. The workflow file is included in the PR, but there is no GitHub Actions run attached yet because the base branch does not contain an existing workflow that can execute this newly introduced workflow on the pull_request event. No GitHub CI pass is claimed.


## Exact-head CI result — 10 November 2026

Expanded reproducibility run 42732032993 on source head `5a01e5e56d203c0ed987f6bb70c1519b107e9f23` passed. Job 129552163491 (`exact-finite-tables`) verified all six thresholds, both complete extended CSV tables, the original and new confluence suffixes, and the B=1023 valuation-word/cylinder/margin certificate. This is finite Python reproducibility CI only; no Lean kernel verification or universal Collatz result is claimed.
