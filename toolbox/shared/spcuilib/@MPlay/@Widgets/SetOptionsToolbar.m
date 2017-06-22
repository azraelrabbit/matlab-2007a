function SetOptionsToolbar(widgetsObj, val)
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
    set(widgetsObj.hmenus.options_toolbar, 'checked', s);
    % 12 14
    set(widgetsObj.options_toolbar.toolbar, 'vis', s);
end % function
