%Sort function written By Yash Sachin Pawar
%Sort 1st array and rearrange respective 2nd array elements accordingly
function [a,b]=SortA(a,b)
len = length(a);
for i=1:len-1
    for j=i+1:len
        if(a(i)>a(j))
            ta = a(i);
            a(i) = a(j);
            a(j) = ta;
            tx = b(i);
            b(i) = b(j);
            b(j) = tx;
        end
    end
end
return 
end