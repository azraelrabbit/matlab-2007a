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
    % 15 17
    % 16 17
    if isnan(gridpt)
        set(h.SelectionMarker, 'Visible', 'off')
        hScatters = handle(h.Scatters);
        for i=1.0:length(hScatters)
            c = get(hScatters(i), 'Color');
            lightencolor = getappdata(hScatters(i), 'ColorLighten');
            if isa(hScatters(i), 'hg.line') && not(isempty(lightencolor)) && lightencolor
                set(hScatters(i), 'Color', mrdivide(minus(c, lambda), minus(1.0, lambda)))
                setappdata(hScatters(i), 'ColorLighten', false);
            end % if
        end % for
        return;
    end % if
    % 30 32
    % 31 32
    if strcmp(h.Envelope, 'on')
        return;
    end % if
    % 35 37
    % 36 37
    theseScatters = handle(h.Scatters);
    markerXData = [];
    markerYData = [];
    markerParent = [];
    % 41 42
    for k=1.0:length(theseScatters)
        I = eq(get(theseScatters(k), 'UserData'), gridpt);
        if any(I)
            thisScatter = theseScatters(k);
            thispos = find(I);
            xdata = get(thisScatter, 'XData');
            ydata = get(thisScatter, 'YData');
            markerXData = vertcat(markerXData, xdata(thispos));
            markerYData = vertcat(markerYData, ydata(thispos));
            markerParent = get(thisScatter, 'Parent');
        end % if
        if isa(theseScatters(k), 'hg.line')
            c = get(theseScatters(k), 'Color');
            lightencolor = getappdata(theseScatters(k), 'ColorLighten');
            if isempty(lightencolor) || not(lightencolor)
                set(theseScatters(k), 'Color', plus(lambda, mtimes(minus(1.0, lambda), c)), 'ZData', []);
                setappdata(theseScatters(k), 'ColorLighten', true);
            end % if
        end % if
    end % for
    % 62 64
    % 63 64
    if not(isempty(markerXData))
        set(h.SelectionMarker, 'xdata', markerXData, 'YData', markerYData, 'ZData', mtimes(10.0, ones(size(markerXData))), 'Parent', markerParent, 'Visible', 'on');
        % 66 67
    end % if
end % function
