function zdot = full_observer_nonlinear(t, z)

    x=[z(1); z(2)];    % process state x is upper part of z
    xhat=[z(3); z(4)]; % observer state xhat is lower part of z  
    
    % state feedback
    K = [12  112.75];
    u = -K*xhat;
    
    % Observer Gain for eigenvalue of (A-LC) placed at -2+2*j, -2-2*j
    L = [55/16; 1769/64];
    
    C = [1, 0];
    y = C * x;
    yhat = C * xhat;

    a1 = 4;
    a2 = 4;
    k1 = 1;
    k2 = .5;
%     xdot = zeros(2, 1);
%     xdot(1) = u/a1 - k1 / a1 * sqrt(x(1) - x(2)); 
%     xdot(2) = k1/a1*sqrt(x(1)-x(2)) - k2/a2*sqrt(x(2));
%     xhatdot = zeros(2, 1);
%     xhatdot(1) = u/a1 - k1 / a1 * sqrt(xhat(1) - xhat(2));
%     xhatdot(2) = k1/a1*sqrt(xhat(1)-xhat(2)) - k2/a2*sqrt(xhat(2));
%     xhatdot = xhatdot + L*(y-yhat);
    
    xdot = [ u/a1 - k1 / a1 * sqrt(x(1) - x(2)); k1/a1*sqrt(x(1)-x(2)) - k2/a2*sqrt(x(2))];
    xhatdot = [ u/a1 - k1 / a1 * sqrt(xhat(1) - xhat(2)); k1/a1*sqrt(xhat(1)-xhat(2)) - k2/a2*sqrt(xhat(2))] + L*(y-yhat);
    
    zdot = [xdot; xhatdot];
end