function [r] = phi(v, alpha)
	r = arrayfun(@(v, alpha) 1 / (1 + power(e, -alpha*v)), v, alpha);
end
