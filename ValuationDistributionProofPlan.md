# Exact 2-adic valuation distribution: proof plan

## Scope
This note records the next theorem target for the Syracuse audit. It is not itself a proof of the global Collatz conjecture.

## Target theorem
For integers K and j with 1 <= j < K, count residue classes n modulo 2^K for which v2(3*n+1)=j. The expected count is 2^(K-j-1), with n restricted to odd classes (which is automatic when j >= 1).

## Proof decomposition suitable for Lean
1. Prove that multiplication by 3 is injective modulo 2^j. A direct route is: if 2^j divides 3*(a-b), then since gcd(3,2^j)=1, 2^j divides a-b.
2. Consequently the congruence 3*n+1 = 0 mod 2^j has exactly one solution class modulo 2^j.
3. The solution class modulo 2^j has two lifts modulo 2^(j+1); exactly one lift also solves 3*n+1 = 0 mod 2^(j+1). The other lift therefore has valuation exactly j.
4. That one exact-valuation class modulo 2^(j+1) has exactly 2^(K-j-1) lifts modulo 2^K.
5. Translate divisibility by 2^j and non-divisibility by 2^(j+1) using the existing v2_eq_iff_dvd_pow_not_next lemma.
6. Keep the endpoint j = K separate: valuation at least K is a congruence class modulo 2^K, not an exact valuation class.

## Existing local statements (newest addition awaits CI)
The theorem v2_three_mul_add_one_eq_one_iff_mod_four_three states the j=1 split.
The theorem v2_three_mul_add_one_eq_two_iff_mod_eight_one states the j=2 split.
The current workflow runs must finish before the newest addition is marked kernel-verified.

## Literature and methodological boundary
Terras, “A stopping time problem on the positive integers,” Acta Arithmetica 30 (1976), 241–252, DOI 10.4064/aa-30-3-241-252, is a classical stopping-time reference. Congruence-class counts are finite/local information. They do not imply every individual Syracuse orbit reaches a smaller value or terminates.


## General residue-class theorem: exact arithmetic target

For every j>=1, the congruence 3n+1 = 0 modulo 2^j has exactly one solution class modulo 2^j, because multiplication by 3 is invertible modulo 2^j. Its two lifts modulo 2^(j+1) have opposite values of the next binary digit of (3n+1)/2^j; exactly one lift is divisible by 2^(j+1). Therefore exactly one of the two lifts has valuation exactly j. It follows that, for K>j, exactly 2^(K-j-1) residue classes modulo 2^K have valuation exactly j.

The implementation should avoid hard-coding the observed residues 3, 1, 13, 5, 53, 21, 213, 85, 853, 341, 3413, 1365. These are regression examples, not the theorem. The reusable result should be expressed in one of two ways: define the unique residue r_j in Fin(2^(j+1)) with 2^j dividing 3r_j+1 and 2^(j+1) not dividing 3r_j+1, then prove uniqueness; or state the counting theorem directly using a finite set of residues and prove its cardinality.

A Lean proof should isolate the number-theoretic core first: if 2^j divides 3a, then 2^j divides a, using coprimality of 3 and 2^j. Then prove uniqueness of the solution class modulo 2^j, the two-lift split, and the lift count. Keep the boundary j=K separate: the event v2(3n+1)>=K has one class modulo 2^K, while exact valuation K is not determined by a residue modulo 2^K alone.

## What this theorem does and does not buy

This gives exact finite-block counts for valuation symbols without assuming independence. It can validate a finite transition graph and its class weights. It does not bound the accumulated additive offset along every path and does not prove that every starting value has a strict descent block. The global target remains: for every n>1, there exists k>=1 with C^k(n)<n, for the relevant accelerated map (with map and domain fixed explicitly). Any use of a probabilistic/density theorem must preserve its actual quantifiers; a statement about almost all starting values cannot be promoted to this universal statement.


## Audit correction: what a 2-adic finite-state argument must still prove

A finite residue graph at fixed precision K cannot, by itself, certify a descent block for every positive integer. The transition graph records congruence information; the affine cocycle also contains an integer-dependent additive offset. A negative average drift, a Haar-almost-everywhere statement, or exact valuation frequencies do not imply a pointwise bound on that offset for every orbit.

The proof obligation is therefore not merely to show that some residue classes have a contracting multiplier. It must establish a uniform, orbit-valid descent statement with the exact quantifiers, for example ∀ n > 1, ∃ k ≥ 1, C^[k](n) < n, for one explicitly fixed map C and domain. The block length may depend on n unless a genuinely proved uniform bound is available. Only after that statement is proved can strong induction on n establish termination. A proposed real-valued Lyapunov function is useful only if its strict decrease is proved on every relevant transition and its well-foundedness on the integer state space is established.

The tempting claim that bounded 2-adic states or a lower bound of 1 automatically forces descent is invalid: a lower bound prevents an infinite strictly descending chain only when the potential is well-founded (for example, a natural-valued potential), and it does not show that the dynamics ever decrease that potential. The exact valuation-class theorem is retained as a local lemma, not promoted to the missing global theorem.
