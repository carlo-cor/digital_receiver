% Transmitted Signal Computations
% -------------------------------
function [p_t] = transmitter(time)
    % Variable E_p / N_0 Ratios
    % -------------------------------
    
    global t;
    global p_t;               % Pulse Function
    global y_t;               % Transmitted Pulse w/ Noise
    global pulse_train;       % Pulse Train
    
    energy_div_nsd = 0:10;        % Energy Pulse Divided by Noise Spectral Density
    f_s = 200;                    % Sampling Rate @ 200 Hz
    r_s = 1;                      % Symbol Rate
    t = linspace(0, 1, f_s);      % Symbol t Range Defined
    for i = 1:11
        snr_val = energy_div_nsd(i) + 10 .* log((2 .* r_s) ./ f_s);  % Signal-Noise Ratio Values Computed
    
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


