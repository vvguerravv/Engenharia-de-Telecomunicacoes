
% Método da secante

% Chute inicial
x0 = 2;
x1 = 4;

f = @(x) 4*cos(x) - exp(x);
% df = @(A0,A1) (f(A1) - f(A0)) / (A1 - A0);
error = 1;

while(error > 0.000001)
    
%     x2 = x1 - f(x1) / df(x1,x0);

    x2 = (x0*f(x1) - f(x0)*x1)/(f(x1)-f(x0))
    
    error = abs(x2 - x1);
    
    x0 = x1;
    x1 = x2;
    
end

x0
x1
x2