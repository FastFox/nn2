% net function
more off;
alpha = 0.01;

input = [0, 0; 0, 1; 1, 0; 1, 1];
target = [0, 1, 1, 0];
w = randn(1, 6); % w1, w2, v1, v2, u1, u2
w1 = w(1);
w2 = w(2);
v1 = w(3);
v2 = w(4);
u1 = w(5);
u2 = w(6);
x = input(1, :);
d = target(1);
x1 = x(1);
x2 = x(2);
%y = net(x(1), x(2), w);
%mysse(w)

for i = 1:100
	t = randi(4, 1, 1);
	x1 = input(t, 1);
	x2 = input(t, 2);
	d = target(t);

	net1 = w1*x1 + w2*x2; y1 = phi(net1, alpha);
	net2 = v1*x1 + v2*x2; y2 = phi(net2, alpha);
	net = y1*u1 + y2*u2; y = phi(net, alpha);

	du1 = (y - d) * phiprime(net, alpha) * y1;
	du2 = (y - d) * phiprime(net, alpha) * y2;

	dw1 = (y - d) * phiprime(net, alpha) * u1 * phiprime(net1, alpha) * x1;
	dw2 = (y - d) * phiprime(net, alpha) * u1 * phiprime(net1, alpha) * x2;

	dv1 = (y - d) * phiprime(net, alpha) * u2 * phiprime(net2, alpha) * x1;
	dv2 = (y - d) * phiprime(net, alpha) * u2 * phiprime(net2, alpha) * x2;

	u1 = u1 + du1;
	u2 = u2 + du2;

	w1 = w1 + dw1;
	w2 = w2 + dw2;

	v1 = v1 + dv1;
	v2 = v2 + dv2;

	mysse([w1, w2, v1, v2, u1, u2])
end
	
%mysse([w1, w2, v1, v2, u1, u2])


if false
alpha = 0.1;
beta = 1;
momentum = 1;

x = zeros(1, 2);
w = zeros(1, 6); % w1, w2, v1, v2, u1, u2
y = zeros(1, 3); % nodes
%w = [1, -1, 1, -1, 1, 1];
w = randn(1, 6);
x = [0, 0];

g = @(x) 1 / (1 + exp(-beta*x));
gp = @(x) beta*g(x) * (1 - g(x));


%Error loss, t = target, y = prediction
%loss = @(t, y) = 0.5 * power( sum(t - y), 2);

for i = 1:10000
	%t = 4;
	%t = (1 + (4-1)) * rand(1, 1)
	t = randi(4, 1, 1);
	x = input(t, :);
	% Calculate values of the nodes
	y(1) = x(1)*w(1) + x(2)*w(2);
	y(2) = x(1)*w(3) + x(2)*w(4);
	y(3) = y(1)*w(5) + y(2)*w(6);

	% Update weights from hidden to output

	%w(5) = w(5) + alpha*y(1)*(target(t) - y(3))*gp(y(3));
	%w(6) = w(6) + alpha*y(2)*(target(t) - y(3))*gp(y(3));

	% Update weights from inputs to hidden
	%w(1) = w(1) + alpha * x(1) * gp(y(1)) * w(5) * (target(t) - y(3)) * gp(y(3));
	%w(2) = w(2) + alpha * x(2) * gp(y(2)) * w(6) * (target(t) - y(3)) * gp(y(3));

end

for t = 1:4
	x = input(t, :);
	y(1) = x(1)*w(1) + x(2)*w(2);
	y(2) = x(1)*w(3) + x(2)*w(4);
	y(3) = y(1)*w(5) + y(2)*w(6);

	round(y(3))
	%target(t)
end

%y = (x(1)*w(1) + x(2)*w(2))*w(5) + (x(1)*w(3) + x(2)*w(4))*w(6)

end % false
