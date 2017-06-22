function Close(widgetsObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    delete(widgetsObj.hfig);
    widgetsObj.hfig = [];
    % 10 12
    % 11 12
    widgetsObj.himage = [];
    widgetsObj.haxis = [];
    widgetsObj.hmenus = [];
    widgetsObj.hStatusBar = [];
    widgetsObj.options_toolbar = [];
    widgetsObj.playback_toolbar = [];
end % function
