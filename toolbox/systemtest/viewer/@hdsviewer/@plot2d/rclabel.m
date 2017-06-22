function rclabel(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isempty(h.Waves)
        return;
    end % if
    % 10 12
    % 11 12
    if not(isempty(h.Waves(1.0).DataSrc.Xvar))
        h.AxesGrid.XLabel = h.Waves(1.0).DataSrc.Xvar{1.0};
    else
        h.AxesGrid.XLabel = 'Index';
    end % if
    if gt(length(h.Waves), 1.0)
        h.AxesGrid.yLabel = 'Multiple';
    else
        h.AxesGrid.yLabel = h.Waves.DataSrc.Yvar{1.0};
    end % if
    % 22 24
    % 23 24
    if not(isempty(h.waves(1.0).DataSrc.RowVar))
        rowlabels = repmat({''}, horzcat(length(h.AxesGrid.RowLabel), 1.0));
        for k=1.0:length(h.AxesGrid.RowLabel)
            rowlabels{k} = sprintf('%s %s', h.waves(1.0).DataSrc.RowVar{1.0}, h.waves(1.0).Data.RowData{k});
        end % for
        h.AxesGrid.RowLabel = rowlabels;
    end % if
    % 31 32
    if not(isempty(h.waves(1.0).DataSrc.ColumnVar))
        collabels = repmat({''}, horzcat(length(h.AxesGrid.ColumnLabel), 1.0));
        for k=1.0:length(h.AxesGrid.ColumnLabel)
            collabels{k} = sprintf('%s %s', h.waves(1.0).DataSrc.ColumnVar{1.0}, h.waves(1.0).Data.ColumnData{k});
        end % for
        h.AxesGrid.ColumnLabel = collabels;
    end % if
end % function
