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
    %h(:, 1) = (0:dt:T)';
    
    % For the first 22 th
    h(1:o+1,1) = h(1:o+1,1)+(1/(o+1));
    
     % Amplitude, Signal freqency, Phae, Sample freqency, Periode time.
    [time_vector signal] = generate_sinusoid(1, 500, 0, 10*10^3, 1);
    
    % H(w)
    [H freq] = make_spectrum(h,fs);
    plot(freq, H)
    % b = (1/o+1)*[ones(o+1,1)];
    %a = 1;
   % y = filter(b,a,signal');
    %plot(y);
    %hold on
   % plot(Convolution(signal', h(:,1)));
   % hold on
   % plot(y)
   % legend('Signal n(x)','System response y(n)=x(n)*h(n)', 'Matlab filter')