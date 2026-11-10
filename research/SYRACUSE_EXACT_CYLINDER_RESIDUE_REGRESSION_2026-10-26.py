#!/usr/bin/env python3
"""Finite exact-valuation cylinder regression test for Syracuse words.

For each tested positive exponent word a=(a_0,...,a_{N-1}), solve the
terminal congruence C_N = 2^{A_N} (mod 2^{A_N+1}) for its unique start
residue modulo 2^{A_N+1}, then test exact prefix valuations on representatives.
This is finite evidence only, not a proof of the general cylinder theorem.
"""
from itertools import product
from math import prod


def valuation2(n: int) -> int:
    assert n > 0
    v = 0
    while n % 2 == 0:
        n //= 2
        v += 1
    return v


def prefix_data(word):
    A = [0]
    C_const = [0]
    for a in word:
        C_const.append(3 * C_const[-1] + 2 ** A[-1])
        A.append(A[-1] + a)
    return A, C_const


def cylinder_residue(word):
    A, C_const = prefix_data(word)
    N, total = len(word), A[-1]
    modulus = 2 ** (total + 1)
    coefficient = pow(3, N, modulus)
    inverse = pow(coefficient, -1, modulus)
    residue = ((2 ** total - C_const[-1]) * inverse) % modulus
    assert (coefficient * residue + C_const[-1] - 2 ** total) % modulus == 0
    return residue, modulus, A


def check_word(word):
    residue, modulus, A = cylinder_residue(word)
    # Check several representatives of the unique residue class.
    for t in range(8):
        n = residue + t * modulus
        if n == 0:
            n += modulus
        state = n
        prefix_exponent = 0
        for a in word:
            value = 3 * state + 1
            assert valuation2(value) == a, (word, n, a, value)
            state = value // (2 ** a)
            prefix_exponent += a
    return modulus


def main():
    checked_words = 0
    largest_modulus = 0
    for length in range(1, 5):
        for word in product(range(1, 5), repeat=length):
            modulus = check_word(word)
            checked_words += 1
            largest_modulus = max(largest_modulus, modulus)
    print(f"PASS: {checked_words} words (length <= 4, exponents 1..4)")
    print("PASS: unique terminal residue and exact prefix valuations")
    print(f"Largest tested modulus: {largest_modulus}")
    print("SCOPE: finite regression test only; theorem and global convergence remain separate")


if __name__ == "__main__":
    main()
