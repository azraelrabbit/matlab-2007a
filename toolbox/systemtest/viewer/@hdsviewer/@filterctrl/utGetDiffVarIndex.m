function [untouched_gridindex, untouched_nongridindex, x_index, y_index, row_index, col_index, marker_index, color_index] = utGetDiffVarIndex(this, plot_type, untouched_gridindex, untouched_nongridindex, Number, xGrid, yGrid, rowvar, colvar, markervar, colorvar)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    gridVars = fieldnames(this.DataSet.testvector);
    groupedVars = this.GroupedVariables;
    [junk, Iord] = setdiff(gridVars, groupedVars);
    unGroupedVars = gridVars(sort(Iord));
    unGroupedVars = ctranspose(unGroupedVars(:));
    % 18 20
    % 19 20
    if not(isempty(xGrid))
        x_index = localFindIndex(xGrid{:}, unGroupedVars, groupedVars);
        % 22 23
        [untouched_gridindex, untouched_nongridindex] = local_remained(plot_type, untouched_gridindex, untouched_nongridindex, Number, x_index);
    else
        % 25 26
        x_index = [];
    end % if
    % 28 30
    % 29 30
    if not(isempty(yGrid))
        y_index = localFindIndex(yGrid{:}, unGroupedVars, groupedVars);
        % 32 33
        [untouched_gridindex, untouched_nongridindex] = local_remained(plot_type, untouched_gridindex, untouched_nongridindex, Number, y_index);
    else
        % 35 36
        y_index = [];
    end % if
    % 38 40
    % 39 40
    if not(isempty(rowvar))
        row_index = localFindIndex(rowvar{:}, unGroupedVars, groupedVars);
        % 42 43
        [untouched_gridindex, untouched_nongridindex] = local_remained(plot_type, untouched_gridindex, untouched_nongridindex, Number, row_index);
    else
        % 45 46
        row_index = [];
    end % if
    % 48 50
    % 49 50
    if not(isempty(colvar))
        col_index = localFindIndex(colvar{:}, unGroupedVars, groupedVars);
        % 52 53
        [untouched_gridindex, untouched_nongridindex] = local_remained(plot_type, untouched_gridindex, untouched_nongridindex, Number, col_index);
    else
        % 55 56
        col_index = [];
    end % if
    % 58 60
    % 59 60
    if not(isempty(markervar))
        marker_index = localFindIndex(markervar{:}, unGroupedVars, groupedVars);
        % 62 63
        [untouched_gridindex, untouched_nongridindex] = local_remained(plot_type, untouched_gridindex, untouched_nongridindex, Number, marker_index);
    else
        % 65 66
        marker_index = [];
    end % if
    % 68 70
    % 69 70
    if not(isempty(colorvar))
        color_index = localFindIndex(colorvar{:}, unGroupedVars, groupedVars);
        % 72 73
        [untouched_gridindex, untouched_nongridindex] = local_remained(plot_type, untouched_gridindex, untouched_nongridindex, Number, color_index);
    else
        % 75 76
        color_index = [];
    end % if
end % function
function [mygrid, mynongrid] = local_remained(plot_type, mygrid, mynongrid, numDepVars, index)
    % 80 84
    % 81 84
    % 82 84
    % 83 84
    if strcmp(plot_type, 'GridOnly')
        mygrid(index) = 0.0;
        mynongrid = [];
    else
        mygrid(index) = 0.0;
        for i=1.0:numDepVars
            tmp = mynongrid{i};
            tmp(index) = 0.0;
            mynongrid(i) = cellhorzcat(tmp);
        end % for
    end % if
end % function
function outIndex = localFindIndex(varName, unGroupedVars, groupedVars)
    % 97 100
    % 98 100
    % 99 100
    if any(strcmpi(varName, groupedVars))
        outIndex = plus(numel(unGroupedVars), 1.0);
    else
        [junk, outIndex] = ismember(varName, unGroupedVars);
    end % if
    if eq(outIndex, 0.0)
        error('variable has to be a test vector');
    end % if
end % function
