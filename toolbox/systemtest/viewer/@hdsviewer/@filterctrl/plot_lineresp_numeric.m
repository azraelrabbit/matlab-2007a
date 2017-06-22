function [x_data, y_data, y_index, iteration, row_label, col_label] = plot_lineresp_numeric(this, x, y, rowvar, colvar, markervar, colorvar)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    if isempty(x)
        [x_data, y_data, y_index, iteration, row_label, col_label] = utXAutoYNonGrid(this, x, y, rowvar, colvar, markervar, colorvar);
    else
        % 18 24
        % 19 24
        % 20 24
        % 21 24
        % 22 24
        if ismember(x{:}, fieldnames(this.DataSet.testvector))
            [x_data, y_data, y_index, iteration, row_label, col_label] = utXGridYNonGrid(this, x, y, rowvar, colvar, markervar, colorvar);
        else
            if ismember(x{:}, fieldnames(this.DataSet.variable))
                [x_data, y_data, y_index, iteration, row_label, col_label] = utXNonGridYNonGrid(this, x, y, rowvar, colvar, markervar, colorvar);
            else
                % 29 31
                error('x is not recognizable');
            end % if
        end % if
    end % if
end % function
