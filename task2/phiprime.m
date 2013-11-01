function [r] = phiprime(v)
	r = arrayfun(@(v) phi(v) * (1 - phi(v)), v);
end
