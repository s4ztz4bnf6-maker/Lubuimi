#!/usr/bin/env python3
"""Exact witness generator for the finite-window valuation-barrier no-go.

For any requested length L and cutoff H, construct an actual odd Syracuse
orbit segment with every source valuation exactly 2 and every source state
larger than H. Integer arithmetic only; this is a finite segment, not a
divergent orbit or a Collatz counterexample.
"""

from __future__ import annotations
import argparse


def v2(n: int) -> int:
    assert n > 0
    a = 0
    while n % 2 == 0:
        n //= 2
        a += 1
    return a


def witness(length: int, cutoff: int) -> list[int]:
    if length < 1 or cutoff < 0:
        raise ValueError("length must be >= 1 and cutoff must be >= 0")
    # Each source state is 1 + m * 3^j * 2^(2(length-j)+1).
    # Choosing m > cutoff suffices because the smallest coefficient among
    # j=0,...,length-1 is at least 8.
    m = cutoff + 1
    states = [
        1 + m * (3**j) * (2 ** (2 * (length - j) + 1))
        for j in range(length + 1)
    ]
    for j in range(length):
        x, y = states[j], states[j + 1]
        assert x % 2 == 1
        assert v2(3 * x + 1) == 2
        assert (3 * x + 1) // 4 == y
        assert x > cutoff
    return states


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--length", type=int, default=32)
    parser.add_argument("--cutoff", type=int, default=10**6)
    args = parser.parse_args()
    states = witness(args.length, args.cutoff)
    print(f"length={args.length}, cutoff={args.cutoff}")
    print(f"all source states > cutoff: {all(x > args.cutoff for x in states[:-1])}")
    print(f"valuation sequence: {[v2(3*x+1) for x in states[:-1]]}")
    print(f"first state: {states[0]}")
    print(f"last source state: {states[-2]}")
    print("exact checks passed; this is a finite orbit segment only")


if __name__ == "__main__":
    main()
