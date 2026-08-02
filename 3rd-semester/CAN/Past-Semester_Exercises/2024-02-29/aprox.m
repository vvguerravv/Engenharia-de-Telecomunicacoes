f = @(x)sin(x);
a = 2;
b = 4;
x = (a + b)/2
fa = f(a);
fb = f(b);
fx = f(x);
[a b x; fa fb fx]
if(fa * fb < 0)
    while(abs(a - b) > 0.0001)
        x = (a + b)/2
        fx = f(x);
   
        if(fa > 0 && fb < 0 && fx > 0)
            a = x;
        elseif(fa > 0 && fb < 0 && fx < 0 )
            b = x;
        elseif(fa < 0 && fb > 0 && fx < 0 )
            a = x;
        elseif(fa < 0 && fb > 0 && fx > 0)
            b = x;
        end
        fa = f(a);
        fb = f(b);
    end
end
