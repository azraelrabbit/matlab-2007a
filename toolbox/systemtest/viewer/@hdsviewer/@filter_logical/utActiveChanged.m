function utActiveChanged(this, varargin)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    if strcmp(this.Active, 'on')
        [SelectedIndex, SelectedGrid] = getselectedindex(this, this.SelectedValue);
        this.SelectedGrid = SelectedGrid;
        this.SelectedIndex = SelectedIndex;
    else
        if this.isgridvariable
            this.SelectedGrid = true(length(this.parent.getinddata(this.hdsvariable)), 1.0);
        else
            this.SelectedGrid = [];
        end % if
        gridSize = this.parent.getGridSize;
        if not(isscalar(gridSize))
            this.SelectedIndex = true(gridSize);
        else
            this.SelectedIndex = true(horzcat(gridSize, 1.0));
        end % if
    end % if
end % function
