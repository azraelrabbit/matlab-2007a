function formatStr = getClockFormatString(this, mode)
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
        formatStr = '%-26.26s   %-10.10s   %-20.20s';
    case 'path'
        formatStr = '%-26.26s ';
    case 'mode'
        formatStr = '%-10.10s ';
    case 'time'
        formatStr = '%-20.20s';
    case 'pathLength'
        formatStr = 26.0;
    case 'timeNum2Str'
        formatStr = '%.17g';
    otherwise
        formatStr = '';
        warning('Missed a clock format string update');
    end % switch
end % function
