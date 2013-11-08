function [d] = mysse(w)
	d = power(xornet(0, 0, w) - 0, 2) + power(xornet(0, 1, w) - 1, 2)	+ power(xornet(1, 0, w) - 1, 2) + power(xornet(1, 1, w) - 0, 2);
end
