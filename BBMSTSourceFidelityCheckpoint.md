# BBMST source-fidelity checkpoint: the actual fiber-sieve recursion

Date: 2026-10-26

Primary source: Balister–Bollobás–Morris–Sahasrabudhe–Tiba, *The Erdős–Selfridge problem with square-free moduli*, Algebra & Number Theory 15 (2021), pp. 609–626, DOI 10.2140/ant.2021.15.609. The statements below refer to the published version, Section 2.1 and Section 3.

## Exact objects the formalization must represent

For finite coordinate sets S_1,...,S_n, let Q_k = S_1 × ... × S_k. At stage k, B_k is the union of the newly exposed hyperplanes whose fixed-coordinate set contains k and is contained in [k]. R_k = R_{k-1} \ B_k. The probability measure P_{k-1} is extended uniformly over the new coordinate, so each fiber F_x = {(x,y) : y in S_k} has uniform conditional mass on its last coordinate.

For x in Q_{k-1}, define the removed fiber proportion
\[
\alpha_k(x)=|\{y\in S_k:(x,y)\in B_k\}|/|S_k|.
\]
The source's measure update (equation (3)) has two distinct pointwise multipliers:
- on points in B_k: max(0,(alpha_k(x)-delta_k)/(alpha_k(x)(1-delta_k)));
- on points outside B_k: min(1/(1-alpha_k(x)),1/(1-delta_k)).

These factors cannot be replaced by a single scalar multiplier. At alpha=0 the first expression is not evaluated on any point of B_k in that fiber; at alpha=1 the outside part is empty. The Lean definition should make these empty-part endpoint facts explicit, rather than define a meaningful conditional probability by division by zero.

## Lemma 2.1: three obligations to prove from the update

For every Q_k-measurable set S, prove P_k(S)=P_{k-1}(S). For every set S, prove P_k(S) ≤ P_{k-1}(S)/(1-delta_k). For every S subset B_k, prove P_k(S) ≤ P_{k-1}(S). These are not just algebraic mass-split identities: they require summing the actual updated point masses over fibers and using the exact piecewise update.

The global consequence is the union estimate
\[
P_n(\bigcup_{k>a}B_k)\le \sum_{k>a}P_k(B_k),
\]
because each B_k is Q_k-measurable and therefore P_n(B_k)=P_k(B_k). If the sum is less than one, the union cannot cover Q.

## Critical link to the existing Lean modules

The existing `BBMSTFiberMassCore.lean` proves genuine finite-fiber partition identities and weighted bounds. `BBMSTProbabilityInterface.lean` proves the scalar removed-fraction bound. Together these cover useful algebraic sublemmas, but they do not yet implement the source's full P_k pointwise update or prove Lemma 2.1 from that update.

The next source-faithful formalization target should therefore be a finite model with:
1. a finite type for Q_{k-1} and S_k, and an explicit product type for Q_k;
2. a finite set B_k and a computable fiber count defining alpha_k;
3. a rational-valued point mass P_{k-1}, with total mass one and the uniform-extension condition;
4. a piecewise rational update for P_k, with endpoint branches for alpha=0 and alpha=1;
5. separate finite-sum proofs of normalization, Q_k-measurable preservation, global distortion, and covered-set contraction.

Only after those are proved should the current moment interface be connected to M_k^(1)=E_{k-1}[alpha_k] and M_k^(2)=E_{k-1}[alpha_k^2]. Theorem 3.2's sharper second-moment bound additionally requires the genuine geometric condition that no newly exposed hyperplane has codimension one; the paper handles this by removing codimension-one hyperplanes and shrinking coordinate sets. That condition must be derived from the construction, not introduced as a free assumption.

## Audit status

- Source-derived mathematical specification: written from the published paper's equations (2)–(6) and Theorem 3.2.
- Lean compilation: this note is not Lean code and has not been compiled.
- Axiom audit: not applicable to this note.
- Global theorem: not proved by the current project. The unrestricted Erdős–Selfridge question remains open; the paper proves the square-free-moduli theorem.
