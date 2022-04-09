% Solutions to Exercise 1.2
% by Daniel Degenstein

% properties of the sine wave
duration = 5;
frequency = 1000;
sampling_rate = 44100;
time_steps = 1/sampling_rate;

% Create the sine wave
x = [];
for i = 0:time_steps:1
    x(end+1) = i;
end
sine_wave = sin((2*pi*frequency)*x);

% windowed Fourier Transform Representation
% spectrogram(sine_wave);