# Syracuse residual-threshold work: source triage and proof-gap audit

Date: 2026-10-26

## External lead
A search surfaced a recent SSRN preprint, Mohammad Amir Khusru Akhtar, “Compression Spectra of Collatz Orbits: Sharp Residual Ordering, Exact Valuation Cylinders, and Residue-Threshold Sparsity” (posted 20 August 2026, revised 27 August 2026). Its abstract claims exact finite-word affine residual formulas, extremal ordering results, and exponential sparsity of words with non-descent witnesses when total valuation per length exceeds log_2(3). It explicitly says this does not prove Collatz.

This is an abstract-level triage only. The full derivations have not been independently checked here; the result is not treated as established merely because it appears in a repository.

## The mathematical interface worth extracting
For a word a=(a_1,...,a_m), let K=sum a_i and write the exact affine iterate as

2^K T^m(n) = 3^m n + C(a),

where C(a) is the positive integer residual determined by the ordered word. Then

T^m(n) < n  iff  (3^m-2^K)n + C(a) < 0.

If 2^K > 3^m, this becomes the exact threshold

n > C(a)/(2^K-3^m).

Thus the residual is not a cosmetic correction: it determines which members of the word's unique residue class actually descend at that block length. Ordering can change C(a) even when m and K are fixed.

## What a sparsity theorem can and cannot do
An exponential bound on the fraction of bad words in a finite word space can be useful for density estimates and for prioritizing searches. It does not by itself rule out a single exceptional positive integer whose infinite valuation itinerary lies in a sparse set. To obtain a pointwise theorem, one needs a deterministic mechanism that prevents every integer orbit from following bad prefixes indefinitely, or a proved bound on the nested residue classes compatible with a positive integer start.

## New proof obligation
The next useful interface is an exact *nested-prefix threshold theorem*: given compatible valuation prefixes a^(j), derive the least positive odd representative r_j modulo 2^(K_j+1) and prove a necessary-and-sufficient condition for a fixed positive integer n to realize every prefix. Then determine whether an infinite sequence of thresholds forces r_j to stabilize, diverge, or leave the positive integers. The stabilization/realizability implication must be proved, not inferred from empirical growth.

## Falsification checklist
- For fixed (m,K), enumerate word orderings and verify the claimed extremal residuals by exact integer arithmetic.
- Check all boundary cases where 2^K <= 3^m separately; the descent threshold above only applies when the denominator is positive.
- Distinguish “there exists a non-descent witness in the residue class” from “the least positive representative is a witness.”
- Test any claimed exponential word-count bound against exact small parameters, but do not use those tests as proof of the asymptotic bound.
- Trace every density claim to its exact probability space and conditioning; do not transfer a word-space probability to orbit frequency without a theorem.

## Status
This is a research triage and a derived exact inequality, not an independent verification of the preprint and not a proof or disproof of the Collatz conjecture.