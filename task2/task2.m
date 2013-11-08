% net function
more off;
clear all;
%alpha = 1; % Defined in alpha.m
etha = 0.01; % Learning rate

% Random seed

input = [0, 0; 0, 1; 1, 0; 1, 1];
%input = [-1, -1; -1, 1; 1, -1; 1, 1];
target = [0, 1, 1, 0];
%target = [-1, 1, 1, -1];
w = randn(1, 6); % w1, w2, v1, v2, u1, u2
%w1 = w(1);
%w2 = w(2);
%v1 = w(3);
%v2 = w(4);
%u1 = w(5);
%u2 = w(6);
%x = input(1, :);
%d = target(1);
%x1 = x(1);
%x2 = x(2);
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
		net1 = w(1) * input(t, 1) + w(2) * input(t, 2); y1 = phi(net1);
		net2 = w(3) * input(t, 1) + w(4)* input(t, 2); y2 = phi(net2);
		net = y1 * w(5) + y2 * w(6); y = phi(net);


		du1 = - etha * ( (y - target(t)) * phiprime(net) * y1 );
		du2 = - etha * ( (y - target(t)) * phiprime(net) * y2 );

		dw1 = - etha * ( (y - target(t)) * phiprime(net) * w(5) * phiprime(net1) * input(t, 1) );
		dw2 = - etha * ( (y - target(t)) * phiprime(net) * w(6) * phiprime(net1) * input(t, 2) );

		dv1 = - etha * ( (y - target(t)) * phiprime(net) * w(5) * phiprime(net2) * input(t, 1) );
		dv2 = - etha * ( (y - target(t)) * phiprime(net) * w(6) * phiprime(net2) * input(t, 2) );

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

	i = i + 1;
	if mod(i, 1000) == 0
		i
	end
end

xornet(0, 0, w)
xornet(1, 1, w)
xornet(1, 0, w)
xornet(0, 1, w)
trials = i
w
toc
