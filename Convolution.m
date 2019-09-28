% Denne funktion folder f og g.

% Input:
% f: Vektor
% g: Vektor
%
% Udgange:
% signal : Signalvektor



function [signal] = Convolution(f, g)
    % Størrelser.
    f_len = size(f,1);
    g_len =size(g,1);
    
    % Tilføj nuller til sidst i vektoren.
    h=[g; zeros(f_len,1)];
    
    % Kør f_len + g_len gange.
    for i=1:(f_len + g_len)-1
        
        % Nulstil.
        signal(i)=0;
        
        % Kør igennem f vektoren.
        for j=1:f_len
            
            % Hvis det er inde for array størrelse.
            if(i-j+1 > 0)
                signal(i) = signal(i) + f(j,1)*h((i-j)+1, 1);
            else
                % Afbryd.
                break
            end
        end
    end

%     % Nulstil.
%    signal = zeros(size(f, 1),1);
%     % Inverter g
%     %g_invert = flipud(g);
% 
% 
%     % Kør hele f igennem.
%     for k = 1:size(f, 1)
%         % Kør k igennem.
%         for m = 1:k
%             signal(k, 1) =  signal(k, 1) + ( f(m,1)*h((k-m)+1,1) );
%         end
%         
%     end


end