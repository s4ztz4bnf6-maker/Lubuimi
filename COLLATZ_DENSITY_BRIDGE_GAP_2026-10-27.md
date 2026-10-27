# Collatz density bridge: exact gap audit (2026-10-27)

Status: research note, not a proof of the Collatz conjecture.

## Verified input statements

1. Mazur's formalized predecessor-density theorem says that for every fixed positive target a with 3 not dividing a, the set of positive starts whose ordinary Collatz orbit reaches a has positive lower natural density. The density constant and cutoff may depend on a.
2. A counterexample to convergence to 1 forces the set of nonconvergent starts to have positive lower natural density.
3. Consequently, upper natural density 1 of the set reaching 1 implies universal convergence. The density-one premise itself is not established by these results.
4. A separate recent result establishes explicit positive lower density of starts reaching 1 in logarithmic ordinary time. Positive density is not density one.
5. Natural-density-one descent below a growing threshold is still weaker than reaching 1: the threshold diverges and can contain nonconvergent starts.

## Exact obstruction to a naive density amplification

Let C = {n >= 1 : n eventually reaches 1} and E = N_{>0} \\ C. The known implication is

    E nonempty => lower_density(E) > 0.

Thus proving upper_density(C) = 1 would force E empty. But no known result in the checked sources gives upper_density(C) = 1.

Neither (i) positive lower density of C, (ii) positive lower density of each fixed target basin for targets a not divisible by 3, nor (iii) density-one descent below a threshold g(n) -> infinity, entails density-one convergence to 1. A valid bridge must control the *remaining orbit after first crossing g(n)*, not merely the first-passage event.

## Candidate new research object: post-threshold survival kernel

For a threshold function g and a cutoff X, define the finite-scale survival profile

    S_g(X, t) = #{1 <= n <= X : orbit of n first enters [1,g(n)]
                   but has not reached 1 within t further steps} / X.

The first task is not to assume S_g -> 0, but to derive an inequality for S_g from exact residue-class transitions and the known first-passage distribution. Any proposed bound must retain dependence on the entered state y <= g(n); an estimate uniform only in n or only on the first-passage time is insufficient.

A useful proof route would need to show that for some t=t(X) or an iterated threshold schedule, S_g(X,t) -> 0 while the exceptional set of starts that never enter the threshold is also controlled. If this is not derivable, a finite residue-class counterexample should expose which transition estimate fails.

## Falsification and formalization requirements

- Count distinct positive starts in [1,X], under the ordinary unaccelerated map.
- Separate upper density, lower density, logarithmic density, and density-one descent.
- Do not infer orbit convergence from 2-adic continuity alone.
- A Lean theorem about a finite truncation or a conditional density implication is a helper result, not the Collatz conjecture.
- Any final theorem must have an explicit statement-to-source mapping, a clean compile, and a transitive `#print axioms` audit.

## Sources to compare

- Mazur, *Positive Lower Density of Collatz Predecessors*, formalized theorem and scope: https://www.proofatlas.ai/formalizations/positive-lower-density-collatz-predecessors/
- Mazur, *Explicit Positive-Density Collatz Convergence in Logarithmic Time*: https://www.proofatlas.ai/formalizations/positive-density-log-time-collatz/
- Shaik, *Quantitative Collatz Descent to Stretched-Logarithmic Scale in Natural Density*: https://shaikidris.github.io/cet/

These sources establish meaningful density/descent results but do not claim a proof of the full conjecture.
