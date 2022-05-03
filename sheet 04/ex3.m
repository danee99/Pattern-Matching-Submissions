N=512;

k=0:1/N:1-1/N;

%Source signal: a
a = sin(2*pi*4*k);

%Noisy signal: b = a + r
r=rand(1,N)-0.5;
b = a + r;

B = fft(b);
Btheta = B*0;
Btheta(4)=B(4);
Btheta(508) = B(508);
atilde1 = ifft(Btheta) + a; %atilde
atilde2 = ifft(Btheta); %atilde - a

plot(k,atilde2)
title('titel');
xlabel('k/N'); 
ylabel('amplitude');
axis([0 1 -1 1])

