function zdot = full_observer_linear(t, z)

    % Process Model
    A = [-1/4, 1/4; 1/4, -5/16];
    B = [1/4; 0];
    C = [1, 0];
    
    x=[z(1); z(2)];    % process state x is upper part of z
    xhat=[z(3); z(4)]; % observer state xhat is lower part of z  
    
    % state feedback
    K = [12  112.75];
    u = -K*xhat;
    
    % Observer Gain for eigenvalue of (A-LC) placed at -2+2*j, -2-2*j
    L = [55/16; 1769/64];
    
    y = C*x;
    yhat = C * xhat;
    
    xdot = A*x + B*u;
    xhatdot = A * xhat + B*u + L*(y-yhat);
    
    zdot = [xdot; xhatdot];
end