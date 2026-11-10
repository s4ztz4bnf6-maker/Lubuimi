# Kolaz / Collatz Threshold-Return Archive

**Research author:** Ta-Yoshua Lubuimi  
**Status:** Exact finite computational archive; not a general theorem or a proof of Collatz.

This project records threshold escape excursions of the accelerated odd Syracuse map
\[
T(n)=\frac{3n+1}{2^{v_2(3n+1)}}.
\]
For an odd threshold B, scan all positive odd x<B and retain those with T(x)>=B. The source of an excursion is x, its first outside value is z0=T(x), and the return is the first later iterate below B.

## Exact conventions

For each retained x:
- z0 = T(x);
- m is the least positive integer with T^m(z0) < B;
- H is the maximum of z0,T(z0),...,T^m(z0);
- R = T^m(z0), the first return below B.

The edge x -> z0 is not counted in m. This convention matters for reproducing the tables.

## Results archived

- B=31: source edges x=23,27; first images z0=35,41. The longest excursion is 41 -> ... -> 23 with m=36 and H=3077. The other is 35 -> 53 -> 5 with m=2.
- B=63: five source edges x=43,47,51,55,59; longest excursion starts at z0=71, returns to 61 in 32 steps, and reaches H=3077.
- B=127: ten source edges x=87,91,95,99,103,107,111,115,119,123; longest excursion starts at z0=155, returns to 61 in 25 steps, and reaches H=3077. The z0=167 excursion returns to 61 in 18 steps.
- B=255: twenty-one source edges x=171,175,...,251; longest excursion starts at z0=335, returns to 61 in 18 steps, and reaches H=3077. Another starts at z0=359 (11 steps to 61), and z0=377 (16 steps to 61). The z0=341 excursion returns directly to 1.

The exact source-set characterization E_B={x<B: x=3 mod 4 and 2B<=3x+1} and the power-of-two count |E_(2^k-1)|=floor(2^k/12) are proved in MANUSCRIPT.md. The full B=31,63,127,255 tables, extended B=511,1023,2047,4095 and 8191 CSV archives, confluence suffixes, and the worked 731 -> 1097 -> 823 valuation-cylinder/signed-margin certificate are documented there. The complete extended tables are archived in threshold_511.csv, threshold_1023.csv, threshold_2047.csv, threshold_4095.csv and threshold_8191.csv. The independent integer-only reproduction script is threshold_return.py; its regression tests are test_threshold_return.py.

## Reproducibility and scope

The script uses exact integer arithmetic only and has no third-party dependencies. The exact-head GitHub Actions workflow checks all nine thresholds, all five complete extended CSV tables, the named common suffixes, the source-set criterion and the power-of-two count formula. This is a finite computational audit, not a proof about all thresholds or all starting values.

The value 1097 occurs as z0=T(731) in the B=1023 finite table, with first return 823 after one further step. This does not identify or verify the separate earlier “1097 threshold/count” lead, whose definition remains unresolved.

**Attribution:** Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers.


## Exact-head CI result — 10 November 2026

Expanded reproducibility run 42732032993 on source head `5a01e5e56d203c0ed987f6bb70c1519b107e9f23` passed. Job 129552163491 (`exact-finite-tables`) verified all six thresholds, both complete extended CSV tables, the original and new confluence suffixes, and the B=1023 valuation-word/cylinder/margin certificate. This is finite Python reproducibility CI only; no Lean kernel verification or universal Collatz result is claimed.


## Reproducibility CI

The expanded B=511/B=1023 archive and all seven regression tests passed workflow 42732216205 on code/test commit `821579ea5555a6f5e2e38fa771f8797dc4650106`. This is exact finite Python reproducibility, not Lean kernel verification.


## Exact-head B=2047 extension result — 10 November 2026

Workflow 42737245099 passed on source head `9081ab4da049f5713dfafa0e7a8fbba6b0b65584`. All eight regression tests passed. The complete B=2047 CSV table contains 170 escape sources; all return below threshold in the finite enumeration. The maximum excursion length is 50 (z0=2111, return 157), and the maximum height is 425645 (z0=2729, 37 steps, return 1067). Two exact B=1023-to-B=2047 common suffixes are verified: length 49 from 2375 to 157, and length 45 from 3007 to 157. This is finite deterministic computation only; no uniform threshold bound or universal Collatz result is claimed.


## Exact-head B=4095/B=8191 extension result — 10 November 2026

Workflow 42737593864 passed on code snapshot 710fb173c3006bbf622f6b7b3a67ac69907fc783. All nine regression tests passed, including the complete B=4095 and B=8191 tables. B=4095 has 341 escape sources, maximum excursion length 30 and maximum height 425645. B=8191 has 682 sources, maximum length 45 and maximum height 2717873. The B=4095 path from z0=4607 and B=8191 path from z0=10367 share a 29-term suffix ending at 3371. This is exact finite Python reproducibility, not Lean verification or a universal Collatz result.


## Exact-head confluence CI reconfirmation — 10 November 2026

Workflow [42738273620](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42738273620) passed on PR #39 head `c8ae9d010757b82342fa8085011c6d55bdcbbd94`; the separate written-review reconciliation [42738265402](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42738265402) also passed on that exact head. The reproducibility log prints the cross-threshold suffix checks through B=8191, including the B=4095 start 4607 and B=8191 start 10367 sharing a 29-term suffix ending at 3371. This is a finite exact-integer regression/reproducibility result only. It does not prove a uniform excursion bound, exclude all nontrivial cycles, or establish the Collatz conjecture.
