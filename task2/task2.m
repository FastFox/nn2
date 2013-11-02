% net function
more off;
clear all;
%alpha = 1; % Defined in alpha.m
etha = 0.1;

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

success = 0;
fail = 0;

z = 0;
i = 1;
%for i = 1:1
tic
while z == 0
	t = mod(i, 4) + 1;
	%for t = 1:4
		%t = randi(4, 1, 1);

		%x1 = input(t, 1);
		%x2 = input(t, 2);
		%d = target(t);

		%net1 = w1*x1 + w2*x2; y1 = phi(net1);
		%net2 = v1*x1 + v2*x2; y2 = phi(net2);
		%net = y1*u1 + y2*u2; y = phi(net);
		net1 = w(1)*input(t, 1) + w(2)*input(t, 2); y1 = phi(net1);
		net2 = w(3)*input(t, 1) + w(4)*input(t, 2); y2 = phi(net2);
		net = y1*w(5) + y2*w(6); y = phi(net);

		%x1
		%x2 
		%w
		%alpha
		%[net1, net2, net3, y1, y2, y3] = net(x1, x2, w, alpha);
		%net(x1, x2, w, alpha);

		du1 = - etha * ( (y - target(t)) * phiprime(net) * y1 );
		du2 = - etha * ( (y - target(t)) * phiprime(net) * y2 );

		dw1 = - etha * ( (y - target(t)) * phiprime(net) * u1 * phiprime(net1) * input(t, 1) );
		dw2 = - etha * ( (y - target(t)) * phiprime(net) * u1 * phiprime(net1) * input(t, 2) );

		dv1 = - etha * ( (y - target(t)) * phiprime(net) * u2 * phiprime(net2) * input(t, 1) );
		dv2 = - etha * ( (y - target(t)) * phiprime(net) * u2 * phiprime(net2) * input(t, 2) );

		%u1 = u1 + du1;
		%u2 = u2 + du2;

		%w1 = w1 + dw1;
		%w2 = w2 + dw2;

		%v1 = v1 + dv1;
		%v2 = v2 + dv2;

		w(5) = w(5) + du1;
		w(6) = w(6) + du2;

		w(1) = w(1) + dw1;
		w(2) = w(2) + dw2;

		w(3) = w(3) + dv1;
		w(4) = w(4) + dv2;

	 %mysse(w)
		%mysse([w1, w2, v1, v2, u1, u2])
		%bla
		%w1, w2, v1, v2, u1, u2

	%end

	%xornet(0, 0, w)
	%xornet(1, 1, w)
	%xornet(1, 0, w)
	%xornet(0, 1, w)
	z = round(xornet(0, 0, w)) == 0 & ...
			round(xornet(1, 1, w)) == 0 & ... 
		 	round(xornet(0, 1, w)) == 1 & ...
			round(xornet(1, 0, w)) == 1;
	%if z == 1
	%	success = success + 1;
	%else
	%	fail = fail + 1;
	%end
	i = i + 1;
	if mod(i, 1000) == 0
		i
	end
end
%success
%fail
xornet(0, 0, w)
xornet(1, 1, w)
xornet(1, 0, w)
xornet(0, 1, w)
toc
%ac = success / (success + fail)

%/*

	%net1 = w1*x1 + w2*x2; y1 = phi(net1, alpha);
	%net2 = v1*x1 + v2*x2; y2 = phi(net2, alpha);
	%net = y1*u1 + y2*u2; y = phi(net, alpha);

%du1 = (y - d) * phiprime(net, alpha) * y1;
%	du2 = (y - d) * phiprime(net, alpha) * y2;

%	dw1 = (y - d) * phiprime(net, alpha) * u1 * phiprime(net1, alpha) * x1;
%	dw2 = (y - d) * phiprime(net, alpha) * u1 * phiprime(net1, alpha) * x2;

%	dv1 = (y - d) * phiprime(net, alpha) * u2 * phiprime(net2, alpha) * x1;
%	dv2 = (y - d) * phiprime(net, alpha) * u2 * phiprime(net2, alpha) * x2;

%for 4 cases 

%
	
%mysse([w1, w2, v1, v2, u1, u2])
