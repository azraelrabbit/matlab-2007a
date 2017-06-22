function loop_restoreState(h, oldState)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    set(rptgen_sl.appdata_sl, oldState.adsl{:});
    % 10 11
    if not(isempty(oldState.CurrentSystem))
        % 12 14
        % 13 14
        set_param(0.0, 'currentsystem', oldState.CurrentSystem);
    end % if
end % function
