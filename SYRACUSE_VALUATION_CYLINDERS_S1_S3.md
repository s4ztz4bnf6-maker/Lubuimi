# Syracuse valuation-cylinder program (S1–S3)

## Exact modulus correction

For an odd positive start and an exact valuation word
`σ = (a₀,…,aₖ₋₁)`, each `aᵢ ≥ 1`, put `A = ∑ aᵢ`.
The candidate cylinder is **one odd residue class modulo `2^(A+1)`**,
not modulo `2^A`. The extra bit enforces exactness of the last
valuation. Example: `v₂(3n+1)=1 ↔ n ≡ 3 (mod 4)`.

A source-faithful Lean theorem must establish both directions for all
positive odd starting values and prove the residue unique modulo the
stated power of two. Do not infer this from a finite computational sample.

## Constructive route

Define `T(n) = (3*n+1)/2^(v₂(3*n+1))` for positive odd `n`.
For any prescribed positive word `σ`, construct the unique residue
`rσ : ZMod (2^(A+1))` by lifting the exact valuation condition
`3*n_j+1 ≡ 2^a_j (mod 2^(a_j+1))` through the preceding affine
identities. Prove uniqueness inductively, using that 3 is invertible
modulo every power of two.

Use the existing `SyracuseOffsetIdentity.lean` identities to prove
the block endpoint equation and its margin characterization.
A fixed word has a fixed `A` and offset `C`; it does **not** make
the descent margin uniformly positive without a separate inequality.

## Finite audit

Enumerate all 1+3+9+27+81 = 121 words of lengths 0–4 over
`{1,2,3}` (120 nonempty words), calculate each candidate residue
modulo `2^(A+1)`, then check the valuations for multiple positive
representatives. This is a test, not the general proof.

## Global proof boundary

An arbitrarily long initial word of valuation 1 can occur.
Finite word classification cannot alone imply universal Collatz
descent. S3 must control concatenation and offset growth.

## RH/GRH assumption ledger

| Assumption | Research status | Lean interface | Used in |
| --- | --- | --- | --- |
| RH | External formally verified result, not imported here | Explicit `hRH` parameter if needed | None |
| GRH for Dirichlet L-functions | External formally verified result, not imported here | Explicit `hGRH` parameter if needed, with exact definition | None |
| Kernel import | Not performed | No imported RH/GRH proof | None |

No RH/GRH hypothesis is needed for S1–S3. Any future BBMST use
must first identify a specific prime-distribution lemma; CRT fiber
compatibility alone is not a GRH application.


## L3: explicit compatibility proof (2026-11-23)

**Correction:** The canonical offset `C_k` need not be even and
need not be divisible by `2^A` (already `C_1=1`). Only
`3^k*n+C_k` is divisible by `2^A` for an admissible prefix start.

Let `A = ∑ σ'`, `C=C_k`, and let `r` be a **positive odd
representative** of the prefix cylinder. Define
`t=(3^k*r+C)/2^A`; by the prefix theorem `t` is an odd natural.
All extensions of this cylinder modulo `2^(A+a+1)` are uniquely
`n=r+2^(A+1)*u`, where `u` ranges modulo `2^a`.
(For an arbitrary fixed representative of the prefix class, take
the congruence modulo the larger modulus; positivity can be ensured by
adding a sufficiently large multiple of that modulus.)

The affine identity gives the integer equality
`n_k=t+2*3^k*u` for these representatives. Thus
`v₂(3*n_k+1)=a` is equivalent to
`3*t+1+2*3^(k+1)*u ≡ 2^a (mod 2^(a+1))`.
Since `t` is odd, divide the even congruence by two:
`3^(k+1)*u ≡ 2^(a-1)-(3*t+1)/2 (mod 2^a)`.
The coefficient `3^(k+1)` is a unit modulo `2^a`.
Therefore exactly one `u mod 2^a` exists, and its lifted
residue reduces to the prefix residue modulo `2^(A+1)`.

This proves the constructive compatibility/uniqueness assertion,
subject to the already stated prefix-cylinder hypothesis. The
argument must not be replaced by the invalid claim that nested
moduli alone imply compatibility.

### Lean proof obligations

1. Formalize exact valuation as the congruence
   `3*n+1 ≡ 2^a (mod 2^(a+1))`, for positive odd `n`
   and positive `a`.
2. Establish the affine endpoint transport
   `n_k(r+2^(A+1)*u)=n_k(r)+2*3^k*u`
   under a fixed certified prefix.
3. Establish the division-by-two congruence and the
   invertibility of odd `3^(k+1)` modulo `2^a`.
4. Prove existence and uniqueness of the lifted class and its
   reduction to the prefix class.
5. Only then execute the 120-pattern enumeration as an audit.

**Status:** Human mathematical derivation recorded; the general L3
statement has not yet been kernel-checked in Lean.
