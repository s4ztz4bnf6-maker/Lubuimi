# BBMST source-faithful formalization target: distortion moment bridge
Date: 2026-10-23

## Primary-source anchor

The published BBMST paper is *The Erdős–Selfridge Problem with Square-Free Moduli*, Algebra & Number Theory 15 (2021), 609–626. It proves the square-free-moduli result, not the unrestricted distinct-odd-moduli question. Publisher record: https://digitalcommons.memphis.edu/facpubs/5868/ ; Oxford record/PDF: https://ora.ox.ac.uk/objects/uuid%3A3c55267c-60be-4652-89a7-db3db5f62c25 ; preprint: https://arxiv.org/abs/1901.11465 .

## Concrete source equations to formalize

The companion exposition by the same authors, *Erdős covering systems* (Acta Math. Hungar. 161 (2020), 540–549), gives the mechanism explicitly:

- Let Q_k = S_1 × ... × S_k and Q_k = Q_(k-1) × S_k.
- A_k is the family of hyperplanes with max F(A)=k and B_k is their union.
- For x in Q_(k-1), alpha_k(x) = |{y in S_k : (x,y) in B_k}| / |S_k|.
- Definition 3.1 updates the point mass in two branches. On B_k it is max(0,(alpha_k(x)-delta)/(alpha_k(x)(1-delta))) * P_(k-1)(x)/|S_k|; outside B_k it is min(1/(1-alpha_k(x)),1/(1-delta)) * P_(k-1)(x)/|S_k|.
- The crucial fibre normalization is sum over y in S_k of P_k(x,y) = P_(k-1)(x).
- Lemma 3.2 bounds new covered mass by E_(k-1)[alpha_k(x)^2]/(4 delta (1-delta)). Its scalar inequality is max(a-b,0) <= a^2/(4b) for a >= 0 and b > 0, from (a-2b)^2 >= 0.
- Lemma 4.1 bounds the second moment using non-parallel hyperplanes: E_(k-1)[alpha_k(x)^2] <= |S_k|^(-2) sum_(j=1)^(k-1) (1 + 3/((1-delta)|S_j|)). The proof passes through pair-counting Lemma 4.3 and distortion bound Lemma 4.2.

These are the actual structural obligations. A generic alpha : ι → ℚ and conservation identity is insufficient: the hard content is (i) alpha arises as a cardinality ratio of the actual union of incidence sets, (ii) the two-branch update is normalized on every fibre, and (iii) non-parallelism gives the pair-counting/moment estimate.

## Lean staging plan (avoid circular assumptions)

1. Define a finite coordinate box using an explicit coordinate index and finite coordinate sets; define a hyperplane as a coordinate assignment with a finite fixed-coordinate set. Prove membership is coordinatewise.
2. Define fixedCoords, parallelism as equality of fixed-coordinate sets, and the round family A_k by max fixedCoords = k. Prove that for fixed x and a hyperplane in round k, there is at most one y such that (x,y) belongs to it.
3. Define B_k as the actual union and alphaNumerator x := card {y | (x,y) in B_k}. Use alpha := alphaNumerator / card S_k, with 0 < card S_k; prove 0 <= alpha <= 1 and the exact incidence-count identity.
4. Before formalizing the two-branch measure update, prove the scalar inequality max(a-b,0) <= a^2/(4*b) under 0 < b and 0 <= a, with rational inequalities and no denominator-zero branch.
5. Define the update using an explicit zero-alpha branch or denominator-safe if; prove fibre normalization by cases on alpha <= delta and alpha > delta. Do not simplify a 0/0 expression.
6. Only then formalize Lemma 4.2, Lemma 4.3 and the second-moment estimate. Summing the moment estimate into Lemma 3.2 yields positive uncovered mass.

## What is proved versus open in this repository

The existing BBMSTFiberMassCore.lean proves abstract finite mass conservation, positivity, and envelope/squeeze lemmas. It does not implement the source's measure update or prove the geometric second-moment estimate. The main file still has admitted sf_sieve_lt_one / sieve_criterion obligations. CI success for the abstract mass core is not evidence that those source-specific gaps are closed.

## Primary next milestone

The best next Lean theorem is the finite scalar bound max (a - b) 0 <= a^2 / (4*b) over rationals for 0 <= a and 0 < b, then a finite-fibre incidence-count identity. This is small enough to compile independently and directly used by Lemma 3.2; it is a real bridge but not, by itself, the theorem.
