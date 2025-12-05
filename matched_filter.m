% --------------------------------------------------
% ---                 EENG 421                   ---
% ---           Matched Filter Block             ---
% --------------------------------------------------

global energy_div_nsd;
global f_s;

global y_t;
global h_t;
global r_t;

% Variable E_p / N_0 Ratios
% -------------------------------
k = 1.0;                      % Adjusted receiver gain 
energy_div_nsd = 0:10;        % Energy Pulse Divided by Noise Spectral Density
f_s = 200;                    % Sampling Rate @ 200 Hz
r_s = 1;                      % Symbol Rate
t = linspace(0, 1, f_s);      % Symbol t Range Defined

[p_t, snr_val, message] = transmitter(energy_div_nsd, t, r_s, f_s);
y_t = awgn(p_t, snr_val, 'measured');

h_t = k * flip(p_t);              % Matched Filter Impulse Response

% Perform convolution
r_t = conv(y_t, h_t, 'same');  

t_conv = t;

