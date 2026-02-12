f= @(x) x^2 + 2*x - 2;
a = -2;
b = -3;
error = 1;

while (error > 10^-4);
    
    x = (a+b) / 2;

    if(f(a) < 0 && f(b) > 0 && f(x) < 0)
        a = x;
    end

    if(f(a) < 0 && f(b) > 0 && f(x) > 0)
        b=x;
    end
    
    error = abs(b - a);
    
    x = (a+b) / 2;

    if(f(a) > 0 && f(b) < 0 && f(x) < 0)
        b = x;
    end

    if(f(a) > 0 && f(b) < 0 && f(x) > 0)
        a=x;
    end
    
end




