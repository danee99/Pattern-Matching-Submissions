% Solutions to Exercise 3.2
% by Raphael Wude, Claude Jordan, Martin Brückmann, Daniel Degenstein

%Properties N and t
N=512;
t=0:1/N:1;

% function f and f_hat (f_hat is like the lecture magnitude spectrum / 256)
f = cos(4*pi*t)+4*cos(20*pi*t)+8*cos(2*pi*20*t);
f_hat=0*t;

%the special values for f_hat
f_hat(2)= 1;
f_hat(N-2)= 1;
f_hat(10)= 2;
f_hat(N-10)= 2;
f_hat(20)= 4;
f_hat(N-20)= 4;

%plot both functions:
subplot(2,1,1)
stem(t,f)
title("Graph of sampled function f(t)")
ylabel("f(t)")
xlabel("time [sec]")

subplot(2,1,2)
stem(t,f_hat)
title("Magnitude spectrum / 256")
ylabel("Magnitude of Fourier transformation")
xlabel("Frequency (Hz)")