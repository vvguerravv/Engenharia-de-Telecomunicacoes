f = @(x) x.*x.*x
Dx = 0.1;
x = [0:Dx:1];
size(x)

F = f(x)
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
S = F(1) + F(end)
for i = 2:size(x,2)-1
    
    if(mod(i,2) == 0) 
        S= S + 4*F(i);
    else
        S=S+2*F(i);
        
    end
end

S=S*Dx/3