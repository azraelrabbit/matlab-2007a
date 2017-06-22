function SetStatusBar(widgetsObj, val)
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
    set(widgetsObj.hmenus.status_bar, 'checked', s);
    % 12 15
    % 13 15
    widgetsObj.hStatusBar.Visible = s;
    % 15 18
    % 16 18
    ResizeFcn(widgetsObj);
end % function
