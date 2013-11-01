function [r] = phi(v)
	r = arrayfun(@(v) 1 / (1 + exp(-alpha() * v)), v);
end
