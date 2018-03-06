%% Problem 2
W = [1 0 0 0; 
     0 2 0 0; 
     0 0 4 0; 
     0 0 0 8];
alpha = [1 .5 .25 0]';
x = W * alpha;
v1 = [1 0 0 0]';
v2 = [1 1 0 0]';
v3 = [1 1 1 0]';
v4 = [1 1 1 1]';
G = [v1'*v1, v1'*v2, v1'*v3, v1'*v4;
     v2'*v1, v2'*v2, v2'*v3, v2'*v4;
     v3'*v1, v3'*v2, v3'*v3, v3'*v4;
     v4'*v1, v4'*v2, v4'*v3, v4'*v4];
beta = inv(G) * [v1'*x, v2'*x, v3'*x, v4'*x]'

A = [2 -1; 3 4];
A^4
-275 * eye(2) + 84 * A
inv(A)
6/11 * eye(2) - 1/11 * A

%% Problem 3 Check
A = [2 -1; 3 4]
A^4
-275 * eye(2) + 84 * A
inv(A)
eye(2) * 6/11 - A / 11

b0 = 1.4249 - 0.0389i
b1 = log(7/11) / (2 * sqrt(2) * j)
%% Problem 4
A = [0 1 0;
    0 0 1;
    -6 -11 -6]
[M, s] = eig(A)
syms t
M * expm(s * t) * inv(M)

expm(A*t)

%% Problem 5
A = [-1 1 0
    0 -2 1;
    0 0 -3]

b0 = 3*exp(-t) - 3*exp(-2*t) + exp(-3*t)
b1 = 5*exp(-t)/2 - 4*exp(-2*t) + 3*exp(-3*t)/2
b2 = exp(-t)/2 - exp(-2*t) + exp(-3*t)/2
b0*eye(3) + b1*A + b2 * A^2

%% Problem 6
syms s
A = [0 1 0; 0 0 1; -1 -2 -2]
phi = inv(s * eye(3) - A)
ilaplace(phi)
% Check
expm(A * t)

%% Problem 7
