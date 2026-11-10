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

The full exact tables and confluence suffixes are in MANUSCRIPT.md. The independent integer-only reproduction script is threshold_return.py; its regression tests are test_threshold_return.py.

## Reproducibility and scope

The script uses exact integer arithmetic only and has no third-party dependencies. The CI workflow checks the exact tables and named common suffixes. This is a finite computational audit, not a proof about all thresholds or all starting values.

The earlier numerical lead “1097” is not assigned a verified mathematical meaning in the archived material and is deliberately not included as a result.

**Attribution:** Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers.
