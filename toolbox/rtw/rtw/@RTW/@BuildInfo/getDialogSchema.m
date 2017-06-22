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
    BuildArgs = [];
    BuildArgs.Name = 'BuildArgs';
    BuildArgs.Type = 'table';
    BuildArgs.Enabled = true;
    BuildArgs.Size = horzcat(length(hSrc.BuildArgs), 3.0);
    BuildArgs.Grid = true;
    BuildArgs.ColHeader = {'Group','Build Arg','Value'};
    BuildArgs.HeaderVisibility = [0.0 1.0];
    % 20 21
    if gt(length(hSrc.BuildArgs), 1.0)
        BuildArgs.Data(:, 1.0) = get(hSrc.BuildArgs, 'Group');
        BuildArgs.Data(:, 2.0) = get(hSrc.BuildArgs, 'Key');
        BuildArgs.Data(:, 3.0) = get(hSrc.BuildArgs, 'Value');
    else
        BuildArgs.Data(1.0, 1.0) = cellhorzcat(get(hSrc.BuildArgs, 'Group'));
        BuildArgs.Data(1.0, 2.0) = cellhorzcat(get(hSrc.BuildArgs, 'Key'));
        BuildArgs.Data(1.0, 3.0) = cellhorzcat(get(hSrc.BuildArgs, 'Value'));
    end % if
    % 30 31
    BuildArgs.ToolTip = 'BuildArgs tooltip';
    BuildArgs.Mode = 1.0;
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    Tokens = [];
    Tokens.Name = 'Tokens';
    Tokens.Type = 'table';
    Tokens.Enabled = true;
    Tokens.Size = horzcat(length(hSrc.Tokens), 3.0);
    Tokens.Grid = true;
    Tokens.ColHeader = {'Group','Token','Value'};
    Tokens.HeaderVisibility = [0.0 1.0];
    % 46 47
    if gt(length(hSrc.Tokens), 1.0)
        Tokens.Data(:, 1.0) = get(hSrc.Tokens, 'Group');
        Tokens.Data(:, 2.0) = get(hSrc.Tokens, 'Key');
        Tokens.Data(:, 3.0) = get(hSrc.Tokens, 'Value');
    else
        Tokens.Data(1.0, 1.0) = cellhorzcat(get(hSrc.Tokens, 'Group'));
        Tokens.Data(1.0, 2.0) = cellhorzcat(get(hSrc.Tokens, 'Key'));
        Tokens.Data(1.0, 3.0) = cellhorzcat(get(hSrc.Tokens, 'Value'));
    end % if
    % 56 57
    Tokens.ToolTip = 'Tokens tooltip';
    Tokens.Mode = 1.0;
    % 59 63
    % 60 63
    % 61 63
    % 62 63
    BuildArgs.RowSpan = [1.0 1.0];
    BuildArgs.ColSpan = [1.0 3.0];
    % 65 66
    Tokens.RowSpan = [2.0 2.0];
    Tokens.ColSpan = [1.0 3.0];
    % 68 69
    group.Name = 'build Info';
    group.Type = 'group';
    group.LayoutGrid = [2.0 2.0];
    group.Items = cellhorzcat(BuildArgs, Tokens);
    % 73 75
    % 74 75
    dlgstruct.DialogTitle = hSrc.getDisplayLabel;
    dlgstruct.Items = cellhorzcat(group);
end % function
