# Syracuse: exact cylinder probabilities and the density-one threshold route

Date: 2026-10-26

## Exact finite-prefix distribution

For the accelerated odd map T(n)=(3n+1)/2^{v₂(3n+1)}, write a_i=v₂(3n_i+1) and A_N=Σ_{i<N} a_i. The affine relation gives one compatible residue class modulo 2^{A_N+1} for each prescribed positive word (a_0,...,a_{N-1}). Among odd integers, that cylinder therefore has natural density

    2^{-A_N} = Π_{i<N} 2^{-a_i}.

Consequently the finite-dimensional valuation distributions are exactly those of independent geometric variables with P(a_i=k)=2^{-k}, k≥1, when initial odd integers are sampled by natural density (equivalently, odd 2-adic integers with normalized Haar measure).

This is stronger than just saying every finite word is realizable: it identifies the exact density of every finite word, and the factorization proves finite-dimensional independence.

## Consequence: typical starts cross the certificate threshold

For one geometric valuation a with P(a=k)=2^{-k},

    E[a] = Σ_{k≥1} k/2^k = 2.

Thus E[5a-9]=1. By the strong law for the product valuation process,

    (5A_N-9N)/N → 1

for almost every odd 2-adic start. In particular, almost every such start eventually reaches 5A_N≥9N. The same finite-cylinder distribution bounds show that the exceptional set of positive odd integers has natural density zero.

This supplies a rigorous density-one route to the existing conditional suffix certificate, once the measure-theoretic transfer is formalized. It does **not** prove the universal Syracuse conjecture: a density-zero exceptional set may still contain positive integers, and the universal claim requires ruling out every exceptional orbit.

## Exponential tail for a finite horizon

The lower-tail event A_N < 9N/5 can be bounded by Chernoff. For t>0,

    P(A_N < 9N/5)
      ≤ [ exp(4t/5) / (2-exp(-t)) ]^N.

Choosing exp(-t)=8/9 gives the base

    (9/10) (9/8)^(4/5) < 1,

so the probability of failing to cross by time N decays exponentially. The inequality follows from the geometric moment-generating function E[exp(-t a)]=exp(-t)/(2-exp(-t)). The numerical rate is weak but strictly positive. A sharper rate is possible by optimizing t.

## Proof boundary

The cylinder probabilities and expectation are exact. The strong-law step is a standard probability theorem, not yet encoded in Lean here. Even after formalization, this yields a density-one theorem only. The remaining universal gap is to show that no positive integer lies in the exceptional set, or to find a different descent argument that covers those exceptional starts.
