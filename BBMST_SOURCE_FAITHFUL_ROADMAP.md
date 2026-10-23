# BBMST source-faithful formalization roadmap

## Scope and target

Primary source: Balister, Bollobás, Morris, Sahasrabudhe, Tiba, *The Erdős–Selfridge problem with square-free moduli*, Algebra & Number Theory 15 (2021), 609–626, DOI 10.2140/ant.2021.15.609.

The proved theorem is the **square-free-moduli** result: a finite covering system with distinct square-free moduli greater than one cannot have every modulus odd. This is not the unrestricted Erdős–Selfridge conjecture. The formalization must retain that hypothesis at every translation layer.

## Current formal status in this repository

- `BBMSTFiberMassCore.lean`: kernel-checked finite weighted-fiber partition, nonnegative-mass bounds, and two-sided squeeze over a finite label map.
- `BBMSTProbabilityInterface.lean`: normalizes that algebraic squeeze when the finite source mass sums to one.
- These modules are interfaces only. They do **not** yet define the paper's geometric box, hyperplanes, evolving measures, or conditional fiber estimates.
- `ErdosSelfridge_v17_fixed.lean` still reports the admitted dependencies `sf_sieve_lt_one` and `sieve_criterion` in the main theorem's axiom list. Do not describe the main theorem as axiom-free.

## Source-to-Lean obligation graph

1. **Arithmetic translation / CRT bridge**
   - Formalize the equivalence between a square-free-modulus covering system and the corresponding nonparallel hyperplane cover on a box with distinct prime coordinate sizes.
   - Explicitly exclude modulus one and trivial hyperplanes; preserve distinctness and square-freeness.
   - Deliverable: two directional equivalence lemmas with all hypotheses visible.

2. **Finite geometric probability space**
   - Define the finite box `Ω = ∏ k, Fin (p k)` using a finite index set and the chosen prime sizes.
   - Define the measure from the source's coordinate weights and normalize it by a proved total-mass identity.
   - Keep zero-mass fibers explicit rather than dividing by their mass.

3. **Single-coordinate fiber sieve (source Lemma 2.1)**
   - Model the removed set and the surviving set for each coordinate/fiber.
   - Prove the source's first- and second-moment bounds as separate statements.
   - Connect those statements to `finite_fiber_weighted_partition_mass`; do not assume the fiber coefficients independently of the geometric construction.

4. **Iteration / moment propagation**
   - Formalize the paper's propagation of hyperplane weights and compatible intersection moments (including the source's Lemmas 3.3–3.4 and Theorems 3.1–3.2).
   - State every nonparallelism and coordinate-size condition at the interface where it is used.

5. **Finite certificate and tail**
   - Encode the finite parameter certificate with exact rationals/integers and prove its inequalities in Lean, not via a floating-point assertion.
   - Separate the finite 480-point certificate / parameter bound from the analytic tail estimate imported by the paper.
   - If an external analytic theorem is retained, mark it explicitly as an axiom until independently formalized.

6. **Main theorem**
   - Compose the geometric obstruction with the CRT bridge to prove only the square-free theorem.
   - Audit `#print axioms` on every public endpoint; require no `sorryAx` and report any admitted external theorem by name.

## Immediate next formal milestone

Replace the two admitted sieve interfaces with source-derived lemmas, starting with the exact definitions and hypotheses of Lemma 2.1. The finite weighted-fiber algebra already supplies the summation bridge, but no geometric conditional estimate should be inferred from that algebra alone.

## Verification rule

A successful CI run establishes compilation of the selected modules and commands only. It does not by itself establish that the formalization matches the paper's hypotheses, that an admitted theorem has been proved, or that the unrestricted Erdős–Selfridge problem is solved.
