function dlgStruct = constructDlgStruct(this, items, numRows)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    block = this.getBlock;
    % 7 9
    % 8 9
    descText.Name = block.BlockDescription;
    descText.Type = 'text';
    descText.WordWrap = true;
    descText.RowSpan = [1.0 1.0];
    descText.ColSpan = [1.0 1.0];
    % 14 15
    descGroup.Name = block.BlockType;
    descGroup.Type = 'group';
    descGroup.Items = cellhorzcat(descText);
    descGroup.RowSpan = [1.0 1.0];
    descGroup.ColSpan = [1.0 1.0];
    descGroup.LayoutGrid = [1.0 1.0];
    descGroup.RowStretch = 0.0;
    descGroup.ColStretch = 0.0;
    % 23 25
    % 24 25
    paramGroup.Name = 'Parameters';
    paramGroup.Type = 'group';
    paramGroup.Items = items;
    paramGroup.LayoutGrid = horzcat(numRows, 1.0);
    paramGroup.RowStretch = zeros(1.0, numRows);
    paramGroup.ColStretch = zeros(1.0, 1.0);
    paramGroup.RowSpan = [2.0 2.0];
    paramGroup.ColSpan = [1.0 1.0];
    paramGroup.Source = block;
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    dlgStruct.DialogTitle = horzcat('Block Parameters: ', strrep(block.Name, sprintf('\n'), ' '));
    dlgStruct.Items = cellhorzcat(descGroup, paramGroup);
    % 40 42
    % 41 42
    dlgStruct.LayoutGrid = [3.0 2.0];
    dlgStruct.RowStretch = horzcat(zeros(1.0, 2.0), 1.0);
    dlgStruct.ColStretch = [0.0 1.0];
    dlgStruct.ShowGrid = false;
    dlgStruct.HelpMethod = 'slhelp';
    dlgStruct.HelpArgs = cellhorzcat(block.Handle);
    % 48 49
    dlgStruct.PreApplyMethod = 'PreApplyCallback';
    dlgStruct.PreApplyArgs = {'%dialog'};
    dlgStruct.PreApplyArgsDT = {'handle'};
    % 52 53
    dlgStruct.CloseMethod = 'CloseCallback';
    dlgStruct.CloseMethodArgs = {'%dialog'};
    dlgStruct.CloseMethodArgsDT = {'handle'};
    % 56 57
    [isLib, isLocked] = this.isLibraryBlock(block);
    if isLocked
        dlgStruct.DisableDialog = 1.0;
    else
        dlgStruct.DisableDialog = 0.0;
    end % if
    % 63 64
end % function
