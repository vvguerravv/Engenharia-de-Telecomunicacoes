% Exercício 

f = @(x) sin(x);

integral(f,0,pi)

deltas =[];
erros = [];

for n=10:5:100
    
    Dx = pi/n;
    x = [0:Dx:pi];
    size(x);

    F = f(x);
    S = F(1) + F(end);

    % Meio 2
    S = F(1) + F(end);
    for i = 2:size(x,2)-1

        if(mod(i,2) == 0) 
            S= S + 4*F(i);
        else
            S=S+2*F(i);
        end
    end
    error = S-2
    deltas=[deltas Dx];
    erros = [erros error];

end

plot(deltas,erros)
S=S*Dx/3