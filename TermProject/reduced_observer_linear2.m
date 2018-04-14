function vdot = reduced_observer_linear(t, v)

    % Process Model
    A = [-1/4, 1/4; 1/4, -5/16];
    B = [1/4; 0];
    C = [1, 0];
    A1 = A(1, 1); A2 = A(1, 2); A3 = A(2, 1); A4 = A(2, 2); 
    B1 = B(1); B2 = B(2);
    % Observer Gain for eigenvalue of (A-LC) placed at -2
    s = -2;
    L = (A4-s) / A2;
    
    x=[v(1); v(2)];    % process state x is upper part of v    
    q = v(3);
    
    y = C*x;
    zhat = q + L * y;
    xhat = [y; zhat];
    
    % state feedback
    K = [12  112.75];
    u = -K*xhat;
    
    xdot = A*x + B*u;
    qdot = (A4 - L*A2) *q + (A4*L - L*A2*L +A3 - L*A1) * y + (B2 - L*B1) * u;
    
    vdot = [xdot; qdot];
end