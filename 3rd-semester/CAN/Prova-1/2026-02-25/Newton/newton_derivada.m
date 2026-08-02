

x1 = -5;
f = @(x) 4*cos(x) - exp(x);
df = @(x) (-1 * 4*sin(x)) - exp(x);
error = 1;

while(error > 0.000001)
    x2 = x1-f(x1)/df(x1);
    
    error = abs(x2-x1);
    x1=x2;
end

x1
x2