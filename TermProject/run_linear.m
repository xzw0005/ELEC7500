% Run simulation of the model named "linear_with_state_feedback"
tspan=[0 5];  % initial and final time
x0=[1; 0];    % initial state

[t,x]=ode45('linear_with_state_feedback',tspan,x0);  % Run the simulation

% Plot the results
plot(t,x,'linewidth',2)  % plot the state vs. time
grid       % turn on grid line
set(gca,'fontsize',16);  % make labels large!
legend('x_1','x_2')  % insert a legend
xlabel('time')    % label horizontal axis
ylabel('values')  % label vertical axos
title('Simulation of Linearized Model with State Feedback')