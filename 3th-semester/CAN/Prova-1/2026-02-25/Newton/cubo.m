a = 27
x1 =-2
f = @(x) 4*cos(x) - exp(x);
df = @(x) (-1 * 4*sin(x)) - exp(x);
error = 1;

while(error > 0.01)
    x2 = (2*x1+ a/ (x1*x1)) / 3
    
    error = abs(x2-x1);
    x1=x2;
end

x1
x2