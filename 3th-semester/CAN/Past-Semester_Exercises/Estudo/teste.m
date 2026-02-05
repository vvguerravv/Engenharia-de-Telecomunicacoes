A=[6. 2 -1 7;2 4 1 7;3 2 8 13];
[n,m]=size(A);
A
n
m
for j=1:m-2
for i=j+1:n
K=A(i,j)/A(j,j);
A(i,:)=A(i,:)-K*A(j,:);
end
end
for j=m-1:-1:2
for i=j-1:-1:1
K=A(i,j)/A(j,j);
A(i,:)=A(i,:)-K*A(j,:);
end
end
for i=1:m-1
A(i,:)=A(i,:)/A(i,i);
end
X=A(:,4)