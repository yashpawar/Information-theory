function bin=dectobin(dec)
j=1;
bin=zeros(1,ceil(log(dec)/log(2)));
while dec>0
bin(j)=mod(dec,2);
dec=floor(dec/2);
j=j+1;
end
bin=flip(bin);
end