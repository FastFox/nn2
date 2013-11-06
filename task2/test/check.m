d = hoi(3, 4, 5)

[dx, dy, dz] = dhoi(3, 4, 5)

%x = [-1 1];
%gradchek(x, 'hoi', 'dhoi', 3, 4, 5)

x = [3 4 5];
gradchek(x, 'hoi', 'dhoi')
