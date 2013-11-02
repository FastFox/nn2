function [r] = loss(v, t, y)
	r = 0.5*sum(power(t - y), 2);
end
