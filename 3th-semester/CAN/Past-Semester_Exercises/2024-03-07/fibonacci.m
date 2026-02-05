numero = 12;
fib = zeros(1,numero);
fib(1) = 1;
fib(2) = 1;
for i = 3:numero
    fib(i) = fib(i-1) + fib(i-2);
end
fib
plot(fib, '*')
