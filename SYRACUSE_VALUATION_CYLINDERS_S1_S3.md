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
