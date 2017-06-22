function formatStr = getPortFormatString(this, mode)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    switch mode
    case 'all'
        formatStr = '%-20.20s   %-10.10s   %-12.12s      %-9.9s     %-15.15s';
    case 'path'
        formatStr = '%-20.20s ';
    case 'mode'
        formatStr = '%-10.10s ';
    case 'time'
        formatStr = '%-12.12s';
    case 'sign'
        formatStr = '%-9.9s  ';
    case 'frac'
        formatStr = '%-15.15s';
    case 'pathLength'
        formatStr = 20.0;
    case 'timeNum2Str'
        formatStr = '%.12g';
    otherwise
        formatStr = '';
        warning('Missed a port format string update');
    end % switch
end % function
