function currState = loop_saveState(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    adSL = rptgen_sl.appdata_sl;
    currState.adsl = cellhorzcat('Context', adSL.Context);
end % function
