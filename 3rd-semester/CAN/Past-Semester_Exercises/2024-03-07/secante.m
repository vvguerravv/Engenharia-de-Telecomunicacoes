fx = @(x) x^2-3
x1 = 1;
x2 = 1.2;

gx = (fx(x2)-fx(x1))/(x2-x1);
x3 = x2 - fx(x2)/gx;

while (abs(x3-x2) > 10^-5)
  x1 = x2;
  x2 = x3;
  gx = (fx(x2)-fx(x1))/(x2-x1);
  x3 = x2 - fx(x2)/gx;
end
  
x3