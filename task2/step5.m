more off
clear all
rng('shuffle');

w = randn(power(10, 7), 6);
success = 0;

tic
for i = 1:power(10, 7)
	if 	round(xornet(0, 0, w(i, :))) == 0 & ...
		round(xornet(1, 1, w(i, :))) == 0 & ... 
		round(xornet(0, 1, w(i, :))) == 1 & ...
		round(xornet(1, 0, w(i, :))) == 1
			success = success + 1;
	end
end
toc

ac = success / power(10, 7)
