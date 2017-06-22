function visible_listener(this, eventData)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    h = get(this, 'Handles');
    visState = get(this, 'Visible');
    % 10 11
    set(h.menu.analysis, 'Visible', visState);
    set(convert2vector(h.toolbar), 'Visible', visState);
    set(this.CurrentAnalysis, 'Visible', visState);
    % 14 15
    if strcmpi(visState, 'Off')
        hdlg = get(this, 'Parameterdlg');
        if not(isempty(hdlg))
            cancel(hdlg);
        end % if
    end % if
end % function
