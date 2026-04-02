% Método de Newton ( Utilizado para Matrizes de N dimensões)

F = @(x,y) [x^2 - y + 1; y^2 - x + 3];
J = @(x,y) [2*x, -1; -1, 2*y]; % O Jacobiano é a matriz onde temos a derivada 
% Da F1 em relação a x e a derivada de F1 em relação a y na linha 1, e
% assim vai

F
J

X0 = [1;0];

x = X0(1);
y = X0(2);

X= X0 - J(x,y) \ F(x,y);

error = sum(abs(X - X0));

while (error > 0.001)
    
    X0 = X;
    x = X0(1);
    y = X0(2);

    X= X0 - inv(J(x,y)) * F(x,y);
    
    error = sum(abs(X - X0))
end

X