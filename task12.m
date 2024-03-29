clc

% Opgave 1.2
%     % Sample frekvens.
%     fs = 2000;
%     
%     % Vi �nsker at have 10 samples pr. periode. Sample frekvens: 10/(1/500)
%     [time signal] = generate_sinusoid(1, 500, 0, fs, 0.5);
%     [Y freq] = make_spectrum(signal,fs);
%     
%     % Plot
%     subplot(2, 1, 1);
%     plot(freq, abs(Y))
%     ylabel('Amplitude')
%     xlabel('Frequency')
%     grid on
%     
% 
% 
%     
%     % Sample frekvens.
%     fs = 3000;
%     
%     [time signal] = generate_sinusoid(1, 499, 0, fs, 0.5);
%     [Y freq] = make_spectrum(signal,fs);
%     
%     % Plot
%     subplot(2, 1, 2);
%     plot(freq, abs(Y))
%     ylabel('Amplitude')
%     xlabel('Frequency')
%     grid on
%     
%     % Vi ser p� de positive frekvenser!
%     % Hvis vi sampler med 500 hz og 499 hz eller 2*500 hz og 2*499, s� vil spektrummene vise 0 Hz, da vi
%     % rammer hvor f(x)=0. Alle andre steder ser vi i spektrummet den
%     % korrekte amplitude, ved den korrekte frekvens. Samtidig ser vi en
%     % amplitude ved fs-f. Denne skal ses som den negative frekvens.
%     % Den er spejlet omkring fs/2.

% Opgave 1.2
 

    fs = 2000;
    
    % Beregn signal.
    % F_0, Sample frekvens, time.
    [Time, Signal] = s(25, fs, 4);
       
    % FFT.
     [Y freq] = make_spectrum(Signal,fs);
    
    figure (1)
    subplot(3, 1, 1);
    plot(Time, Signal);
    grid on
    xlim([0.8, 0.9]);
        ylabel('Amplitude')
    xlabel('Time [s]')
     set(gca,'Fontsize',14)
     
    % Plot amplitude.
    subplot(3, 1, 2);
    stem(freq, abs(Y));
    grid on
    ylabel('Amplitude')
    xlabel('Frequency [Hz]')
    set(gca,'Fontsize',14)
    
    % Plot phase.
    subplot(3, 1, 3);
    stem(freq(abs(Y) > 0.01), angle(Y(abs(Y) > 0.1)));
    grid on
    ylabel('Phase [rad]')
    xlabel('Frequency [Hz]')
        %set(gca, 'linewidth',2)
set(gca,'Fontsize',14)
    
%print -dpng -r300 1
    % Plot real part.
    figure (2)
    subplot(2, 1, 1);
    stem(freq, real(Y));
    grid on
    ylabel('Amplitude')
    xlabel('Frequency [Hz]') 
    title('Real')
         set(gca,'Fontsize',14)
    
    % Plot imaginary part.
    subplot(2, 1, 2);
    stem(freq, imag(Y));
    grid on
    ylabel('Amplitude')
    xlabel('Frequency [Hz]') 
    title('Imaginary')
         set(gca,'Fontsize',14)
    
   % print -dpng -r300 2
    
    figure (3)
    audiowrite('test1.wav',Signal,fs,  'BitsPerSample',32);
    [g,Fsh] = audioread('test1.wav');
    info = audioinfo('test1.wav');
    
    % Hent tiden for sangen.
    t = 0:(1/Fsh):(info.Duration);
    t = t(1:end-1);
    
    subplot(2, 1, 1);
    plot(Time, Signal);
    xlim([0.8, 0.9]);
    
    subplot(2, 1, 2);
    plot(t, g);
    xlim([0.85, 0.925]);
    
%    figure (3)
%    semilogx(freq, 20*log10(abs(Y)))
%    grid on
%    ylabel('dB')
%    xlabel('Frequency [Hz]') 
    
     function [Time, Signal] = s(f_0,f_s, T)
     %Result = 0;

         % Samle interval.
        dT = 1/f_s;

            % Maks antal samles.
        N = T/dT;
         Signal = zeros(N,1); 
            % Antal samples.
        n = 0:1:N-1;


        for g = 0:N-1    
            for k = 0:4
                Signal(g+ 1,1) = Signal(g + 1,1) + cos(2*pi*(2^k)*f_0*g*dT+k*pi/3);
            end
          
        end
        Time(:,1) = n*dT;
     end

     % Hvis vi erstatter cos med sin, s� bytter amplituden for realdelen og imagin�re
     % delen om, samtidig med at de �ndre fortegn.
     
    
     