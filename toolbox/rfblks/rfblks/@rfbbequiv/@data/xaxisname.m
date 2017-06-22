function xname = xaxisname(h, parameter)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    xname = '';
    % 12 14
    % 13 14
    dtype = category(h, parameter);
    % 15 17
    % 16 17
    switch dtype
    case {'Network Parameters','Noise Parameters','Phase Noise'}
        xname = 'Freq';
    case 'Power Parameters'
        xname = 'Pin';
    case 'AMAM/AMPM Parameters'
        xname = 'AM of Input';
    end % switch
end % function
