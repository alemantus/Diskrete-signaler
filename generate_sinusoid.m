% Denne funktion genererer et samplet sinussignal.

% Input:
% a : amplitude
% f : frequency of sinusoid (in Hz)
% phi_k : phase (in multiples of 2pi)
% fs : sampling frequency (in Hz)
% T_s : duration (in seconds)

% Udgange:
% time_vector : time vector with sampling points
% signal : the output signal
function [time_vector signal] = generate_sinusoid(a, F, phi_k, f_s, T_s)

    
    % Samle interval.
    dT = 1/f_s;
   
    % Maks antal samles.
    N = T_s/dT;
    
    % Antal samples.
    n = 0:1:N-1;
    
    % Relativ frekvens / Normaliseret frekvens.
    f = F/f_s;
    
%time_vector = (0:dT:T_s)';
    % x(n) - Diskret tid.
    signal = a*sin((2*pi()*f*n)+2*pi()*phi_k); 
   % signal = sin(2*pi*F*time_vector);
    time_vector = n*dT;


end