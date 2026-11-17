# Lubuimi's Terminal-Residue Collision Energy
## A finite-place second-moment identity for Syracuse valuation words

**Author:** Ta-Yoshua Lubuimi  
**Date:** 10 November 2026  
**Status:** Mathematical derivation from the finite valuation-word cylinder theorem; Lean formalization target, not yet compiled.

## 1. Valuation words as weighted sources

Fix a prefix length \(k\ge1\). Let \(\mathcal W_k=\mathbb N_{>0}^k\) be the set of all finite exact exponent words \(\alpha=(a_0,\ldots,a_{k-1})\). Put

\[A(\alpha)=\sum_{j=0}^{k-1}a_j,\qquad w_\alpha=2^{-A(\alpha)}.\]

By Lubuimi's Finite Valuation-Word Cylinder Partition Theorem, every such word is realized by exactly one odd starting residue class modulo \(2^{A(\alpha)+1}\), and its relative natural density among odd starts is \(w_\alpha\). At fixed length \(k\), the word cylinders form a disjoint partition of the odd starting integers. Consequently

\[\sum_{\alpha\in\mathcal W_k}w_\alpha=\left(\sum_{a\ge1}2^{-a}\right)^k=1.\tag{1}\]

Thus the valuation words are a countable probability source family with explicit product weights.

The finite valuation-word cylinder theorem is presented in its own companion manuscript and project ([PR #36](https://github.com/s4ztz4bnf6-maker/Lubuimi/pull/36)). The present collision-energy manuscript uses that theorem as an explicit mathematical input; it does not duplicate or alter its proof or Lean-verification status.

## 2. The terminal-residue map

For a word \(\alpha\), let \(C_k(\alpha)\) be its affine offset, defined by

\[C_0=0,\qquad C_{j+1}=3C_j+2^{A_j},\qquad A_j=\sum_{i<j}a_i.\]

The affine identity along every orbit realizing \(\alpha\) is

\[2^{A(\alpha)}n_k=3^k n_0+C_k(\alpha).\]

Reducing modulo \(3^k\) gives a terminal residue determined by the word alone:

\[\boxed{\tau_k(\alpha)=C_k(\alpha)\,2^{-A(\alpha)}\pmod{3^k}.}\tag{2}\]

Here \(2^{-A}\) denotes the multiplicative inverse of \(2^A\) modulo \(3^k\). Thus every starting integer realizing \(\alpha\) has

\[n_k\equiv\tau_k(\alpha)\pmod{3^k}.\]

Moreover, the recurrence for \(C_j\) gives \(C_k\equiv2^{A-a_{k-1}}\pmod3\), so

\[\tau_k(\alpha)\equiv2^{-a_{k-1}}\not\equiv0\pmod3.\]

Therefore the terminal place set is the finite unit group

\[\mathcal U_k=(\mathbb Z/3^k\mathbb Z)^\times,\qquad |\mathcal U_k|=\varphi(3^k)=2\cdot3^{k-1}.\]

The map \(\tau_k:\mathcal W_k\to\mathcal U_k\) is the natural incidence map from valuation-word sources to terminal-residue places.

## 3. Aggregated place masses and collision energy

For each terminal place \(t\in\mathcal U_k\), define its aggregate mass by the convergent nonnegative series

\[m_k(t)=\sum_{\substack{\alpha\in\mathcal W_k\\\tau_k(\alpha)=t}}w_\alpha.\]

Equation (1) implies

\[\sum_{t\in\mathcal U_k}m_k(t)=1.\]

Define the terminal-residue second moment

\[E_k=\sum_{t\in\mathcal U_k}m_k(t)^2.\]

Expanding the square gives an exact diagonal/off-diagonal decomposition:

\[E_k=D_k+C_k^{\mathrm{coll}},\]

where

\[D_k=\sum_{\alpha\in\mathcal W_k}w_\alpha^2,\]

and

\[C_k^{\mathrm{coll}}=\sum_{\substack{\alpha,\beta\in\mathcal W_k\\\alpha\ne\beta\\\tau_k(\alpha)=\tau_k(\beta)}}w_\alpha w_\beta.\]

The diagonal term is exactly computable:

\[\boxed{D_k=\left(\sum_{a\ge1}4^{-a}\right)^k=3^{-k}.}\tag{3}\]

Hence

\[\boxed{E_k=3^{-k}+C_k^{\mathrm{coll}}.}\tag{4}\]

This is a genuine weighted collision identity: distinct valuation words contribute to the off-diagonal term precisely when they induce the same terminal residue modulo \(3^k\).

## 4. A forced lower bound for off-diagonal collision mass

Since the place set has at most \(2\cdot3^{k-1}\) elements and its masses sum to one, Cauchy–Schwarz gives

\[E_k=\sum_{t\in\mathcal U_k}m_k(t)^2\ge\frac{1}{|\mathcal U_k|}=\frac{1}{2\cdot3^{k-1}}.\]

Combining this with (3) and (4),

\[\boxed{C_k^{\mathrm{coll}}\ge\frac{1}{2\cdot3^k}.}\tag{5}\]

Thus nontrivial off-diagonal collision mass is forced at every positive prefix length. This conclusion uses only the exact cylinder weights and the finiteness of the terminal residue space.

## 5. Exact first-level example

For \(k=1\), a word consists of one exponent \(a\), and

\[\tau_1(a)=2^{-a}\pmod3.\]

Odd exponents map to the place \(2\pmod3\), while even exponents map to \(1\pmod3\). Their aggregate masses are

\[m_1(2)=\sum_{j\ge0}2^{-(2j+1)}=\frac23,\qquad m_1(1)=\sum_{j\ge1}2^{-2j}=\frac13.\]

Therefore

\[E_1=\left(\frac23\right)^2+\left(\frac13\right)^2=\frac59,\qquad D_1=\frac13,\qquad C_1^{\mathrm{coll}}=\frac29.\]

This is strictly above the universal lower bound \(1/6\) from (5).

## 6. Finite truncations with explicit tail control

For \(B\ge1\), restrict to the finite source set \(\mathcal W_{k,B}=\{1,\ldots,B\}^k\). Its total mass and diagonal mass are

\[s_{k,B}=\sum_{\alpha\in\mathcal W_{k,B}}w_\alpha=(1-2^{-B})^k,\]

\[d_{k,B}=\sum_{\alpha\in\mathcal W_{k,B}}w_\alpha^2=\left(\frac{1-4^{-B}}3\right)^k.\]

Define the finite place masses \(m_{k,B}(t)\), finite energy \(E_{k,B}=\sum_t m_{k,B}(t)^2\), and finite collision term \(C_{k,B}=E_{k,B}-d_{k,B}\). Cauchy–Schwarz yields the explicit finite bound

\[C_{k,B}\ge\frac{(1-2^{-B})^{2k}}{2\cdot3^{k-1}}-\left(\frac{1-4^{-B}}3\right)^k.\]

The omitted source mass is

\[\delta_{k,B}=1-(1-2^{-B})^k.\]

Since all place masses are nonnegative, the finite energy approximates the full energy with the explicit estimate

\[0\le E_k-E_{k,B}\le2\delta_{k,B}.\]

Thus the countable source system has a finite, quantitatively controlled approximation. The exact finite-prefix tail-cylinder partition gives a complementary way to retain the omitted mass as explicit tail atoms.

## 7. APW4 interface and the remaining obligation

This construction supplies an exact APW4-style incidence architecture:

- source objects: finite valuation words \(\alpha\), with weights \(w_\alpha=2^{-A(\alpha)}\);
- finite places: terminal unit residues \(t\in(\mathbb Z/3^k\mathbb Z)^\times\);
- incidence: \(\alpha\mapsto\tau_k(\alpha)\);
- diagonal mass: exactly \(3^{-k}\);
- off-diagonal collision mass: exactly \(E_k-3^{-k}\), with lower bound (5).

The diagonal/off-diagonal split is now an exact theorem in this valuation-word model, not merely a proposed analogy. It is a concrete mathematical bridge candidate for the author's APW4 transport architecture.

However, this does not yet instantiate the historical APW4 BIB reserve. A nontrivial transfer still requires an explicit index-preserving map from the word-pair collision events to the original APW4/BIB event and place objects, preservation of the historical weights, and a proved capacity/Hall inequality. The terminal-residue collision energy is a new, separately defined Syracuse quantity; it must not be silently identified with the historical APW4 reserve.

Nor does (5) prove Collatz descent. The remaining orbitwise task is to connect terminal-residue collision structure to the signed-margin recurrence and show that every positive odd start has a finite realized block with positive margin, or establish another universal obstruction.

## 8. Finite Markov representation of the terminal-residue masses

The exact product weights of valuation words imply that, under the natural probability measure on odd starts, the exponent coordinates are independent with

\[\mathbb P(a_j=b)=2^{-b},\qquad b\ge1.\]

Fix \(k\) and work modulo \(3^k\). Define the state

\[x_j=C_j2^{-A_j}\pmod{3^k},\qquad x_0=0.\]

The offset recurrence gives

\[\boxed{x_{j+1}=2^{-a_j}(3x_j+1)\pmod{3^k}.}\tag{6}\]

At time \(k\), this state is exactly \(\tau_k(\alpha)\). Thus the terminal-residue masses are the distribution of a finite-state Markov chain driven by independent geometric exponents.

Let \(\phi_k=2\cdot3^{k-1}\). The integer 2 is a primitive root modulo \(3^k\), so for every state \(x\) and unit \(y\) there is a unique \(r_k(x,y)\in\{1,\ldots,\phi_k\}\) such that

\[2^{r_k(x,y)}y\equiv3x+1\pmod{3^k}.\]

The transition matrix is explicitly

\[\boxed{P_k(x,y)=\frac{2^{-r_k(x,y)}}{1-2^{-\phi_k}}\quad(y\in U_k),\qquad P_k(x,y)=0\quad(3\mid y).}\tag{7}\]

All exponents \(a\equiv r_k(x,y)\pmod{\phi_k}\) produce the same next state, and their probabilities sum to the geometric series in (7). Each row sums to one. The primitive-root assertion follows from the LTE identity \(v_3(2^{2\cdot3^j}-1)=v_3(4^{3^j}-1)=j+1\), which gives \(\operatorname{ord}_{3^k}(2)=2\cdot3^{k-1}\).

Writing \(\delta_0\) for the point mass at zero, the terminal distribution is

\[\boxed{m_k=\delta_0P_k^k.}\tag{8}\]

This converts the countable valuation-word source family into an explicit finite rational matrix computation. In particular,

\[E_k=\|\delta_0P_k^k\|_2^2.\]

For \(k=1\), the two place masses are \((1/3,2/3)\) and \(E_1=5/9\). For \(k=2\), ordering the unit residues as \(1,2,4,5,7,8\), the exact terminal distribution is

\[m_2=\frac1{63}(8,16,11,4,2,22),\qquad E_2=\frac5{21},\qquad D_2=\frac19,\qquad C_2^{\rm coll}=\frac8{63}.\]

This finite Markov representation makes the collision energy directly computable with exact rational arithmetic and provides a concrete matrix/second-moment interface for the APW4 programme.

## 9. Formalization target

Formalize the following in Lean, in dependency order:

1. `terminalResidue_eq_offset_mul_inv`: equation (2) from the affine offset identity.
2. `terminalResidue_isUnit`: the residue is nonzero modulo 3.
3. `valuationWordWeight_sum_eq_one`: the countable product mass identity, with explicit convergence/measure conventions.
4. `terminalResidueEnergy_eq_diagonal_add_collision`: the nonnegative double-sum expansion.
5. `terminalResidueDiagonalMass_eq_three_pow_neg`: equation (3).
6. `terminalResidueCollision_lower_bound`: inequality (5).
7. finite truncation and the explicit tail-error estimate.

No Lean compile, kernel check, or axiom audit is claimed for this new collision-energy note.

---

**Ta-Yoshua Lubuimi**  
Copyright © 2026 Ta-Yoshua Lubuimi. All rights reserved in the author's original expression and code, subject to applicable law, third-party rights and the repository's licensing notices.

## 7. The explicit \(k=2\) transition matrix

For \(k=2\), the unit state space is \(U_2=\{1,2,4,5,7,8\}\), \(\varphi(9)=6\), and the denominator in every transition probability is \(2^6-1=63\). In the column order \(1,2,4,5,7,8\), the initial row and the two distinct unit-state row types are

| State \(x\) | \(63P_2(x,1)\) | \(63P_2(x,2)\) | \(63P_2(x,4)\) | \(63P_2(x,5)\) | \(63P_2(x,7)\) | \(63P_2(x,8)\) |
|---|---:|---:|---:|---:|---:|---:|
| \(0\) | 1 | 2 | 4 | 32 | 16 | 8 |
| \(x\equiv1\pmod3\) | 16 | 32 | 1 | 8 | 4 | 2 |
| \(x\equiv2\pmod3\) | 4 | 8 | 16 | 2 | 1 | 32 |

Each row sums to \(63\), so after division by \(63\) this is a row-stochastic rational transition matrix. Applying the initial row twice gives
\[
m_2=\frac1{63}(8,16,11,4,2,22)
\]
in the same state order, and therefore
\[
E_2=\sum_{t\in U_2}m_2(t)^2=\frac5{21}.
\]
This table makes the finite-state representation directly reproducible without iterating over an infinite word family.


## Exact-head Lean verification addendum — 10 November 2026

The standalone finite k=2 terminal-residue module passed exact-head pull-request workflow [42744750457](https://github.com/s4ztz4bnf6-maker/Lubuimi/actions/runs/42744750457) on commit `a4775db22e2ff774aa6992441da8e70673298e41`, using Lean 4.35.0 and Mathlib v4.35.0. The build completed 9,048 jobs. The seven declarations `initialRow_sum`, `rowOne_sum`, `rowTwo_sum`, `transitionRow_sum`, `twoStepNumerator_eq`, `twoStepMass_eq`, and `twoStepEnergy_eq_five_div_twentyOne` all reported [propext, Classical.choice, Quot.sound]. The full log contained no actual `sorryAx` hit. The `lake check --paranoid` step completed and printed “Lean paranoid kernel accepts the solution”; its summary reported “checked 0 declarations”, which is recorded as a limitation of the reported check count.

The verified finite result is the exact two-step terminal distribution (8,16,11,4,2,22)/63 on the six unit residues modulo 9, with second moment 5/21. This does not formalize the general k-state Markov theorem, the infinite-word source-moment identity, the truncation/tail limit, or any APW4/BIB transport. Earlier candidate-status and “no Lean verification” statements are historical snapshots and are superseded only for this finite k=2 module.
