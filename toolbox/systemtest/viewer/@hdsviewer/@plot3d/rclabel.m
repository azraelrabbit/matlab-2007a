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
    % 10 11
    ax = h.AxesGrid.getaxes;
    set(ax, 'CameraPositionMode', 'auto')
    set(ax, 'view', [45.0 45.0])
    % 14 16
    % 15 16
    h.AxesGrid.XLabel = h.Waves(1.0).DataSrc.Xvar{1.0};
    h.AxesGrid.yLabel = h.Waves(1.0).DataSrc.Yvar{1.0};
    if gt(length(h.Waves), 1.0)
        h.AxesGrid.zLabel = 'Multiple';
    else
        h.AxesGrid.zLabel = h.Waves.DataSrc.Zvar{1.0};
    end % if
    % 23 25
    % 24 25
    if not(isempty(h.Waves(1.0).DataSrc.RowVar))
        rowlabels = repmat({''}, horzcat(length(h.AxesGrid.RowLabel), 1.0));
        for k=1.0:length(h.AxesGrid.RowLabel)
            rowlabels{k} = sprintf('%s %s', h.Waves(1.0).DataSrc.RowVar{1.0}, h.Waves(1.0).Data.RowData{k});
        end % for
        h.AxesGrid.RowLabel = rowlabels;
    end % if
    % 32 33
    if not(isempty(h.Waves(1.0).DataSrc.ColumnVar))
        collabels = repmat({''}, horzcat(length(h.AxesGrid.ColumnLabel), 1.0));
        for k=1.0:length(h.AxesGrid.ColumnLabel)
            collabels{k} = sprintf('%s %s', h.Waves(1.0).DataSrc.ColumnVar{1.0}, h.Waves(1.0).Data.ColumnData{k});
        end % for
        h.AxesGrid.ColumnLabel = collabels;
    end % if
end % function
