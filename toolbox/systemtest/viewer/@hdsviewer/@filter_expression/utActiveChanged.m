function utActiveChanged(h, varargin)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    if strcmp(h.Active, 'on')
        newindex = h.getselectedindex;
        if isequal(newindex, h.SelectedIndex)
            h.parent.getfilteredgridindex([], []);
        else
            h.SelectedIndex = newindex;
        end % if
        h.SelectedIndexCache = h.SelectedIndex;
    else
        gridSize = h.parent.getGridSize;
        if not(isscalar(gridSize))
            h.SelectedIndex = true(gridSize);
        else
            h.SelectedIndex = true(horzcat(gridSize, 1.0));
        end % if
    end % if
end % function
