% net function
disp('net')

input = [0, 0; 0, 1; 1, 0; 1, 1];
target = [0, 1, 1, 0];


alpha = 0.1;
beta = 1;

x = zeros(1, 2);
w = zeros(1, 6); % w1, w2, v1, v2, u1, u2
y = zeros(1, 3); % nodes
w = [1, -1, 1, -1, 1, 1];
x = [0, 0];

g = @(x) 1 / (1 + exp(-beta*x));
gp = @(x) beta*g(x) * (1 - g(x));

i = 0;

% Calculate values of the nodes
y(1) = x(1)*w(1) + x(2)*w(2);
y(2) = x(1)*w(3) + x(2)*w(4);
y(3) = y(1)*w(5) + y(2)*w(6);

y

% Update weights from hidden to output
%w(5) = w(5) + alpha*y(1)*(target(i) - y(3))*gp(y(3));
%w(6) = w(6) + alpha*y(2)*(target(i) - y(3))*gp(y(3));

% Update weights from inputs to hidden
%w(1) = w(1) + alpha*input(i, 1)*gp(


%y = (x(1)*w(1) + x(2)*w(2))*w(5) + (x(1)*w(3) + x(2)*w(4))*w(6)




