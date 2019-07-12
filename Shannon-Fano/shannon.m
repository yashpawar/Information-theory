%Shannon Fano encoder written By Yash Sachin Pawar

function c=shannon(startpoint,endpoint,ps,c)

%base case
if(endpoint==startpoint)
    return
end

%Splitting array in 2 arrays such that sum of probabilities of one array
%and that of other have minimum difference
mindiff=inf;
for k=startpoint:endpoint
    diff=abs(sum(ps(startpoint:k))-sum(ps(k+1:endpoint)));
    if(diff<mindiff)
        mindiff=diff;
        mark=k;
    else
        break;
    end
end

%Encoding accordingly
for j=startpoint:mark
        c(j)=strcat(c(j),'0');
end
for j=mark+1:endpoint
        c(j)=strcat(c(j),'1');
end

%recursive calls
c=shannon(startpoint,mark,ps,c);
c=shannon(mark+1,endpoint,ps,c);


return
end