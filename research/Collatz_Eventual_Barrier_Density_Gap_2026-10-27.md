# Collatz density bridge: exact orbit dichotomy and the missing uniformity

Date: 2026-10-27
Status: rigorous reduction/obstruction note; no Collatz proof.

## 1. Orbit dichotomy that must be respected
Let T be the ordinary Collatz map on positive integers. If an orbit repeats a value, determinism makes it eventually periodic. If it never repeats a value, then it tends to infinity in the strong sense: for every H, only finitely many orbit terms can be at most H, because there are only finitely many positive integers ≤H and none can occur twice. Thus every counterexample falls into one of two classes:

- a nontrivial periodic orbit;
- a nonrepeating orbit with T^k(n) → ∞.

This elementary dichotomy is useful because a barrier theorem about orbits that stay above H can only address the second class. It does not rule out a nontrivial cycle.

## 2. Exact quantifier gap in the density argument
For a fixed barrier H define
  A_H = {n : T^j(n) > H for every j ≥ 0},
and for a transition time t define
  A_{H,t} = {n : T^j(n) > H for every j ≥ t}.

A power-saving estimate for A_H does not by itself bound A_{H,t} uniformly in t. Every divergent orbit belongs to A_{H,t} for some t depending on its start, so the relevant set is a union over all t. One cannot infer that this union has density zero merely because each fixed-t slice has density zero. Countable unions do not preserve density-zero estimates without a quantitative uniform/summable bound.

## 3. The missing theorem, stated in a falsifiable form
A viable bridge would prove, for every H,
  limsup_{X→∞} X⁻¹ #{n≤X : ∃t ∀j≥t, T^j(n)>H} ≤ ε(H),
with ε(H)→0 as H→∞, while separately excluding nontrivial cycles.

Equivalently, it is enough to give an explicit tail decomposition with bounds uniform in X and summable over t. A bound for each fixed t with constants allowed to explode with t is not enough.

## 4. Consequence for the Mazur/Nashida combination
Mazur's conditional positive-lower-density result for nonconvergent starts would contradict the displayed estimate only after (i) nontrivial cycles are ruled out and (ii) the eventual-barrier set is controlled. Nashida's estimate for trajectories that stay above a barrier from time zero supplies neither missing implication by itself.

Therefore the current natural-density route is promising but not closed. The decisive next object is a uniform pullback/tail estimate, not another local carry identity.