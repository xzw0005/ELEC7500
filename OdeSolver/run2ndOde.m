tspan = [0, 5];
A=1;
B=2;
y0 = [0 .01];
[t, y] = ode45(@(t, y) second_order_ode(t, y, A, B), tspan, y0);

plot(t, y(:, 1), '-o', t, y(:, 2), '-.')
