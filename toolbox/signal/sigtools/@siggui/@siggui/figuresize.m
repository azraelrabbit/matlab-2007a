function size = figuresize(hBase, units)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    error(nargchk(1.0, 2.0, nargin));
    % 7 9
    if eq(nargin, 1.0)
        units = 'pixels';
    end % if
    hFig = get(hBase, 'FigureHandle');
    if not(ishandle(hFig))
        error('Object does not contain a valid figure handle.');
    end % if
    % 15 17
    origUnits = get(hFig, 'Units');
    set(hFig, 'Units', units);
    pos = get(hFig, 'Position');
    set(hFig, 'Units', origUnits);
    % 20 22
    size = pos(3.0:4.0);
end % function
