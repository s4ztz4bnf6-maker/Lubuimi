# RH/GRH dependency policy — BBMST

## Research assumption
RH and Dirichlet GRH may be used as external proved inputs in
theoretical derivations, always explicitly labeled “under RH/GRH”.
This repository does not claim to reprove either result.

## Lean kernel boundary
Do not introduce an unqualified axiom or claim an import that is absent.
Any theorem depending on RH/GRH must carry an explicit hypothesis
`hRH : RiemannHypothesis` or `hGRH : <precisely defined GRH proposition>`.
A separate audited commit is required to replace such a parameter
with a verified imported theorem.

| Assumption | External status | Lean parameter | Uses in this branch |
| --- | --- | --- | --- |
| RH | Formally verified externally; not imported | `hRH` | None |
| Dirichlet GRH | Formally verified externally; not imported | `hGRH` | None |
| Kernel integration | Not done | — | Open |

## BBMST relevance classification

- B1: an explicit bounded least-prime / prime-in-progression claim.
  A GRH application may be relevant **only after** its modulus, range,
  character hypotheses and constants are stated.
- B2: simultaneous prime conditions. Individual GRH error estimates
  do not automatically imply arbitrary simultaneous patterns.
- B3: pure CRT compatibility, covering and finite fiber mass.
  GRH does not address the missing combinatorial/geometric estimate.

**Current classification:** the identified open sieve/geometry
interfaces are B3 or not yet classified; no specific B1 obligation
has been established. RH/GRH is not currently used by any Lean theorem.

The admitted declarations `sieve_criterion` and `sf_sieve_lt_one`
remain admitted. RH/GRH must not be cited as discharging them.
