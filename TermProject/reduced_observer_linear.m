function vdot = reduced_observer_linear(t, v)

    % Process Model
    A = [-1/4, 1/4; 1/4, -5/16];
    B = [1/4; 0];
    C = [1, 0];
    
    x=[v(1); v(2)];    % process state x is upper part of v
    xhat=[v(3); v(4)]; % observer state xhat is lower part of z  
    
    y = C * x;
    yhat = C*xhat;
    
    Cbar = [0, 1];
    z = Cbar * x;
    zhat = Cbar * xhat;
    
    % state feedback
    K = [12  112.75];
    u = -K * [y; zhat];
    
    A1 = A(1, 1); A2 = A(1, 2); A3 = A(2, 1); A4 = A(2, 2); 
    B1 = B(1); B2 = B(2);
    
    % Observer Gain for eigenvalue of (A-LC) placed at -2
    s = -2;
    L = (A4-s) / A2;
% L=100;
    ydot = A1 * y + A2 * z + B1 * u;
    zdot = A3 * y + A4 * z + B2 * u;
    
    ydothat = A1 * y + A2 * zhat + B1 * u + L*(y-yhat);
%    zdothat = (A4 - L * A2) * zhat + (A3 - L * A1) * y + (B2 - L * B1) * u + L * ydot;
    zdothat = A3 * y + A4 * zhat + B2 * u + L * (ydot - ydothat);

    xdot = A*x + B*u;
    T = [C; Cbar];
    xhatdot = inv(T) * [ydothat; zdothat];
    
    vdot = [xdot; xhatdot];
end