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
    InputTypeMenu = dspGetLeafWidgetBase('combobox', 'Input image type:', 'inputType', this, 'inputType');
    % 30 31
    InputTypeMenu.Entries = ctranspose(set(this, 'inputType'));
    InputTypeMenu.RowSpan = [3.0 3.0];
    InputTypeMenu.ColSpan = [1.0 10.0];
    InputTypeMenu.DialogRefresh = 1.0;
    InputTypeMenu.Visible = 0.0;
    % 36 37
    ImagePortsMenu = dspGetLeafWidgetBase('combobox', 'Image signal:', 'imagePorts', this, 'imagePorts');
    % 38 39
    ImagePortsMenu.Entries = ctranspose(set(this, 'imagePorts'));
    ImagePortsMenu.RowSpan = [3.0 3.0];
    ImagePortsMenu.ColSpan = [1.0 10.0];
    ImagePortsMenu.DialogRefresh = 1.0;
    % 43 47
    % 44 47
    % 45 47
    % 46 47
    if not(strcmp(this.inputType, 'Obsolete'))
        if strcmp(this.inputType, 'Intensity')
            this.imagePorts = 'One multidimensional signal';
        else
            this.imagePorts = 'Separate color signals';
        end % if
        % 53 54
        this.inputType = 'Obsolete';
    end % if
    % 56 62
    % 57 62
    % 58 62
    % 59 62
    % 60 62
    % 61 62
    parameterPane = dspGetContainerWidgetBase('group', 'Parameters', 'parameterPane');
    parameterPane.Items = dspTrimItemList(cellhorzcat(FileNameEdit, BrowseButton, InputTypeMenu, ImagePortsMenu));
    % 64 65
    parameterPane.RowSpan = [2.0 2.0];
    parameterPane.ColSpan = [1.0 1.0];
    parameterPane.LayoutGrid = [3.0 10.0];
    parameterPane.Tag = 'parameterPane';
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    % 73 74
    dlgStruct = this.getBaseSchemaStruct(parameterPane);
end % function
