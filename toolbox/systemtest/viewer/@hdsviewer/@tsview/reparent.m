function reparent(this, Axes, Markers, Colors)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    nax = numel(Axes);
    % 11 13
    % 12 13
    viewHandles = double(ghandles(this));
    hAxes = double(Axes);
    % 15 16
    for ct=1.0:nax
        isValid = ishandle(viewHandles(ct, :));
        set(viewHandles(ct, isValid), 'Parent', hAxes(ct), 'Marker', Markers{ct}, 'Color', Colors{ct});
        % 19 20
        setappdata(viewHandles(ct, isValid), 'ColorLighten', false);
    end % for
end % function
