function [d] = dmysse(w)
  d = zeros(1, 6);

  input = [0, 0; 0, 1; 1, 0; 1, 1];
  target = [0, 1, 1, 0];

  for i = 1:4
    net1 = w(1) * input(i, 1) + w(2) * input(i, 2);
	 	y1 = phi(net1);
    net2 = w(3) * input(i, 1) + w(4) * input(i, 2);
	 	y2 = phi(net2);
    net = w(5) * y1 + w(6) * y2; 
		y = phi(net);

    d(1) = d(1) + (y - target(i)) * phiprime(net) * w(5) * phiprime(net1) * input(i, 1);
    d(2) = d(2) + (y - target(i)) * phiprime(net) * w(5) * phiprime(net1) * input(i, 2);
    d(3) = d(3) + (y - target(i)) * phiprime(net) * w(6) * phiprime(net2) * input(i, 1);
    d(4) = d(4) + (y - target(i)) * phiprime(net) * w(6) * phiprime(net2) * input(i, 2);
    d(5) = d(5) + (y - target(i)) * phiprime(net) * y1;
    d(6) = d(6) + (y - target(i)) * phiprime(net) * y2;
  end
  d = d * 2;
end
