# Research update — 10 November 2026
## Lubuimi Syracuse cylinder results and APW4 bridge programme

**Research author:** Ta-Yoshua Lubuimi  
**Record type:** Append-only continuation. Earlier research notes and successful CI results are retained.

## 1. Established Collatz/Syracuse results

The existing affine offset and signed-margin framework remains in force:
\[
2^{A_k}n_k=3^kn_0+C_k,\qquad
C_k=\sum_{j<k}3^{k-1-j}2^{A_j},
\]
\[
D_k=2^{A_k}-C_k-3^k,\qquad
D_{k+1}=3D_k+(2^{a_k}-4)2^{A_k}.
\]
Previously established offset, block decomposition, weighted expansion, run-of-ones/run-of-twos identities and valuation-transition results remain part of the research record.

### 1.1 Initial valuation-one cylinder — proved and Lean-audited

For every positive odd start and every \(N\ge0\),
\[
(\forall j<N,\ a_j=1)\iff n_0\equiv-1\pmod{2^{N+1}}.
\]
The exact initial run length is \(r=v_2(n_0+1)-1\). The natural densities are:
- at least \(N\) initial ones: \(2^{-N}\) among odd starts and \(2^{-(N+1)}\) among all positive integers;
- exactly \(r\) initial ones: \(2^{-(r+1)}\) among odd starts and \(2^{-(r+2)}\) among all positive integers.

The explicit prefix is \(n_j=3^j2^{N+1-j}m-1\) when \(n_0+1=2^{N+1}m\). Its signed margin after \(r\) ones is
\[
D_r=-2(3^r-2^r),
\]
and the exact next-step positivity threshold is
\[
2^{a_r+r}>6\cdot3^r-2^{r+1}.
\]

### 1.2 Formal verification chronology

The main declaration CollatzSyracuseAudit.lubuimi_initial_valuation_one_cylinder has passed four complete exact-commit workflows:
- 42721006544 — success;
- 42721305220 — success;
- 42721911555 — success;
- 42722186081 — success.

The job steps show successful library build, iteration/threshold, Syracuse reference/quarter-descent, offset identity, closed form, stronger offset lower bound, margin block and valuation-transition modules. Each log prints the main declaration's transitive axiom profile as
\[
[\texttt{propext},\texttt{Classical.choice},\texttt{Quot.sound}],
\]
and the complete-log sorryAx scan passes. These results apply to their exact checked snapshots.

Failed earlier proof-script attempts 42719689591 and 42720406876 remain in the chronology and are superseded for this declaration by the later successful checks. The separate recheck 42722186081 completed successfully. It is the fourth successful exact-commit snapshot for the initial cylinder declaration.

### 1.3 General finite valuation-word cylinder theorem — mathematical proof supplied

For every finite exact word \(\alpha=(a_0,\ldots,a_{k-1})\), all \(a_i\ge1\), with \(A=\sum_i a_i\), its exact cylinder is one unique odd residue class modulo \(2^{A+1}\), with relative odd-start density \(2^{-A}\).

The explicit residue is
\[
r_\alpha\equiv(2^A-C_k)(3^k)^{-1}\pmod{2^{A+1}}.
\]
A parent prefix extended by exponent \(b\) has relative child mass \(2^{-b}\), and the children partition the parent because \(\sum_{b\ge1}2^{-b}=1\).

At a finite cutoff \(B\), exact children \(b=1,\ldots,B\) plus the single tail event \(a_k\ge B+1\) form a finite partition with relative masses \(2^{-1},\ldots,2^{-B},2^{-B}\). The tail itself is one residue cylinder, not a union of unspecified residue classes.

This general theorem and finite tail refinement have a separate manuscript project under projects/LubuimiFiniteValuationWordCylinder on its publication branch. They are mathematically derived there but are not yet claimed as Lean-compiled or axiom-audited.

## 2. APW4 research record retained

The APW4 manuscript's mathematical result remains the author's established result. Its energy decomposition and transport inequalities are not downgraded by later Lean integration failures. Successful CI runs remain valid for their exact commits and scopes. The latest integrated failures are recorded separately as formalization diagnostics.

## 3. Named bridge programme

The general finite valuation-word tree motivates the **Lubuimi APW4–Syracuse Cylinder–Energy Bridge**. Candidate source data:
- finite valuation words as prefix nodes;
- unique residue cylinders as fibres;
- prefix extension as incidence;
- exact relative edge weights \(2^{-b}\);
- one exact tail atom at each finite cutoff;
- signed offset margins attached to the same word indices.

A bridge theorem is not yet claimed. It requires explicit finite source and target index sets, a concrete index-preserving map, diagonal mass fidelity, separate off-diagonal collision accounting, an actual BIB/Hall capacity inequality, tail-mass preservation, and a resulting arithmetic statement about a finite realized block. The APW4 diagonal mass, off-diagonal mass and BIB pair reserve must not be identified without a proved index-preserving map.

## 4. Next research milestones

1. Formalize the general finite-word cylinder theorem in Lean, building on the now verified all-one special case.
2. Formalize the finite tail-cylinder partition and exact mass identity.
3. Build a finite Syracuse prefix-incidence structure with terminal-state and signed-margin labels.
4. Define the candidate APW4 source/target indices and explicit map.
5. Prove or refute diagonal domination and off-diagonal/BIB capacity as separate lemmas.
6. Connect any successful transport estimate to the exact signed-margin block criterion.
7. Continue APW4 prefix and hyperplane formalization repairs without changing the mathematical manuscript's established result.

## 5. Scope and attribution

The cylinder density theorems alone do not prove that every orbit descends. No global Collatz proof is claimed. APW4 and Syracuse remain independent proved inputs until the bridge theorem is actually established.

All research and theorem attribution: **Ta-Yoshua Lubuimi**. AI tools are assistants only, not authors or independent mathematical verifiers. Earlier results and CI records are preserved append-only.
