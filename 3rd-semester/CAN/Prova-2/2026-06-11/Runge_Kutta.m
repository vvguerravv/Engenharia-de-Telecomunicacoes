f = @(x,y) y

for j = 1 : 5
   
    h = 0.5^j;
    x = [0:h:1];
    y0 = 1;
    y = zeros(size(x));
    y(1) = y0;
    
    for i = 2:size(y,2)
       
        K1 = f(x(i - 1),y(i - 1));
        K2 = f(x(i - 1) + 0.5*h, y(i - 1) + h*0.5 * K1);
        K3 = f(x(i - 1) + 0.5*h, y(i-1)+0.5*h*K2);
        K4 = f(x(i - 1) + h,y(i - 1) + h*K3);
        
        y(i) = y(i - 1) + (K1 + 2*K2+2*K3+K4)*h/6;
        
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