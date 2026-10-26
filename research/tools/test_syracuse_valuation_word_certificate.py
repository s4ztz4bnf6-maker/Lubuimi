"""Regression tests for exact Syracuse valuation-word certificates."""
import unittest
from syracuse_valuation_word_certificate import certificate


class SyracuseValuationCertificateTests(unittest.TestCase):
    def test_short_orbit_matches_known_segment(self):
        # 3 -> 5 -> 1, with exact valuations 1, 4.
        r = certificate(3, 2)
        self.assertEqual(r["valuation_word"], [1, 4])
        self.assertEqual(r["end"], 1)
        self.assertTrue(r["descent_direct"])
        self.assertTrue(r["identity_agrees"])

    def test_non_descent_segment_is_not_misclassified(self):
        # 27 -> 41 -> 31 -> 47 -> 71 -> 107
        r = certificate(27, 5)
        self.assertEqual(r["end"], 107)
        self.assertFalse(r["descent_direct"])
        self.assertTrue(r["identity_agrees"])

    def test_invalid_starts_rejected(self):
        with self.assertRaises(ValueError):
            certificate(2, 3)
        with self.assertRaises(ValueError):
            certificate(0, 3)

    def test_invalid_length_rejected(self):
        with self.assertRaises(ValueError):
            certificate(3, 0)


if __name__ == "__main__":
    unittest.main()
