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

The exact source-set characterization E_B={x<B: x=3 mod 4 and 2B<=3x+1} and the power-of-two count |E_(2^k-1)|=floor(2^k/12) are proved in MANUSCRIPT.md. The full B=31,63,127,255 tables, extended B=511/1023 CSV archives, confluence suffixes, and the worked 731 -> 1097 -> 823 valuation-cylinder/signed-margin certificate are also documented there. The complete extended B=511 and B=1023 tables are archived in threshold_511.csv and threshold_1023.csv. The independent integer-only reproduction script is threshold_return.py; its regression tests are test_threshold_return.py.

## Reproducibility and scope

The script uses exact integer arithmetic only and has no third-party dependencies. Local checks reproduce all seven thresholds, all three complete extended CSV tables, the named common suffixes, the source-set criterion and the power-of-two count formula. A GitHub Actions workflow is included, but no GitHub CI run is claimed while the base main branch lacks the workflow. This is a finite computational audit, not a proof about all thresholds or all starting values.

The value 1097 occurs as z0=T(731) in the B=1023 finite table, with first return 823 after one further step. This does not identify or verify the separate earlier “1097 threshold/count” lead, whose definition remains unresolved.

**Attribution:** Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers.


## Exact-head CI result — 10 November 2026

Expanded reproducibility run 42732032993 on source head `5a01e5e56d203c0ed987f6bb70c1519b107e9f23` passed. Job 129552163491 (`exact-finite-tables`) verified all six thresholds, both complete extended CSV tables, the original and new confluence suffixes, and the B=1023 valuation-word/cylinder/margin certificate. This is finite Python reproducibility CI only; no Lean kernel verification or universal Collatz result is claimed.


## Reproducibility CI

The expanded B=511/B=1023 archive and all seven regression tests passed workflow 42732216205 on code/test commit `821579ea5555a6f5e2e38fa771f8797dc4650106`. This is exact finite Python reproducibility, not Lean kernel verification.
