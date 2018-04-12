% These are the model equations

function xdot=mymodel(t,x)
% State feedback
K=[2 3];
u = -K*x;

% The state equations for the model
% x1_dot = x2
% x2_dot = -x1 + u
  xdot= [x(2);          % first equation
         -x(1) + u];    % the second eqn
end