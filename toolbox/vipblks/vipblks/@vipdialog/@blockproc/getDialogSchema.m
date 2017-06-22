function dlgStruct = getDialogSchema(this, dummy)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    NumIbox = dspGetLeafWidgetBase('edit', 'Number of inputs:', 'NumI', this, 'NumI');
    % 16 17
    NumIbox.Entries = ctranspose(set(this, 'NumI'));
    NumIbox.RowSpan = [1.0 1.0];
    NumIbox.ColSpan = [1.0 1.0];
    % 20 21
    NumObox = dspGetLeafWidgetBase('edit', 'Number of outputs:', 'NumO', this, 'NumO');
    % 22 23
    NumObox.Entries = ctranspose(set(this, 'NumO'));
    NumObox.RowSpan = [2.0 2.0];
    NumObox.ColSpan = [1.0 1.0];
    % 26 27
    blocksizebox = dspGetLeafWidgetBase('edit', 'Block size:', 'Blocksize', this, 'Blocksize');
    % 28 29
    blocksizebox.Entries = ctranspose(set(this, 'Blocksize'));
    blocksizebox.RowSpan = [3.0 3.0];
    blocksizebox.ColSpan = [1.0 1.0];
    % 32 33
    ovlpblocksizebox = dspGetLeafWidgetBase('edit', 'Overlap:', 'Overlapsize', this, 'Overlapsize');
    % 34 35
    ovlpblocksizebox.Entries = ctranspose(set(this, 'Overlapsize'));
    ovlpblocksizebox.RowSpan = [4.0 4.0];
    ovlpblocksizebox.ColSpan = [1.0 1.0];
    % 38 39
    traverse = dspGetLeafWidgetBase('combobox', 'Traverse order:', 'Traverse', this, 'Traverse');
    % 40 41
    traverse.Entries = ctranspose(set(this, 'Traverse'));
    traverse.RowSpan = [5.0 5.0];
    traverse.ColSpan = [1.0 1.0];
    % 44 48
    % 45 48
    % 46 48
    % 47 48
    buttondscpt.Type = 'text';
    buttondscpt.Name = 'Click the Open Subsystem button to open the block''s subsystem. Click-and-drag blocks into this subsystem to define the processing operation(s) the block performs on submatrices.';
    buttondscpt.Tag = 'ButtonDescription';
    buttondscpt.WordWrap = 1.0;
    buttondscpt.RowSpan = [1.0 1.0];
    buttondscpt.ColSpan = [1.0 5.0];
    % 54 55
    blkbutton = dspGetContainerWidgetBase('pushbutton', 'Open Subsystem', 'opensubsystem');
    % 56 57
    blkbutton.ObjectMethod = 'Opensubsystem';
    blkbutton.RowSpan = [2.0 2.0];
    blkbutton.ColSpan = [3.0 3.0];
    blkbutton.Tunable = 1.0;
    % 61 67
    % 62 67
    % 63 67
    % 64 67
    % 65 67
    % 66 67
    parameterPane = dspGetContainerWidgetBase('group', 'Parameters', 'parameterPane');
    parameterPane.Items = dspTrimItemList(cellhorzcat(NumIbox, NumObox, blocksizebox, ovlpblocksizebox, traverse));
    % 69 70
    parameterPane.RowSpan = [2.0 2.0];
    parameterPane.ColSpan = [1.0 1.0];
    parameterPane.LayoutGrid = [5.0 1.0];
    parameterPane.Tag = 'parameterPane';
    % 74 76
    % 75 76
    subsystemPane = dspGetContainerWidgetBase('group', 'Subsystem', 'subsystemPane');
    subsystemPane.Items = dspTrimItemList(cellhorzcat(buttondscpt, blkbutton));
    subsystemPane.RowSpan = [3.0 3.0];
    subsystemPane.ColSpan = [1.0 1.0];
    subsystemPane.LayoutGrid = [2.0 5.0];
    subsystemPane.Tag = 'subsystemPane';
    % 82 83
    mainPane = dspGetContainerWidgetBase('panel', '', 'mainPane');
    mainPane.Items = cellhorzcat(parameterPane, subsystemPane);
    mainPane.RowSpan = [2.0 2.0];
    mainPane.Tag = 'mainPane';
    % 87 92
    % 88 92
    % 89 92
    % 90 92
    % 91 92
    dlgStruct = this.getBaseSchemaStruct(cellhorzcat(mainPane));
end % function
