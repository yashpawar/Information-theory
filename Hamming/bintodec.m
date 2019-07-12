function dec=bintodec(bin)
len=length(bin);
bin=flip(bin);
dec=0;
for k=1:len
dec=dec+bin(k)*(2^(k-1));
end
end