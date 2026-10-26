#!/usr/bin/env python3
"""Exact regression for the constant valuation word a_k = 3 in accelerated Syracuse.

Uses Python integers only. This is finite arithmetic evidence, not a Collatz proof
and not Lean/kernel verification.
"""
def check_constant_three(N: int) -> tuple[int, int]:
    assert N >= 1
    modulus = 1 << (3 * N + 1)
    n = pow(5, -1, modulus)
    assert 1 <= n < modulus
    assert (5 * n - 1) % modulus == 0
    assert n >= (modulus + 1) // 5

    x = n
    for _ in range(N):
        numerator = 3 * x + 1
        # Exact valuation v_2(numerator) = 3.
        assert numerator % 8 == 0
        assert (numerator // 8) % 2 == 1
        x = numerator // 8
    return n, x

if __name__ == "__main__":
    for length in range(1, 201):
        check_constant_three(length)
    print("PASS: N=1..200; inverse congruence, lower bound, and exact valuation 3")
