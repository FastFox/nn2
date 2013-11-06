% Random vs Neural Network
z = 0;
trials = 0;
tic
while z == 0
	w = randn(1, 6);
	z = round(xornet(0, 0, w)) == 0 & ...
			round(xornet(1, 1, w)) == 0 & ... 
			round(xornet(0, 1, w)) == 1 & ...
			round(xornet(1, 0, w)) == 1;
	trials = trials + 1;
	if mod(trials, 1000) == 0
		trials
	end
end
toc
