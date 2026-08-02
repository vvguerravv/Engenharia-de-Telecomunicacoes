fx = @(x) x^2-3
f = @(x)2*x
x1 = 1;
x2 = 1.2;

x3 = x2 - fx(x2)/f(x2);

while (abs(x3-x2) > 10^-5)
  x1 = x2;
  x2 = x3;
  x3 = x2 - fx(x2)/f(x2);
end
  
x3