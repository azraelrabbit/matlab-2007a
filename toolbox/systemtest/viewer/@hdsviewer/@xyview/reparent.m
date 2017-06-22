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
    isLine = strcmp(get(viewHandles, {'Type'}), 'line');
    % 22 24
    % 23 24
    for ct=1.0:nax
        set(viewHandles(ct), 'Parent', hAxes(ct), 'Marker', Markers{ct});
        if isLine(ct)
            set(viewHandles(ct), 'Color', Colors{ct})
        end % if
    end % for
end % function
