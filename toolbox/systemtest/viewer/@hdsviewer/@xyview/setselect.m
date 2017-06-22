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
        hLines = handle(h.Lines);
        set(hLines(strcmp(get(h.Lines, 'Type'), 'line')), 'Selected', 'off')
        % 19 20
        return;
    end % if
    % 22 24
    % 23 24
    if strcmp(h.Envelope, 'on')
        return;
    end % if
    % 27 29
    % 28 29
    theselines = double(h.Lines);
    markerXData = [];
    markerYData = [];
    markerParent = [];
    gridpts = get(theselines(1.0), 'UserData');
    % 34 36
    % 35 36
    set(theselines, 'Selected', 'off');
    % 37 38
    if eq(length(gridpts), 1.0)
        % 39 40
        for k=1.0:length(theselines)
            if eq(get(theselines(k), 'UserData'), gridpt)
                xdata = get(theselines(k), 'Xdata');
                ydata = get(theselines(k), 'Ydata');
                set(h.SelectionMarker, 'xdata', xdata, 'YData', ydata, 'ZData', mtimes(10.0, ones(size(xdata))), 'Parent', get(theselines(k), 'Parent'), 'Marker', 'None', 'Selected', 'on', 'LineStyle', '-', 'Visible', 'on', 'Color', [0.0 0.0 0.0]);
                % 45 51
                % 46 51
                % 47 51
                % 48 51
                % 49 51
                % 50 51
            end % if
        end % for
        return;
    else
        for k=1.0:length(theselines)
            I = eq(get(theselines(k), 'UserData'), gridpt);
            if any(I)
                thisline = theselines(k);
                thispos = find(I);
                xdata = get(thisline, 'XData');
                ydata = get(thisline, 'YData');
                markerXData = vertcat(markerXData, xdata(thispos));
                markerYData = vertcat(markerYData, ydata(thispos));
                markerParent = get(thisline, 'Parent');
            end % if
        end % for
        % 67 69
        % 68 69
        if not(isempty(markerXData))
            set(h.SelectionMarker, 'xdata', markerXData(:), 'YData', markerYData(:), 'ZData', mtimes(10.0, ones(size(markerXData(:)))), 'Parent', markerParent, 'Visible', 'on');
            % 71 72
        end % if
    end % if
end % function
