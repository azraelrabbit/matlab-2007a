function str = getClockTitle(this, mode)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    formatStr = this.getClockFormatString(mode);
    % 10 11
    pathStr = 'Full HDL Name';
    modeStr = 'Edge';
    % 13 14
    timeStr = 'Period      ';
    % 15 16
    switch lower(mode)
    case 'all'
        str = sprintf(formatStr, pathStr, modeStr, timeStr);
    case 'path'
        str = sprintf(formatStr, pathStr);
    case 'mode'
        str = sprintf(formatStr, modeStr);
    case 'time'
        str = sprintf(formatStr, timeStr);
    end % switch
end % function
