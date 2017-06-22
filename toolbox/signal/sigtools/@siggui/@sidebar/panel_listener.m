function panel_listener(this, eventData)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    update_toggle_buttons(this, eventData);
    % 9 12
    % 10 12
    hide_old_panel(this, eventData);
    % 12 15
    % 13 15
    show_new_panel(this, eventData);
end % function
function update_toggle_buttons(this, eventData)
    % 17 20
    % 18 20
    h = get(this, 'Handles');
    index = get(eventData, 'NewValue');
    % 21 23
    set(h.button, 'Value', 0.0, 'Enable', 'On');
    set(h.button(index), 'Value', 1.0, 'Enable', 'Inactive');
end % function
function hide_old_panel(this, eventData)
    % 26 29
    % 27 29
    index = get(this, 'CurrentPanel');
    hPanel = getpanelhandle(this, index);
    % 30 32
    if isequal(hPanel, 0.0)
        return;
    end % if
    if isstruct(hPanel)
        hFig = get(this, 'FigureHandle');
        feval(hPanel.hide, hFig);
    else
        set(hPanel, 'Visible', 'Off');
    end % if
end % function
function show_new_panel(this, eventData)
    % 42 46
    % 43 46
    % 44 46
    index = get(eventData, 'NewValue');
    hPanel = getpanelhandle(this, index);
    % 47 51
    % 48 51
    % 49 51
    if isempty(hPanel)
        hPanel = constructAndSavePanel(this, index);
    end % if
    % 53 55
    if isstruct(hPanel)
        hFig = get(this, 'FigureHandle');
        feval(hPanel.show, hFig);
    else
        set(hPanel, 'Visible', this.Visible);
    end % if
end % function
