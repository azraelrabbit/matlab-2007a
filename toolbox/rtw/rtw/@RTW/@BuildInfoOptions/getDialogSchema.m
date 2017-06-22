function dlgstruct = getDialogSchema(hSrc, schemaName)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    dlgstruct = [];
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    widget = [];
    widget.Name = 'Preprocessor Defines';
    widget.Type = 'table';
    widget.Enabled = true;
    widget.Size = horzcat(length(hSrc.Defines), 3.0);
    widget.Grid = true;
    widget.ColHeader = {'Group','Define','Value'};
    widget.HeaderVisibility = [0.0 1.0];
    % 19 20
    if gt(length(hSrc.Defines), 1.0)
        widget.Data(:, 1.0) = get(hSrc.Defines, 'Group');
        widget.Data(:, 2.0) = get(hSrc.Defines, 'Key');
        widget.Data(:, 3.0) = get(hSrc.Defines, 'Value');
    else
        widget.Data(1.0, 1.0) = cellhorzcat(get(hSrc.Defines, 'Group'));
        widget.Data(1.0, 2.0) = cellhorzcat(get(hSrc.Defines, 'Key'));
        widget.Data(1.0, 3.0) = cellhorzcat(get(hSrc.Defines, 'Value'));
    end % if
    % 29 30
    widget.ToolTip = 'Preprocessor Defines';
    widget.Mode = 1.0;
    Defines = widget;
    widget = [];
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    widget.Name = 'Compile Flags';
    widget.Type = 'table';
    widget.Enabled = true;
    widget.Size = horzcat(length(hSrc.CompileFlags), 2.0);
    widget.Grid = true;
    widget.ColHeader = {'Group','Value'};
    widget.HeaderVisibility = [0.0 1.0];
    % 45 46
    if gt(length(hSrc.CompileFlags), 1.0)
        widget.Data(:, 1.0) = get(hSrc.CompileFlags, 'Group');
        widget.Data(:, 2.0) = get(hSrc.CompileFlags, 'Value');
    else
        widget.Data(1.0, 1.0) = cellhorzcat(get(hSrc.CompileFlags, 'Group'));
        widget.Data(1.0, 2.0) = cellhorzcat(get(hSrc.CompileFlags, 'Value'));
    end % if
    % 53 54
    widget.ToolTip = 'Compile Flags';
    widget.Mode = 1.0;
    CompileFlags = widget;
    widget = [];
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    % 62 63
    widget.Name = 'Link Flags';
    widget.Type = 'table';
    widget.Enabled = true;
    widget.Size = horzcat(length(hSrc.LinkFlags), 2.0);
    widget.Grid = true;
    widget.ColHeader = {'Group','Value'};
    widget.HeaderVisibility = [0.0 1.0];
    % 70 71
    if gt(length(hSrc.LinkFlags), 1.0)
        widget.Data(:, 1.0) = get(hSrc.LinkFlags, 'Group');
        widget.Data(:, 2.0) = get(hSrc.LinkFlags, 'Value');
    else
        widget.Data(1.0, 1.0) = cellhorzcat(get(hSrc.LinkFlags, 'Group'));
        widget.Data(1.0, 2.0) = cellhorzcat(get(hSrc.LinkFlags, 'Value'));
    end % if
    % 78 79
    widget.ToolTip = 'Link Flags';
    widget.Mode = 1.0;
    LinkFlags = widget;
    widget = [];
    % 83 87
    % 84 87
    % 85 87
    % 86 87
    Defines.RowSpan = [1.0 1.0];
    Defines.ColSpan = [1.0 3.0];
    CompileFlags.RowSpan = [2.0 2.0];
    CompileFlags.ColSpan = [1.0 3.0];
    LinkFlags.RowSpan = [3.0 3.0];
    LinkFlags.ColSpan = [1.0 3.0];
    % 93 95
    % 94 95
    group.Name = 'Options';
    group.Type = 'group';
    group.LayoutGrid = [3.0 3.0];
    group.Items = cellhorzcat(Defines, CompileFlags, LinkFlags);
    % 99 101
    % 100 101
    dlgstruct.DialogTitle = 'Options';
    dlgstruct.Items = cellhorzcat(group);
end % function
