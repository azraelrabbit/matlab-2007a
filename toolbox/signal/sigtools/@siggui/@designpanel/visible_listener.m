function visible_listener(this, eventData)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    visState = get(this, 'Visible');
    % 8 10
    set(horzcat(getcomponent(this, '-class', 'siggui.selector', 'Name', 'Response Type'), getcomponent(this, '-class', 'siggui.selector', 'Name', 'Design Method'), this.ActiveComponents), 'Visible', visState);
    % 10 14
    % 11 14
    % 12 14
    if isempty(this.CurrentDesignMethod)
        set(this.Frames, 'Visible', visState);
    end % if
    set(this.Handles.design, 'Visible', visState)
    listeners(this, eventData, 'staticresponse_listener');
end % function
