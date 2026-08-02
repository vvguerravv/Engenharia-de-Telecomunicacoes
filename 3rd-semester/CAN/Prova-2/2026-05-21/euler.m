h=0.1;
x=[0:h:1];
y0 = 1;
y=zeros(size(x));
y(1) = y0
for i=2:size(y,2)
    y(i)=y(i-1)*(1+h);
end
plot(x,y,'*b',x,exp(x),'r');