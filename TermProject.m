syms u k1 k2 h1 h2 a1 a2

f1 = u/a1 - k1/a1 * sqrt(h1-h2)
f2 = k1/a2 * sqrt(h1-h2) -k2/a2 * sqrt(h2)

%f = [f1; f2]
Arow1 = gradient(f1, [h1, h2])
Arow2 = gradient(f2, [h1, h2])

syms n1 n2
a1 = 4
a2 = 4
k1 = 1
k2 = .5
h2 = 1
h1 = 1 + (k2/k1)^2
expand(Arow1)
Arow1
Arow2

A = [   -k1/(2*a1*(h1 - h2)^(1/2)), k1/(2*a1*(h1 - h2)^(1/2)) ;
        k1/(2*a2*(h1 - h2)^(1/2)),  -k2/(2*a2*h2^(1/2)) - k1/(2*a2*(h1 - h2)^(1/2))]
    
    
B = [1/4 ; 0]
C = [1 0]

[M, S] = eig(A)

Mc = ctrb(A, B)
rank(Mc)

Mo = obsv(A, C)
rank(Mo)

syms s
G = C * inv(s * eye(2) - A) * B

syms k0 k1
K = [k0 k1]
p5 = det(s * eye(2) - (A - B*K))
simplify(p5)

simplify((s+2-2*j)*(s+2+2*j))

syms s L1 L2
L = [L1; L2]
Mo = A - L*C
M6 = s * eye(2) - (A - L * C)
p6 = det(M6)
simplify(p6)

eqn1 = L1 + 9/16 == 4;
eqn2 = 5/16 * L1 + L2/4 + 1/64 == 8;
[a, b] = equationsToMatrix([eqn1, eqn2], [L1, L2])
linsolve(a, b)