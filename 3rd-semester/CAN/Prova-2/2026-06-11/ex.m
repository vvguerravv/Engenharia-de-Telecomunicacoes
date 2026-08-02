close all

h = 0.1
x = [0:h:1];
yi = 0;
yf = 0;

n = size(x,2);
A = zeros(n,n);
F = zeros(n,1);

A(1,1) = 1;
A(n,n) = 1;

F(1) = yi;
F(n) = yf;

for i = 2:n-1
   
    F(i) = -2*h*h
    A(i,i-1)=1;
    A(i,i)=-2;
    A(i,i+1)=1;
    
end

Y = inv(A)*F
plot(x,Y,'r*',x,-x.*(x-1),'b')
