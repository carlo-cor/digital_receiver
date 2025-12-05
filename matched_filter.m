% --------------------------------------------------
% ---           Matched Filter (Lightweight)     ---
% --------------------------------------------------

function [energy_div_nsd, pulse_shape, snr_vals, m_t] = matched_filter()
    % Simple utility that just returns basic info
    
    % System parameters
    f_s = 200;                    % Sampling Rate @ 200 Hz
    r_s = 1;                      % Symbol Rate
    t_symbol = linspace(0, 1, f_s);      % Time for one symbol
    
    % Variable E_p / N_0 Ratios
    energy_div_nsd = 0:10;        % Energy Pulse Divided by Noise Spectral Density
    
    % Get pulses from transmitter (only need basic info)
    [pulse_matrix, snr_vals, m_t] = transmitter(energy_div_nsd, t_symbol, r_s, f_s);
    
    % Just return the pulse shape
    pulse_shape = 100 .* t_symbol .* exp(-10 .* t_symbol);
    
    disp('Matched Filter Utility: Ready');
end
