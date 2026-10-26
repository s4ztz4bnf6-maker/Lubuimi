#!/usr/bin/env python3
"""Exact 2-adic cylinder certificate for a prescribed Syracuse valuation word.

For a positive odd start n, S(n)=(3n+1)/2^v2(3n+1). A positive word
(a_0,...,a_{k-1}) determines one residue class modulo 2^(sum(a_i)+1)
whose starts realize exactly that word. This script computes and checks
that class using integer arithmetic only. It is a finite-word theorem/tool,
not a proof of global Collatz termination.
"""
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


def realize_word(start: int, length: int) -> dict:
    n = start
    word = []
    for _ in range(length):
        n, a = step(n)
        word.append(a)
    return {"end": n, "valuation_word": word}


def cylinder(word: list[int], lifts: int = 4) -> dict:
    if not isinstance(word, list) or not word:
        raise ValueError("word must be a nonempty list of positive integers")
    if any(isinstance(a, bool) or not isinstance(a, int) or a < 1 for a in word):
        raise ValueError("every valuation in word must be a positive integer")
    if isinstance(lifts, bool) or not isinstance(lifts, int) or lifts < 1:
        raise ValueError("lifts must be a positive integer")

    total = 0
    c = 0
    for a in word:
        c = 3 * c + (1 << total)
        total += a

    modulus = 1 << (total + 1)
    # From 2^A n_k = 3^k n_0 + c and odd n_k:
    # 3^k n_0 + c == 2^A (mod 2^(A+1)).
    residue = ((1 << total) - c) * pow(pow(3, len(word), modulus), -1, modulus)
    residue %= modulus
    if residue % 2 == 0:
        raise ArithmeticError("derived cylinder representative is not odd")

    checks = []
    for j in range(lifts):
        start = residue + j * modulus
        realized = realize_word(start, len(word))
        checks.append({
            "start": start,
            "word_matches": realized["valuation_word"] == word,
            "end": realized["end"],
        })
        if not checks[-1]["word_matches"]:
            raise ArithmeticError("computed residue class failed direct realization check")

    return {
        "status": "exact_finite_valuation_cylinder",
        "valuation_word": word,
        "length": len(word),
        "valuation_sum_A": total,
        "recurrence_constant_c": c,
        "residue": residue,
        "modulus": modulus,
        "all_starts_in_class": f"n = {residue} (mod {modulus})",
        "identity": f"2^{total} * n_k = 3^{len(word)} * n_0 + {c}",
        "direct_lift_checks": checks,
        "proof_idea": (
            "The affine identity gives a unique residue modulo 2^(A+1) "
            "with odd final iterate. Since every a_i is positive, backward "
            "divisibility forces all intermediate iterates to be odd and "
            "each prescribed valuation to be exact. Adding a multiple of "
            "2^(A+1) preserves every valuation in the finite word."
        ),
        "warning": "This certifies one finite valuation cylinder; it does not prove global descent or termination.",
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--word", required=True,
                        help="comma-separated positive valuations, e.g. 1,4")
    parser.add_argument("--lifts", type=int, default=4)
    parser.add_argument("--output", default="-")
    args = parser.parse_args()
    try:
        word = [int(part.strip()) for part in args.word.split(",")]
        result = cylinder(word, args.lifts)
        encoded = json.dumps(result, indent=2, sort_keys=True) + "\n"
        if args.output == "-":
            print(encoded, end="")
        else:
            with open(args.output, "w", encoding="utf-8") as f:
                f.write(encoded)
    except (ValueError, ArithmeticError) as exc:
        parser.error(str(exc))


if __name__ == "__main__":
    main()
