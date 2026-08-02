x=[0:10];
y=3*exp(x)/5+1+rand(size(x));
plot(x,y,'*')
A =[sum(x.*x) sum(x);sum(x) size(x,2)]
B = [sum(x.*y);sum(y)]
plot(x,y);
SOL = A\B;
a = SOL(1,1);
b = SOL(2,1);
plot(x,y,'*',x,a*x+b)
