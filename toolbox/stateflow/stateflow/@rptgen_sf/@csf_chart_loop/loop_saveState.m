function currState = loop_saveState(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    adSF = rptgen_sf.appdata_sf;
    % 8 9
    currState = cellhorzcat('CurrentMachine', adSF.CurrentMachine, 'CurrentChart', adSF.CurrentChart, 'CurrentState', adSF.CurrentState, 'CurrentObject', adSF.CurrentObject, 'Context', adSF.Context);
    % 10 13
    % 11 13
    % 12 13
end % function
