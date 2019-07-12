% Sort (Ascending) written By Yash Sachin Pawar
function [p,x]=SortA(p,x)
len = length(p);
for i=1:len-1
    for j=i+1:len
        if(p(i)>p(j))
            temp = p(i);
            p(i) = p(j);
            p(j) = temp;
            tempx = x(i);
            x(i) = x(j);
            x(j) = tempx;
        end
    end
end
return 
end