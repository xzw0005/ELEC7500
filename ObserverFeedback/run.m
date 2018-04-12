% Run simulation of the model named "mymodel"
tspan=[0 5];  % initial and final time
z0=[1; 0; 0; 0;];    % initial state
[t,z]=ode45('mymodel',tspan,z0);  % Run the simulation

% Plot the results
plot(t,z,'linewidth',2)  % plot the state vs. time with fat lines
grid       % turn on grid line
set(gca,'fontsize',16);  % make labels large!
legend('x_1','x_2','x_1 estimate','x_2 estimate')  % insert a legend
xlabel('time')    % label horizontal axis
ylabel('values')  % label vertical axis
title('Process and observer state responses')

% Plot estimation error in another window
figure(2)   % Open figure window 2
plot(t,z(:,1:2)-z(:,3:4),'linewidth',2)  % plot x_hat vs. time, fat lines
grid       % turn on grid line
set(gca,'fontsize',16);  % make labels large!
legend('e_1','e_2')  % insert a legend
xlabel('time')    % label horizontal axis
ylabel('values')  % label vertical axis
title('State estimation errors')

% Print plots to PDF files 
print -dpdf -f1 state_responses  % Print figure 1
print -dpdf -f2 estimation_error % Print figure 2

