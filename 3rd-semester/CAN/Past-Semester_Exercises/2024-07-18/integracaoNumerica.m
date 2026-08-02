Dx = 0.1;
f = @(x) x;
x = [0:Dx:1];
y=f(x);
integral = sum(Dx*y)