function [dx, dy, dz] = dhoi(x, y, z)
	dx = 1;
	dy = 2 * y;
	dz = 3 * power(z, 2);
end
