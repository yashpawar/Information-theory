%Shannon Fano encoder(display) written By Yash Sachin Pawar
clc;
clear;
x=['A' 'B' 'C' 'D' 'E' 'F'];
p=[0.36 0.18 0.18 0.12 0.09 0.07];

len=length(p);

for n=1:len
    c{n} = '' ;
end

%Sort probabilities descendingly and rearrange respective sysmbols
[p,x]=SortD(p,x);

c=shannon(1,len,p,c);

%output
for n=1:len
    output = [x(n),p(n),c(n)];
    disp(output);
end