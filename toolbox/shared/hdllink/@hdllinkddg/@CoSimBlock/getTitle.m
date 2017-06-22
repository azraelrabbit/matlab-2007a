function str = getTitle(this, mode, type)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    formatStr = this.getFormatString(mode);
    % 6 7
    pathStr = 'Full HDL Name';
    % 8 9
    switch lower(type)
    case 'port'
        modeStr = 'I/O Mode';
    case 'clock'
        modeStr = 'Edge';
    end % switch
    % 15 16
    switch lower(mode)
    case 'all'
        str = sprintf(formatStr, pathStr, modeStr, 'Sample Time ');
    case 'path'
        str = sprintf(formatStr, pathStr);
    case 'mode'
        str = sprintf(formatStr, modeStr);
    case 'time'
        str = sprintf(formatStr, 'Sample Time ');
    end % switch
end % function
