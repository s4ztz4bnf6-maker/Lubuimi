#!/usr/bin/env python3
"""Exact certificate for a finite Syracuse valuation word; diagnostic, not a proof."""
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


def certificate(start: int, length: int) -> dict:
    if start <= 0 or start % 2 == 0:
        raise ValueError("start must be a positive odd integer")
    if length < 1:
        raise ValueError("length must be positive")
    n = start
    A = 0
    c = 0
    word = []
    for j in range(length):
        # Exact identity before the next transition.
        assert 3**j * start + c == n * 2**A
        nxt, a = step(n)
        word.append(a)
        c = 3 * c + 2**A
        A += a
        n = nxt
        assert 3**(j + 1) * start + c == n * 2**A

    denominator = 2**A - 3**length
    if denominator > 0:
        threshold_floor = c // denominator
        descent_by_identity = start > threshold_floor
        threshold = threshold_floor + 1
    else:
        threshold_floor = None
        threshold = None
        descent_by_identity = False
    return {
        "status": "finite_exact_certificate",
        "start": start,
        "length": length,
        "valuation_word": word,
        "valuation_sum_A": A,
        "recurrence_constant_c": c,
        "end": n,
        "descent_direct": n < start,
        "denominator_2A_minus_3k": denominator,
        "strict_descent_threshold_integer": threshold,
        "descent_from_threshold": descent_by_identity,
        "identity_agrees": (n < start) == descent_by_identity,
        "warning": "This certifies one realized finite orbit segment only; it proves no universal descent theorem."
    }


def main() -> None:
    p = argparse.ArgumentParser()
    p.add_argument("--start", type=int, required=True)
    p.add_argument("--length", type=int, default=10)
    p.add_argument("--output", default="-")
    args = p.parse_args()
    try:
        result = certificate(args.start, args.length)
        if not result["identity_agrees"]:
            raise ArithmeticError("descent criterion disagrees with direct iteration")
        encoded = json.dumps(result, indent=2, sort_keys=True) + "\n"
        if args.output == "-":
            print(encoded, end="")
        else:
            with open(args.output, "w", encoding="utf-8") as f:
                f.write(encoded)
    except (ValueError, ArithmeticError) as exc:
        p.error(str(exc))


if __name__ == "__main__":
    main()
