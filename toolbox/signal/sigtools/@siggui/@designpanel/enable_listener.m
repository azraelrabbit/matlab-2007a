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
    if isempty(this.CurrentDesignMethod)
        set(this.Frames(3.0:4.0), 'Enable', this.Enable);
    end % if
end % function
