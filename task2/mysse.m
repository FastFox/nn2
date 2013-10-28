function [e] = mysse(w)
	e = power(net(0, 0, w) - 0, 2) + power(net(0, 1, w) - 1, 2)	+ power(net(1, 0, w) - 1, 2) + power(net(1, 1, w) - 0, 2);
end
