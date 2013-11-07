% What does a gradient mean from mysse? There are 6 inputs, the weights. So the outputs should be 6 derivates from the formula myssee.
% u1, du2, dw1, dw2, dv1, dv2 are the derivatives. Should they summed up or something? How to use them with gradchek 
% There are 6 derivates for every combination of x' and mysse is taking them all in account. 

function [d] = dmysse(w)
  d = 0;  

  input = [0, 0; 0, 1; 1, 0; 1, 1];
  target = [0, 1, 1, 0];

  %for i = 1:4
	i = 1;
    x1 = input(i, 1);
    x2 = input(i, 2);
    d = target(i);

    net1 = w(1)*x1 + w(2)*x2; y1 = phi(net1);
    net2 = w(3)*x1 + w(4)*x2; y2 = phi(net2);
    net = y1*w(5) + y2*w(6); y = phi(net);

    du1 = (y - d) * phiprime(net) * y1;
    du2 = (y - d) * phiprime(net) * y2;

    dw1 = (y - d) * phiprime(net) * u1 * phiprime(net1) * x1;
    dw2 = (y - d) * phiprime(net) * u1 * phiprime(net1) * x2;

    dv1 = (y - d) * phiprime(net) * u2 * phiprime(net2) * x1;
    dv2 = (y - d) * phiprime(net) * u2 * phiprime(net2) * x2;

   	 
    
  %end

end


