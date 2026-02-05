Vh = [];
V = [];
h = 1;

for k = 1:5
    h = h/2
end

L = 1;
n = L/h;
G = zeros(n+1,1);
G(2:n) = -2*h^2;

M = zeros(n+1,n+1);
M(1,1) = 1;
M(n+1,n+1) = 1;

for i=2:n
    M(i,i-1)=1;
    M(i,i) = -2;
    M(i,i+1) = 1;
end

S = M\G;
x = 0:h:L;

f=@(x) -x.*x+L.*x;
plot(x,S,'*',x,f(x))
