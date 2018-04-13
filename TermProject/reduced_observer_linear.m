function vdot = reduced_observer_linear(t, v)

    % Process Model
    A = [-1/4, 1/4; 1/4, -5/16];
    B = [1/4; 0];
    C = [1, 0];
    
    x=[v(1); v(2)];    % process state x is upper part of v
    xhat=[v(3); v(4)]; % observer state xhat is lower part of z  
    
    Cbar = [0, 1];
    zhat = Cbar * xhat;
    
    % state feedback
    K = [12  112.75];
    u = -K*xhat;
       
    y = C*x;
    z = Cbar * x;
    
    A1 = -1/4;
    A2 = 1/4;
    A3 = 1/4;
    A4 = -5/16;
    B1 = 1/4;
    B2 = 0;
    % Observer Gain for eigenvalue of (A-LC) placed at -2
    s = -2
    L = (A4-s) / A2
    
    ydot = A1 * y + A2 * z + B1 * u;
    zdot = A3 * y + A4 * z + B2 * u;
    
    ydothat = A1 * y + A2 * zhat + B1 * u;
    zdothat = (A4 - L * A2) * zhat + (A3 - L * A1) * y + (B2 - L * B1) * u + L * ydot;
    
    xdot = A*x + B*u;
    T = [C; Cbar];
    xhatdot = inv(T) * [ydothat; zdothat];
    
    vdot = [xdot; xhatdot];
end