% --------------------------------------------------
% ---                 EENG 421                   ---
% ---               Source Block                 ---
% --------------------------------------------------

function [symbols] = source()
    global message;
    global message_encoded;
        
    for dB = 1:11
        if dB == 8
            symbols = 2e+6;
        elseif dB == 9
            symbols = 5e+6;
        elseif dB == 10
            symbols = 10e+6;
        else
            symbols = 1e+6;
        end
            
        message(dB) = symbols;
        message_encoded = randi([0, 1], 1, symbols);
    end
end