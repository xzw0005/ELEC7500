function vdot = reduced_observer_nonlinear(t, v)

    x=[v(1); v(2)];    % process state x is upper part of z
    xhat=[v(3); v(4)]; % observer state xhat is lower part of z  
    
    % Process Model
    A = [-1/4, 1/4; 1/4, -5/16];
    B = [1/4; 0];
    A1 = A(1, 1); A2 = A(1, 2); A3 = A(2, 1); A4 = A(2, 2); 
    B1 = B(1); B2 = B(2);
    % Observer Gain for eigenvalue of (A-LC) placed at -2
    s = -2;
    L = (A4-s) / A2; 
    % state feedback
    K = [12  112.75];
    u = -K*xhat;

    
    C = [1, 0];
    y = C * x;
    yhat = C * xhat;
    
    Cbar = [0, 1];
    z = Cbar * x;
    zhat = Cbar * xhat;
    
    a1 = 4;     a2 = 4;    k1 = 1;    k2 = .5;

    zdot = k1/a1*sqrt(y-z) - k2/a2*sqrt(z);
    ydot = u/a1 - k1 / a1 * sqrt(y-z);
    
    yhatdot = u/a1 - k1 / a1 * sqrt(xhat(1) - xhat(2)) + L*(y-yhat);; 
    zhatdot = k1/a1*sqrt(xhat(1)-xhat(2)) - k2/a2*sqrt(xhat(2)) + L*(ydot-yhatdot);

    
    xdot = [ u/a1 - k1 / a1 * sqrt(x(1) - x(2)); k1/a1*sqrt(x(1)-x(2)) - k2/a2*sqrt(x(2))];
    xhatdot = [yhatdot; zhatdot];
    
    vdot = [xdot; xhatdot];
    
end