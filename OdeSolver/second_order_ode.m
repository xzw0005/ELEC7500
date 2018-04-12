function yhat = second_order_ode(t, y, A, B)
    % Original ODE: y'' = (A/B) * t * y
    % Rewrite it as
    %   y1' = y2
    %   y2' = (A/B) *t * y1
    yhat = zeros(2, 1);
    yhat(1) = y(2);
    yhat(2) = (A/B) * t .* y(1);