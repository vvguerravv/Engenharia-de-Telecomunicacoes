ERRO = [0 0 0 0 0];
HS = [0 0 0 0 0];

agas = [];
erros = [];
for j =1:5
    
    h=0.1^j;
    x=[0:h:1];
    y0 = 1;
    y=zeros(size(x));
    y(1) = y0;
    for i=2:size(y,2)
        y(i)=y(i-1)*(1+h);
    end
    erro = abs(exp(1)-y(end));
    
    ERRO(j)=erro;
    Hs(j) = h;
    
    agas = [agas h]
    erros = [erros erro]
end

ERRO
Hs
erro

plot(Hs,ERRO)
plot(agas,erros)
