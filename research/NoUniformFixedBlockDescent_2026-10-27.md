# A rigorous obstruction to uniform fixed-length Syracuse descent

Date: 2026-10-27  
Status: short mathematical proof; not Lean-compiled.

## Theorem

For every fixed block length N ≥ 1, there are infinitely many positive odd starting values n₀ whose first N accelerated Syracuse valuations all equal 1. For every such start, n_N > n₀. Consequently, no theorem of the form “there exists a fixed N such that every odd n > 1 has n_N < n” can hold.

## Proof

The exact finite-word cylinder lemma gives, for the valuation word (1,…,1) of length N, one odd residue class modulo 2^(N+1) whose starts have exactly that valuation word. A residue class contains infinitely many positive integers, so there are infinitely many such starts.

For this word A_N = N. The exact block identity is
2^N n_N = 3^N n₀ + C_N,
where C_N = Σ_{j=0}^{N−1} 3^(N−1−j) 2^j > 0. Since 3^N > 2^N and n₀ > 0,
3^N n₀ + C_N > 2^N n₀,
hence n_N > n₀.

This refutes a universal fixed-length strict-descent lemma, not the Collatz conjecture. The chosen starting value depends on N, and the result does not provide one orbit that grows forever. It does show why a valid strategy must use an adaptive block length, a state-dependent potential, or a different global argument rather than fixed-length descent for all starts.

## Formalization target

Prove the cylinder lemma for the all-ones word, the block identity, and the endpoint inequality as three separate Lean theorems. The final corollary should quantify over every fixed N and construct a start in the relevant residue class. No global termination claim follows.
