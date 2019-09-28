
%sample frequency
fs=2000;

%500 Hz
[time_vector, signal] = generate_sinusoid(1, 500, 0, fs, 0.5);
[frequencies_Hz, Y] = make_spectrum(signal, fs);

subplot(2, 1, 1);
plot(frequencies_Hz,abs(Y));
set(gca,'fontsize',14);
title('Frequency of 500 Hz');
ylabel('Amplitude');
xlabel('Frequency');
grid on;

%499 Hz
[time_vector, signal] = generate_sinusoid(1, 499, 0, fs, 0.5);
[frequencies_Hz, Y] = make_spectrum(signal, fs);

subplot(2, 1, 2);
plot(frequencies_Hz,abs(Y));
set(gca,'fontsize',14);
title('Frequency of 499 Hz');
ylabel('Amplitude');
xlabel('Frequency');
grid on;


