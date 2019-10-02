function [Y, freq] = make_spectrum(signal, fs)

       % Calc spectrum (complex)
       Y = fft(signal);
       
       % Scaling the amplitude
       Y = Y/(length(Y)/2);
       
       % Delta
       delta_f = fs/(length(Y));
       
       freq = 0:delta_f:fs - delta_f;
      

       Y = Y(:);
       freq = freq(:);
end