fn = 15;
vet = [fn];

while(fn ~= 1)
    if(mod(fn,2) == 0)
        fn = fn/2;
    else
        fn = 3*fn + 1;
    end
    vet = [vet fn];
end

vet
plot(vet,'*')
