% These are the model equations for a control system
% under observer state feedback.

function zdot=mymodel(t,z)
% Process model
A=[0 1; 1 0];  % inverted pendulum system matrix
B=[0; 1];   % input matrix
C=[1 0];   % output matrix

% Define process state x and observer state xhat in terms
%  of the model state z
x=[z(1); z(2)];    % process state x is upper part of z
xhat=[z(3); z(4)]; % observer state xhat is lower part of z

% Observer state feedback
K=[7 5];   % Eigenvalues of (A-BK) placed at -2, -3
u = -K*xhat;  % multiplies the observer state (estimated x)

% Observer gain for eigenvalues of (A-LC) placed at -2, -3
L=[5; 7]; 

% Define other variables
y=C*x;   % process output
yhat=C*xhat;   % observer output

% The state equations for the process and observer
  xdot= A*x + B*u;
  xhatdot= A*xhat + B*u + L*(y - yhat);
  % return model state to the ODE solver
  zdot=[xdot; xhatdot];
end