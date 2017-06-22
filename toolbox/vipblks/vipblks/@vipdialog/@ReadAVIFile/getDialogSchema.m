function dlgStruct = getDialogSchema(this, dummy)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    FileNameEdit = dspGetLeafWidgetBase('edit', 'File name:', 'filename', this, 'filename');
    % 15 16
    FileNameEdit.Entries = ctranspose(set(this, 'filename'));
    FileNameEdit.RowSpan = [1.0 1.0];
    FileNameEdit.ColSpan = [1.0 9.0];
    % 19 20
    BrowseButton = dspGetContainerWidgetBase('pushbutton', 'Browse...', 'FileSelect');
    % 21 22
    BrowseButton.ObjectMethod = 'FileSelect';
    BrowseButton.MethodArgs = {'%dialog'};
    BrowseButton.ArgDataTypes = {'handle'};
    BrowseButton.RowSpan = [1.0 1.0];
    BrowseButton.ColSpan = [10.0 10.0];
    BrowseButton.Tunable = 0.0;
    % 28 29
    LoopCBox = dspGetLeafWidgetBase('checkbox', 'Loop', 'loopOrNot', this, 'loopOrNot');
    LoopCBox.Entries = set(this, 'loopOrNot');
    LoopCBox.RowSpan = [3.0 3.0];
    LoopCBox.ColSpan = [1.0 1.0];
    LoopCBox.DialogRefresh = 1.0;
    LoopCBox.Visible = 0.0;
    % 35 36
    NumLoopsEdit = dspGetLeafWidgetBase('edit', 'Number of times to play file:', 'numLoops', this, 'numLoops');
    % 37 38
    NumLoopsEdit.Entries = ctranspose(set(this, 'numLoops'));
    NumLoopsEdit.RowSpan = [4.0 4.0];
    NumLoopsEdit.ColSpan = [1.0 1.0];
    % 41 43
    % 42 43
    if eq(this.Loop, 1.0)
        NumLoopsEdit.Enabled = 1.0;
    else
        NumLoopsEdit.Enabled = 0.0;
    end % if
    % 48 49
    OutDataTypeMenu = dspGetLeafWidgetBase('combobox', 'Video output data type:', 'dataType', this, 'dataType');
    % 50 51
    OutDataTypeMenu.Entries = ctranspose(set(this, 'dataType'));
    OutDataTypeMenu.RowSpan = [2.0 2.0];
    OutDataTypeMenu.ColSpan = [1.0 1.0];
    OutDataTypeMenu.DialogRefresh = 1.0;
    % 55 56
    OutputEOFCBox = dspGetLeafWidgetBase('checkbox', 'Output end-of-file indicator', 'outputEOF', this, 'outputEOF');
    % 57 58
    OutputEOFCBox.Entries = set(this, 'outputEOF');
    OutputEOFCBox.RowSpan = [5.0 5.0];
    OutputEOFCBox.ColSpan = [1.0 1.0];
    OutputEOFCBox.DialogRefresh = 1.0;
    % 62 68
    % 63 68
    % 64 68
    % 65 68
    % 66 68
    % 67 68
    parameterPane = dspGetContainerWidgetBase('group', 'Parameters', 'parameterPane');
    parameterPane.Items = dspTrimItemList(cellhorzcat(FileNameEdit, BrowseButton, LoopCBox, NumLoopsEdit, OutDataTypeMenu, OutputEOFCBox));
    % 70 72
    % 71 72
    parameterPane.RowSpan = [2.0 2.0];
    parameterPane.ColSpan = [1.0 1.0];
    parameterPane.LayoutGrid = [3.0 10.0];
    parameterPane.Tag = 'parameterPane';
    % 76 81
    % 77 81
    % 78 81
    % 79 81
    % 80 81
    dlgStruct = this.getBaseSchemaStruct(parameterPane);
end % function
