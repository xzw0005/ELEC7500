function xdot = linear_with_state_feedback(t, x)

    % Process Model
    A = [-1/4, 1/4; 1/4, -5/16];
    B = [1/4; 0];
    C = [1, 0];
    
    % state feedback
    K = [12  112.75];
    u = -K*x;
    
    xdot = A*x + B*u;
end