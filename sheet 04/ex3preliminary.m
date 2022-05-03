N=512;

k=(1:1:N)/N;

%Source signal: a
a = sin(2*pi*4*k);

%Noisy signal: b = a + r
r=rand(1,N)-0.5;

plot(k,a)
title('titel');
xlabel('k/N'); 
ylabel('amplitude');