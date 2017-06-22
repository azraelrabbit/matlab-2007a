function dlgStruct = getDialogSchema(this, dummy)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    filtType = dspGetLeafWidgetBase('combobox', 'Filter type:', 'filtType', this, 'filtType');
    % 17 18
    filtType.Entries = ctranspose(set(this, 'filtType'));
    % 19 21
    % 20 21
    N = dspGetLeafWidgetBase('edit', 'Input samples per symbol (N):', 'N', this, 'N');
    % 22 23
    N.Entries = ctranspose(set(this, 'N'));
    % 24 26
    % 25 26
    D = dspGetLeafWidgetBase('edit', 'Group delay (number of symbols):', 'D', this, 'D');
    % 27 28
    D.Entries = ctranspose(set(this, 'D'));
    % 29 31
    % 30 31
    R = dspGetLeafWidgetBase('edit', 'Rolloff factor (0 to 1):', 'R', this, 'R');
    R.Entries = ctranspose(set(this, 'R'));
    % 33 35
    % 34 35
    sampMode = dspGetLeafWidgetBase('combobox', 'Input sampling mode:', 'sampMode', this, 'sampMode');
    % 36 37
    sampMode.Entries = ctranspose(set(this, 'sampMode'));
    % 38 40
    % 39 40
    rateMode = dspGetLeafWidgetBase('combobox', 'Output mode:', 'rateMode', this, 'rateMode');
    % 41 42
    rateMode.Entries = ctranspose(set(this, 'rateMode'));
    % 43 45
    % 44 45
    downFactor = dspGetLeafWidgetBase('edit', 'Downsampling factor (L):', 'downFactor', this, 'downFactor');
    % 46 47
    downFactor.Entries = ctranspose(set(this, 'downFactor'));
    % 48 50
    % 49 50
    downOffset = dspGetLeafWidgetBase('edit', 'Sample offset (0 to L-1):', 'downOffset', this, 'downOffset');
    % 51 52
    downOffset.Entries = ctranspose(set(this, 'downOffset'));
    % 53 55
    % 54 55
    checkGain = dspGetLeafWidgetBase('combobox', 'Filter gain:', 'checkGain', this, 'checkGain');
    % 56 57
    checkGain.Entries = ctranspose(set(this, 'checkGain'));
    checkGain.DialogRefresh = 1.0;
    % 59 61
    % 60 61
    filterGain = dspGetLeafWidgetBase('edit', 'Linear amplitude filter gain:', 'filterGain', this, 'filterGain');
    % 62 63
    filterGain.Entries = ctranspose(set(this, 'filterGain'));
    if strcmpi(this.checkGain, 'User-specified')
        filterGain.Visible = 1.0;
    else
        filterGain.Visible = 0.0;
    end % if
    % 69 71
    % 70 71
    checkCoeff = dspGetLeafWidgetBase('checkbox', 'Export filter coefficients to workspace', 'checkCoeff', this, 'checkCoeff');
    % 72 74
    % 73 74
    checkCoeff.DialogRefresh = 1.0;
    % 75 77
    % 76 77
    variableName = dspGetLeafWidgetBase('edit', 'Coefficient variable name:', 'variableName', this, 'variableName');
    % 78 79
    variableName.Entries = set(this, 'variableName');
    if this.checkCoeff
        variableName.Visible = 1.0;
    else
        variableName.Visible = 0.0;
    end % if
    % 85 86
    MWCOMMS_CENTER_LEFT = 4.0;
    % 87 89
    % 88 89
    fvtoolButton.Type = 'pushbutton';
    fvtoolButton.Name = 'Visualize filter with FVTool';
    fvtoolButton.Tag = 'fvtoolButton';
    % 92 93
    fvtoolButton.ToolTip = 'Launches fvtool to inspect the frequency response of the specified filter object.';
    % 94 95
    fvtoolButton.Alignment = MWCOMMS_CENTER_LEFT;
    fvtoolButton.ColSpan = [1.0 1.0];
    fvtoolButton.MatlabMethod = 'dspLinkFVTool2Mask';
    fvtoolButton.MatlabArgs = cellhorzcat(gcbh, 'create');
    % 99 100
    buttonPanel = dspGetContainerWidgetBase('panel', 'Buttons', 'buttonPanel');
    buttonPanel.LayoutGrid = [1.0 3.0];
    buttonPanel.Items = cellhorzcat(fvtoolButton);
    % 103 104
    dlgStruct = this.getRootSchemaStruct(cellhorzcat(filtType, N, D, R, sampMode, rateMode, downFactor, downOffset, checkGain, filterGain, checkCoeff, variableName));
    % 105 106
end % function
