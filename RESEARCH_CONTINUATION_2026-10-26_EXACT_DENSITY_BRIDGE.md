# Research continuation — 2026-10-26: exact bridge theorem and audit protocol

## External theorem inventory

ProofAtlas records a Lean-checked result: if a positive ordinary-Collatz counterexample exists, the set of positive nonconvergent starts has positive lower natural density. Its formal assumption is conditional; it does not assert a counterexample exists. A separate formal result gives positive lower density of starts reaching 1 within an explicit logarithmic-time bound. Neither establishes that almost all starts converge.

The October 6, 2026 OpenAI release initially contained 722 manuscripts grouped into 372 families. OpenAI says it includes Lean formalizations for many results; independent reporting records rapid withdrawals/revisions after errors were found. Therefore treat each manuscript as a candidate theorem, not as a verified theorem merely by association with the release. The public source is the release announcement and repository, not the headline count.

## Exact logical gap in the proposed contradiction

Let E be the set of starts whose ordinary orbit never reaches 1. Let D be the set of starts whose orbit fails the specified short-time descent test. The conditional theorem gives

  E nonempty -> lower_density(E) > 0.

The power-saving estimate concerns D, not automatically E. A contradiction requires a proved inclusion or quantitative counting bridge, for example

  E ∩ [1,N) ⊆ D ∩ [1, K N^q)

with explicit K,q and a clock-compatible definition, or a direct power-saving estimate on E. The displayed inclusion is only a schema: it is not known here and should not be assumed. Also, if the upper bound is on D's density at cutoff N while the lower bound is on E at cutoff K N^q, convert both estimates to the same cutoff before comparing exponents.

## Concrete falsification-first workflow

1. Copy the exact definitions of the ordinary map, accelerated map, clock, and descent predicate from each pinned source.
2. Search finite values for counterexamples to any proposed finite-window implication. Such tests cannot prove the implication, but a counterexample disproves it immediately.
3. Formalize the implication with explicit constants and cutoff conversion.
4. Only after the bridge is proved, combine the lower- and upper-density inequalities algebraically and check the constants/exponents.
5. Audit the final root's transitive axioms and exact theorem statement.

## Important distinction

A p-adic extension can organize residue classes and continuity of finite iterate maps, but continuity in the 2-adic topology does not imply ordinary-order descent. Any proposed global-sink argument must include a theorem translating its topological conclusion into an ordinary natural-number inequality.

No new Lean implementation, compile, or independent checker replay is claimed here.
