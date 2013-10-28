function [r] = phiprime(v, alpha)
	r = arrayfun(@(v, alpha) phi(v, alpha) * (1 - phi(v, alpha)), v, alpha);
end
