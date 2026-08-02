D = 0.000001;
x =-2:D:3;
f = @(x) x.*x;
F = f(x);
n = size(x,2);
V = ones(1,n);
V(2:2:n)=4;
V(3:2:n-1) = 2;

integral = sum(D*F.*V/3)