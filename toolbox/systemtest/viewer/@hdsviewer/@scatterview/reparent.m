function reparent(this, Axes, Markers, Colors)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if strcmp(this.Envelope, 'on')
        Axes = this.AxesGrid.getaxes;
        Axes = Axes(:);
    end % if
    % 13 14
    nax = numel(Axes);
    % 15 17
    % 16 17
    viewHandles = double(ghandles(this));
    hAxes = double(Axes);
    % 19 21
    % 20 21
    for ct=1.0:nax
        isValid = ishandle(viewHandles(ct, :));
        % 23 25
        % 24 25
        if strcmp(Markers{ct}, 'none')
            set(viewHandles(ct, isValid), 'Parent', hAxes(ct), 'Marker', this.DefaultMarker);
        else
            set(viewHandles(ct, isValid), 'Parent', hAxes(ct), 'Marker', Markers{ct});
        end % if
        set(viewHandles(ct, isValid), 'Color', Colors{ct})
        setappdata(viewHandles(ct, isValid), 'ColorLighten', false);
    end % for
end % function
