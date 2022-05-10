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

ax1 = subplot(2,2,1);
plot(k,a);
title('underlying signal a');
xlabel('k/N');
ylabel('amplitude');

ax2 = subplot(2,2,2);
plot(k,b);
title('noisy version b');
xlabel('k/N');
ylabel('amplitude');

ax3 = subplot(2,2,3);
plot(k,atilde1);
title('denoised signal');
xlabel('k/N');
ylabel('amplitude');

ax4 = subplot(2,2,4);
plot(k,atilde2)
title('difference signal');
xlabel('k/N');
ylabel('amplitude');
axis([0 1 -1 1])
