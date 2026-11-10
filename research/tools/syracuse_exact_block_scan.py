#!/usr/bin/env python3
"""Exact finite Syracuse diagnostics; not a proof of the Collatz conjecture.

For odd n, S(n)=(3*n+1)/2**v2(3*n+1). All arithmetic is integer-exact.
The scan reports counterexamples to a *specified finite-block return target*;
absence of a counterexample below the cutoff is not a universal theorem.
"""
from __future__ import annotations
import argparse
import json


def v2(n: int) -> int:
    if n <= 0:
        raise ValueError("v2 requires a positive integer")
    return (n & -n).bit_length() - 1


def step(n: int) -> tuple[int, int]:
    if n <= 0 or n % 2 == 0:
        raise ValueError("Syracuse step expects a positive odd integer")
    m = 3 * n + 1
    a = v2(m)
    return m >> a, a


def block(n: int, k: int) -> dict:
    start = n
    valuations = []
    for _ in range(k):
        n, a = step(n)
        valuations.append(a)
    return {
        "start": start,
        "length": k,
        "end": n,
        "valuation_word": valuations,
        "valuation_sum": sum(valuations),
        "strict_descent": n < start,
        "ratio_le_half": 2 * n <= start,
    }


def main() -> None:
    p = argparse.ArgumentParser()
    p.add_argument("--cutoff", type=int, default=10000,
                   help="scan odd starts 3..cutoff inclusive")
    p.add_argument("--length", type=int, default=10,
                   help="fixed block length")
    p.add_argument("--ratio-num", type=int, default=1,
                   help="test end/start <= ratio-num/ratio-den")
    p.add_argument("--ratio-den", type=int, default=2)
    p.add_argument("--output", default="-")
    args = p.parse_args()
    if args.cutoff < 3 or args.length < 1:
        p.error("cutoff must be >=3 and length >=1")
    if args.ratio_den <= 0 or args.ratio_num < 0:
        p.error("ratio must be nonnegative with positive denominator")
    failures = []
    checked = 0
    for start in range(3, args.cutoff + 1, 2):
        result = block(start, args.length)
        checked += 1
        if args.ratio_den * result["end"] > args.ratio_num * start:
            failures.append(result)
    report = {
        "status": "finite_scan_only",
        "cutoff": args.cutoff,
        "odd_starts_checked": checked,
        "block_length": args.length,
        "target": f"end/start <= {args.ratio_num}/{args.ratio_den}",
        "failures": failures,
        "warning": "Finite scan does not prove the target for all odd integers."
    }
    encoded = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.output == "-":
        print(encoded, end="")
    else:
        with open(args.output, "w", encoding="utf-8") as f:
            f.write(encoded)


if __name__ == "__main__":
    main()
