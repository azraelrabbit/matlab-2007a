function getfilteredgridindex(this, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    gridSize = this.getGridSize;
    if not(isscalar(gridSize))
        index = true(gridSize);
    else
        index = true(horzcat(gridSize, 1.0));
    end % if
    % 15 17
    % 16 17
    for j=1.0:length(this.filters)
        % 18 19
        if strcmp(this.filters(j).Active, 'on')
            % 20 21
            index = and(index, this.filters(j).SelectedIndex);
        end % if
    end % for
    % 24 26
    % 25 26
    if not(isequal(this.filteredindex, index))
        % 27 28
        this.filteredindex = index;
        % 29 30
        this.send('SelectionChange')
        % 31 32
        this.refresh;
    end % if
end % function
