#!/usr/bin/env python3
"""Exact regression for the finite Syracuse valuation-cylinder construction.

This checks finite instances only; it is not a proof of Collatz convergence.
All arithmetic is integer arithmetic, with exact modular inverses.
"""
from itertools import product


def v2(n: int) -> int:
    if n == 0:
        raise ValueError("v2(0) is undefined for this regression")
    n = abs(n)
    return (n & -n).bit_length() - 1


def cylinder_residue(word: tuple[int, ...]) -> tuple[int, int, list[int]]:
    assert word and all(a >= 1 for a in word)
    prefixes = [0]
    for a in word:
        prefixes.append(prefixes[-1] + a)
    N, A = len(word), prefixes[-1]
    modulus = 1 << (A + 1)
    offset = sum(3 ** (N - 1 - j) * (1 << prefixes[j]) for j in range(N))
    rhs = ((1 << A) - offset) % modulus
    residue = (rhs * pow(3 ** N, -1, modulus)) % modulus
    return residue, modulus, prefixes


def check_word(word: tuple[int, ...]) -> int:
    residue, modulus, prefixes = cylinder_residue(word)
    N = len(word)
    # The affine terminal congruence determines exactly one class modulo 2^(A_N+1).
    A = prefixes[-1]
    assert (3**N * residue +
            sum(3 ** (N - 1 - j) * (1 << prefixes[j]) for j in range(N))
            - (1 << A)) % modulus == 0
    assert residue % 2 == 1

    # Each representative of this class preserves every exact prefix valuation.
    # Check several nonnegative representatives, not just the least residue.
    for t in range(4):
        n0 = residue + t * modulus
        C = n0
        assert v2(C) == prefixes[0]
        for k, a in enumerate(word):
            C = 3 * C + (1 << prefixes[k])
            assert v2(C) == prefixes[k + 1], (word, t, k, C, prefixes)
    return 1


def main() -> None:
    checked = 0
    for length in range(1, 6):
        for word in product(range(1, 5), repeat=length):
            checked += check_word(word)
    print(f"PASS: {checked} exponent words; lengths 1..5; exponents 1..4; "
          "4 representatives per exact cylinder.")
    print("Scope: finite exact-arithmetic regression only; no global Collatz claim.")


if __name__ == "__main__":
    main()
