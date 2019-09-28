close all;
%Define number of samples to take
fs = 100;
f = 10; %Hz
%Define signal
t = 0:1/fs:1-1/fs;
signal = 2*sin(2*pi*f*t);
%Plot to illustrate that it is a sine wave
%plot(t, signal);
%title('Time-Domain signal');
%Take fourier transform
fftSignal = fft(signal);
%apply fftshift to put it in the form we are used to (see documentation)
fftSignal = abs(fftshift(fftSignal));
%Next, calculate the frequency axis, which is defined by the sampling rate
f = fs/2*linspace(-1,1,fs);
f = -fs/2:fs/(length(signal)-1):fs/2
f = -fs:fs/(length(signal)-1)*2:fs
df =fs/length(signal);
%freqvec = -fs/2+df:df:fs/2

%Since the signal is complex, we need to plot the magnitude to get it to
%look right, so we use abs (absolute value)
figure;
plot(f, abs(fftSignal) / (length(signal)/2));
title('magnitude FFT of sine');
xlabel('Frequency (Hz)');
ylabel('magnitude');