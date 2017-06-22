function s = getOutlineString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if not(builtin('license', 'checkout', 'SIMULINK_Report_Gen'))
        s = xlate('[Unlicensed Component]');
        return;
        % 12 13
    end % if
    % 14 16
    % 15 16
    if c.isFunctionTable
        typeStr = xlate('Function');
        conjStr = '/';
    else
        typeStr = '';
        conjStr = '';
    end % if
    % 23 24
    if c.isVariableTable
        typeStr = horzcat(typeStr, conjStr, xlate('Variable'));
    end % if
    % 27 28
    loopInfo = findContextBlocksDesc(rptgen_sl.appdata_sl, c);
    % 29 30
    s = horzcat(typeStr, ' ', xlate('Table'), ' - ', loopInfo);
    % 31 32
end % function
