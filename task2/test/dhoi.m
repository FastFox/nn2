function [d] = dhoi(x)
	d(1) = 1;
	d(2) = 2 * x(2);
	d(3) = 3 * power(x(3), 2);
end
