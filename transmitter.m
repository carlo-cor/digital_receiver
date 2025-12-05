% --------------------------------------------------
% ---                 EENG 421                   ---
% ---            Transmitter Block               ---
% --------------------------------------------------

function [pulse_matrix, snr_vals, message_encoded] = transmitter(energy_nsd_ratio, time, symbol_rate, sampling_rate)
    
    [num_symbols, message, message_encoded] = source();
    
    % Calculate pulse shape once (basis function)
    pulse_shape = 100 .* time .* exp(-10 .* time);
    
    % Create pulse matrix: each row is a pulse for one symbol
    pulse_matrix = zeros(num_symbols, length(time));
    
    % Create all pulses in matrix form
    for j = 1:num_symbols
        if message_encoded(j) == 1
            pulse_matrix(j, :) = pulse_shape;
        elseif message_encoded(j) == 0
            pulse_matrix(j, :) = -pulse_shape;
        end
    end
    
    % Calculate SNR values for all energy_nsd_ratio values
    snr_vals = zeros(size(energy_nsd_ratio));
    for i = 1:length(energy_nsd_ratio)
        snr_vals(i) = energy_nsd_ratio(i) + 10 .* log10((2 .* symbol_rate) ./ sampling_rate);
    end
    
end