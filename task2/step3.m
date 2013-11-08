%gradchek(x, 'rosen', 'rosegrad')

%gradchek(x, 'mysse', 'dmysse');

% What should x be? and dmysse is not implemented

%w = [2.1074 2.8222 0.2439 1.1828 3.5656 -4.3965]; % Weights for solving xor
w = randn(1, 6);

gradchek(w, 'mysse', 'dmysse');
