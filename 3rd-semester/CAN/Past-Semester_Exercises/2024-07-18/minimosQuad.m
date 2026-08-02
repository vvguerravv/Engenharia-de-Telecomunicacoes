x = [-1:0.1:1];
y = 3.*x.^2 + 2*x + 1+ rand(size(x))
y = [ 3.0329 2.6837 1.5760 1.2579 1.6123 0.8688 1.2214 1.2093 1.5851 1.3159 1.3935 1.9024 2.2653 2.3991 2.6437 2.9250 3.9021 4.1811 4.6285 6.0659 6.3428]

A = [sum(x.^4) sum(x.^3) sum(x.*x);
    sum(x.^3) sum(x.*x) sum(x);
    sum(x.*x) sum(x) size(x,2)]
B = [sum(x.^2.*y); sum(x.*y); sum(y)]
SOL = A\B;
a = SOL(1,1)
b = SOL(2,1)
c = SOL(3,1)

erro = sum((a*x.^2+b*x+c - y).*(a*x.^2+b*x+c - y))

a = 3.1;
erro1 = sum((a*x.^2+b*x+c - y).*(a*x.^2+b*x+c - y))

plot(x,y,'*',x,a*x.^2+b*x+c)

%Método minimos quadrados
