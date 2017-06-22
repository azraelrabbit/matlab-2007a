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
    loopInfo = findContextBlocksDesc(rptgen_sl.appdata_sl, c, xlate('To Workspace/To File'));
    % 16 17
    s = horzcat(xlate('Plot'), ' - ', loopInfo);
end % function
