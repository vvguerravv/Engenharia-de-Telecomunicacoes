F = @(x) exp(x);
L = 5;
f0 =1;
f=[f0];
h = 0.01;
x=[0:h:L];

for i=1:L/h
    f1 = (h+1)*f0;
    f=[f f1]
    f0=f1
    
end
size(x)
size(f)
plot(x,f,'*')