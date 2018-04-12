%% Problem 1 (Robust Servo Design)
A = [-1 0;
    0 1];
B = [-1 1]';
C = [1 1];

Abar = horzcat(vertcat(A, C), zeros(3, 1))
Bbar = vertcat(B, 0)
rank(ctrb(Abar, Bbar))

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
A = [1 0 0 0;
    0 -2 0 0;
    0  0 3 0;
    0  0 0 -4];
[M, S] = eig(A)
C = [1 0 1 0];
obsv(A, C)

rank([1 * eye(4) - A; C])
rank([-2 * eye(4) - A; C])
rank([3 * eye(4) - A; C])
rank([-4 * eye(4) - A; C])

%% Problem 3 (State Estimation)
A = [-1 0;
    0 1];
B = [-1 1]';
C = [1 1];
syms t
expm(A*t)

x1_0 = -1/(1 - exp(-2))
x2_0 = 1 / (exp(2) - 1)

x1_0 = (2*exp(1) - 4 + exp(-2)) / (1 - exp(-2))
x2_0 = 2*exp(-1) - exp(-2) - 1 - (2*exp(-1) - 4*exp(-2) +exp(-4)) / (1 - exp(-2))

x0 = [x1_0; x2_0]
C * expm(A) * x0
C * expm(A*2) * x0

x1_0 = (2*exp(1) + exp(-2) - 4) / (1 - exp(-2))
x2_0 = 2/exp(1) - 1/exp(2) - 1 - (2*exp(1) + exp(-2) - 4) / (exp(2) - 1)
x0 = [x1_0; x2_0]

syms tau
integrand = expm(A*(t-tau)) * B * 1 
int(integrand, tau, 0, t)
C *  (expm(A) * x0 + [exp(-1) - 1; exp(1) - 1])
C *  (expm(A * 2) * x0 + [exp(-2) - 1; exp(2) - 1])

%% Problem 4 (Full-Order Observer Design)
A = [1 0 0 0;
    0 -2 0 0;
    0  0 3 0;
    0  0 0 -4];
C = [1 0 1 0];
syms s
syms L1
syms L2
syms L3
syms L4
L = [L1; L2; L3; L4];
Ao = A - L*C
s*eye(4) - Ao
p = det(s*eye(4) - Ao)
simplify(p)
expand((s+1)*(s+2)*(s+3)*(s+4))

L = [-4; 0; 12; 0];
Ao = A - L * C
eig(Ao)

% The estimation error is $e = x - \hat{x}$, and the error dynamics are given by $\dot{e} = (A - LC)e$. 
% The gain matrix $L$ is designed to place the eigenvalues of the matrix $A-LC$, so that the error dynamics would be asymptotically stable. 
% However, since the pair (A, C) is not observable, not all of the eigenvalues could be freely chosen by the choice the of gain matrix $L$. 
% $A$ has two eigenvalues $-2, -4$ associated with the unobservable subspace, and these two eigenvalues of $A$ will also be eigenvalues of $A-LC$, and cannot be changed by the choice of $L$. 
% On the other hand, the other two eigenvalues are associated with the observable subspace of $A$, and thus can be freely chosen. 

%desired_eigs = [-1 -3 -2 -4];
%L = place(A', C', desired_eigs)
%L = L'

%% Problem 5 (Reduced-Order Observer Design)
A = [1 0;
     0 3];
C = [1 1];
T = [1 1;
    1 -1];
T * A * inv(T)
