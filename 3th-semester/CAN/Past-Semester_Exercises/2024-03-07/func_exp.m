fx = @(x) (1+x) * exp(x);
f = @(x)2*exp(x) + x*exp(x);
x1 = 1;
x2 = 1.2;

x3 = x2 - fx(x2)/f(x2);

while (abs(x3-x2) > 10^-5)
  x1 = x2;
  x2 = x3;
  x3 = x2 - fx(x2)/f(x2);
end
  
x3