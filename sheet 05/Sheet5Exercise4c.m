%sampling frequency
N=5000;

k2 = -1:1/N:-0.5;
k=-0.5:1/N:0.5;
k3 = 0.5:1/N:1;

hann = 1/2 * (1+cos(2*pi*k));

plot(k2, 0*k2);
hold on
plot(k,hann);
hold on
plot(k3, 0*k3)
hold off
grid


title('(c)');
xlabel('seconds'); 
ylabel('amplitude');
