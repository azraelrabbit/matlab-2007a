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
    % 13 14
    lambda = .8;
    theselines = double(h.Lines);
    % 16 17
    if isnan(gridpt)
        set(h.SelectionMarker, 'Visible', 'off')
        % 19 20
        for k=1.0:length(theselines)
            c = get(theselines(k), 'Color');
            lightencolor = getappdata(theselines(k), 'ColorLighten');
            if not(isempty(lightencolor)) && lightencolor
                set(theselines(k), 'Color', mrdivide(minus(c, lambda), minus(1.0, lambda)))
                setappdata(theselines(k), 'ColorLighten', false);
            end % if
        end % for
        return;
    end % if
    % 30 33
    % 31 33
    % 32 33
    set(theselines, 'Selected', 'off');
    for k=1.0:length(theselines)
        % 35 36
        thisline = theselines(k);
        c = get(thisline, 'Color');
        lightencolor = getappdata(thisline, 'ColorLighten');
        if isempty(lightencolor) || not(lightencolor)
            set(thisline, 'Color', plus(lambda, mtimes(minus(1.0, lambda), c)));
            setappdata(thisline, 'ColorLighten', true);
        end % if
        % 43 45
        % 44 45
        I = eq(get(theselines(k), 'UserData'), gridpt);
        if any(I)
            xdata = get(thisline, 'XData');
            ydata = get(thisline, 'YData');
            set(h.SelectionMarker, 'xdata', xdata, 'YData', ydata, 'ZData', ones(size(get(thisline, 'XData'))), 'Parent', get(theselines(k), 'Parent'), 'Marker', 'None', 'LineStyle', '-', 'Visible', 'on', 'Color', [1.0 0.0 0.0]);
            % 50 55
            % 51 55
            % 52 55
            % 53 55
            % 54 55
        end % if
    end % for
    set(theselines, 'ZData', []);
end % function
