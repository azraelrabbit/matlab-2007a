function formatStr = getFormatString(this, mode)
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
        formatStr = '%-20.20s   %-8.8s   %-12.12s';
    case 'path'
        formatStr = '%-20.20s ';
    case 'mode'
        formatStr = '%-8.8s ';
    case 'time'
        formatStr = '%-12.12s';
    case 'pathlength'
        formatStr = 20.0;
    case 'timeNum2Str'
        formatStr = '%.12g';
    end % switch
end % function
