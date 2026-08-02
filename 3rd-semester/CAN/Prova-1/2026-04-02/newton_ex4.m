% Método de Newton ( Utilizado para Matrizes de N dimensões)

F = @(x,y,z) [x+9*y^2+3*z^2-100;x^2+y^2-3;x+y+z-1];
J = @(x,y,z) [1,18*y,6*z;2*x,2*y,0;1,1,1;]; % O Jacobiano é a matriz onde temos a derivada 
% Da F1 em relação a x e a derivada de F1 em relação a y na linha 1, e
% assim vai

F
J

X0 = [1;1;1];

x = X0(1);
y = X0(2);
z = X0(3);


X= X0 - inv(J(x,y,z)) * F(x,y,z);

error = sum(abs(X - X0))

while (error > 0.001)
    
    X0 = X;
    x = X0(1);
    y = X0(2);
    z = X0(3);

    X= X0 - inv(J(x,y,z)) * F(x,y,z);
    
    error = sum(abs(X - X0));
end

X