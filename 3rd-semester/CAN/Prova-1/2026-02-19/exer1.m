phi1 = @(x) log(4) + log(x);
phi2 = @(x) exp(x) / 4;

x1 = 0.5;
error = 1;

while(error > 0.0001)
   x2 = phi2(x1);
   
   error = abs(x2-x1);
   x1 = x2;
end

x2
x1