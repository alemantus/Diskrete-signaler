clc
close all


% 1.3 blocked freqencies

    % Impulsresponse. Piecewise function. For 0 <= n <= 22:
    % h(n) = 1/(n+22). or h(n)=0
    
    % Impuls response: Signal time.
    T = 100*10^-3;
    
    % Impuls response:  Sample freqency.
    fs = 10*10^3;
    
    % Impuls response:  Time sample step.
    dt = 1/fs;
    
    % Impuls response: Numbers of samples.
    N= T/dt;
    
    % Ini. h vector.
    h = zeros(N+1,2);
    
    % Order of moving avarage.
    o = 21;
    
    % Time data.
    h(:, 1) = (0:dt:T)';
    
    % For the first 22 th
    h(1:o+1,2) = h(1:o+1,2)+(1/(o+1));
    
     % Amplitude, Signal freqency, Phae, Sample freqency, Periode time.
    [time_vector signal] = generate_sinusoid(1, 1818, 0, 10*10^3, 1);
    
    % H(w)
    [H freq] = make_spectrum(h(:,2),fs);
    
    %subplot(2,1,1)
    plot(freq,abs(H))
    grid on
    set(gca,'fontsize',14);
    title('Spectrum of impuls response abs(H(w))')
    xlabel('Frequency [Hz]')
    ylabel('Amplitude')
    xlim([0,5000])
    
    %subplot(2,1,2)
    %plot(conv(signal', h(:,2)));
    %grid on
   % b = (1/o+1)*[ones(o+1,1)];
   % a = 1;
   % y = filter(b,a,signal');
   %plot(y);
    %hold on
   % 
   % hold on
   % plot(y)
   % legend('Signal n(x)','System response y(n)=x(n)*h(n)', 'Matlab filter')