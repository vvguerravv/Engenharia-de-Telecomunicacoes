A = [5 2 1;-1 4 2; 2 3 10];
b = [7;3;-1];
[m,n] = size(A);

for i = 1 : n
    b(i) = b(i)/A(i,i);
    A(i,:) = A(i,:)/A(i,i);
    A(i,i) = 0;
end

x0 = [1;1;1];
x1 = -A*x0+b;
erro = sum(abs(x1-x0)) / sum(abs(x1))

while(erro > 0.0001)
    x0 = x1;
    x1 = -A*x0+b;
    erro = sum (abs(x1-x0))/ sum(abs(x1));
end
erro
x1
A = [5 2 1;-1 4 2; 2 3 10];
A*x1