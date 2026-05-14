% Exercício 4 da prova 2 dada pelo professor

f = @(x) (exp(-0.5 * x.*x))/sqrt(2*pi);
Dx = 0.1;
x = [-1:Dx:1];
size(x);

integral(f,-1,1)

F = f(x);
S = F(1) + F(end);

% Meio 1
for i=2:2:size(x,2)
   S=S+4*F(i); 
end

for i=3:2:size(x,2)-1
   S = S + 2 * F(i);
end

S=S*Dx/3

% Meio 2
S = F(1) + F(end);
for i = 2:size(x,2)-1
    
    if(mod(i,2) == 0) 
        S= S + 4*F(i);
    else
        S=S+2*F(i);
        
    end
end

S=S*Dx/3