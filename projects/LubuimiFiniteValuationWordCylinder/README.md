# Lubuimi's Finite Valuation-Word Cylinder Partition Theorem

**Author:** Ta-Yoshua Lubuimi · **Date:** 10 November 2026

A standalone companion project on the exact 2-adic residue-cylinder structure of every finite exact valuation word in the accelerated odd Syracuse map.

For a finite word \(\alpha=(a_0,\ldots,a_{k-1})\), with every \(a_i\ge1\), and total exponent \(A=\sum_i a_i\), the set of positive odd starts realizing exactly this word is one unique odd residue class modulo \(2^{A+1}\). Its relative natural density among odd starts is \(2^{-A}\).

The initial all-one cylinder theorem is the special case \(\alpha=(1,\ldots,1)\). The finite cutoff refinement adds the exact tail cylinder \(a_k\ge B+1\), giving a finite, disjoint, exhaustive partition with relative masses \(2^{-1},\ldots,2^{-B},2^{-B}\).

## Companion incidence project

The terminal-residue second-moment theorem built on these cylinders is maintained as a separate project with its own manuscript and written review: [PR #38](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/38). It is not identified with the historical APW4 BIB reserve.

## Contents
- WRITTEN_REVIEW.md — internal proof review, mathematical scope, finite-branching corollary and Lean status.
- MANUSCRIPT.md — canonical standalone theorem manuscript, recursive proof, explicit residue formula, worked examples, prefix-tree masses, finite tail partition, tail-cylinder margin certificate, worked applications and limits.
- LEAN_FORMALIZATION_ROUTE_TERMINAL_CONGRUENCE.md — staged Lean formalization route from the terminal exact-residue criterion.
- CITATION.cff — citation metadata.
- LICENSE.md — rights and attribution notice.

## Verification
The all-one special case is separately formalized as `CollatzSyracuseAudit.lubuimi_initial_valuation_one_cylinder` and passed seven successful exact-commit CI workflows: 42721006544, 42721305220, 42721911555, 42722186081, 42724343412, 42725006480 and 42725493567. Each reports [propext, Classical.choice, Quot.sound] and passed the complete-log sorryAx scan.

The theorem also yields a state-dependent finite cap B_alpha on any next valuation along a non-descending path: 2^(A+b)+3D(alpha) <= 4*2^A. Thus each node has finitely many candidate non-descending children, while the complementary exact tail cylinder forces descent. This is not a uniform bound and does not prove global Collatz descent. The APW4 bridge is a research programme until an explicit index-preserving incidence and capacity map is proved.

**Attribution:** Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers. Lean, Mathlib and other dependencies retain their own licences.


## Mathematical reach

The theorem classifies every finite exact valuation word as one odd residue class modulo 2^(A+1), with relative density 2^(-A) among odd starts and absolute natural density 2^(-(A+1)) among all positive integers. The explicit residue is computed from the affine offset. The finite tail partition has one exact terminal cylinder at every cutoff. A further local corollary: for any fixed prefix, a sufficiently high next valuation forces positive next signed margin and strict descent; the cutoff is prefix-dependent and does not prove global Collatz.

The manuscript also derives an exact finite valuation cap for a least hypothetical nonterminating start: at a prefix with total exponent A and signed margin D, every next exponent b must satisfy 2^(A+b)+3D <= 4*2^A. Thus each node has only finitely many possible non-descending children. This reduces a least counterexample to an infinite path in a state-dependent finitely branching tree; ruling out such a path remains open.