function [x_data, y_data, y_index, iteration, row_label, col_label] = plot_scatterresp(this, x, y, rowvar, colvar, markervar, colorvar)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    gridVars = fieldnames(this.DataSet.testvector);
    depVars = fieldnames(this.DataSet.variable);
    gridSize = this.getGridSize;
    % 13 16
    % 14 16
    if ismember(x{:}, gridVars)
        [x_data, y_data, y_index, iteration, row_label, col_label] = utXGridYNonGrid(this, x, y, rowvar, colvar, markervar, colorvar);
        % 17 23
        % 18 23
        % 19 23
        % 20 23
        % 21 23
        if gt(ndims(y_data{1.0}), length(gridVars))
            % 23 25
            ydata_ = permute(y_data{1.0}, horzcat(plus(length(gridSize), 1.0), 1.0:length(gridSize)));
            % 25 29
            % 26 29
            % 27 29
            s = size(ydata_);
            if ge(length(s), 3.0)
                y_data{1.0} = reshape(ydata_, horzcat(mtimes(s(1.0), s(2.0)), s(3.0:end)));
            else
                y_data{1.0} = reshape(ydata_, horzcat(mtimes(s(1.0), s(2.0)), 1.0));
            end % if
            x_data = repmat(x_data(:), horzcat(s(1.0), 1.0));
            iteration = cellhorzcat(repmat(iteration{1.0}, horzcat(s(1.0), 1.0)));
        end % if
    else
        % 38 40
        if ismember(x{:}, depVars)
            [x_data, y_data, y_index, iteration, row_label, col_label] = utXNonGridYNonGrid(this, x, y, rowvar, colvar, markervar, colorvar);
        else
            % 42 44
            error('x is not recognizable');
        end % if
    end % if
end % function
