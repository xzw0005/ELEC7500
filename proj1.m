%% Problem 1
A1 = [0 1 0;
      0 0 1;
      -15 -23 -9]
[M1, S1] = eig(A1)

A2 = [-7 1 0;
      -7 0 1;
      15 0 0]
[M2, S2] = eig(A2)

A3 = [0 1 0;
      0 0 1;
      0 -15 -8]
[M3, S3] = eig(A3)


A4 = [0 0 0;
      0 0 0;
      0 0 -1]
[M4, S4] = eig(A4)

A5 = [0 1 0;
      0 0 0;
      0 0 -1]
[M5, S5] = eig(A5)

A6 = [0 1 0;
      1 0 0;
      0 0 -1]
[M6, S6] = eig(A6)


%% Problem 4
A = [1 0 0 0;
    0 -2 0 0;
    0 0 3 0;
    0 0 0 -4]
[M, S] = eig(A)

B = [1 0 1 0]'
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