% Solutions to Exercise 1.2
% by Raphael Wude, Claude Jordan, Martin Brückmann, Daniel Degenstein  

% properties of the sine wave
duration = 5;
frequency = 1000;
sampling_rate = 44100;
time_steps = 1/sampling_rate;

% Create the sine and cosine wave
x = [];
for i = 0:time_steps:duration
    x(end+1) = i;
end
sine_wave = sin((2*pi*frequency)*x);
cos_wave = cos((2*pi*frequency)*x);

% windowed Fourier Transform Representation
subplot(1,2,1);
spectrogram(sine_wave,[],[],[],sampling_rate, 'yaxis')
subplot(1,2,2);
spectrogram(cos_wave,[],[],[],sampling_rate, 'yaxis')

% Save the created signal in a .wav file
audiowrite('signal.wav', sine_wave, sampling_rate)