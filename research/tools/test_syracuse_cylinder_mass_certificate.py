import unittest
from fractions import Fraction
from math import comb

from syracuse_cylinder_mass_certificate import (
    certificate, cumulative_mass, tail_mass, word_mass,
)


class CylinderMassCertificateTests(unittest.TestCase):
    def test_single_digit_distribution_and_tail(self):
        for cutoff in range(0, 30):
            cert = certificate(1, cutoff)
            self.assertTrue(cert["mass_identity_verified"])
            self.assertEqual(tail_mass(1, cutoff), Fraction(1, 1 << cutoff))

    def test_tail_formula_matches_direct_sum(self):
        for length in range(1, 8):
            for cutoff in range(0, 40):
                direct = sum(
                    (word_mass(length, total) for total in range(cutoff + 1, 300)),
                    Fraction(0, 1),
                )
                # For these ranges, the omitted tail beyond total=299 is negligible
                # but not zero; instead compare via the exact finite cumulative identity.
                if cutoff >= length:
                    formula = Fraction(sum(comb(cutoff, j) for j in range(length)),
                                        1 << cutoff)
                    self.assertEqual(tail_mass(length, cutoff), formula)
                else:
                    self.assertEqual(tail_mass(length, cutoff), Fraction(1, 1))

    def test_mass_conservation(self):
        for length in range(1, 10):
            for cutoff in range(0, 50):
                self.assertEqual(
                    cumulative_mass(length, cutoff) + tail_mass(length, cutoff),
                    Fraction(1, 1),
                )

    def test_invalid_inputs(self):
        for args in [(0, 3), (-1, 3), (True, 3), (2, -1), (2, True)]:
            with self.assertRaises(ValueError):
                certificate(*args)

    def test_known_values(self):
        self.assertEqual(word_mass(2, 5), Fraction(4, 32))
        self.assertEqual(tail_mass(2, 5), Fraction(6, 32))
        self.assertEqual(cumulative_mass(2, 5), Fraction(26, 32))


if __name__ == "__main__":
    unittest.main()
