# Syracuse valuation cylinders: exact law and a quantitative density-descent lemma

Date: 2026-10-25

Status: exact mathematical derivation for the research track; not yet Lean-compiled. This is a partial density result, not a proof of the global Collatz conjecture.

## 1. Exact finite-prefix law

Let n_0 be a positive odd integer and define
  n_{j+1} = (3 n_j + 1) / 2^{a_j},   a_j = v_2(3 n_j + 1) >= 1.
For any fixed word (a_0,...,a_{r-1}) of positive integers, put A_j = sum_{i<j} a_i and A=A_r.

The set of odd starting values realizing this exact valuation word is one residue class modulo 2^{A+1}. Therefore its natural density among odd integers is exactly 2^{-A}.

Reason: on each valuation branch a_j=a, the input is one odd residue class modulo 2^{a+1}; the branch map n -> (3n+1)/2^a is an affine bijection from that 2-adic cylinder onto the odd 2-adic integers. Pulling back the next branch cylinder refines the previous cylinder by a factor 2^{-a_j}, giving one cylinder modulo 2^{A+1}. Equivalently, this follows by induction on r using the affine branch formula.

Consequently, for every fixed r, the first r valuations under natural density on odd starting values have the exact joint law
  P(a_0=k_0,...,a_{r-1}=k_{r-1}) = product_i 2^{-k_i}.
Thus the finite valuation prefix is i.i.d. geometric with P(a=k)=2^{-k}, E[a]=2 and Var(a)=2. This statement is exact for every fixed finite prefix in the natural-density sense; it does NOT imply that every individual integer orbit is typical, nor that all orbits descend.

## 2. Corrected interpretation of the drift heuristic

The mean valuation 2 is not merely a heuristic about independent random bits: finite-prefix independence follows from exact dyadic cylinders. Hence the model log multiplier has mean
  E[log 3 - a log 2] = log 3 - 2 log 2 = log(3/4) < 0.

Two important limitations remain:
1. A natural-density statement about finite prefixes does not settle exceptional starts or universal descent.
2. The polynomial correction term 2^a has infinite expectation under P(a=k)=2^{-k}: each term (2^a)P(a=k)=1. Therefore a proof cannot casually average the weighted correction 2^a-4. Logarithmic increments are integrable; the raw exponential correction is not. This is a concrete reason to keep the log-potential and weighted-affine identities as separate proof tracks.

## 3. Explicit fixed-block descent on a density-one set

The exact affine iterate identity is
  2^{A_r} n_r = 3^r n_0 + B_r,
  B_r = sum_{j=0}^{r-1} 3^{r-1-j} 2^{A_j}.

Since every a_i >= 1, A_j <= A_r-(r-j), so
  B_r / 2^{A_r} <= sum_{k=1}^r 3^{k-1}/2^k = (3/2)^r - 1.

Choose any real lambda with log_2(3) < lambda < 2. If A_r >= lambda r, then
  3^r / 2^{A_r} <= (3 / 2^lambda)^r < 1,
and therefore
  B_r / (2^{A_r}-3^r)
    <= ((3/2)^r - 1) / (1 - (3/2^lambda)^r)
    =: C(r,lambda).

It follows directly from the affine identity that if n_0 > C(r,lambda) and A_r >= lambda r, then n_r < n_0.

For a random finite valuation prefix, E[A_r]=2r and Var(A_r)=2r. Chebyshev gives
  P(A_r < lambda r) <= 2 / (r (2-lambda)^2).
Thus for any epsilon>0, first choose lambda in (log_2(3),2), then choose r large enough that the right side is below epsilon. For every odd n_0 above the explicit threshold C(r,lambda), all starts whose prefix satisfies A_r >= lambda r descend within r accelerated steps; the complementary set has upper natural density at most epsilon.

This is an elementary quantitative route to a density-one descent statement. It still leaves an exceptional set and is nowhere near the universal statement needed for Collatz.

## 4. Formalization targets

1. Define the valuation word and cumulative exponent without division ambiguity.
2. Prove the exact cylinder theorem, including uniqueness modulo 2^{A+1}.
3. Prove the affine iterate identity and the B_r upper bound.
4. Formalize the Chebyshev / finite geometric-word estimate, or use exact binomial-tail bounds.
5. State the result with its correct quantifiers: for every epsilon there is a threshold N such that the proportion of odd n<=X with n>N and no r-step descent is at most epsilon in the limit. Do not strengthen this to every n.

## 5. External context and evidence boundary

Tao's 2019 theorem proves an almost-all result in logarithmic density, not the full conjecture: https://arxiv.org/abs/1909.03562.
A recent independent partial-result route also emphasizes density and stopping-time bounds rather than universal descent: https://shaikidris.github.io/cet/.
The July 2026 Lean kernel soundness incident is a reason to rerun proof artifacts with a fixed patched toolchain; an empty #print axioms output alone is not a soundness guarantee: https://leodemoura.github.io/blog/2026-8-1-postmortem-for-kernel-soundness-bug-14576/.

No global Collatz claim is made here.
