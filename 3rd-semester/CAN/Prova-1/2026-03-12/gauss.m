A = [2 -3 1;4 -6 -1;1 2 1];
B = [-5;-7;4];
M = [A B];

[l c] = size(A);


% Passo 1: Zerar os valores abaixo da diagonal
for j=1:c-1
    
    maior = max(abs(M(j:end,j)));
    LinhaPermuta = j-1 + find(M(j:end,j) == maior);
    
    aux = M(j,:);
    M(j,:) = M(LinhaPermuta,:);
    M(LinhaPermuta,:) = aux;
    
    for i = j+1:l
        a = M(i,j) / M(j,j);
        M(i,:) = M(i,:) - (a) * M(j,:);
    end
    
end
    

% Passo 2: Deixar todas as diagonais igual a 1 (Dividir cada linha pelo
% valor da sua diagonal)
for i=1:l
   
    M(i,:) = M(i,:) / M(i,i);
    
end


% Passo 3: Chegar nos resultados das variáveis

for i = l-1:-1:1
    
    s=0;
    for j=l:-1:i+1
        
       s = s+M(j,c + 1) * M(i,j);
       
    end
    M(i,c+1) = M(i, c+1) - s;
    
end

solucao = M(:,c+1)