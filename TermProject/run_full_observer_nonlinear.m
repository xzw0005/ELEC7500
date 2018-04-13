% Run simulation of the model named "full_observer_linear"
tspan=[0 15];  % initial and final time
z0=[.1; .1; 0; 0];    % initial state

[t,z]=ode45('full_observer_nonlinear', tspan, z0);  % Run the simulation

% Plot the results
plot(t,z,'linewidth',2)  % plot the state vs. time with fat lines
grid       % turn on grid line
set(gca,'fontsize',16);  % make labels large!
legend('\delta x_1','\delta x_2','\delta x_1 estimate','\delta x_2 estimate')  % insert a legend
xlabel('time')    % label horizontal axis
ylabel('values')  % label vertical axis
title('Simulation of Nonlinear Model with Full-Order Observer State Responses')

% Plot estimation error in another window
figure(2)   % Open figure window 2
plot(t,z(:,1:2)-z(:,3:4),'linewidth',2)  % plot x_hat vs. time, fat lines
grid       % turn on grid line
set(gca,'fontsize',16);  % make labels large!
legend('\delta e_1','\delta e_2')  % insert a legend
xlabel('time')    % label horizontal axis
ylabel('values')  % label vertical axis
title('Estimation Errors of Nonlinear Model with Full-Order Observer State Responses')