function enable_listener(this, eventData)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    sigcontainer_enable_listener(this, eventData);
    % 9 10
    updateaxes(this);
end % function
function updateaxes(this)
    % 13 15
    % 14 15
    enabState = get(this, 'Enable');
    % 16 17
    if strcmpi(enabState, 'on')
        lcolor = [0.0 0.0 0.0];
        bcolor = [1.0 1.0 1.0];
    else
        bcolor = get(0.0, 'DefaultUicontrolBackgroundColor');
        lcolor = [.4 .4 .4];
    end % if
    % 24 25
    h = get(this, 'Handles');
    % 26 27
    set(h.staticresp, 'Color', bcolor);
    set(h.staticresp, 'XColor', lcolor);
    set(h.staticresp, 'YColor', lcolor);
    % 30 31
    hText = findall(h.staticresp, 'type', 'text');
    hLines = findall(h.staticresp, 'type', 'line');
    set(vertcat(hLines, hText), 'color', lcolor);
    % 34 35
    hPatch = findall(h.staticresp, 'type', 'patch');
    set(hPatch, 'EdgeColor', lcolor);
end % function
