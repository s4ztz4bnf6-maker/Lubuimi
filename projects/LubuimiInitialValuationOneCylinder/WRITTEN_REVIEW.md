# Written Review — Initial Valuation-One Cylinder Classification

**Author:** Ta-Yoshua Lubuimi  
**Review date:** 10 November 2026  
**Review type:** Internal mathematical and formalization review of manuscript v1.0; not independent peer review.

## 1. Statement

For the accelerated odd Syracuse map
\[
2^{a_j}n_{j+1}=3n_j+1,\qquad a_j=v_2(3n_j+1),
\]
the first \(N\) valuations are all one exactly when
\[
n_0\equiv-1\pmod{2^{N+1}}.
\]
Equivalently, the exact initial run length is \(v_2(n_0+1)-1\).

## 2. Mathematical assessment

The equivalence is exact in both directions. Repeated use of the valuation-one recurrence gives the explicit prefix formula
\[
n_j=3^j2^{N+1-j}m-1
\]
when \(n_0+1=2^{N+1}m\), and the converse follows by propagating divisibility of \(n_0+1\) through the recurrence. The density statements follow from counting one odd residue class modulo \(2^{N+1}\): relative density \(2^{-N}\) among odd starts, and absolute density \(2^{-(N+1)}\) among all positive integers. The exact-run density is the difference of two nested cylinders.

The signed margin after \(r\) initial ones is
\[
D_r=-2(3^r-2^r),
\]
and the next valuation threshold for positive margin is
\[
2^{a_r+r}>6\cdot3^r-2^{r+1}.
\]
These formulas are consistent with the general margin recurrence.

## 3. Formal verification

The main declaration is Lean-compiled and axiom-audited on seven successful exact-commit workflows:
42721006544, 42721305220, 42721911555, 42722186081, 42724343412, 42725006480, and 42725493567.

The audited declaration's transitive profile is
[propext, Classical.choice, Quot.sound]. The completed logs for the checked runs contain no actual sorryAx finding. Run 42725493567 is a documentation-only descendant of the code snapshot checked by 42725006480; it re-ran the full compile-drafts suite without changing the Lean source. Earlier failed proof-script attempts remain in the chronology and are superseded for this declaration by the later successful audits.

## 4. Scope and limitations

This theorem classifies the initial valuation-one cylinder exactly. It does not establish global Collatz descent. The arbitrary finite valuation-word cylinder theorem, finite tail partition, state-dependent finite non-descent cap, terminal-residue collision energy, and Markov representation are separate mathematical results or extensions. They are not certified by this declaration's Lean audits.

## 5. Publication assessment

The manuscript is a self-contained independent exposition and proof of a classical finite congruence consequence. It must not use an eponymous theorem label or claim novelty or priority for the parity-vector classification. Its legitimate contribution is the author's independent derivation in accelerated-valuation coordinates, the explicit run-length/density/margin presentation, and the Lean formalization at the exact source snapshots documented separately. No journal acceptance, DOI, or independent peer review is claimed.

The companion finite valuation-word cylinder statement is also a classical parity-vector consequence. It must not be presented as a new general theorem. Its Lean status remains separate and unverified unless a dedicated exact-commit build and declaration-scoped axiom audit are supplied.

**Verdict:** The mathematical statements and elementary proofs are correct as reviewed. Their historical content is classical. The initial-cylinder Lean audit record is separate and applies only to the named declaration and checked source snapshots. The wider Collatz programme remains open.

**Attribution:** Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers.


## Verification-scope clarification

The seven listed exact-commit workflows audit the main initial-cylinder declaration. The separate Syracuse margin-cap declarations passed workflow 42728049650 on exact source commit ca48ec7fdad5e8d6f8aeb82fed8586a1b57c12bc. Neither record should be overread as a claim that every displayed signed-margin corollary in the manuscript has its own named Lean theorem and audit.


## 6. References

[1] R. Terras, “A stopping time problem on the positive integers,” *Acta Arithmetica* **30** (1976), 241–252.

[2] C. J. Everett, “Iteration of the number-theoretic function f(2n) = n, f(2n + 1) = 3n + 2,” *Advances in Mathematics* **25** (1977), 42–45.

[3] J. C. Lagarias, “The 3x + 1 Problem and Its Generalizations,” *The American Mathematical Monthly* **92** (1985), 3–23, Theorem B.

[4] T. Tao, “Almost all orbits of the Collatz map attain almost bounded values,” *Forum of Mathematics, Pi* **10** (2022), e12, §1.2 and Proposition 1.9.

**Correction note:** Tao's Proposition 1.9 is a distribution theorem under a residue-equidistribution hypothesis; it is not cited as the exact one-residue-class theorem.


## Current neutral declaration — verification update, 10 November 2026

The source now also contains `initial_valuation_one_cylinder_iff_dyadic_divisibility` at `SyracuseOffsetIdentity.lean:2603`, exact source commit `5f6e46de8bed7061f8336089857143c54e997af5`. Exact-head workflow [42809750956](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42809750956) passed Lean 4.34.1, `compile-drafts`, and Lean 4.35.0 paranoid. Its declaration-scoped transitive profile is `[propext, Classical.choice, Quot.sound]`, and the no-`sorryAx` guard passed. The seven earlier workflows remain historical evidence for the original identifier only; no audit is transferred across the rename. This does not certify the general finite-word theorem, tail partition, or global Collatz descent.


## Review reconciliation — 10 November 2026

The supplied editorial checklist has been reconciled with the current source. The initial-cylinder manuscript now has correctly typeset affine and density formulae, Corollary 6.3 explicitly states and proves that positive signed margin forces the iterate below the start, and Corollary 4.2 is titled “Exact initial run length” rather than a stopping-time statement. The note no longer contains APW4/tail-partition cross-project claims. The detailed source check is recorded in [REVIEW_RECONCILIATION_2026-11-10.md](REVIEW_RECONCILIATION_2026-11-10.md). This remains an internal review record, not independent peer review.
