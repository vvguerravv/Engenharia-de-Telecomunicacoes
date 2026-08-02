s = 0
s_ant = 0
error = 1
i=0
while(error > 0.001)
    
    a = ((-1)^i)/(2*i+1);
    s = s + a;
    error = abs(s - s_ant)/ abs(s);
    s_ant = s;
    i = i + 1;
end

ValPI=4*s