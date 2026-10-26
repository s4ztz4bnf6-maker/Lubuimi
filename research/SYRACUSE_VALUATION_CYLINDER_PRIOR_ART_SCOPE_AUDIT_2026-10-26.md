# Prior-art and scope audit: exact valuation cylinders

Date: 2026-10-26

## External literature found

1. Mohammad Amir Khusru Akhtar, *Compression Spectra of Collatz Orbits: Sharp Residual Ordering, Exact Valuation Cylinders, and Residue-Threshold Sparsity* (SSRN, posted 20 Aug 2026, revised 27 Aug 2026):
   https://papers.ssrn.com/sol3/papers.cfm?abstract_id=7314419

   The abstract states that each finite accelerated valuation word is tied to one odd residue class modulo \(2^{K+1}\), and develops residual-ordering and sparsity bounds. It explicitly says the results do not prove the Collatz conjecture.

2. Miguel Cerdá Bennassar, *Cylinder collision, bit non-reuse and effective non-degeneracy in the 2-adic Collatz dynamics* (Zenodo, 2026):
   https://zenodo.org/records/18831527

   The abstract describes finite-resolution cylinder structure and an exact factor-of-one-half decrease for restricted survival sets. It explicitly leaves open whether the infinite survival set is empty.

3. Seyma Yaman Kayadibi, *Canonical Shells and Valuation-Cylinder Covers for Delayed First Descent in Accelerated Odd Collatz Dynamics* (SSRN, July 2026):
   https://ssrn.com/abstract=7564459

   The abstract frames the closure of the non-certified cylinder tree as equivalent to universal first descent, explicitly identifying that closure as the unresolved global step.

## Consequence for this project

The finite-word / unique-residue-class principle is not, by itself, a novelty claim. Related results are already present in the literature. Our narrow current contribution is an independently auditable implementation path that connects:

- the affine recurrence \(C_{k+1}=3C_k+2^{A_k}\);
- the terminal congruence modulo \(2^{A_N+1}\);
- backward recovery of exact prefix valuations;
- a finite regression over words and representatives;
- and, as a separate future task, a Lean theorem with explicit assumptions.

The exact regression script in this branch checks 1,364 words (lengths 1–5, each exponent 1–4), with four representatives in each residue class. This is finite evidence only and must not be presented as a proof of any infinite statement.

## Remaining theorem boundary

A proof that each finite word has one residue class does not establish that every infinite compatible 2-adic itinerary is represented by a positive integer. Nor does compactness alone imply eventual descent. The global target remains a uniform argument excluding every positive odd integer from an infinite non-descending trajectory (or an equivalent complete descent certificate).

## Verification caution

This note is a literature/scope audit. It does not assert that the cited preprints have been peer reviewed, nor that our Lean development formalizes their results. Each source should be checked at theorem level before relying on a particular claim.
