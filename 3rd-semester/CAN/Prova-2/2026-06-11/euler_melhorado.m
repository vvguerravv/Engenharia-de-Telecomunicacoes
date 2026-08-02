f = @(x,y) 

for j = 1 : 5
   
    h = 0.1^j;
    x = [0:h:1];
    y0 = 1;
    y = zeros(size(x));
    y(1) = y0;
    
    for i = 2:size(y,2)
       
        K1 = f(x(i - 1),y(i - 1));
        K2 = f(x(i - 1) + h, y(i - 1) + h * K1);
        
        y(i) = y(i - 1) + (K1 + K2)*h/2;
        
    end
    
    erro = abs(exp(1) - y(end));
    
    ERRO(j) = erro;
    Hs(j) = h;
    
end

Lerros = log(ERRO)
LHs = log(Hs)
DLerros = Lerros(end) - Lerros(1)
DLhs = LHs(end) - LHs(1)
DLerros/DLhs