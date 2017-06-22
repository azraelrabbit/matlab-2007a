function EnableOptionsControls(playbackObj, ena)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    h = cellhorzcat(playbackObj.button_simulink_snapshot, playbackObj.button_simulink_hilite, playbackObj.button_simulink_floating, playbackObj.menu_simulink_snapshot, playbackObj.menu_simulink_hilite, playbackObj.menu_simulink_floating);
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    if lt(nargin, 2.0)
        ena = true;
    end % if
    if ena
        s = 'on';
    else
        s = 'off';
    end % if
    for i=1.0:numel(h)
        set(h{i}, 'enable', s);
    end % for
end % function
