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
    nax = prod(size(Axes));
    % 11 13
    % 12 13
    viewHandles = double(ghandles(this));
    hAxes = double(Axes);
    colorVec = cell2mat(Colors);
    if isvector(colorVec) || not(any(any(diff(colorVec))))
        for ct=1.0:nax
            isValid = ishandle(viewHandles(ct, :));
            set(viewHandles(ct, isValid), 'Parent', hAxes(ct), 'Marker', Markers{ct}, 'EdgeColor', 'flat');
            % 20 21
        end % for
    else
        for ct=1.0:nax
            isValid = ishandle(viewHandles(ct, :));
            set(viewHandles(ct, isValid), 'Parent', hAxes(ct), 'Marker', Markers{ct}, 'EdgeColor', Colors{ct});
            % 26 27
        end % for
    end % if
end % function
