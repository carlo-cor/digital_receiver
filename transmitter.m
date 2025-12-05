% --------------------------------------------------
% ---                 EENG 421                   ---
% ---            Transmitter Block               ---
% --------------------------------------------------

% Transmitted Signal Computations
% -------------------------------
function [p_t, snr_val, message] = transmitter(energy_nsd_ratio, time, symbol_rate, sampling_rate)
    
[symbols, message, message_encoded] = source();

    for i = 1:11
        snr_val = energy_nsd_ratio(i) + 10 .* log10((2 .* symbol_rate) ./ sampling_rate);  % Signal-Noise Ratio Values Computed
    
        % Binary Polar Signaling
        for j = 1:symbols
            if message_encoded(j) == 1
                p_t = 100 .* time .* exp(-10 .* time);
            elseif message_encoded(j) == 0
                p_t = -100 .* time .* exp(-10 .* time);
            end      
        end
    end
end


