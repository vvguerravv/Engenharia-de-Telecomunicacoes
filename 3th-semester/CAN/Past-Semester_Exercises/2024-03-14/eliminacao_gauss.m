% mat1 = [1 4 2;-1 0 3;1 -2 1];
% matsol= [17;11;1];
% [m,n] = size(mat1);
% sol = zeros(size(matsol));
% 
% 
% 
% for j = 1:n-1
%     for i = j + 1:m
%         pivo = mat1(i,j) / mat1(j,j);
%         mat1(i,:) = mat1(i,:) - mat1(j,:) * pivo;
%         matsol(i,:) = matsol(i,:) - matsol(j,:) * pivo;
%     end
% end
% 
% for i=1:n
%    matsol(i) = matsol(i) / mat1(i,i);
%    mat1(1,:) = mat1(1,:) / mat1(i,i);
% end
% 
% for i = n-1 :-1: 1
%     soma = 0;
%     for j= i + 1 : m
%         soma = soma+mat1(i,j) * matsol(j);
%     end
%     matsol(i) = matsol(i) - soma;
% end


% SISTEMA
% {X  + 4Y  + 2Z = 17}
% {-X + 0   + 3Z = 11}
% {X  + -2Y + Z  = 1 }

matP = [1 4 2; -1 0 3; 1 -2 1];
vetP = [17; 11; 1];
vetSol = zeros(size(vetP));

[m,n] = size(matP);

for j = 1 : n - 1
	for i = j + 1: m
    	pivo = matP(i,j)/matP(j,j)
    	matP(i,:) = matP(i,:) - matP(j,:) * pivo
    	vetP(i,:) = vetP(i,:) - vetP(j,:) * pivo
	end
end

for i = 1 : n
	vetP(i,:) = vetP(i,:)/matP(i,i)
	matP(i,:) = matP(i,:)/matP(i,i)
end    

for i = n - 1: -1 :1
	soma = 0;
   for j = i + 1:m
 	soma = soma + matP(i, j) * vetP(j)
   end
   vetP(i) = vetP(i) - soma
end


    