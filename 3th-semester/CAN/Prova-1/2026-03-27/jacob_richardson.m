A=[10 2 1;1 5 1; 2 3 10];
b=[7;-8;6];

[m n] = size(A);

% Chute inicial
x0 =[0;0;0];

for i=1:m
   
    b(i,:) = b(i,:)/A(i,i);
    A(i,:) = A(i,:)/A(i,i);
    A(i,i) = 0
    
end


x1 = b - A * x0;

erro = max(abs(x1-x0));

while(erro > 0.01)
    
    x0 = x1;
    x1 = b - A * x0;

    erro = max(abs(x1-x0));
    
end

A
b
x1