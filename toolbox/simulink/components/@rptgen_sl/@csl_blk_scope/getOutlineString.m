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
    % 14 15
    if c.isForceOpen
        typeString = 'XY graph & scope';
    else
        typeString = 'XY graph & open scope';
    end % if
    % 20 21
    loopInfo = findContextBlocksDesc(rptgen_sl.appdata_sl, c, xlate(typeString));
    % 22 23
    s = horzcat(xlate('Scope Snapshot'), ' - ', loopInfo);
end % function
