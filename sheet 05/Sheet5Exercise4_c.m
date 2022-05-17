%sampling frequency
N=5000;

k3 = -2:1/N:-0.5;
k=-0.5:1/N:0.5;
k2 = 0.5:1/N:2;

hann = 1/2 * (1+cos(2*pi*k));

plot(k3, 0*k3);
hold on
plot(k,hann);
hold on
plot(k2, 0*k2)
hold off
grid


title('(c)');
xlabel('seconds'); 
ylabel('amplitude');
