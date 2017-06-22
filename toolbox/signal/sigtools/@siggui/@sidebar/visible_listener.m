function visible_listener(this, eventData)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    h = handles2vector(this);
    visState = get(this, 'Visible');
    set(h, 'Visible', visState);
    % 11 12
    hP = getpanelhandle(this, this.CurrentPanel);
    % 13 14
    if isstruct(hP)
        if strcmpi(visState, 'On')
            feval(hP.show, this.FigureHandle);
        else
            feval(hP.hide, this.FigureHandle);
        end % if
    else
        set(hP, 'Visible', visState);
    end % if
end % function
