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
        tmpAxes = ctranspose(horzcat(Axes(:), Axes(:)));
        Axes = tmpAxes(:);
        Markers = repmat({'none'}, horzcat(numel(Axes), 1.0));
    end % if
    % 15 17
    % 16 17
    nax = numel(Axes);
    hAxes = double(Axes);
    viewHandles = double(ghandles(this));
    colorVec = cell2mat(Colors);
    if isvector(colorVec) || not(any(any(diff(colorVec))))
        for ct=1.0:nax
            isValid = ishandle(viewHandles(ct, :));
            set(viewHandles(ct, isValid), 'Parent', hAxes(ct), 'Marker', Markers{ct}, 'FaceColor', 'flat');
            % 25 27
            % 26 27
        end % for
    else
        for ct=1.0:nax
            isValid = ishandle(viewHandles(ct, :));
            set(viewHandles(ct, isValid), 'Parent', hAxes(ct), 'Marker', Markers{ct}, 'FaceColor', Colors{ct});
            % 32 33
        end % for
    end % if
end % function
