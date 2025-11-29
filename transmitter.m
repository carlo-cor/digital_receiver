% --------------------------------------------------
% ---                 EENG 421                   ---
% ---             Transmitter Block              ---
% --------------------------------------------------

% Variable E_p / N_0 Ratios
% -------------------------------

source();

global p_t;               % Pulse Function
global y_t;               % Transmitted Pulse w/ Noise
global pulse_train;       % Pulse Train

energy_div_nsd = 0:10;        % Energy Pulse Divided by Noise Spectral Density
f_s = 200;                    % Sampling Rate @ 200 Hz
r_s = 1;                      % Symbol Rate
t = linspace(0, 1, f_s);      % Symbol t Range Defined

% Transmitted Signal Computations
% -------------------------------

for i = 1:11
    snr_val = energy_div_nsd(i) + 10 .* log((2 .* r_s) ./ f_s);  % Signal-Noise Ratio Values Computed

    % Binary Polar Signaling
    for j = 1:symbols
        if message_encoded(j) == 1
            p_t = 100 .* t .* exp(-10 .* t);
        elseif message_encoded(j) == 0
            p_t = -100 .* t .* exp(-10 .* t);
        end

        y_t = awgn(p_t, snr_val, 'measured');                    % Received Signal (Pulse Function + AWGN)
    end
end
