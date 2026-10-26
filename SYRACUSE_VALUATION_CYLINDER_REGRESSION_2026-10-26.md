# Syracuse valuation-cylinder finite regression check

Date: 2026-10-26
Status: finite computational check only; not a proof and not Lean-compiled.

## Test performed

For each word length N = 1,…,4, every word with entries in {1,2,3,4} and total valuation A_N ≤ 9 was tested. For each word, all odd residues modulo 2^(A_N+1) were enumerated and iterated under the accelerated Syracuse map. The check asks whether exactly one residue class has the specified exact valuation prefix.

Result: 180 words checked; zero failures. The tested words include mixed valuation patterns, not just all-ones prefixes.

The script logic is:
- compute the 2-adic valuation of 3n+1 by repeated division by 2;
- iterate the accelerated map N times, recording each exact valuation;
- enumerate odd representatives 1,3,…,2^(A_N+1)−1;
- count representatives whose prefix equals the prescribed word.

## Interpretation

This is a useful regression test for the exact-cylinder lemma and catches indexing/modulus mistakes on a finite range. It is not a formal proof, does not cover all words, and does not imply universal Collatz descent. The mathematical induction remains the proof obligation for Lean.

## Follow-up

Formalize the cylinder predicate and prove the lift step for arbitrary j and a_j. Use the finite test as a test oracle only, not as evidence for the universal theorem.
