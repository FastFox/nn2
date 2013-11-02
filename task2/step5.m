more off
clear all

w = randn(power(10, 7), 6);
success = 0;


tic
for i = 1:power(10, 4) % Will take 2.5 hours
	if 	round(xornet(0, 0, w(i, :))) == 0 & ...
			round(xornet(1, 1, w(i, :))) == 0 & ... 
			round(xornet(0, 1, w(i, :))) == 1 & ...
			round(xornet(1, 0, w(i, :))) == 1
		success = success + 1;
	end
end
toc

% Four instances of matlab
% took 30 minutes
% success = 45; % = 9+12+12+12
ac = success / power(10, 7)
