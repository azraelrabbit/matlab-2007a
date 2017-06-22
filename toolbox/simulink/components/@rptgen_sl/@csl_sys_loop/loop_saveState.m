function currState = loop_saveState(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    currState.CurrentSystem = get_param(0.0, 'CurrentSystem');
    % 9 10
    adSL = rptgen_sl.appdata_sl;
    currState.adsl = cellhorzcat('Context', adSL.Context);
end % function
