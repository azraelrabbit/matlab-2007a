function tsresp(this, r, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    [xdata, ydata, yindex, iteration, rowLabels, colLabels] = this.FilterControl.plot_lineresp_timeseries(this.xvar, this.yvar, this.RowVar, this.ColumnVar, this.MarkerVar, this.ColorVar);
    % 9 12
    % 10 12
    % 11 12
    if gt(length(rowLabels), 10.0) || gt(length(colLabels), 10.0)
        msg = 'Cannot generate a plot with more than 10 rows or columns. Try using a different test vector to distinguish rows/cols.';
        uiwait(errordlg(msg, 'Test Results Viewer', 'modal'));
        r.Data.Exception = true;
        return;
    end % if
    % 18 20
    % 19 20
    if isempty(r.Data.XData) && strcmp(r.View.Visible, 'on')
        % 21 22
        set(r.Data, 'XData', xdata{1.0}, 'YData', ydata{1.0}, 'GridIds', iteration, 'RowData', rowLabels, 'ColumnData', colLabels)
        % 23 24
        if not(isempty(yindex{3.0}))
            r.Data.MarkerData = 1.0:size(ydata{1.0}, yindex{3.0});
        else
            r.Data.MarkerData = 0.0;
        end % if
        if not(isempty(yindex{4.0}))
            r.Data.ColorData = 1.0:size(ydata{1.0}, yindex{4.0});
        else
            r.Data.ColorData = 0.0;
        end % if
        % 34 35
    end % if
end % function
