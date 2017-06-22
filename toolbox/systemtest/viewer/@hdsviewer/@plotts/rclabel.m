function rclabel(h)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    if isempty(h.Waves)
        return;
    end % if
    % 8 10
    % 9 10
    h.AxesGrid.XLabel = h.Waves(1.0).DataSrc.Xvar{1.0};
    if gt(length(h.Waves), 1.0)
        h.AxesGrid.yLabel = 'Multiple';
    else
        h.AxesGrid.yLabel = h.Waves.DataSrc.Yvar{1.0};
    end % if
    % 16 18
    % 17 18
    if not(isempty(h.waves(1.0).DataSrc.RowVar))
        % 19 20
        rowlabels = repmat({''}, horzcat(length(h.AxesGrid.RowLabel), 1.0));
        for k=1.0:length(h.AxesGrid.RowLabel)
            if not(isequal(h.AxesGrid.RowLabel{k}, sprintf('%s %s', h.waves(1.0).DataSrc.RowVar{1.0}, h.waves(1.0).Data.RowData{k})))
                rowlabels{k} = sprintf('%s %s', h.waves(1.0).DataSrc.RowVar{1.0}, h.waves(1.0).Data.RowData{k});
            end % if
        end % for
        h.AxesGrid.RowLabel = rowlabels;
    end % if
    % 28 29
    if not(isempty(h.waves(1.0).DataSrc.ColumnVar))
        % 30 31
        collabels = repmat({''}, horzcat(length(h.AxesGrid.ColumnLabel), 1.0));
        for k=1.0:length(h.AxesGrid.ColumnLabel)
            if not(isequal(h.AxesGrid.ColumnLabel{k}, sprintf('%s %s', h.waves(1.0).DataSrc.ColumnVar{1.0}, h.waves(1.0).Data.ColumnData{k})))
                collabels{k} = sprintf('%s %s', h.waves(1.0).DataSrc.ColumnVar{1.0}, h.waves(1.0).Data.ColumnData{k});
            end % if
        end % for
        h.AxesGrid.ColumnLabel = collabels;
    end % if
end % function
