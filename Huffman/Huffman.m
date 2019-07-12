clc;
clear;
x=['A' 'B' 'C' 'D' 'E' 'F'];
p=[0.36 0.18 0.18 0.12 0.09 0.07];

len=length(p);
p1=p;
x1=x;

for n=1:len
    c{n} = '' ;
end

x3=zeros(len);

for j=1:len-1
    %sort p ascendingly and rearrange x accordingly
    [p,x]=SortA(p,x);
    
    %find indices of smallest 2 elements in original symbol vector
    indexs2=find(x(j+1)==x1);
    indexs1=find(x(j)==x1);
    
    %add smallest 2 nodes
    p(j+1)=p(j)+p(j+1);
    
    %find indices of elements which are leaf nodes to smallest two elements
    a=find(x3(:,indexs2)==1);
    b=find(x3(:,indexs1)==1);
    
    c(a)=strcat('1',c(a));
    c(indexs2)=strcat('1',c(indexs2));
    
    c(b)=strcat('0',c(b));
    c(indexs1)=strcat('0',c(indexs1));
    
    %combine smallest two nodes
    x3(indexs1,indexs2)=1;
    x3(:,indexs2)=x3(:,indexs2)+x3(:,indexs1);
 
    
    
end



%output display
for n=1:len
    output = [x1(n),p1(n),c(n)];
    disp(output);
end
