# Syracuse signed-margin cocycle: exact block-balance formulation

Status: exact algebraic roadmap derived from the existing recurrence lemmas; not a global Collatz proof.

## Margin dynamics

For an exponent sequence a_j with A_{j+1}=A_j+a_j, define C_0=0, C_{j+1}=3C_j+2^{A_j}, and M_j = 2^{A_j} - 3^j - C_j.

The affine identity gives 2^{A_j} n_j = 3^j n_0 + C_j for a certified trajectory. For n_0>1 and a nonempty block, strict descent is equivalent to C_j < (2^{A_j}-3^j)n_0. The simpler condition M_j>0, namely C_j+3^j<2^{A_j}, is sufficient for descent when n_0>1, but is not the exact necessary-and-sufficient condition for each start value.

Using the recurrences, the signed margin satisfies the exact cocycle M_{j+1} = 3 M_j + 2^{A_j}(2^{a_j}-4). Thus a_j=1 contributes a negative term -2·2^{A_j}; a_j=2 contributes zero; and a_j≥3 contributes a positive term at least 4·2^{A_j}.

Iterating gives the exact weighted balance M_N = 3^N M_0 + Σ_{j<N} 3^{N-1-j} 2^{A_j}(2^{a_j}-4). Since M_0=0, positivity of this weighted sum is a sufficient uniform margin criterion. This equation is algebraic; it does not assert that every admissible word makes the sum positive.

## Why this is the useful abstraction

The issue is not merely how often exponent-one steps occur. Their negative contributions are weighted by 3^{N-1-j}2^{A_j}, so their positions relative to later high exponents matter. A proof based only on frequency, average exponent, or maximum run length loses this positional information.

A plausible next research target is a block-balance theorem: partition a realizable exponent word into blocks and bound the total negative contribution of exponent-one positions against the positive contributions from exponent-at-least-three positions, with exponent-two positions neutral. Any such inequality must be proved from admissibility constraints, not assumed as a property of arbitrary words. Arbitrarily long finite runs of exponent one exist, so a uniform bound based solely on run length is false.

## Formal proof milestones

1. Verify that the existing Lean definition of signedOffsetMargin matches M_j above.
2. Formalize the one-step cocycle directly from the recurrence.
3. Prove the finite weighted-sum expansion by induction.
4. Derive block-local balance inequalities from the exact residue constraints for realizable exponent words.
5. Connect a positive margin to the exact start-dependent descent threshold.
6. Audit #print axioms transitively and test the theorem statement against the original accelerated Syracuse map.

This is a sharper proof target than a vague appeal to 2-adic continuity: it identifies the exact signed quantity whose weighted balance would imply descent. It does not establish that balance universally, and it does not prove Collatz termination.
