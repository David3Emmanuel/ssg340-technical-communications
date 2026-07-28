x = -4*pi:pi/20:4*pi;
x(x == 0) = eps; 
y = sin(x) ./ x;