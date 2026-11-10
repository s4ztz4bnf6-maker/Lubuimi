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
- 21 for B=255.

It reproduces every row in the manuscript tables. The longest excursion lengths are respectively 36, 32, 25 and 18; the maximum observed height is 3077 at each threshold. These statements are restricted to the enumerated source sets.

## 3. Confluence result

The most substantial structural observation is the nested common suffix:
- the B=63 excursion from z0=71 enters the B=127 excursion from z0=155;
- the latter enters the B=127 z0=167 path;
- that path enters the B=255 z0=377 path;
- the B=255 z0=335 and z0=359 paths join the same terminal route at 425 and 911 respectively.

The shared terminal suffix from 155 to 61 is printed explicitly in the manuscript. The exact tests verify these path identities under T. This is a genuine finite confluence result, not an extrapolation.

## 4. Limitations

No uniform bound on excursion length or height as B varies has been proved. The finite tables do not establish that all orbits return below every threshold, nor that all orbits reach 1. The number 1097 remains unverified and is not used. The data are exact computational observations, not a theorem about all starting values.

## 5. Verification status

The Python script uses integer arithmetic only and no third-party libraries. The project includes a CI workflow that checks the four exact tables and named common suffixes. This is reproducibility CI, not Lean kernel verification. No Lean proof is claimed.

**Verdict:** The finite threshold tables and confluence suffixes are exact, reproducible, and worth preserving as a numerical research archive. The general mathematical consequences remain open.

**Attribution:** Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers.
