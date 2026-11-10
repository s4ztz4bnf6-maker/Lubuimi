# Lean Formalization Route — Terminal-Residue Collision Energy

**Author:** Ta-Yoshua Lubuimi  
**Date:** 10 November 2026  
**Status:** Formalization plan only. No declaration in this route is claimed as Lean-compiled or axiom-audited.

This route turns the standalone collision-energy manuscript into a sequence of small, independently auditable Lean declarations. It deliberately separates the finite-word cylinder theorem, the weighted source, the finite-place energy, and the Markov representation.

## 1. Arithmetic source and terminal residue

Fix \(k\ge1\). Represent a finite valuation word by \(a:\mathrm{Fin}(k)\to\mathbb N\) with \(1\le a_i\). Define
\[
A_j=\sum_{i<j}a_i,\qquad
C_0=0,\quad C_{j+1}=3C_j+2^{A_j}.
\]
The affine numerator is \(X_j=3^j n_0+C_j\), and the exact finite-word cylinder theorem gives one odd residue class modulo \(2^{A_k+1}\).

Define the terminal place
\[
\tau_k(a)=C_k\,2^{-A_k}\in\mathbb Z/3^k\mathbb Z.
\]
The inverse exists because \(2\) is a unit modulo \(3^k\). Prove that \(C_k\) is a unit modulo \(3\), using
\[
C_k\equiv2^{A_{k-1}}\pmod3.
\]
Thus \(\tau_k(a)\) belongs to
\[
U_k=(\mathbb Z/3^k\mathbb Z)^\times.
\]

Suggested declarations:
1. valuationWord_totalExponent_pos;
2. offset_mod_three_eq_last_power;
3. terminalResidue_mem_units;
4. terminalResidue_eq_terminal_odd_iterate_mod.

The last declaration should use the affine offset identity and must not assume an unproved orbit reconstruction.

## 2. Probability weights and total mass

Set
\[
w_k(a)=2^{-A_k}=\prod_{i<k}2^{-a_i}.
\]
The source mass is
\[
\sum_{a\in(\mathbb N_{>0})^k}w_k(a)
=\left(\sum_{b\ge1}2^{-b}\right)^k=1.
\]

Use either:
- real-valued weights and Mathlib's summability/Fubini API; or
- finite truncations followed by an explicit geometric-tail limit.

Do not silently use a rational infinite sum without proving its convergence. Keep the chosen scalar type consistent throughout the moment proof.

Suggested declarations:
1. geometric_two_inverse_sum;
2. valuationWord_weight_eq_prod;
3. valuationWord_weight_sum_eq_one;
4. valuationWord_weight_sq_sum_eq_three_inv_pow.

The diagonal identity should be proved by factorization:
\[
\sum_a w_k(a)^2
=\left(\sum_{b\ge1}4^{-b}\right)^k=3^{-k}.
\]

## 3. Place masses and collision energy

For \(t\in U_k\), define
\[
m_k(t)=\sum_{a:\tau_k(a)=t}w_k(a).
\]
Prove:
\[
\sum_{t\in U_k}m_k(t)=1,
\qquad
E_k=\sum_{t\in U_k}m_k(t)^2.
\]
Expand the square over ordered pairs of source words and split the diagonal \(a=b\) from \(a\ne b\):
\[
E_k=D_k+C_k^{\rm coll},\qquad D_k=3^{-k}.
\]

Suggested declarations:
1. terminalMass_nonneg;
2. terminalMass_sum_eq_one;
3. collisionEnergy_eq_orderedPairSum;
4. collisionEnergy_diagonal_eq_three_inv_pow;
5. collisionEnergy_eq_diagonal_add_offDiagonal.

Keep the off-diagonal collision sum as its own indexed object. Do not identify it with an APW4 reserve.

## 4. Forced off-diagonal lower bound

The unit group has cardinality
\[
|U_k|=\varphi(3^k)=2\cdot3^{k-1}.
\]
Cauchy–Schwarz gives
\[
1=\left(\sum_t m_k(t)\right)^2
\le |U_k|\sum_t m_k(t)^2.
\]
Therefore
\[
E_k\ge\frac1{2\cdot3^{k-1}},
\qquad
C_k^{\rm coll}=E_k-3^{-k}\ge\frac1{2\cdot3^k}.
\]

Suggested declarations:
1. unitGroup_card;
2. collisionEnergy_lower_bound;
3. offDiagonalCollision_lower_bound.

The final lower bound must be derived from the exact diagonal identity and the finite-place Cauchy bound, not imported as an axiom or assumed APW4 input.

## 5. Finite truncation

Restrict to words whose letters all satisfy \(a_i\le B\). The retained source mass is
\[
s_{k,B}=(1-2^{-B})^k,
\]
and retained diagonal mass is
\[
d_{k,B}=\left(\frac{1-4^{-B}}3\right)^k.
\]
The finite place vector has total mass \(s_{k,B}\). Cauchy–Schwarz gives
\[
E_{k,B}\ge\frac{s_{k,B}^2}{|U_k|}.
\]
If \(\delta_{k,B}=1-s_{k,B}\), nonnegativity of the retained and tail vectors gives
\[
0\le E_k-E_{k,B}\le2\delta_{k,B}.
\]

Suggested declarations:
1. boundedWordWeight_sum;
2. boundedWord_diagonal_sum;
3. truncatedCollisionEnergy_lower_bound;
4. collisionEnergy_tail_error_bound.

This is a finite computational certificate: all retained words and terminal residues are explicitly enumerable, and the omitted source mass has a closed-form bound.

## 6. Primitive root and rational Markov matrix

For \(k\ge1\), prove that \(2\) has multiplicative order
\[
\phi_k=2\cdot3^{k-1}
\]
modulo \(3^k\). One route is to combine the order modulo \(3\) with
\[
v_3(2^{2\cdot3^j}-1)=j+1.
\]
For every state \(x\in\mathbb Z/3^k\mathbb Z\) and terminal unit \(y\in U_k\), there is then a unique \(r_k(x,y)\in\{1,\ldots,\phi_k\}\) such that
\[
2^{r_k(x,y)}y\equiv3x+1\pmod{3^k}.
\]
Define
\[
P_k(x,y)=
\frac{2^{-r_k(x,y)}}{1-2^{-\phi_k}}.
\]
The row sum is one because \(y\mapsto r_k(x,y)\) is a bijection from \(U_k\) to \(\{1,\ldots,\phi_k\}\), and the numerator is a finite geometric progression.

Suggested declarations:
1. two_order_mod_three_pow;
2. terminalExponentResidue_unique;
3. markovTransition_nonneg;
4. markovTransition_row_sum;
5. markovTransition_stochastic.

## 7. Markov representation of the terminal masses

The normalized offset state
\[
x_j=C_j2^{-A_j}\pmod{3^k}
\]
obeys
\[
x_{j+1}=2^{-a_j}(3x_j+1).
\]
The exponent coordinate has geometric weight \(2^{-b}\). Grouping all \(b\ge1\) by their residue class modulo \(\phi_k\) gives exactly \(P_k(x,y)\). Prove by induction on the prefix length that the terminal distribution is
\[
m_k=\delta_0P_k^k.
\]

Suggested declarations:
1. normalizedOffset_succ;
2. valuationExponent_grouped_weight;
3. terminalMass_oneStep_markov;
4. terminalMass_eq_initialRow_mul_matrix_pow.

The induction must track the exact word weights. A numerical match for small \(k\) is a test, not a proof of the general identity.

## 8. Exact small cases

For \(k=1\), verify \(m_1=(1/3,2/3)\) on units \(\{1,2\}\), hence \(E_1=5/9\).

For \(k=2\), use units \(\{1,2,4,5,7,8\}\). In that order, the initial row and two unit-state row types have denominator \(63\):
\[
P_2(0,\cdot)=\frac1{63}(1,2,4,32,16,8),
\]
\[
P_2(x,\cdot)=\frac1{63}(16,32,1,8,4,2)
\quad(x\equiv1\pmod3),
\]
\[
P_2(x,\cdot)=\frac1{63}(4,8,16,2,1,32)
\quad(x\equiv2\pmod3).
\]
Two steps give
\[
m_2=\frac1{63}(8,16,11,4,2,22),\qquad E_2=\frac5{21}.
\]

Suggested declarations:
1. markovTransition_k1_explicit;
2. terminalMass_k1_explicit;
3. markovTransition_k2_explicit;
4. terminalMass_k2_explicit;
5. collisionEnergy_k2_eq_five_div_twentyOne.

## 9. APW4 interface and strict audit boundary

Only after the above declarations are independently proved should the source-place incidence be offered to the APW4 bridge. The required APW4 theorem still needs:
- an explicit map to the original historical APW4 event/place indices;
- preservation or proved domination of the original weights;
- separate diagonal and off-diagonal transport inequalities;
- a BIB/Hall capacity theorem.

The Syracuse collision energy is not the historical APW4 BIB pair reserve. No structural analogy may replace the missing index map.

Final Lean acceptance requires:
- exact source commit and complete successful build;
- named declarations present in the build;
- lake check --paranoid where applicable;
- #print axioms for each main theorem and corollary;
- complete-log absence of sorryAx and project-specific axioms;
- exact CI run/job IDs.

**Current status:** all results in the companion manuscript are mathematical derivations. This route is not Lean verification. No global Collatz proof is claimed.

**Attribution:** Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers.


## Addendum — finite k=2 Lean formalization candidate, 10 November 2026

A standalone Lean module `LubuimiTerminalResidueEnergyK2.lean` has now been added on the companion Syracuse/Collatz formalization branch `collatz/offset-margin-roadmap-2026-10-23`, at commit `c0d3e93e19d13fda2044e24f7c8902d4c47d75d8`. It encodes the six unit residues modulo 9, the initial row and two unit-state row types with denominator 63, proves all row numerators sum to 63, proves the exact two-step numerator vector `(8,16,11,4,2,22)`, and states the rational energy theorem `twoStepEnergy_eq_five_div_twentyOne`.

The module is registered in the Lean library and in the Collatz draft audit workflow. Exact-head run 42730248268 is queued at this update. Therefore this is an implemented formalization candidate, **not yet a Lean-verified result**. The audit must complete successfully, print the named axiom profiles, and show no actual `sorryAx` before the status is upgraded. This finite k=2 module does not formalize the general Markov-chain theorem, the infinite word-space moment identity, or the APW4/BIB identification.
