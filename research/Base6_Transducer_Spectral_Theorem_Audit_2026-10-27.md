# Audit of the proposed base-six transducer spectral theorem
Date: 2026-10-27
Status: exact arithmetic audit; no global Collatz theorem claimed

## What is correct

For odd \(n\), \(n\bmod 6\in\{1,3,5\}\), and
\[
3n+1\equiv4\pmod6.
\]
So the ordinary Collatz odd branch is followed by an even value and at least one division by two. This is a one-step parity fact.

## What does not follow

### 1. Division by two is not a base-six digit shift

A base-six digit shift multiplies or divides by six, not by two. The residue \(3n+1\equiv4\pmod6\) implies evenness, but does not encode the quotient's full base-six digits or its later parity. For example, values congruent to 4 modulo 6 can have quotients by two with different residues modulo 6.

### 2. The proposed transducer has not been defined

A finite-state transducer must specify its state space, input/output alphabet, transition function, initial-state encoding, and how carries are represented. Multiplication by 3 plus 1 can be performed digitwise with carry states, but the subsequent division by 2 in base 6 is not a simple digit-local operation. A finite-state description of an infinite integer map needs a proof that the state representation is complete and that no unbounded information is lost.

### 3. Perron–Frobenius does not provide the claimed implication

For a nonnegative matrix \(M\), \(\rho(M)\leq\|M\|_1\) for the induced matrix 1-norm, so a proved \(\|M\|_1<1\) would imply \(\rho(M)<1\). But no concrete matrix, state encoding, or proof of this norm bound is supplied.

More importantly, even a spectral-radius bound for a transition/counting matrix does not automatically bound the ordinary integer values along every orbit. It may bound counts or weighted state mass, not the numeric observable \(n_k\). A theorem connecting the matrix dynamics to \(n_k\), uniformly over every admissible orbit and with all carries included, is indispensable.

### 4. Divergence is not excluded by a parity fact

The congruence proves that an odd step is followed by an even number. It does not prove that the full accelerated orbit descends over every sufficiently long block. The accelerated map is
\[
S(x)=\frac{3x+1}{2^{v_2(3x+1)}}.
\]
The amount of division depends on the full 2-adic valuation, not only on the residue modulo 6. The existing exact construction of arbitrarily long valuation-two segments also rules out a universal fixed-window rule requiring a valuation-one step in every large block.

## Correct replacement target

Do not assert a spectral theorem until an explicit finite-state model is given. The first falsifiable specification should contain:
1. the exact state and carry representation;
2. a proof that each state transition represents the integer Collatz/Syracuse step exactly;
3. a nonnegative matrix derived from those transitions, not postulated;
4. an explicit positive weight vector or norm;
5. a proved inequality controlling the *integer-value observable*, not merely the number of paths;
6. a theorem that the inequality applies to every admissible orbit, including exceptional long blocks.

If a proposed matrix is produced, test its transition semantics against exhaustive exact integer calculations for all states up to a chosen length. Such tests can refute a wrong model but cannot prove the universal inequality.

## Conclusion

The base-six residue observation is true. The claimed transducer matrix, norm bound, and implication from spectral radius to absence of divergent integer orbits are not established. The proposal therefore does not yet provide a proof, and no global Collatz result should be entered into Lean as a theorem with unproved bridge assumptions.
