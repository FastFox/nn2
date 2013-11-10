function [y] = xornet(x1, x2, w)
	net1 = w(1) * x1 + w(2) * x2;
 	y1 = phi(net1);
	net2 = w(3) * x1 + w(4) * x2;
 	y2 = phi(net2);
	net = w(5) * y1 + w(6) * y2;
 	y = phi(net);
end
