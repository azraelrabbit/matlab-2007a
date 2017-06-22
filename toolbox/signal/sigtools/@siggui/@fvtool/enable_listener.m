function enable_listener(hObj, eventData)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    siggui_enable_listener(hObj);
    % 9 10
    enabState = get(hObj, 'Enable');
    % 11 12
    if strcmpi(enabState, 'on')
        lcolor = [0.0 0.0 0.0];
        bcolor = [1.0 1.0 1.0];
    else
        bcolor = get(0.0, 'DefaultUicontrolBackgroundColor');
        lcolor = [.4 .4 .4];
    end % if
    % 19 20
    h = get(hObj, 'Handles');
    % 21 22
    set(h.axes, 'Color', bcolor);
    set(h.axes, 'XColor', lcolor);
    set(h.axes, 'YColor', lcolor);
    % 25 26
    hText = findall(h.axes, 'type', 'text');
    hLines = findall(h.axes, 'type', 'line');
    set(vertcat(hLines, hText), 'color', lcolor);
    % 29 30
    hPatch = findall(h.axes, 'type', 'patch');
    set(hPatch, 'EdgeColor', lcolor);
end % function
