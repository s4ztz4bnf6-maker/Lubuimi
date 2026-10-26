"""Independent finite diagnostic for the Syracuse exact-valuation cylinder lemma.

This is a computational regression test, not a proof of the general theorem.
Run with Python 3. It checks every exponent word of lengths 0 through 5 over
{1, 2, 3}, and three representatives of the selected residue class per word.
"""
from itertools import product


def check_word(word: tuple[int, ...]) -> None:
    n_steps = len(word)
    prefix = [0]
    for exponent in word:
        if exponent < 1:
            raise ValueError("the theorem requires positive exponents")
        prefix.append(prefix[-1] + exponent)

    total_exponent = prefix[n_steps]
    modulus = 2 ** (total_exponent + 1)
    affine_offset = sum(
        3 ** (n_steps - 1 - j) * 2 ** prefix[j]
        for j in range(n_steps)
    )
    inverse = pow(3**n_steps, -1, modulus)
    residue = ((2**total_exponent - affine_offset) * inverse) % modulus

    for q in range(3):
        start = residue + q * modulus
        c = [start]
        for k in range(n_steps):
            c.append(3 * c[-1] + 2 ** prefix[k])

        assert c[n_steps] % modulus == 2**total_exponent
        assert c[n_steps] % (2**total_exponent) == 0
        assert c[n_steps] % (2 ** (total_exponent + 1)) != 0

        for k, exponent in enumerate(word):
            scale = 2**prefix[k]
            assert c[k] % scale == 0
            state = c[k] // scale
            next_state = c[k + 1] // 2**prefix[k + 1]
            assert state % 2 == 1
            assert 2**exponent * next_state == 3 * state + 1


def main() -> None:
    words_checked = 0
    for length in range(6):
        for word in product((1, 2, 3), repeat=length):
            check_word(word)
            words_checked += 1
    print(f"PASS: {words_checked} exponent words; lengths 0..5; alphabet {{1,2,3}}")


if __name__ == "__main__":
    main()
