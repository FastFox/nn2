%function [net1, net2, net3, y1, y2, y3] = net(x1, x2, w, alpha)
function [y] = xornet(x1, x2, w)
	net1 = w(1)*x1 + w(2)*x2; y1 = phi(net1);
	net2 = w(3)*x1 + w(4)*x2; y2 = phi(net2);
	net = y1*w(5) + y2*w(6); y = phi(net);

  %y1 = x1*w(1) + x2*w(2);
	%y2 = x1*w(3) + x2*w(4);
	%y3 = y1*w(5) + y2*w(6);
	
	% Activation function
	%if y3 > 0
	%	y3 = 1;
	%else
	%	y3 = -1;
	%end
	%y3 = y3 > 0;
end
