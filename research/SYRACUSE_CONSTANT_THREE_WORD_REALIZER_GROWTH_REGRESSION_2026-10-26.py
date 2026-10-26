#!/usr/bin/env python3
"""Exact regression for the constant valuation word (3, ..., 3).

This verifies the finite realizer formula using integer arithmetic only.
It does not prove the Collatz conjecture and does not invoke Lean.
"""
from itertools import product


def realizer_word(word: tuple[int, ...]) -> tuple[int, int, int]:
    """Return least residue n, total valuation A, and modulus 2^(A+1)."""
    A = 0
    S = 0
    N = len(word)
    for j, a_j in enumerate(word):
        S += pow(3, N - 1 - j) * (1 << A)
        A += a_j
    modulus = 1 << (A + 1)
    rhs = (1 << A) - S
    n = (rhs * pow(pow(3, N, modulus), -1, modulus)) % modulus
    return n, A, modulus


def check_constant_three(max_n: int = 100) -> int:
    checks = 0
    for N in range(1, max_n + 1):
        n, A, modulus = realizer_word((3,) * N)
        assert A == 3 * N
        assert modulus == 1 << (3 * N + 1)
        assert n == pow(5, -1, modulus)
        assert (5 * n) % modulus == 1
        t = (5 * n - 1) // modulus
        assert 1 <= t <= 4
        assert n == (t * modulus + 1) // 5
        assert n >= (modulus + 1) // 5
        checks += 6
    return checks


def check_all_words(length: int, max_exponent: int) -> int:
    checks = 0
    for word in product(range(1, max_exponent + 1), repeat=length):
        n, A, modulus = realizer_word(word)
        assert 0 < n < modulus
        assert n % 2 == 1
        C = n
        prefix = 0
        for a_j in word:
            C = 3 * C + (1 << prefix)
            prefix += a_j
        assert C % modulus == (1 << A) % modulus
        checks += 3
    return checks


def main() -> None:
    checks = check_constant_three()
    checks += check_all_words(6, 3)
    checks += check_all_words(6, 4)
    print(f"PASS: {checks} exact integer assertions")


if __name__ == "__main__":
    main()
