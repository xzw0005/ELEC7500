function xdot = nonlinear_with_state_feedback(t, x)
    a1 = 4;
    a2 = 4;
    k1 = 1;
    k2 = .5;
    
    % state feedback
    K = [12  112.75];
    u = -K*x;
    
    xdot = zeros(2, 1);
    xdot(1) = u/a1 - k1 / a1 * sqrt(x(1) - x(2));
    xdot(2) = k1/a1*sqrt(x(1)-x(2)) - k2/a2*sqrt(x(2));
end