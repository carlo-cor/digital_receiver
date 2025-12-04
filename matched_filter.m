% --------------------------------------------------
% ---                 EENG 421                   ---
% ---           Matched Filter Block             ---
% --------------------------------------------------

global h_t;
global r_t;

t = linspace(0, 1, f_s);      % Symbol t Range Defined
p_t = transmitter(t);

k = 1.0;       % Adjusted receiver gain 
t_0 = max(t);
tau = t_0 - t;

% NOTE: Reformat p_t to pass in different values (tau or t_0 - t); fix
% generally
h_t = k * transmitter(tau)   % Matched Filter Impulse Response; TEMPORARY EXAMPLE
h_t = fliplr(h_t);

% Perform convolution
r_t = conv(y_t, h_t, 'same');  % Use 'same' to maintain original length

% Create time vector for the convolution result
t_conv = tau;  % For 'same' convolution, use original time vector
