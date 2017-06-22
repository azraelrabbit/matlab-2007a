function str = getPortTitle(this, mode)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    formatStr = this.getPortFormatString(mode);
    % 10 11
    pathStr = 'Full HDL Name';
    modeStr = 'I/O Mode';
    timeStr = 'Sample Time ';
    signStr = 'Data Type ';
    fracStr = 'Fraction Length';
    % 16 17
    switch lower(mode)
    case 'all'
        str = sprintf(formatStr, pathStr, modeStr, timeStr, signStr, fracStr);
    case 'path'
        str = sprintf(formatStr, pathStr);
    case 'mode'
        str = sprintf(formatStr, modeStr);
    case 'time'
        str = sprintf(formatStr, timeStr);
    case 'sign'
        str = sprintf(formatStr, signStr);
    case 'frac'
        str = sprintf(formatStr, fracStr);
    end % switch
end % function
