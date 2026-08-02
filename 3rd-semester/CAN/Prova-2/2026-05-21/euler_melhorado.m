ERRO = [0 0 0 0 0];
HS = [0 0 0 0 0];

f=@(x,y) y;

for j =1:5
    
    h=0.1^j;
    x=[0:h:1];
    y0 = 1;
    y=zeros(size(x));
    y(1) = y0;
    for i=2:size(y,2)
        K1 = f(x(i-1),y(i-1));
        K2 = f(x(i-1)+0.5*h,y(i-1)+0.5*h*K1);
        y(i)=y(i-1) + h*K2;
    end
    erro = abs(exp(1)-y(end));
    
    ERRO(j)=erro;
    Hs(j) = h;
end

LERROS = log(ERRO)
LHs = log(Hs)
DLERROS=LERROS(end)-LERROS(1)
DLHs = LHs(end) - LHs(1)
DLERROS/DLHs

plot(Hs,ERRO)