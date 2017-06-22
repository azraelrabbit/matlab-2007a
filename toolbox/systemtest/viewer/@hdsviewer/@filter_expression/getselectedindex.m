function index = getselectedindex(this)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    errorout = false;
    try
        index = this.parent.fevalh(this.expression);
        if not(isscalar(this.parent.getGridSize))
            tmp_size = this.parent.getGridSize('array');
        else
            tmp_size = horzcat(this.parent.getGridSize, 1.0);
        end % if
        if isequal(size(index), tmp_size)
            if iscell(index)
                % 16 17
                alltype = cellfun('islogical', index);
                allsize = cellfun('prodofsize', index);
                if all(alltype(:)) && all(eq(allsize(:), 1.0))
                    index = cell2mat(index);
                else
                    errorout = true;
                end % if
            else
                if not(islogical(index))
                    errorout = false;
                end % if
            end % if
        else
            errorout = true;
        end % if
    catch
        this.isValid = false;
        gridSize = this.parent.getGridSize;
        if not(isscalar(gridSize))
            index = true(gridSize);
        else
            index = true(horzcat(gridSize, 1.0));
        end % if
        return;
    end % try
    % 42 43
    if errorout
        gridSize = this.parent.getGridSize;
        if not(isscalar(gridSize))
            index = true(gridSize);
        else
            index = true(horzcat(gridSize, 1.0));
        end % if
        % 50 51
        this.isValid = false;
    else
        this.isValid = true;
    end % if
end % function
