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

%% Problem 3 Check in Matlab
A = [2 -1; 
    3 4];
A^4
-275 * eye(2) + 84 * A
inv(A)
eye(2) * 6/11 - A / 11

c1 = (log(3+sqrt(2)*j) - log(3-sqrt(2)*j)) / (2*sqrt(2)*j)
c0 = log(3+sqrt(2)*j) - c1 * (3 + sqrt(2)*j)
c0 * eye(2) + c1 * A
logm(A)
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
    0 0 -3];
syms t
b0 = 3*exp(-t) - 3*exp(-2*t) + exp(-3*t);
b1 = 5*exp(-t)/2 - 4*exp(-2*t) + 3*exp(-3*t)/2;
b2 = exp(-t)/2 - exp(-2*t) + exp(-3*t)/2;
b0*eye(3) + b1*A + b2 * A^2

%% Problem 6
syms s
A = [0 1 0; 0 0 1; -1 -2 -2]
resolvent = inv(s * eye(3) - A)
eAt = ilaplace(resolvent)
% Check
expm(A * t)




%% Problem 7
A = [0 1 0;
    0 0 1;
    -1 -2 -2];
B = [0 0 2]';
u = 1;
syms s
resolvent = inv(s * eye(3) - A);
eAt = ilaplace(resolvent);
eAt * B * u
syms t
syms tau
integrand = [ 2*exp(-(t - tau)) - 2*exp(-(t - tau)/2)*(cos((3^(1/2)*(t - tau))/2) - (3^(1/2)*sin((3^(1/2)*(t - tau))/2))/3)
 2*exp(-(t - tau)/2)*(cos((3^(1/2)*(t - tau))/2) + (3^(1/2)*sin((3^(1/2)*(t - tau))/2))/3) - 2*exp(-(t - tau))
                        2*exp(-(t - tau)) - (4*3^(1/2)*exp(-(t - tau)/2)*sin((3^(1/2)*(t - tau))/2))/3]

                    
forcedResponse = int(integrand, tau, 0, t)
x0 = [1 0 0]'
naturalResponse = eAt * x0
xt = naturalResponse + forcedResponse

subplot(3, 1, 1);
fplot(xt(1)); xlim([0, 15]); ylim([0.9, 2.1]); xlabel("t"); ylabel("x_1(t)"); %title("x_1(t)");
subplot(3, 1, 2);
fplot(xt(2)); xlim([0, 15]); ylim([-0.5, 0.5]); xlabel("t"); ylabel("x_2(t)");
subplot(3, 1, 3);
fplot(xt(3)); xlim([0, 15]); ylim([-0.5, 0.5]); xlabel("t"); ylabel("x_3(t)");