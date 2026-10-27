#!/usr/bin/env python3
"""Exact finite falsification scan for short-block Syracuse frequency claims.

This is an experiment, not a proof of Collatz. All orbit arithmetic is integer-only.
It searches odd starts <= max_start, follows the accelerated odd Syracuse map
S(x)=(3x+1)/2^v2(3x+1), and records windows whose source states all exceed H.
The flag is 1 exactly when v2(3x+1)=1.
"""
from collections import deque
from math import log2

MAX_START = 200_000
MAX_STEPS = 1_500
BARRIERS = (10, 100, 1_000, 10_000)
LENGTHS = (8, 16, 32, 64, 128)


def step(x: int) -> tuple[int, int]:
    z = 3 * x + 1
    valuation = 0
    while z % 2 == 0:
        z //= 2
        valuation += 1
    return z, valuation


def main() -> None:
    best = {(h, length): (1.0, None)
            for h in BARRIERS for length in LENGTHS}

    for start in range(3, MAX_START + 1, 2):
        x = start
        states: list[int] = []
        flags: list[int] = []
        for _ in range(MAX_STEPS):
            y, valuation = step(x)
            states.append(x)
            flags.append(int(valuation == 1))
            x = y
            if x == 1:
                break

        prefix = [0]
        for flag in flags:
            prefix.append(prefix[-1] + flag)

        # Sliding minimum for each barrier/window length; exact integer states.
        for h in BARRIERS:
            for length in LENGTHS:
                if len(states) < length:
                    continue
                q: deque[int] = deque()
                for i, value in enumerate(states):
                    while q and states[q[-1]] >= value:
                        q.pop()
                    q.append(i)
                    while q and q[0] <= i - length:
                        q.popleft()
                    if i < length - 1:
                        continue
                    j = i - length + 1
                    if states[q[0]] <= h:
                        continue
                    count = prefix[i + 1] - prefix[j]
                    frequency = count / length
                    if frequency < best[(h, length)][0]:
                        best[(h, length)] = (
                            frequency,
                            (start, j, length, states[q[0]], max(states[j:i + 1]),
                             count),
                        )

    print(f"necessary asymptotic threshold log2(4/3) = {log2(4/3):.12f}")
    print(f"finite search: odd starts <= {MAX_START}, <= {MAX_STEPS} steps/start")
    for h in BARRIERS:
        for length in LENGTHS:
            frequency, witness = best[(h, length)]
            print(f"H={h:5d}, L={length:3d}, min_frequency={frequency:.6f}, "
                  f"witness={witness}")

    print("\nInterpretation: a witness with frequency 0 shows that this finite "
          "window has no valuation-one step despite every source state > H. "
          "It does not refute an asymptotic lower-frequency theorem and cannot "
          "establish or refute Collatz convergence.")


if __name__ == "__main__":
    main()
