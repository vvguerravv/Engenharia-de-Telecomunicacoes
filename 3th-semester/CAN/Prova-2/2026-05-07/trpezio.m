f = @(x) sin(x);
Dx = pi/600;
x = 0:Dx:pi/2;
F = f(x);

(Dx/2)*(sum(2*F(1:end))-F(1)-F(end))
sum(F(2:end)*Dx)
sum(F(1:end-1)*Dx)