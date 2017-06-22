function setselect(h, gridpt)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if strcmp(h.SelectionMode, 'off') && not(isnan(gridpt))
        return;
    end % if
    % 13 15
    % 14 15
    if isnan(gridpt)
        set(h.SelectionMarker, 'Visible', 'off')
        alpha(h.Surface, 1.0)
        return;
    end % if
    % 20 22
    % 21 22
    thesesurfaces = double(h.Surface);
    for k=1.0:length(thesesurfaces)
        [Irow, Icol] = find(eq(get(thesesurfaces(k), 'UserData'), gridpt));
        if not(isempty(Irow)) && not(isempty(Icol))
            thissurface = thesesurfaces(k);
            xdata = get(thissurface, 'XData');
            ydata = get(thissurface, 'YData');
            zdata = get(thissurface, 'ZData');
            if not(isempty(xdata))
                set(h.SelectionMarker, 'Xdata', xdata(Icol(1.0)), 'YData', ydata(Irow(1.0)), 'ZData', zdata(Irow(1.0), Icol(1.0)), 'Parent', get(thissurface, 'Parent'), 'Visible', 'on');
                % 32 34
                % 33 34
                alpha(h.Surface, .05)
            end % if
            return;
        end % if
    end % for
end % function
