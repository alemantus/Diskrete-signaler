clc
% task 1.3
    % Impulsresponse. Piecewise function. For 0 <= n <= 22
    % h(n) = 1/(n+22). otherwise h(n)=0
    T = 100*10^-3;
    fs = 10*10^3;
    dt = 1/fs;
    N= T/dt;
    impuls = zeros(N+1,2);
    impuls(:, 1) = (0:dt:T)';
    
    % The first 22
    impuls(1:22,2) = impuls(1:22,2)+(1/22);

    % Amplitude, grundfrekvens, fase, Samplefrekvens, Måletid.
    [time_vector signal] = generate_sinusoid(1, 1000, 0, 10*10^3, 1);
   % plot(time_vector, signal);



   
    b = (1/22)*[ones(22,1)];
    a = 1;
    y = filter(b,a,signal');
    plot(signal);
    hold on
    plot(Convolution(signal', impuls(:,2)));
    hold on
    plot(y)
    legend('Signal n(x)','System response y(n)=x(n)*h(n)', 'Matlab filter')

% convolution by hand
%     f = 10
%     % Amplitude, frequency, fase, Samplefrequency, timespan.
%     [time_vector signal] = generate_sinusoid(1, f, 0, 50, 1/f);
% 
%         T = 1/f;
%         fs = 50;
%         dt = 1/fs;
%         N= T/dt;
%         impuls = zeros(N+1,2);
%         impuls(:, 1) = (0:dt:T)';
%         impuls(1:5,2) = impuls(1:5,2)+(1/6);
%         d = Convolution(signal', impuls(:,2));
%         plot(d);
