#!/usr/bin/env python3
"""Exact probability certificate for finite Syracuse valuation-word cylinders.

For k >= 1, a positive valuation word (a_0,...,a_{k-1}) has normalized
Haar measure 2^(-sum(a_i)) among odd 2-adic starts. Summing over words of
length k gives a probability distribution for A=sum(a_i):
    P(A=a) = binom(a-1,k-1) / 2^a, a >= k.
This tool emits exact integer/rational identities only. It does not imply
Archimedean descent or Collatz termination.
"""
from __future__ import annotations
import argparse
import json
import math
from fractions import Fraction


def word_mass(length: int, total: int) -> Fraction:
    if isinstance(length, bool) or not isinstance(length, int) or length < 1:
        raise ValueError("length must be a positive integer")
    if isinstance(total, bool) or not isinstance(total, int) or total < 1:
        raise ValueError("total must be a positive integer")
    if total < length:
        return Fraction(0, 1)
    return Fraction(math.comb(total - 1, length - 1), 1 << total)


def cumulative_mass(length: int, cutoff: int) -> Fraction:
    if isinstance(length, bool) or not isinstance(length, int) or length < 1:
        raise ValueError("length must be a positive integer")
    if isinstance(cutoff, bool) or not isinstance(cutoff, int) or cutoff < 0:
        raise ValueError("cutoff must be a nonnegative integer")
    return sum((word_mass(length, total) for total in range(1, cutoff + 1)),
               Fraction(0, 1))


def tail_mass(length: int, cutoff: int) -> Fraction:
    """Exact P(A > cutoff), with A the sum of length positive geometric digits."""
    if isinstance(length, bool) or not isinstance(length, int) or length < 1:
        raise ValueError("length must be a positive integer")
    if isinstance(cutoff, bool) or not isinstance(cutoff, int) or cutoff < 0:
        raise ValueError("cutoff must be a nonnegative integer")
    if cutoff < length:
        return Fraction(1, 1)
    return Fraction(sum(math.comb(cutoff, j) for j in range(length)),
                    1 << cutoff)


def certificate(length: int, cutoff: int) -> dict:
    cumulative = cumulative_mass(length, cutoff)
    tail = tail_mass(length, cutoff)
    if cumulative + tail != 1:
        raise ArithmeticError("exact cumulative mass plus tail failed to equal one")
    return {
        "status": "exact_valuation_cylinder_mass_certificate",
        "word_length": length,
        "total_valuation_cutoff": cutoff,
        "mass_for_total_A": {
            "formula": "binom(A-1, k-1) / 2^A for A >= k; otherwise 0",
            "interpretation": "sum of normalized Haar masses of all positive words with total A",
        },
        "cumulative_mass_A_le_cutoff": {
            "numerator": cumulative.numerator,
            "denominator": cumulative.denominator,
            "exact": f"{cumulative.numerator}/{cumulative.denominator}",
        },
        "tail_mass_A_gt_cutoff": {
            "numerator": tail.numerator,
            "denominator": tail.denominator,
            "exact": f"{tail.numerator}/{tail.denominator}",
            "formula_when_cutoff_ge_length": (
                "sum(binomial(cutoff,j), j=0..length-1) / 2^cutoff"
            ),
        },
        "mass_identity_verified": True,
        "scope_warning": (
            "This is a 2-adic symbolic-mass identity only. It supplies no bound "
            "on the least positive integer in a cylinder and no global descent theorem."
        ),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--length", type=int, required=True)
    parser.add_argument("--cutoff", type=int, required=True)
    args = parser.parse_args()
    try:
        print(json.dumps(certificate(args.length, args.cutoff), indent=2, sort_keys=True))
    except (ValueError, ArithmeticError) as exc:
        parser.error(str(exc))


if __name__ == "__main__":
    main()
