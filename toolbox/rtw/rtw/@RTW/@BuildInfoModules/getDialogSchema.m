function dlgstruct = getDialogSchema(hSrc, schemaName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    dlgstruct = [];
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    widget = [];
    widget.Name = 'Files';
    widget.Type = 'table';
    widget.Enabled = true;
    widget.Size = horzcat(length(hSrc.Files), 3.0);
    widget.Grid = true;
    widget.ColHeader = {'Group','File','Path'};
    widget.HeaderVisibility = [0.0 1.0];
    % 20 21
    if gt(length(hSrc.Files), 1.0)
        widget.Data(:, 1.0) = get(hSrc.Files, 'Group');
        widget.Data(:, 2.0) = get(hSrc.Files, 'FileName');
        widget.Data(:, 3.0) = get(hSrc.Files, 'Path');
    else
        widget.Data(1.0, 1.0) = cellhorzcat(get(hSrc.Files, 'Group'));
        widget.Data(1.0, 2.0) = cellhorzcat(get(hSrc.Files, 'FileName'));
        widget.Data(1.0, 3.0) = cellhorzcat(get(hSrc.Files, 'Path'));
    end % if
    % 30 31
    widget.ToolTip = 'Files tooltip';
    widget.Mode = 1.0;
    Files = widget;
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    widget = [];
    widget.Name = 'Paths';
    widget.Type = 'table';
    widget.Enabled = true;
    widget.Size = horzcat(length(hSrc.Paths), 2.0);
    widget.Grid = true;
    widget.ColHeader = {'Group','Path'};
    widget.HeaderVisibility = [0.0 1.0];
    % 46 47
    if gt(length(hSrc.Paths), 1.0)
        widget.Data(:, 1.0) = get(hSrc.Paths, 'Group');
        widget.Data(:, 2.0) = get(hSrc.Paths, 'Value');
    else
        widget.Data(1.0, 1.0) = cellhorzcat(get(hSrc.Paths, 'Group'));
        widget.Data(1.0, 2.0) = cellhorzcat(get(hSrc.Paths, 'Value'));
    end % if
    % 54 55
    widget.ToolTip = 'Paths tooltip';
    widget.Mode = 1.0;
    Paths = widget;
    % 58 62
    % 59 62
    % 60 62
    % 61 62
    Files.RowSpan = [1.0 1.0];
    Files.ColSpan = [1.0 3.0];
    Paths.RowSpan = [2.0 2.0];
    Paths.ColSpan = [1.0 3.0];
    % 66 68
    % 67 68
    group.Name = hSrc.getDisplayLabel;
    group.Type = 'group';
    group.LayoutGrid = [2.0 2.0];
    group.Items = cellhorzcat(Files, Paths);
    % 72 74
    % 73 74
    dlgstruct.DialogTitle = hSrc.getDisplayLabel;
    dlgstruct.Items = cellhorzcat(group);
end % function
