"""Regression tests for exact Syracuse valuation-word certificates."""
import unittest

try:
    from .syracuse_valuation_word_certificate import certificate
except ImportError:  # Direct execution from research/tools/
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

    def test_exact_identity_and_threshold_on_many_starts(self):
        # Independently recompute the orbit and check
        # 2^A * n_k = 3^k * n_0 + c, and the strict threshold criterion.
        for start in range(1, 1000, 2):
            for length in range(1, 9):
                r = certificate(start, length)
                n = start
                A = 0
                c = 0
                for j in range(length):
                    m = 3 * n + 1
                    a = 0
                    while m % 2 == 0:
                        m //= 2
                        a += 1
                    c = 3 * c + 2**A
                    A += a
                    n = m
                self.assertEqual(2**A * n, 3**length * start + c)
                self.assertEqual(r["valuation_sum_A"], A)
                self.assertEqual(r["recurrence_constant_c"], c)
                self.assertEqual(r["end"], n)
                self.assertTrue(r["identity_agrees"])

    def test_invalid_starts_rejected(self):
        for start in [0, 2, -1, -3]:
            with self.subTest(start=start):
                with self.assertRaises(ValueError):
                    certificate(start, 3)

    def test_invalid_length_rejected(self):
        for length in [0, -1]:
            with self.subTest(length=length):
                with self.assertRaises(ValueError):
                    certificate(3, length)


if __name__ == "__main__":
    unittest.main()
