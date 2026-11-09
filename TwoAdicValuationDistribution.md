# Two-adic valuation distribution: next formalization target

## Mathematical statement to formalize

For an odd integer sampled uniformly from the odd residue classes modulo \(2^K\), and for each fixed \(j\) with \(1 \le j < K\), the condition
\[
v_2(3n+1)=j
\]
selects exactly one residue class modulo \(2^{j+1}\) among the odd classes. Consequently, among odd classes modulo \(2^K\), exactly \(2^{K-j-1}\) have valuation exactly \(j\), out of \(2^{K-1}\) odd classes. The proportion is therefore \(2^{-j}\).

The key congruence fact is that multiplication by 3 is invertible modulo every power of 2. Thus
\[
3n+1\equiv 0\pmod{2^j}
\]
has one residue class modulo \(2^j\), and its lift to modulo \(2^{j+1}\) has exactly one of the two possible lifts satisfying non-divisibility by \(2^{j+1}\).

## Lean plan

1. Define the finite type of odd residues modulo \(2^K\) without partial list lookups.
2. Prove uniqueness of the solution to \(3n+1\equiv0\pmod{2^j}\) using invertibility of 3 modulo powers of 2.
3. Count the exact-valuation classes for \(j<K\).
4. Derive the finite truncated distribution and explicitly account for the tail class where \(2^K\mid 3n+1\).
5. Only then state a finite average identity for \(v_2(3n+1)\).

## Scope warning

This is a distribution statement for residue classes / the 2-adic Haar model. It is not a pointwise descent theorem for every natural number and does not prove the Collatz conjecture. An average logarithmic drift cannot be substituted for a proof that every orbit descends.

The global bridge remains: prove that every positive starting value has a finite iterate below itself, then use the existing stopping-time induction lemma. The distribution calculation is a candidate source of quantitative information, not yet that bridge.
