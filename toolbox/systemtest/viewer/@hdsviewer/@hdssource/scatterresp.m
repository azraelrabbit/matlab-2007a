function scatterresp(this, r, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    [xdata, ydata, yindex, iteration, rowlabels, collabels] = this.FilterControl.plot_scatterresp(this.xvar, this.yvar, this.RowVar, this.ColumnVar, this.MarkerVar, this.ColorVar);
    % 11 14
    % 12 14
    % 13 14
    if gt(length(rowlabels), 10.0) || gt(length(collabels), 10.0)
        msg = 'Cannot generate a plot with more than 10 rows or columns. Try using a different test vector to distinguish rows/cols.';
        uiwait(errordlg(msg, 'Test Results Viewer', 'modal'));
        r.Data.Exception = true;
        return;
    end % if
    % 20 22
    % 21 22
    if isempty(r.Data.XData) && strcmp(r.View.Visible, 'on')
        % 23 24
        set(r.Data, 'XData', xdata, 'YData', ydata{1.0}, 'GridIds', iteration{1.0}, 'RowData', rowlabels, 'ColumnData', collabels)
        % 25 27
        % 26 27
        if not(isempty(yindex{4.0}))
            r.Data.MarkerData = 1.0:size(ydata{1.0}, yindex{4.0});
        else
            r.Data.MarkerData = 0.0;
        end % if
        if not(isempty(yindex{5.0}))
            r.Data.ColorData = 1.0:size(ydata{1.0}, yindex{5.0});
        else
            r.Data.ColorData = 0.0;
        end % if
    end % if
end % function
