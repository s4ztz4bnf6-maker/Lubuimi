#!/usr/bin/env python3
"""Finite sanity checker for Syracuse valuation cylinders.

This checks small cases only. It is not a proof of the general cylinder lemma.
For every k <= max_k and k <= A <= max_A, each positive composition
(a_1,...,a_k) of A should occur for exactly one odd residue modulo 2^(A+1).
"""
from __future__ import annotations

import argparse
from collections import defaultdict


def v2(n: int) -> int:
    if n <= 0:
        raise ValueError("v2 is defined here only for positive integers")
    result = 0
    while n % 2 == 0:
        n //= 2
        result += 1
    return result


def valuation_word(n: int, k: int) -> tuple[int, ...]:
    word = []
    for _ in range(k):
        a = v2(3 * n + 1)
        word.append(a)
        n = (3 * n + 1) // (1 << a)
    return tuple(word)


def compositions(total: int, parts: int):
    if parts == 1:
        if total >= 1:
            yield (total,)
        return
    for first in range(1, total - parts + 2):
        for rest in compositions(total - first, parts - 1):
            yield (first,) + rest


def check(max_k: int, max_A: int) -> None:
    checked = 0
    for k in range(1, max_k + 1):
        for A in range(k, max_A + 1):
            modulus = 1 << (A + 1)
            observed: dict[tuple[int, ...], list[int]] = defaultdict(list)
            for n in range(1, modulus, 2):
                word = valuation_word(n, k)
                if sum(word) == A:
                    observed[word].append(n)
            for word in compositions(A, k):
                residues = observed.get(word, [])
                if len(residues) != 1:
                    raise AssertionError(
                        f"cylinder mismatch: k={k}, A={A}, word={word}, "
                        f"expected one residue, got {residues}"
                    )
                checked += 1
            # Number of compositions of A into k positive parts is C(A-1,k-1).
            expected = 1
            for j in range(1, k):
                expected = expected * (A - j) // j
            actual = sum(1 for _ in compositions(A, k))
            if actual != expected:
                raise AssertionError(
                    f"composition count mismatch: k={k}, A={A}, "
                    f"actual={actual}, expected={expected}"
                )
    print(
        f"PASS: {checked} valuation words checked for "
        f"1 <= k <= {max_k}, k <= A <= {max_A}; "
        "each matched exactly one odd residue modulo 2^(A+1)."
    )
    print("Scope: finite regression check only; not a proof for arbitrary k or A.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--max-k", type=int, default=4)
    parser.add_argument("--max-A", type=int, default=9)
    args = parser.parse_args()
    if args.max_k < 1 or args.max_A < args.max_k:
        parser.error("require max-k >= 1 and max-A >= max-k")
    check(args.max_k, args.max_A)
