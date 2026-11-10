#!/usr/bin/env python3
"""Exact rational checks for local regularity and the -1/3 singularity.

Fractions represent the displayed rational expressions exactly. The valuation
v2 of 3*x+1 is computed only for these constructed values, whose denominators
are odd; this is a symbolic sanity check for the algebraic formulas, not a
representation of arbitrary 2-adic numbers and not a Collatz proof.
"""
from fractions import Fraction

def v2_positive(n: int) -> int:
    assert n > 0
    k = 0
    while n % 2 == 0:
        n //= 2
        k += 1
    return k

def v2_nonzero_integer(n: int) -> int:
    assert n != 0
    return v2_positive(abs(n))

def accelerated_value(x: Fraction) -> Fraction:
    z = 3*x + 1
    assert z.denominator % 2 == 1 and z != 0
    # For the test domain, z is an integer.
    assert z.denominator == 1 and z.numerator > 0
    k = v2_positive(z.numerator)
    return z / (2**k)

def test_singularity(k: int, u: int) -> None:
    assert k >= 1 and u % 2 == 1 and u > 0
    x_star = Fraction(-1, 3)
    x = x_star + 2**k * u
    assert x != x_star
    assert v2_positive((3*x + 1).numerator) == k
    assert accelerated_value(x) == 3*u

def test_local_cylinder(k: int, u: int, t: int) -> None:
    assert k >= 1 and u > 0 and u % 2 == 1
    x = Fraction(-1, 3) + 2**k*u
    xp = x + 2**(k+1)*t
    z, zp = 3*x + 1, 3*xp + 1
    assert z.denominator == zp.denominator == 1
    assert v2_positive(z.numerator) == k
    assert v2_positive(zp.numerator) == k
    assert accelerated_value(xp) - accelerated_value(x) == 6*t
    if t:
        # Exact 2-adic norm ratio: |T(x')-T(x)|_2 / |x'-x|_2 = 2^k.
        # Here both differences are integers, so |m|_2 = 2^(-v2(m)).
        out_diff = (accelerated_value(xp)-accelerated_value(x)).numerator
        in_diff = (xp-x).numerator
        assert out_diff == 6*t
        assert in_diff == 2**(k+1)*t
        assert v2_nonzero_integer(in_diff) - v2_nonzero_integer(out_diff) == k

if __name__ == "__main__":
    count = 0
    for k in range(1, 101):
        for u in (1, 3, 5, 7, 9):
            test_singularity(k, u)
            for t in (-3, -1, 0, 1, 2, 5):
                # Restrict to positive 3*x+1 for this rational evaluator.
                if 3*(Fraction(-1,3) + 2**k*u + 2**(k+1)*t) + 1 > 0:
                    test_local_cylinder(k, u, t)
                    count += 1
    print(f"PASS: singularity sequences k=1..100, 5 odd u values; {count} local-cylinder cases")
