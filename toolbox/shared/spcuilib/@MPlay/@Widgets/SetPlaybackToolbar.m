function SetPlaybackToolbar(widgetsObj, val)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if val
        s = 'on';
    else
        s = 'off';
    end % if
    set(widgetsObj.hmenus.playback_toolbar, 'checked', s);
    % 12 15
    % 13 15
    set(widgetsObj.playback_toolbar, 'vis', s);
end % function
