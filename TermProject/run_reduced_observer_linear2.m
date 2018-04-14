% Run simulation of the model named "reduced_observer_linear"
tspan=[0 5];  % initial and final time
v0=[.1; 0; 0];    % initial state

[t,v]=ode45('reduced_observer_linear2', tspan, v0);  % Run the simulation

% Plot the results
plot(t,v,'linewidth',2)  % plot the state vs. time with fat lines
grid       % turn on grid line
set(gca,'fontsize',16);  % make labels large!
legend('\delta x_1','\delta x_2','q')
xlabel('time')    % label horizontal axis
ylabel('values')  % label vertical axis
title('Simulation of Linear Model with Recuced-Order Observer State Responses')