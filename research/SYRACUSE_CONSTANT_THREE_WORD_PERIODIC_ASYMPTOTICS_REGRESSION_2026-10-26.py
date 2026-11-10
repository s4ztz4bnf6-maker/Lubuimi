#!/usr/bin/env python3
"""Exact integer regression for the four-phase least realizer formula."""
def check(limit: int = 10000) -> int:
    expected_t = (2, 4, 3, 1)  # indexed by N mod 4
    checks = 0
    for N in range(1, limit + 1):
        M = 1 << (3 * N + 1)
        n = pow(5, -1, M)
        t = (5 * n - 1) // M
        assert (5 * n) % M == 1
        assert n == (t * M + 1) // 5
        assert t == expected_t[N % 4]
        assert 0 < n < M and n % 2 == 1
        # Exact normalized identity, represented without floating point.
        assert 5 * n == t * M + 1
        checks += 6
    return checks

if __name__ == "__main__":
    print(f"PASS: {check():,} exact integer assertions")
