function ControlVis(playbackObj, vis)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if vis
        s = 'on';
    else
        s = 'off';
    end % if
    set(get(playbackObj.parent_toolbar, 'children'), 'vis', s);
    set(get(playbackObj.parent_menu, 'children'), 'vis', s);
    drawnow;
end % function
