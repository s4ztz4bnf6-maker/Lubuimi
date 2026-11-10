"""Tests for exact finite Syracuse valuation-cylinder certificates."""
import itertools
import unittest

try:
    from .syracuse_valuation_cylinder_certificate import cylinder, realize_word
except ImportError:
    from syracuse_valuation_cylinder_certificate import cylinder, realize_word


def positive_words_with_sum_at_most(bound, max_length=5):
    for length in range(1, max_length + 1):
        for word in itertools.product(range(1, bound + 1), repeat=length):
            if sum(word) <= bound:
                yield list(word)


class SyracuseValuationCylinderTests(unittest.TestCase):
    def test_word_1_4_gives_start_3_mod_64(self):
        result = cylinder([1, 4], lifts=5)
        self.assertEqual(result["valuation_sum_A"], 5)
        self.assertEqual(result["recurrence_constant_c"], 5)
        self.assertEqual(result["residue"], 3)
        self.assertEqual(result["modulus"], 64)
        self.assertTrue(all(x["word_matches"] for x in result["direct_lift_checks"]))

    def test_many_words_realized_by_multiple_lifts(self):
        for word in positive_words_with_sum_at_most(7):
            with self.subTest(word=word):
                result = cylinder(word, lifts=3)
                self.assertEqual(result["modulus"], 2 ** (sum(word) + 1))
                self.assertEqual(result["valuation_word"], word)
                for item in result["direct_lift_checks"]:
                    self.assertTrue(item["word_matches"])
                    self.assertEqual(
                        realize_word(item["start"], len(word))["valuation_word"],
                        word,
                    )

    def test_representative_is_odd_and_residue_is_canonical(self):
        for word in ([1], [2], [1, 1], [2, 3], [1, 4], [3, 1, 2]):
            result = cylinder(list(word))
            self.assertEqual(result["residue"] % 2, 1)
            self.assertGreaterEqual(result["residue"], 0)
            self.assertLess(result["residue"], result["modulus"])

    def test_invalid_words_rejected(self):
        for word in ([], [0], [-1], [True], [1, 2.0], "1,2"):
            with self.subTest(word=word):
                with self.assertRaises(ValueError):
                    cylinder(word)

    def test_invalid_lift_count_rejected(self):
        for lifts in (0, -1, True, 2.5):
            with self.subTest(lifts=lifts):
                with self.assertRaises(ValueError):
                    cylinder([1, 4], lifts=lifts)


if __name__ == "__main__":
    unittest.main()
