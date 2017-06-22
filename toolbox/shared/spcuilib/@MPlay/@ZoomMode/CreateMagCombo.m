function CreateMagCombo(zoomObj)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    w = zoomObj.widgetsObj;
    % 7 9
    % 8 9
    isJavaFigure = not(isempty(get(w.hfig, 'JavaFrame')));
    if isJavaFigure
        % 11 12
        hToolbar = w.options_toolbar.toolbar;
        [cb, cb_api] = local_createMagComboBox(hToolbar);
        % 14 15
        w.hMagCombo = cb;
        w.hMagComboAPI = cb_api;
    end % if
end % function
function [cb, cb_api] = local_createMagComboBox(hToolbar)
    % 20 23
    % 21 23
    % 22 23
    [cb, cb_api] = createMagComboBox(hToolbar);
end % function
