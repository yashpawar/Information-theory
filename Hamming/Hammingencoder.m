%Hamming codes written By Yash Sachin Pawar

%m is message(uncoded)
inp=input('Enter message to transmit  ');
disp('message (input)')
disp(inp)
m=dectobin(inp);
disp('message')
disp(m)

len=length(m);
for k=1:len
	if 2^k-k-1>=len
		r=k;
        break;
	end
	
end
m=[zeros(1,(2^r-r-1)-len) m];
bl=2.^r-1;

%Encoding message
b=zeros(1,bl);
l=1;
a=0:r-1;
a=2.^a;
for k=1:bl
	if ~sum(k == a)
        b(k)=m(l);
		l=l+1;
	end

end

%calculating parities
for k=1:bl
    if sum(k == a)
        p=0;
        while (k+p<=bl)
            for n=1:k
                b(k)=b(k)+b(k+n-1+p);
            end
            p=p+k*2;
        end
    end

end
b=mod(b,2);
disp('transmitting')
disp(b)

%message in channel
ebit=round(bl*rand(1));
r=b;
if(ebit ~=0)
    r(ebit)=~r(ebit);
end

%message recieved
disp('recieving')
disp(r)

%calculating Syndrome
disp('checking for error')
syn=zeros(1,bl-len);
l=1;
for k=1:bl
    if sum(k == a)
        p=0;
        while (k+p<=bl)
            for n=1:k
                syn(l)=syn(l)+r(k+n-1+p);
            end
            p=p+k*2;
        end
        l=l+1;
    end

end
syn=mod(syn,2);

%find errored bit using syndrome
edbit=bintodec(flip(syn));
disp('error found at bit')
disp(edbit)
c=r;
if(ebit ~=0)
    c(ebit)=~c(ebit);
end
disp('corrected recived message')
disp(c)

%decode message
cr=zeros(1,len);
l=1;
for k=1:bl
    if ~sum(k == a)
        cr(l)=c(k);
		l=l+1;
    end
end
disp('corrected recived message(decoded)')
disp(cr)
cm=bintodec(cr);
disp('decoded message')
disp(cm)