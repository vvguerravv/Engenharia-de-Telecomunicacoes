F = @(x) [x(1)^2 + x(2)^2 - 2; x(2) - x(1)];
J = @(x) [2*x(1) 2*x(2);-1 1];
x1 = [1;0]

x2 = x1 - inv(J(x1))*F(x1);


while (sum(abs(x2-x1) > 10^-5))
  x1 = x2;
  x2 = x1 - inv(J(x1))*F(x1);
end
  
x2