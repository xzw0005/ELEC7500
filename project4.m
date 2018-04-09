%% Problem 1 (Robust Servo Design)
A = [-1 0;
    0 1];
B = [-1 1]';
C = [1 1];

Abar = horzcat(vertcat(A, C), zeros(3, 1))
Bbar = vertcat(B, 0)
syms s
syms k0
syms k1
syms k2
K = [k0 k1 k2]
Ac = Abar - Bbar * K
p = det(s * eye(3) -Ac)
s = -1;
subs(p)
s = -2;
subs(p)
s = -3;
subs(p)

eqn1 = 2*k2 - 2*k0 == 0;
eqn2 = 2*k1 - 6*k0 + 2*k2 == 6;
eqn3 = 6*k1 - 12*k0 + 2*k2 == 24;
sol = solve([eqn1, eqn2, eqn3], [k0, k1, k2]);
k0 = sol.k0;
k1 = sol.k1;
k2 = sol.k2;
eig(subs(Ac))

%% Problem 2 (Observable and Detectable Properties)