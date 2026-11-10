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


def analyze_threshold(B: int) -> list[dict]:
    """Enumerate all positive odd x<B with T(x)>=B."""
    return [
        row
        for x in range(1, B, 2)
        if (row := trace_excursion(B, x)) is not None
    ]


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
    for B in (31, 63, 127, 255, 511, 1023):
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
    )
    for B1, z1, B2, z2 in pairs:
        suffix = common_suffix(
            row_by_z0(B1, z1)["path"],
            row_by_z0(B2, z2)["path"],
        )
        print((B1, z1), (B2, z2), len(suffix), suffix[0], suffix[-1])


if __name__ == "__main__":
    main()
