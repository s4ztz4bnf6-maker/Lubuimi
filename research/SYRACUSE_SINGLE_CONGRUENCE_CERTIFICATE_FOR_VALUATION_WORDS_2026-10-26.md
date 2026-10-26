# Syracuse valuation words via one exact congruence

Date: 2026-10-26

## The finite-word theorem
Let a=(a_1,...,a_L) be a word of positive integers, K_j=sum_{i=1}^j a_i, K_0=0, and define

F_a(n)=3^L n + sum_{j=1}^L 3^(L-j) 2^(K_{j-1}).

For every positive odd integer n, the following are equivalent:

(i) the first L accelerated Syracuse valuations are exactly a_1,...,a_L;
(ii) v_2(F_a(n))=K_L;
(iii) F_a(n) ≡ 2^(K_L) (mod 2^(K_L+1)).

Here (i) means the iterates are defined on positive odd integers and v_2(3 T^(j-1)(n)+1)=a_j for each j. The congruence formulation is an integer statement and avoids division until the valuation branch has been established.

## Proof of (i) => (ii)
Repeatedly substituting 3n+1=2^(a_1)T(n), then the analogous equations at subsequent iterates, gives
2^(K_L) T^L(n)=F_a(n).
Since T^L(n) is odd, the right-hand side has exact 2-adic valuation K_L.

## Proof of (ii) => (i): induction on L
For L=1 this is the definition of v_2(3n+1).

For L>1, write a=a_1 and let b=(a_2,...,a_L) be the tail word. Define its constant term
G_b=3^(L-2)+3^(L-3)2^(a_2)+...+2^(a_2+...+a_{L-1}),
so F_b(m)=3^(L-1)m+G_b. The number G_b is odd: its first term is odd and every later term is even. Direct expansion gives the exact integer identity

F_a(n)=3^(L-1)(3n+1)+2^a G_b.

Assume v_2(F_a(n))=K_L>a. The second summand has exact valuation a. Since the sum has valuation strictly greater than a, the first summand must also have valuation exactly a: if its valuation were smaller, it would determine the valuation of the sum; if larger, the second summand would determine it. Thus v_2(3n+1)=a, and T(n)=(3n+1)/2^a is a positive odd integer.

Now divide the displayed identity by 2^a. Using 3n+1=2^a T(n), obtain

F_a(n)/2^a=3^(L-1)T(n)+G_b=F_b(T(n)).

Therefore v_2(F_b(T(n)))=K_L-a=sum_{i=2}^L a_i. By induction, the first L-1 valuations of T(n) are exactly a_2,...,a_L. Together with the first valuation a_1=a, this proves (i).

## Proof of (ii) <=> (iii)
For an integer z and nonnegative K, v_2(z)=K iff z is divisible by 2^K but not by 2^(K+1), equivalently z ≡ 2^K mod 2^(K+1).

## Unique residue class
F_a(n) has coefficient 3^L on n. Since 3^L is invertible modulo 2^(K_L+1), the congruence in (iii) determines exactly one residue class modulo 2^(K_L+1). It is an odd class: the congruence forces F_a(n) even, while the constant term in F_a is odd, so n must be odd. Thus the finite valuation word has one residue class of 2-adic odd inputs.

## Haar measure consequence
A single residue class modulo 2^(K_L+1) has Haar measure 2^-(K_L+1) in Z_2. Conditioning on odd inputs, which have measure 1/2, gives cylinder probability 2^-K_L=product_i 2^-a_i.

## Scope and verification status
This is a paper proof of a finite-word arithmetic statement, with the domain and decomposition made explicit. It is not yet a Lean-checked theorem, and no computational regression is claimed for this revision. It does not prove that all positive integer Syracuse orbits converge.