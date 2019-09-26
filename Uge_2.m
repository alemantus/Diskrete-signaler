clc
% % Opgave 1.1
    % T0, T_Tot, Fs
%     [t sig] = generate_square(10/1000, 0.1, 1000);
%     % T0, T_Tot, Fs
%     [t2 sig2] = generate_ramp(10/1000, 0.1, 1000);
%     
%     
%     subplot(2, 1, 1);
%     plot(t,sig)
%     hold on
%     plot(t,sig2)
%     grid on;
%     
%     
%     subplot(2, 1, 2);
%     plot(conv(sig, sig))
%     hold on
%     plot(sig)
%     
%     grid on;
%     % Ved foldning flyttes først den inverteret funktion g(x) fra venstre mod højre.
%     % Når det g(x)'s højreside længst henne ved den anden funktion f(x)
%     % højreside, så er der gået antal samples af f(x). 
%     % Nu skal g(x) flyttes helt ud til højre. Dermed går der antal samples
%     % af g(x). Samlet samples ved foldning er N_g(x) + N_f(x).  


    
%  % Opgave 1.1 - Valgfri
%      % T0, T_Tot, Fs
%     [t sig] = generate_square(10/1000, 0.1, 1000);
%     % T0, T_Tot, Fs
%     [t2 sig2] = generate_ramp(10/1000, 0.1, 1000);
%     subplot(2, 1, 1);
%      plot(conv(sig, sig2))
%      title("Foldning")
%      grid on
%      subplot(2, 1, 2);
%      plot(xcorr(sig, sig2))
%      title("Krydskorrelation")
%      grid on
%      
%      % Forskellen på kryds korrealtion og foldning er at ved foldning
%      % f(x)*g(x) bliver g(x) inverteret og flyttet fra venstre mod højre,
%      % hvorimod ved krydskorrelation bliver g(x) IKKE inverteret.

% Opgave 1.2
%     [t sig] = generate_square(10/1000, 0.1, 1000);
%     % T0, T_Tot, Fs
%     [t2 sig2] = generate_ramp(10/1000, 0.1, 1000);
%     
%     h = Convolution(sig, sig2);
%     plot(conv(sig, sig2))
%     hold on
%     plot(h)

% Opgave 1.3
    % Impulsresponse. Det er et stykvis funktion. For 0 <= n <= 22 gælder
    % h(n) = 1/(n+22). Ellers h(n)=0
    T = 100*10^-3;
    fs = 10*10^3;
    dt = 1/fs;
    N= T/dt;
    impuls = zeros(N+1,2);
    impuls(:, 1) = (0:dt:T)';
    
    % For det første 22.
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

% Foldning i hånden.
%     f = 10
%     % Amplitude, grundfrekvens, fase, Samplefrekvens, Måletid.
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

% Opgave 2.1
%     % Impulsresponse.
%     %delay_samples = 0;
%     %alpha = 1;
%     %h_ir = [1; zeros(delay_samples,1); alpha]
%     
%     % Genererer sinussignal.
%    [t signal] = generate_sinusoid(1, 5, 0, 100, 10);
% 
%   % Impulsresponse fra en kirke.
%   [y,Fs] = audioread('church.wav');
%   
%   % Vi folder signa
%   j = Convolution(signal', y(:,1));
%   audiowrite('test.wav',j,Fs,  'BitsPerSample',32);
%   plot(j);
%  fs = 8000;
% 2 T = 10;
% 3 t = 0:1/fs:T-1/fs;
% 4 f_min = 1500; f_max = 5000; %min and max frequencies
% 5
% 6 %% let 's generate the signal
% 7 signal = chirp(t,f_min,T,f_max,'logarithmic');
% 8
% 9 sound(signal ,fs); %% play the signal