# Syracuse next-step design: carry-resolved diagonal state (2026-10-26)

Status: research design, not a theorem.

## Source-grounded bottleneck

The EOC arithmetic frontier isolates the open hypothesis `PowerOfTwoDangerousWindowSparsity`. The lambda=1 shell reduces to leading balanced-ternary digit patterns of powers of 2. The existing finite-memory transducer route was rejected because high-digit offsets depend on all lower exponent digits. Full-period averaging is too long and does not satisfy the downstream pointwise-in-shift requirement.

Sources:
- https://github.com/innerlightr-wq/eoc-lean-verification/blob/main/docs/ARITHMETIC_FRONTIER.md
- https://github.com/innerlightr-wq/eoc-lean-verification/blob/main/scratch/shiftaudit_2026-09-16/REPORT.md
- https://github.com/innerlightr-wq/eoc-lean-verification/blob/main/scratch/sparsevisits_2026-09-16/REPORT.md

## Proposed state

For a window starting at row r0 of width K, set D = 2*r0 + 2*K and retain the exact common-depth unit
v = 2^(-(sigma+1+t-x0)) modulo 3^D.
Every phase in the window is obtained by projecting v times 2^(z-x0) to the row modulus 3^(2*r+2). Thus the whole window is a deterministic function of one residue with every lower-digit carry retained. This replaces the failed bounded-memory transducer with a carry-resolved diagonal profile; it does not approximate the state.

Let M_i(v) be the exact maximum geometric odd-dark window mass over all start states for window i. The exact finite target is to count N(j,K,t) = #{i < W : M_i(v_t) > 2^(K/5)}, where W=floor((j/2)/K), and prove the source-mapped bound
N(j,K,t) <= (2/9) W + (a log_2(j)+b)/K
uniformly over the original parameter range.

## Required experiment

1. Recover and run the source scripts with pinned inputs.
2. Reproduce the 1230-environment scan and the nine reported exact worst-window checks before extending it.
3. For every window, export j,K,t,i,r0,D,x0, the exact residue, integer/rational phase comparisons, exact kernel-mass comparison, and maximizing start state.
4. Search the lambda=1 diagonal for the smallest exact counterexample to any proposed threshold.
5. Only if the reproduction matches, try a carry-resolved transfer operator or a deterministic interval-discrepancy inequality. A random/Haar bound is not a substitute for the deterministic orbit.

The finite residue group has size 2*3^(D-1), so exhaustive enumeration is only a small-depth oracle. A scalable proof needs a structural inequality, not merely a larger scan. The source-reported experiment has not yet been independently reproduced by this project.

No novelty claim is made for valuation-word realizers, logarithmic drift, or the classical 2-adic conjugacy. No EOC or Collatz theorem is claimed.
