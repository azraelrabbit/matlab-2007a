function xyresp(this, r, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    [xdata, ydata, yindex, iteration, rowlabels, collabels] = this.FilterControl.plot_lineresp_numeric(this.xvar, this.yvar, this.RowVar, this.ColumnVar, this.MarkerVar, this.ColorVar);
    % 10 13
    % 11 13
    % 12 13
    if gt(length(rowlabels), 10.0) || gt(length(collabels), 10.0)
        msg = 'Cannot generate a plot with more than 10 rows or columns. Try using a different test vector to distinguish rows/cols.';
        uiwait(errordlg(msg, 'Test Results Viewer', 'modal'));
        r.Data.Exception = true;
        return;
    end % if
    % 19 21
    % 20 21
    if isempty(r.Data.XData) && strcmp(r.View.Visible, 'on')
        % 22 23
        set(r.Data, 'XData', xdata, 'YData', ydata{1.0}, 'GridIds', iteration{1.0}, 'RowData', rowlabels, 'ColumnData', collabels)
        % 24 26
        % 25 26
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
        % 36 37
    end % if
end % function
