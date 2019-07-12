%Arithmetic encoder written By Yash Sachin Pawar

clc;
clear;
x=['A' 'B' 'F' 'D' 'E' 'C'];
p=[0.36 0.18 0.07 0.12 0.09 0.018];
string='ABFDACFAC';
%Encode the string using Arithmetic encoding
%   p is probablity
%   x is characters
%   string is string to encode

len = length(p);

%Sorting array x alphabetically and rearanging respective terms in array p 
[x,p] = SortA(x,p);

%Each element of psum refers to a symbol and contains sum of probabilities
%of symbols before that symbol
psum = zeros(1,len);
psum(1)=p(1);
for n=2:len
    psum(n) = psum(n-1) + p(n) ;
end

startlimit=0;
endlimit=1;
for n=1:length(string)
    
    %get mapped value of each character of string
    i = find(x==string(n));
    
    %calculating arithmetic code
    width=endlimit-startlimit;
    endlimit=startlimit+width*psum(i);
    if(i==1)
        startlimit=0;
    else
        startlimit=startlimit+width*psum(i-1);
    end 
end


disp('range start')
disp(startlimit)
disp('range end')
disp(endlimit)
val = (startlimit+endlimit)/2;
disp('value')
disp(val)
