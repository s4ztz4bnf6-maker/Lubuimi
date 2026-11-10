# Lubuimi's Finite Valuation-Word Cylinder Partition Theorem

**Author:** Ta-Yoshua Lubuimi · **Date:** 10 November 2026

A standalone companion project on the exact 2-adic residue-cylinder structure of every finite exact valuation word in the accelerated odd Syracuse map.

For a finite word \(\alpha=(a_0,\ldots,a_{k-1})\), with every \(a_i\ge1\), and total exponent \(A=\sum_i a_i\), the set of positive odd starts realizing exactly this word is one unique odd residue class modulo \(2^{A+1}\). Its relative natural density among odd starts is \(2^{-A}\).

The initial all-one cylinder theorem is the special case \(\alpha=(1,\ldots,1)\). The finite cutoff refinement adds the exact tail cylinder \(a_k\ge B+1\), giving a finite, disjoint, exhaustive partition with relative masses \(2^{-1},\ldots,2^{-B},2^{-B}\).

## Contents
- MANUSCRIPT.md — canonical standalone theorem manuscript, recursive proof, explicit residue formula, worked examples, prefix-tree masses, finite tail partition, tail-cylinder margin certificate, worked applications and limits.
- LEAN_FORMALIZATION_ROUTE_TERMINAL_CONGRUENCE.md — staged Lean formalization route from the terminal exact-residue criterion.
- CITATION.cff — citation metadata.
- LICENSE.md — rights and attribution notice.

## Verification
The all-one special case is separately formalized as `CollatzSyracuseAudit.lubuimi_initial_valuation_one_cylinder` and passed four successful exact-commit CI workflows: 42721006544, 42721305220, 42721911555 and 42722186081. Each reports [propext, Classical.choice, Quot.sound] and passed the complete-log sorryAx scan.

The theorem gives exact finite prefix distributions; it does not prove global Collatz descent. The APW4 bridge is a research programme until an explicit index-preserving incidence and capacity map is proved.

**Attribution:** Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers. Lean, Mathlib and other dependencies retain their own licences.
