function [frequencies_Hz, Y_signal_complex] = make_spectrum(signal, fs)

%when the frequency of the input signal, in the fourier transform process,
%matches that of the euler function, the sum og the two goes toward A*n/2+j*B*n/2.
%Where A is the amplitude of the real part and B is the amplitude of the imaginary part in the 
%frequency spectrum, which is why we need to divide with the length of 
%the signal divided by 2 in order to get the amplitude.

L = length(signal);

Y_signal_complex = fft(signal)/L/2;

frequencies_Hz = 0:fs/L:fs-fs/L;