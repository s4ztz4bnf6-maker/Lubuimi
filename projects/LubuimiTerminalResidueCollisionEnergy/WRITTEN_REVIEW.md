# Written Review — Lubuimi's Terminal-Residue Collision Energy

**Author:** Ta-Yoshua Lubuimi  
**Review date:** 10 November 2026  
**Review type:** Internal mathematical review; not independent peer review.

## 1. Core construction

At fixed prefix length \(k\), finite exact valuation words \(\alpha\) have weights \(w_\alpha=2^{-A(\alpha)}\) summing to one. The terminal-residue map
\[
\tau_k(\alpha)=C_k(\alpha)2^{-A(\alpha)}\pmod{3^k}
\]
takes values in the finite unit group \((\mathbb Z/3^k\mathbb Z)^\times\). The aggregate place masses \(m_k(t)\) sum to one.

## 2. Second-moment identity

The expansion of the squared place masses gives
\[
E_k=\sum_t m_k(t)^2=D_k+C_k^{\rm coll}.
\]
The diagonal term factors:
\[
D_k=\sum_\alpha w_\alpha^2
=\left(\sum_{a\ge1}4^{-a}\right)^k=3^{-k}.
\]
Since there are \(2\cdot3^{k-1}\) unit places and total mass one, Cauchy–Schwarz gives
\[
E_k\ge\frac{1}{2\cdot3^{k-1}},
\qquad
C_k^{\rm coll}\ge\frac{1}{2\cdot3^k}.
\]
The inequality is a forced collision lower bound, not an estimate borrowed from APW4.

## 3. Finite truncation

Restricting to words with all letters at most \(B\) gives source mass \(s_{k,B}=(1-2^{-B})^k\) and diagonal mass \(d_{k,B}=((1-4^{-B})/3)^k\). Cauchy–Schwarz yields the stated finite lower bound. The omitted source mass is \(\delta_{k,B}=1-s_{k,B}\); the energy error satisfies
\[
0\le E_k-E_{k,B}\le2\delta_{k,B}.
\]
This follows by writing the full place-mass vector as the finite vector plus a nonnegative tail vector and bounding the cross and tail terms.

## 4. Markov representation

The normalized offset state obeys
\[
x_{j+1}=2^{-a_j}(3x_j+1)\pmod{3^k}.
\]
Because the exponent coordinates have geometric probabilities \(2^{-b}\), and 2 is a primitive root modulo \(3^k\), the transition probability is
\[
P_k(x,y)=\frac{2^{-r_k(x,y)}}{1-2^{-2\cdot3^{k-1}}},
\]
where \(r_k(x,y)\) is the unique representative in \(\{1,\ldots,2\cdot3^{k-1}\}\) satisfying \(2^{r_k(x,y)}y\equiv3x+1\pmod{3^k}\). Each row sums to one. The terminal distribution is \(m_k=\delta_0P_k^k\).

The exact checks \(E_1=5/9\) and \(m_2=(8,16,11,4,2,22)/63\), \(E_2=5/21\), are consistent with direct rational computation.

## 5. APW4 interface and limitations

The source/terminal-place incidence and its exact diagonal/off-diagonal decomposition provide a concrete finite-place second-moment structure. However, this is a separately defined Syracuse collision energy, not the historical APW4 BIB reserve. The historical index-preserving map, original-weight preservation, and capacity/Hall inequality remain to be proved. The collision bound also does not imply global Collatz descent.

## 6. Verification and publication status

This manuscript is a complete mathematical derivation and a standalone preprint draft. It has not yet been Lean-compiled or axiom-audited. The successful initial-cylinder and offset/margin CI runs do not certify this collision-energy theorem or its Markov representation.

**Verdict:** The second-moment identity, forced off-diagonal lower bound, finite truncation estimate, and finite-state Markov representation form a coherent separate mathematical contribution. Formal verification and the APW4 historical transport remain open.

**Attribution:** Ta-Yoshua Lubuimi. AI tools are assistants only, not authors or independent mathematical verifiers.


## 7. Reproducibility of the \(k=2\) Markov example

The manuscript now prints the exact transition matrix in column order \(1,2,4,5,7,8\). Its initial row is \((1,2,4,32,16,8)/63\); the three unit states congruent to \(1\pmod3\) share row \((16,32,1,8,4,2)/63\), and the three unit states congruent to \(2\pmod3\) share row \((4,8,16,2,1,32)/63\). Every row sums to one, and two transitions from state zero give the stated vector \((8,16,11,4,2,22)/63\). This provides a direct rational check of the general transition formula.


## Exact-head Lean 4.35.0 verification — 10 November 2026

Standalone workflow 42735188229 passed on commit `26c7b92fd529bf03582995e1bee301b0d07c131c`. Lean 4.35.0 and Mathlib v4.35.0 were used. All seven audited declarations — `initialRow_sum`, `rowOne_sum`, `rowTwo_sum`, `transitionRow_sum`, `twoStepNumerator_eq`, `twoStepMass_eq`, and `twoStepEnergy_eq_five_div_twentyOne` — print the standard transitive profile [propext, Classical.choice, Quot.sound]. The completed log contains no actual `sorryAx` hit. The exact two-step mass is (8,16,11,4,2,22)/63 and the collision energy is 5/21. This is a finite k=2 theorem module; no APW4/BIB identification or global Collatz consequence is claimed.


## Chronology correction — finite k=2 formalization completed

The earlier review verdict that the collision-energy manuscript had not yet been Lean-compiled is superseded only for the finite k=2 matrix/distribution/energy submodule. Standalone workflow 42735716873 passed on source commit 4e30c083f3e1657edd08b0945cdda4e16c8b0e14 with Lean/Mathlib 4.35.0. Seven declarations were compiled and axiom-audited with [propext, Classical.choice, Quot.sound]; the completed log had no actual sorryAx and lake check --paranoid passed. The general k theorem, countable-word energy identity and APW4/BIB identification remain open formalization/research tasks.
