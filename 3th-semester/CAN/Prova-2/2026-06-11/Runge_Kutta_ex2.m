f = @(x,y) cos(x)

h = 0.01;
x = [0:h:10];
y0 = 0;
y = zeros(size(x));
y(1) = y0;

for i = 2:size(y,2)

    K1 = f(x(i - 1),y(i - 1));
    K2 = f(x(i - 1) + 0.5*h, y(i - 1) + h*0.5 * K1);
    K3 = f(x(i - 1) + 0.5*h, y(i-1)+0.5*h*K2);
    K4 = f(x(i - 1) + h,y(i - 1) + h*K3);

    y(i) = y(i - 1) + (K1 + 2*K2+2*K3+K4)*h/6;

end
plot(x,y,'r*',x,sin(x),'b')

figure()

plot(x,y-(sin(x)))
