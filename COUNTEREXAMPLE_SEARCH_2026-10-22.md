# Counterexample search — Syracuse descent threshold — 2026-10-22

## Classification

The integer (n=165), (k=17) is a counterexample to the *proposed sufficient condition*
`A_k > k log_2(3) ⇒ S^k(n) < n`.
It is **not** a counterexample to the Collatz conjecture.

## Exact trajectory

For accelerated Syracuse (S(n)=(3n+1)/2^{v_2(3n+1)}), starting at 165:

`165 → 31 → 47 → 71 → 107 → 161 → 121 → 91 → 137 → 103 → 155 → 233 → 175 → 263 → 395 → 593 → 445 → 167`

The 17 removed powers of two are:

`[4, 1, 1, 1, 1, 2, 2, 1, 2, 1, 1, 2, 1, 1, 1, 2, 3]`

Their sum is (A_{17}=27), while (17\log_2(3)\approx 26.94436). Hence the proposed exponent threshold holds, but (S^{17}(165)=167>165): there is no descent over this block.

## Exact recurrence identity and the missing term

With (A_i=\sum_{j<i}v_2(3S^j(n)+1)), the recurrence gives

`2^{A_k} S^k(n) = 3^k n + Σ_{i=0}^{k-1} 3^{k-1-i} 2^{A_i}`.

For this example:

- (A_{17}=27)
- (3^{17}\cdot165=21,308,126,895)
- offset sum (Σ=1,106,233,681)
- total (=22,414,360,576=2^{27}\cdot167)
- (2^{27}\cdot165=22,145,925,120)

The offset pushes the total above (2^{27}n). Therefore an exponent-only bound (A_k>k\log_2 3) is insufficient; any valid descent criterion must also control the offset sum.

## Follow-up search

Search should now target explicit finite failures of proposed *sufficient conditions* and local lemmas, separately from a genuine nontrivial cycle or divergent orbit. A finite trajectory that fails to descend is not a counterexample to Collatz. The Lean branch's current compile run must be checked before claiming this calculation is formalized or kernel-verified.
