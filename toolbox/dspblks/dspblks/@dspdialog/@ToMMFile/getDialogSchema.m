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
    FileNameEdit = dspGetLeafWidgetBase('edit', 'Output file name:', 'outputFilename', this, 'outputFilename');
    % 14 16
    FileNameEdit.Entries = ctranspose(set(this, 'outputFilename'));
    FileNameEdit.RowSpan = [1.0 1.0];
    FileNameEdit.ColSpan = [1.0 9.0];
    % 18 20
    BrowseButton = dspGetContainerWidgetBase('pushbutton', 'Browse...', 'FileSelect');
    % 20 22
    BrowseButton.ObjectMethod = 'FileSelect';
    BrowseButton.MethodArgs = {'%dialog'};
    BrowseButton.ArgDataTypes = {'handle'};
    BrowseButton.RowSpan = [1.0 1.0];
    BrowseButton.ColSpan = [10.0 10.0];
    BrowseButton.Tunable = 0.0;
    % 27 29
    StreamSelectionMenu = dspGetLeafWidgetBase('combobox', 'Write:', 'streamSelection', this, 'streamSelection');
    % 29 31
    StreamSelectionMenu.Entries = ctranspose(set(this, 'streamSelection'));
    StreamSelectionMenu.RowSpan = [2.0 2.0];
    StreamSelectionMenu.ColSpan = [1.0 10.0];
    StreamSelectionMenu.DialogRefresh = 1.0;
    % 34 36
    VideoCompressorMenu = dspGetLeafWidgetBase('combobox', 'Video compressor:', 'videoCompressor', this, 'videoCompressor');
    % 36 38
    VideoCompressorMenu.Entries = ctranspose(set(this, 'videoCompressor'));
    VideoCompressorMenu.RowSpan = [4.0 4.0];
    VideoCompressorMenu.ColSpan = [1.0 10.0];
    VideoCompressorMenu.DialogRefresh = 1.0;
    VideoCompressorMenu.Visible = not(isempty(strfind(this.streamSelection, 'ideo')));
    % 42 44
    AudioCompressorMenu = dspGetLeafWidgetBase('combobox', 'Audio compressor:', 'audioCompressor', this, 'audioCompressor');
    % 44 46
    AudioCompressorMenu.Entries = ctranspose(set(this, 'audioCompressor'));
    AudioCompressorMenu.RowSpan = [3.0 3.0];
    AudioCompressorMenu.ColSpan = [1.0 10.0];
    AudioCompressorMenu.DialogRefresh = 1.0;
    AudioCompressorMenu.Visible = not(isempty(strfind(this.streamSelection, 'udio')));
    % 50 53
    % 51 53
    imagePorts = dspGetLeafWidgetBase('combobox', 'Image signal:', 'imagePorts', this, 'imagePorts');
    imagePorts.Entries = ctranspose(set(this, 'imagePorts'));
    imagePorts.RowSpan = [5.0 5.0];
    imagePorts.ColSpan = [1.0 10.0];
    imagePorts.Visible = not(isempty(strfind(this.streamSelection, 'ideo')));
    % 57 64
    % 58 64
    % 59 64
    % 60 64
    % 61 64
    % 62 64
    parameterPane = dspGetContainerWidgetBase('group', 'Parameters', 'parameterPane');
    parameterPane.Items = dspTrimItemList(cellhorzcat(FileNameEdit, BrowseButton, StreamSelectionMenu, VideoCompressorMenu, AudioCompressorMenu, imagePorts));
    % 65 67
    parameterPane.RowSpan = [2.0 2.0];
    parameterPane.ColSpan = [1.0 1.0];
    parameterPane.LayoutGrid = [3.0 10.0];
    parameterPane.Tag = 'parameterPane';
    % 70 76
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    dlgStruct = getBaseSchemaStruct(this, parameterPane);
    title = this.Block.Name;
    title(find(eq(double(title), 10.0))) = ' ';
    dlgStruct.DialogTitle = horzcat('Sink Block Parameters: ', title);
end % function
