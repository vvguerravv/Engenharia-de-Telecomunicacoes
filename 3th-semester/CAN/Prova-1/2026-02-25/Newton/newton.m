% O valor em 'x' é o chute inicial, decidido na hora
% O valor de 'a' é o qual queremos encontrar a raiz
% Ex: Quero a raiz de 4, devo colocar 'a = 4'

F = @(x,a) x / 2+ a/ (2*x)

a = 5;
x1= 267;
error = 1;

while(error > 0.000001)
    x2 = F(x1,a);
    
    error = abs(x2-x1);
    x1=x2;
end

x1
x2