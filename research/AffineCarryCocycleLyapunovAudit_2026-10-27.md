# Carry-Cocycle Lyapunov Search: an exact affine state space
Date: 2026-10-27
Status: research note; identities are exact, no Collatz theorem claimed.

## 1. Audit conclusion: the recurring obstruction

Across the block-arithmetic notes, the repeated gap is not the lack of a good average. It is the lack of a deterministic restriction on the actual orbit's ordered valuation word. For an odd Syracuse orbit
\[
n_{j+1}=(3n_j+1)/2^{k_j},\qquad k_j=v_2(3n_j+1)\ge1,
\]
put A(w)=sum k_j, and define C(empty)=0, C(wk)=3C(w)+2^{A(w)}, N(w)=length(w). Then
\[
2^{A(w)}n_N=3^{N(w)}n_0+C(w).
\]
Thus strict descent is exactly n_0(2^A−3^N)>C. A frequency estimate for the k_j does not control this inequality unless it also controls the positive carry term and the admissibility of the word.

## 2. A useful state-space change: affine carry cocycle

Associate to each finite word w the pair lambda(w)=3^N/2^A and q(w)=C(w)/2^A. The block acts on its input by the affine map F_w(x)=lambda(w)x+q(w). If u is followed by v, the exact composition law is
\[
\lambda(uv)=\lambda(v)\lambda(u),\qquad q(uv)=\lambda(v)q(u)+q(v),
\]
and therefore F_uv=F_v∘F_u. This is an affine semigroup/cocycle description, not an independent random model. The valuation word is constrained by the input integer.

A useful project-specific diagnostic is the pair D(w;n)=(log lambda(w), q(w)/n), with descent iff lambda(w)+q(w)/n<1. The first coordinate is multiplicative drift in logarithmic form; the second is the normalized carry budget. It explicitly prevents treating negative average log-drift as sufficient while ignoring carry.

For concatenation u then v, log lambda is additive, while carry is transported by the later block's multiplier. This order-sensitive transport is the key object to bound.

## 3. Why an entropy-only Lyapunov candidate is insufficient

Word entropy, number of 1s/0s, and average valuation are functions of coarse word statistics. But the carry recurrence weights earlier carries by later factors of 3, so order matters. Any potential depending only on a histogram of k-values loses information needed to compute q(w). A viable potential must include at least a carry coordinate (or a rigorous bound on it) and must be checked on all admissible transitions, not merely on average.

Candidate research target: find a state potential V(n, q, log lambda, residue data) and prove a uniform block inequality on every admissible orbit block, strong enough to force descent below a well-founded threshold. This is a target, not an established Lyapunov theorem.

## 4. Counterexample test that every uniform-block claim must pass

For N,m≥1, let n_0=2^(N+1)m−1. For 0≤j<N, n_j=3^j 2^(N+1−j)m−1, k_j=1, and n_N=2·3^N m−1>n_0. Hence no fixed block length forces descent for every odd start. This does not give one divergent orbit; it refutes only the overly strong uniform claim.

## 5. Divergence audit

For the original (unaccelerated or accelerated, but consistently defined) sequence, a_k→∞ means: for every M>0 there is K such that every k>K satisfies a_k>M. It is not equivalent to nontermination, unboundedness, or occasional large excursions. Any proof strategy must rule out recurrent bounded subsequences as well as establish unboundedness.

## 6. Formalization gates

1. Define finite valuation words and A,N,C recursively in Lean.
2. Prove concatenation identities by induction, then affine-map composition.
3. Prove exact descent equivalence using positive denominators; avoid informal division manipulations.
4. Formalize the all-ones family as a counterexample to universal fixed-length descent.
5. Only after these pass, investigate candidate potentials. Do not label this note compiled, kernel-checked, or a Collatz proof until a pinned Lean build and axiom audit are recorded.

## 7. Physical/acoustic analogy, with a strict boundary

A “spectrum” of block words could be defined as the distribution of the pair (log lambda, q), and concatenation acts by the affine transport above. This gives a precise mathematical object to experiment with. Acoustic resonance is only an analogy: no physical measurement establishes an integer-orbit theorem. Experiments may discover a candidate bound or counterexample; the proof must establish the bound for every admissible word.
