# Exact Syracuse valuation cylinders: induction obligations

Date: 2026-10-26

This note sharpens the finite-cylinder lemma into a precise proof obligation. It is not a Lean proof.

Let T(n)=(3n+1)/2^{v2(3n+1)} for positive odd n. For a prescribed positive exponent word a=(a_1,...,a_L), write K_j=sum_{i<=j} a_i. The intended claim is that the set of odd 2-adic x realizing these exact valuations is empty or one residue class modulo 2^{K_L+1}.

## One-step equivalence
For odd x, v2(3x+1)=a iff 3x+1 ≡ 2^a (mod 2^{a+1}). This is one residue class modulo 2^{a+1}, because 3 is invertible modulo 2^{a+1}. The congruence also forces x odd when a>=1.

## Pullback calculation
Suppose a first branch has valuation a and write y=(3x+1)/2^a. If x is replaced by x+2^{a+b+1}t, then y changes by 3·2^{b+1}t. Thus y modulo 2^{b+1} is unchanged. Conversely, the condition y ≡ r (mod 2^{b+1}) is equivalent to 3x+1 ≡ 2^a r (mod 2^{a+b+1}); invertibility of 3 gives a unique x residue class modulo 2^{a+b+1}.

This is the key inductive pullback step: a length-(L-1) target cylinder modulo 2^{K_{L-1}+1}, pulled back through a fixed first exponent a_1, gives a unique class modulo 2^{a_1+K_{L-1}+1}.

## Formalization obligations
- Define the 2-adic valuation convention and state its finite-exponent equivalence without ambiguous totalized division.
- Express the fixed-branch map as a congruence relation; avoid using division in a congruence until divisibility is proved.
- Prove multiplication by 3 is bijective modulo 2^m.
- Prove both directions of the pullback equivalence.
- Prove the empty-or-single-class induction, including the possibility that a proposed branch is inconsistent with positivity/domain restrictions.
- Derive the normalized Haar measure only after the residue-class theorem is formalized.

## Scope guard
The theorem concerns finite valuation words and Haar measure on 2-adic odd inputs. It does not imply all positive integer orbits converge, nor that a continuous extension exists at the singular point -1/3. No Lean build or computational regression is claimed here.