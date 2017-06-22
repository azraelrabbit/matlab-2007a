function aObj = editstyle(aObj, style)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    switch style
    case 'solid'
        val = '-';
    case 'dash'
        val = '--';
    case 'dot'
        val = ':';
    case 'dashdot'
        val = '-.';
    otherwise
        return;
    end % switch
    % 21 22
    aObj = set(aObj, 'LineStyle', val);
end % function
