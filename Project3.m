%% Problem 1
A1 = [0 1 0;
      0 0 1;
      -15 -23 -9];
[M1, S1] = eig(A1)

A2 = [-7 1 0;
      -7 0 1;
      15 0 0];
[M2, S2] = eig(A2)

A3 = [0 1 0;
      0 0 1;
      0 -15 -8];
[M3, S3] = eig(A3)


A4 = [0 0 0;
      0 0 0;
      0 0 -1];
[M4, S4] = eig(A4)

A5 = [0 1 0;
      0 0 0;
      0 0 -1];
[M5, S5] = eig(A5)

A6 = [0 1 0;
      1 0 0;
      0 0 -1];
[M6, S6] = eig(A6)

%% Problem 2
syms t
M6 * expm(S6 * t) * inv(M6)
expm(A6*t)

%% Problem 3
A = [0 1;
    -1 0]
[M, S] = eig(A)

%% Problem 4
A = [1 0 0 0;
    0 -2 0 0;
    0 0 3 0;
    0 0 0 -4];
[M, S] = eig(A)

B = [1 0 1 0]';
%eigvals = diag(S)
s1 = 1; s2 = -2; s3 = 3; s4 = -4;
chi1 = s1 * eye(4) - A
aug1 = [chi1 B]
rank(aug1)

chi2 = s2 * eye(4) - A
aug2 = [chi2 B]
rank(aug2)

chi3 = s3 * eye(4) - A
aug3 = [chi3 B]
rank(aug3)

chi4 = s4 * eye(4) - A
aug4 = [chi4 B]
rank(aug4)

C = ctrb(A, B)

%% Problem 5
A = [1 0 0 0;
    0 -2 0 0;
    0 0 3 0;
    0 0 0 -4];
B = [1 0 1 0]';

syms s
syms k1
syms k2
syms k3
syms k4
K = [k1 k2 k3 k4]
Ac = A - B * K
det(s * eye(4) - Ac)

poly(A)
poles = [-4, -2, -1, -3]
place(A, B, poles)
acker(A, B, poles)

A = [2.5 -5.5 13;
    .5 -3.5 7;
    1.5 -1.5 2]
eig(A)

A=[0 1; 1 0];
eig(A)
B=[0 1]';
ctrb(A, B)

%% Problem 6
A = [-1 0;
    0 1];
poles = eig(A)
B = [0 1]';
%ctrb(A, B)
C = [0 1];
x0 = [0 1];
t = 0:0.01:1;
u = exp(1)/(1-exp(1)) * ones(size(t));
sys = ss(A, B, C, 0)
[y, t, x] = lsim(sys, u, t, x0);

xx1 = x(:, 1);
xx2 = x(:, 2);
plot(t, xx1, t, xx2)
legend('x[1]', 'x[2]')
xlabel('t')