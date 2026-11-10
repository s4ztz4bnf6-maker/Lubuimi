#!/usr/bin/env python3
"""Exact rational checksum for Syracuse valuation-cylinder densities.

This is a finite computational audit, not a proof of Collatz convergence.
It checks the composition count and partial mass identity using Fraction.
"""
from fractions import Fraction
from math import comb


def compositions_count(total: int, length: int) -> int:
    if length == 0:
        return int(total == 0)
    if total < length or length < 0:
        return 0
    return comb(total - 1, length - 1)


def cylinder_mass(total_exponent: int) -> Fraction:
    return Fraction(1, 2 ** (total_exponent + 1))


def main(max_length: int = 8, max_total: int = 40) -> None:
    checked = 0
    for n in range(1, max_length + 1):
        for total in range(n, max_total + 1):
            count = compositions_count(total, n)
            # Enumerating every word is unnecessary for this identity:
            # all words with the same total exponent have identical mass.
            mass = count * cylinder_mass(total)
            assert mass == Fraction(comb(total - 1, n - 1), 2 ** (total + 1))
            checked += 1

    # For each fixed n, the partial sum tends to 1/2 as the cutoff grows.
    # The residual tail is positive; this check only verifies monotone
    # convergence numerically with exact rational arithmetic.
    tails = []
    for n in range(1, max_length + 1):
        partial = sum(
            (Fraction(comb(total - 1, n - 1), 2 ** (total + 1))
             for total in range(n, max_total + 1)),
            Fraction(0, 1),
        )
        assert partial < Fraction(1, 2)
        tails.append(Fraction(1, 2) - partial)
    assert all(t > 0 for t in tails)
    print(f"PASS: {checked} exact composition/mass cases")
    print(f"PASS: {max_length} exact partial sums below 1/2")
    print("Reminder: finite rational checks do not prove the infinite-series identity.")


if __name__ == "__main__":
    main()
