function [cmatrix, ctype] = noise(h, freq)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    m = length(freq);
    cmatrix(1.0:2.0, 1.0:2.0, 1.0:m) = 0.0;
    ctype = 'ABCD CORRELATION MATRIX';
end % function
