"""Exact finite threshold-return analysis for the accelerated odd Syracuse map.

No third-party dependencies. This script is a reproducibility artifact, not a proof
of any statement about all starting values or all thresholds.
"""

from __future__ import annotations


def v2(n: int) -> int:
    if n <= 0:
        raise ValueError("v2 is defined here only for positive integers")
    return (n & -n).bit_length() - 1


def T(n: int) -> int:
    """Accelerated odd Syracuse map."""
    if n <= 0 or n % 2 == 0:
        raise ValueError("T expects a positive odd integer")
    q = 3 * n + 1
    return q >> v2(q)


def valuation_word(n: int, steps: int) -> tuple[list[int], int]:
    """Return the exact accelerated valuation word and endpoint."""
    if n <= 0 or n % 2 == 0 or steps < 0:
        raise ValueError("expected a positive odd start and nonnegative step count")
    word = []
    for _ in range(steps):
        q = 3 * n + 1
        a = v2(q)
        word.append(a)
        n = q >> a
    return word, n


def offset_margin_certificate(n0: int, word: list[int]) -> dict:
    """Compute the exact affine offset, cylinder residue, and local margin caps."""
    A = 0
    C = 0
    caps = []
    for j, a in enumerate(word):
        D = 2**A - C - 3**j
        lhs = 2 ** (A + a) + 3 * D
        rhs = 4 * 2**A
        caps.append({
            "j": j, "A": A, "a": a, "C": C, "D": D,
            "cap_lhs": lhs, "cap_rhs": rhs, "cap_holds": lhs <= rhs,
        })
        C = 3 * C + 2**A
        A += a
    k = len(word)
    numerator = 3**k * n0 + C
    if numerator % (2**A):
        raise ArithmeticError("word does not divide the affine numerator")
    endpoint = numerator // (2**A)
    modulus = 2 ** (A + 1)
    residue = ((2**A - C) * pow(3**k, -1, modulus)) % modulus
    return {
        "k": k, "A": A, "C": C, "endpoint": endpoint,
        "modulus": modulus, "residue": residue, "caps": caps,
        "offset_lhs": 2**A * endpoint, "offset_rhs": 3**k * n0 + C,
    }


def trace_excursion(B: int, x: int) -> dict | None:
    """Trace x -> z0=T(x), stopping at the first later iterate below B.

    The edge x -> z0 is excluded from m. H includes z0 and the first return.
    """
    if B <= 0 or B % 2 == 0:
        raise ValueError("B must be a positive odd threshold")
    if x <= 0 or x >= B or x % 2 == 0:
        raise ValueError("x must be positive odd and below B")

    z0 = T(x)
    if z0 < B:
        return None

    path = [z0]
    H = z0
    z = z0
    m = 0
    while True:
        z = T(z)
        m += 1
        path.append(z)
        H = max(H, z)
        if z < B:
            return {
                "B": B,
                "x": x,
                "z0": z0,
                "m": m,
                "H": H,
                "R": z,
                "path": path,
            }


def escape_source_characterization(B: int) -> list[int]:
    """Exact source-set criterion: x=3 mod 4 and 2B<=3x+1."""
    if B <= 0 or B % 2 == 0:
        raise ValueError("B must be a positive odd threshold")
    return [x for x in range(3, B, 4) if 2 * B <= 3 * x + 1]


def power_two_threshold_source_count(k: int) -> int:
    """Exact count |E_(2^k-1)| = floor(2^k/12), for k>=2."""
    if k < 2:
        raise ValueError("k must be at least 2")
    B = 2**k - 1
    return (B + 1) // 12


def analyze_threshold(B: int) -> list[dict]:
    """Enumerate all positive odd x<B with T(x)>=B via the exact source criterion."""
    rows = []
    for x in escape_source_characterization(B):
        row = trace_excursion(B, x)
        if row is None:
            raise AssertionError("source characterization produced a non-escape")
        rows.append(row)
    return rows


def common_suffix(path_a: list[int], path_b: list[int]) -> list[int]:
    """Return the longest common terminal suffix of two finite paths."""
    i = len(path_a) - 1
    j = len(path_b) - 1
    length = 0
    while i >= 0 and j >= 0 and path_a[i] == path_b[j]:
        i -= 1
        j -= 1
        length += 1
    return path_a[len(path_a) - length :] if length else []


def row_by_z0(B: int, z0: int) -> dict:
    for row in analyze_threshold(B):
        if row["z0"] == z0:
            return row
    raise KeyError((B, z0))


def main() -> None:
    for B in (31, 63, 127, 255, 511, 1023, 2047):
        print(f"B={B}")
        for row in analyze_threshold(B):
            print(row["x"], row["z0"], row["m"], row["H"], row["R"])

    print("Cross-threshold common suffix lengths:")
    pairs = (
        (63, 71, 127, 155),
        (127, 155, 127, 167),
        (127, 167, 255, 377),
        (255, 335, 255, 377),
        (255, 359, 255, 377),
        (255, 263, 255, 311),
        (511, 671, 1023, 1151),
        (511, 623, 1023, 1403),
        (1023, 1055, 2047, 2375),
        (1023, 1055, 2047, 2111),
    )
    for B1, z1, B2, z2 in pairs:
        suffix = common_suffix(
            row_by_z0(B1, z1)["path"],
            row_by_z0(B2, z2)["path"],
        )
        print((B1, z1), (B2, z2), len(suffix), suffix[0], suffix[-1])


if __name__ == "__main__":
    main()
