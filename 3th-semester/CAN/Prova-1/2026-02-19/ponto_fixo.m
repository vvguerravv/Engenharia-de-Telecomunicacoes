%ṕhi = @(x) x^2 - 2
%phi = @(x) sqrt(x+2)
phi = @(x) (x + 2) / x



%%% Passo a passo:
%%% 1. Achar as funções
%%% 2. Verificar os intervalos de convergência
%%% 3. Achar as raízes

x1=5;
error = 1;

while(error > 0.000001)
    x2 = phi(x1);
    
    error = abs(x2-x1);
    x1=x2;
end

x1
x2