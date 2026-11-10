import unittest
import csv
from pathlib import Path

from threshold_return import (T, analyze_threshold, common_suffix, row_by_z0,
                               escape_source_characterization,
                               power_two_threshold_source_count,
                               valuation_word, offset_margin_certificate)


EXPECTED = {
    31: [
        (23, 35, 2, 53, 5),
        (27, 41, 36, 3077, 23),
    ],
    63: [
        (43, 65, 1, 65, 49),
        (47, 71, 32, 3077, 61),
        (51, 77, 1, 77, 29),
        (55, 83, 2, 125, 47),
        (59, 89, 3, 101, 19),
    ],
    127: [
        (87, 131, 2, 197, 37),
        (91, 137, 1, 137, 103),
        (95, 143, 4, 485, 91),
        (99, 149, 1, 149, 7),
        (103, 155, 25, 3077, 61),
        (107, 161, 1, 161, 121),
        (111, 167, 18, 3077, 61),
        (115, 173, 1, 173, 65),
        (119, 179, 2, 269, 101),
        (123, 185, 4, 209, 59),
    ],
    255: [
        (171, 257, 1, 257, 193),
        (175, 263, 4, 593, 167),
        (179, 269, 1, 269, 101),
        (183, 275, 2, 413, 155),
        (187, 281, 1, 281, 211),
        (191, 287, 6, 1457, 205),
        (195, 293, 1, 293, 55),
        (199, 299, 3, 449, 253),
        (203, 305, 1, 305, 229),
        (207, 311, 7, 701, 167),
        (211, 317, 1, 317, 119),
        (215, 323, 2, 485, 91),
        (219, 329, 1, 329, 247),
        (223, 335, 18, 3077, 61),
        (227, 341, 1, 341, 1),
        (231, 347, 6, 881, 31),
        (235, 353, 2, 353, 199),
        (239, 359, 11, 3077, 61),
        (243, 365, 1, 365, 137),
        (247, 371, 2, 557, 209),
        (251, 377, 16, 3077, 61),
    ],
}


class ThresholdReturnTests(unittest.TestCase):
    def test_exact_escape_source_characterization(self):
        for B in (31, 63, 127, 255, 511, 1023):
            brute_force = [x for x in range(1, B, 2) if T(x) >= B]
            self.assertEqual(escape_source_characterization(B), brute_force)
            self.assertEqual([r["x"] for r in analyze_threshold(B)], brute_force)

    def test_power_two_threshold_source_count(self):
        for k in range(2, 11):
            B = 2**k - 1
            self.assertEqual(
                len(escape_source_characterization(B)),
                power_two_threshold_source_count(k),
            )

    def test_exact_tables(self):
        for B, expected in EXPECTED.items():
            actual = [
                (r["x"], r["z0"], r["m"], r["H"], r["R"])
                for r in analyze_threshold(B)
            ]
            self.assertEqual(actual, expected)

    def test_common_suffixes(self):
        pairs = [
            (63, 71, 127, 155, 26, 155, 61),
            (127, 155, 127, 167, 19, 167, 61),
            (127, 167, 255, 377, 17, 377, 61),
            (255, 335, 255, 377, 15, 425, 61),
            (255, 359, 255, 377, 8, 911, 61),
            (255, 263, 255, 311, 5, 263, 167),
            (511, 671, 1023, 1151, 10, 1151, 173),
            (511, 623, 1023, 1403, 7, 1403, 125),
        ]
        for B1, z1, B2, z2, length, first, last in pairs:
            suffix = common_suffix(
                row_by_z0(B1, z1)["path"],
                row_by_z0(B2, z2)["path"],
            )
            self.assertEqual(len(suffix), length)
            self.assertEqual(suffix[0], first)
            self.assertEqual(suffix[-1], last)

    def test_extended_csv_tables(self):
        for B in (511, 1023):
            path = Path(__file__).with_name(f"threshold_{B}.csv")
            with path.open(newline="", encoding="utf-8") as handle:
                expected = [
                    (int(row["x"]), int(row["z0"]), int(row["m"]),
                     int(row["H"]), int(row["R"]))
                    for row in csv.DictReader(handle)
                ]
            actual = [
                (r["x"], r["z0"], r["m"], r["H"], r["R"])
                for r in analyze_threshold(B)
            ]
            self.assertEqual(actual, expected)

    def test_b1023_1097_cylinder_and_margin_certificate(self):
        word, endpoint = valuation_word(731, 2)
        self.assertEqual(word, [1, 2])
        self.assertEqual(endpoint, 823)
        cert = offset_margin_certificate(731, word)
        self.assertEqual((cert["A"], cert["C"], cert["k"]), (3, 5, 2))
        self.assertEqual((cert["modulus"], cert["residue"]), (16, 11))
        self.assertEqual(731 % cert["modulus"], cert["residue"])
        self.assertEqual(cert["offset_lhs"], cert["offset_rhs"])
        self.assertEqual(cert["offset_lhs"], 6584)
        self.assertEqual(
            [(c["D"], c["cap_lhs"], c["cap_rhs"], c["cap_holds"])
             for c in cert["caps"]],
            [(0, 2, 4, True), (-2, 2, 8, True)],
        )

    def test_direct_return_to_one(self):
        row = row_by_z0(255, 341)
        self.assertEqual((row["m"], row["R"]), (1, 1))


if __name__ == "__main__":
    unittest.main()
