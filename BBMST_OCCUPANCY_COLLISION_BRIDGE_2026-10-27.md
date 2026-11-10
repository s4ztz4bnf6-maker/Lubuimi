# BBMST fiber occupancy and collision-energy bridge

Date: 2026-10-27  
Status: research specification; not yet Lean-checked and not a proof of the BBMST incidence theorem.

## Why this is the recurring bottleneck

The current Lean branch has sound local components for finite proper fibers, interior-band inequalities, and source multiplier normalization. None of these components alone proves that the source-defined geometry puts positive probability mass on proper, nonempty fibers. That existence statement is the key missing bridge.

The source model has a finite coordinate set (S_k) and a newly exposed family (N_k) of hyperplanes whose fixed-coordinate sets contain coordinate (k). For a prefix (xin Q_{k-1}), each compatible hyperplane fixes at most one last coordinate (yin S_k). The source fraction is
[
alpha_k(x)=rac{r_x}{q},quad
q=|S_k|,quad
r_x=|{yin S_k:(x,y)in B_k}|.
]
The required positive interior term is (w_xalpha_k(x)(1-alpha_k(x))>0), which requires both positive prefix mass (w_x>0) and (0<r_x<q).

## New project-specific representation: occupancy and collision energy

For each prefix (x), let (H_xsubseteq N_k) be the hyperplanes compatible with that prefix. Each (Hin H_x) determines a unique final-coordinate value (y_H). Define the occupancy multiplicity
[

u_x(y)=|{Hin H_x:y_H=y}|,
]
the total incidence count
[
m_x=sum_{yin S_k}
u_x(y)=|H_x|,
]
the covered support size
[
r_x=|{yin S_k:
u_x(y)>0}|,
]
and the collision energy
[
c_x=sum_{yin S_k}inom{
u_x(y)}2.
]
These are exact finite combinatorial quantities. They satisfy
[
r_xle m_x,qquad 0le m_x-r_xle c_x.
]
Indeed, for every integer (uge0), (u-1_{{u>0}}le inom u2); sum this pointwise over (y). The difference (m_x-r_x) is exactly the number of duplicate incidences beyond the first occupancy at each covered coordinate. The collision energy counts pairs of hyperplanes that collide at the same final coordinate.

This representation separates two facts that are often blurred together:
- the **support** (r_x) determines (alpha_k(x)) and whether the fiber is proper;
- the **multiplicity** (
u_x) and its pair energy (c_x) are what pair-counting geometry controls.

If (m_x<q), then (r_xle m_x<q); if also (m_x>0), then (1le r_x<q), so the fiber is nonempty and proper. This implication is exact, but its hypotheses must be derived from the source's hyperplane family and the chosen coordinate sizes, not postulated as a theorem conclusion.

## How it plugs into the existing proof

1. **Geometry:** define (H_x) from the actual fixed-coordinate hyperplanes; prove each compatible hyperplane determines at most one (y).
2. **Occupancy:** prove the support/incidence identities and the collision-energy inequality.
3. **Proper-fiber witness:** derive (0<m_x<q) for a set of prefixes of positive source probability, using the actual source assumptions.
4. **Mass:** feed that witness into the existing proper-fiber theorem, then the source-faithful weighted update and interior-mass estimate.
5. **Global second moment:** use pairwise intersections to control collision energy and the source's (M_k^{(2)}) expression. Do not replace the paper's (R_k,N_k,B_k) geometry or its Lemma 2.1 update with an abstract variance assumption.

The crucial unresolved obligation remains step 3: the occupancy identity does not show that any positive-mass prefix has (m_x>0), nor that (m_x<q) follows in the exact source setting. If the source hypotheses do not imply it, the proof must identify the missing condition rather than silently add one.

## Audit gates

- Formalize the finite occupancy identities with exact natural-number counts first.
- Prove the pointwise inequality (u-1_{u>0}le u(u-1)/2) for natural (u), then sum.
- Derive (r_x<q) only from a proved source bound on (m_x).
- Preserve endpoint cases (r_x=0) and (r_x=q); both give zero interior factor.
- Run transitive `#print axioms` and statement-fidelity checks after Lean compilation.

Novelty status: incidence multiplicities and collision counts are standard combinatorial ideas. This particular occupancy/collision-energy interface is a proposed project-specific organization of the source-to-Lean gap, not a claim of a globally unprecedented theorem.
