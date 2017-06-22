function wfresp(this, r, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if any(strcmp(this.FilterControl.getVarClass(this.zvar{1.0}), {'Simulink.Timeseries','timeseries','tsdata.timeseries'}))
        % 9 10
        [xdata, ydata, yindex, iteration, rowLabels, colLabels] = this.FilterControl.plot_lineresp_timeseries(this.xvar, this.zvar, this.RowVar, this.ColumnVar, this.MarkerVar, this.ColorVar);
    else
        % 12 13
        % 13 14
        [xdata, ydata, yindex, iteration, rowLabels, colLabels] = this.FilterControl.plot_lineresp_numeric({}, this.zvar, this.RowVar, this.ColumnVar, this.MarkerVar, this.ColorVar);
        % 15 19
        % 16 19
        % 17 19
        % 18 19
        xdata = cellhorzcat(repmat(cellhorzcat(xdata), this.FilterControl.getGridSize));
        ydata = num2cell(ydata{1.0}, yindex{1.0});
        ydata = cellhorzcat(permute(ydata, horzcat(setdiff(1.0:ndims(ydata), yindex{1.0}), yindex{1.0})));
        % 22 23
        iteration1 = iteration{1.0};
        ind = repmat({':'}, horzcat(1.0, ndims(iteration)));
        ind{yindex{1.0}} = 1.0;
        iteration1 = iteration1(ind{:});
        iteration = permute(iteration1, horzcat(setdiff(1.0:ndims(iteration), yindex{1.0}), yindex{1.0}));
    end % if
    % 29 31
    % 30 31
    if gt(length(rowLabels), 10.0) || gt(length(colLabels), 10.0)
        msg = 'Cannot generate a plot with more than 10 rows or columns. Try using a different test vector to distinguish rows/cols.';
        uiwait(errordlg(msg, 'Test Results Viewer', 'modal'));
        r.Data.Exception = true;
        return;
    end % if
    % 37 39
    % 38 39
    if isempty(r.Data.XData) && strcmp(r.View.Visible, 'on')
        % 40 41
        set(r.Data, 'XData', xdata{1.0}, 'ZData', ydata{1.0}, 'GridIds', iteration, 'RowData', rowLabels, 'ColumnData', colLabels)
        % 42 43
        if strcmpi(this.yVar, 'iteration')
            r.Data.YData = 1.0:cellfun('prodofsize', xdata);
        else
            r.Data.YData = iteration;
        end % if
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
        % 58 59
    end % if
end % function
