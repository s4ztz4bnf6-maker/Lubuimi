# Statement-fidelity audit: theorem name, actual hypotheses, and external scope (2026-10-25)

## BBMST: the current Lean endpoint is stronger than its admitted proof interface

The current source defines:
- `CoveringSystem K` with pairwise-distinct moduli and a covering witness for every integer;
- `CS_allOdd cs := ∀ i, cs.moduli i % 2 = 1`;
- `CS_squarefree cs :=` every prime-square is excluded from each modulus.

The endpoint is:
```lean
theorem erdos_selfridge (K : Nat) (cs : CoveringSystem K) :
    ¬ CS_allOdd cs
```
Its proof extracts the finite prime list, invokes `sf_sieve_lt_one`, transfers the sieve bound by monotonicity, then invokes `sieve_criterion`.

The file header already correctly records that:
- `sieve_criterion` directly asserts noncoverage rather than deriving it from the geometric/probabilistic interface;
- `sf_sieve_lt_one` assumes existence of a parameter/certificate for every finite odd-prime list;
- the source's square-free scope is not represented in the current endpoint's hypotheses.

This is not merely a missing proof tactic. It is a theorem-boundary problem: a source result with square-free hypotheses cannot be used as a proof of a statement about arbitrary moduli unless an additional reduction theorem is proved. Do not silently add a square-free hypothesis to the original target, and do not silently omit it from a source lemma.

### Required repair

1. Write two explicitly named endpoints: (a) the source-faithful square-free theorem with `CS_squarefree cs` as an explicit hypothesis; (b) the original broader target, which remains open unless a separate reduction or stronger source theorem is supplied.
2. Split `sieve_criterion` into a finite-probability/geometry theorem and a separate CRT-to-covering-system bridge. The present axiom should not conclude noncoverage directly.
3. Replace `sf_sieve_lt_one` with the exact finite certificate and large-prime recurrence, with exact rational/integer checks and an explicit termination argument.
4. Add negative tests: a source theorem call must fail if square-freeness is absent; a modulus containing (p^2) for (p>73) must not be rejected merely for that reason if the source hypothesis permits it.
5. Keep the existing interior-mass lemma conditional on its witness. The geometric proof must construct that witness or establish a strict alternative bound.

## Syracuse: external theorem scope is ordinary, not accelerated

ProofAtlas's Collatz predecessor theorem is about the ordinary Collatz map and counts distinct positive starts below a natural cutoff; reaching the target permits zero or more ordinary steps. It proves positive lower density for starts reaching a fixed positive target not divisible by 3. The companion nonconvergence statement is conditional on the existence of a counterexample; the density-one-to-universal statement is also conditional. It does not prove Collatz convergence.

The local project instead studies the accelerated odd map (T(n)=(3n+1)/2^{v_2(3n+1)}). Therefore:
- do not import the ordinary theorem as though it were an accelerated-orbit theorem;
- prove the two-way reachability simulation first;
- keep the ordinary step count and accelerated odd-step count distinct;
- retain the source's target restrictions, cutoff convention, and quantifier order.

## Audit result

The exact useful improvement is a pair of explicit interfaces, not a false global claim:
- BBMST source-fidelity endpoint versus broader conjecture endpoint;
- ordinary Collatz reachability versus accelerated Syracuse reachability.

No global theorem is claimed by this note. Its purpose is to make the remaining gap mechanically visible in Lean names and theorem hypotheses.
