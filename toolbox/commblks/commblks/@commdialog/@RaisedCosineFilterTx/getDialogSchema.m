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
    D = dspGetLeafWidgetBase('edit', 'Group delay (number of symbols):', 'D', this, 'D');
    % 22 23
    D.Entries = ctranspose(set(this, 'D'));
    % 24 26
    % 25 26
    R = dspGetLeafWidgetBase('edit', 'Rolloff factor (0 to 1):', 'R', this, 'R');
    R.Entries = ctranspose(set(this, 'R'));
    % 28 30
    % 29 30
    sampMode = dspGetLeafWidgetBase('combobox', 'Input sampling mode:', 'sampMode', this, 'sampMode');
    % 31 32
    sampMode.Entries = ctranspose(set(this, 'sampMode'));
    % 33 35
    % 34 35
    N = dspGetLeafWidgetBase('edit', 'Upsampling factor (N):', 'N', this, 'N');
    N.Entries = ctranspose(set(this, 'N'));
    % 37 39
    % 38 39
    checkGain = dspGetLeafWidgetBase('combobox', 'Filter gain:', 'checkGain', this, 'checkGain');
    % 40 41
    checkGain.Entries = ctranspose(set(this, 'checkGain'));
    checkGain.DialogRefresh = 1.0;
    % 43 45
    % 44 45
    filterGain = dspGetLeafWidgetBase('edit', 'Linear amplitude filter gain:', 'filterGain', this, 'filterGain');
    % 46 47
    filterGain.Entries = ctranspose(set(this, 'filterGain'));
    if strcmpi(this.checkGain, 'User-specified')
        filterGain.Visible = 1.0;
    else
        filterGain.Visible = 0.0;
    end % if
    % 53 55
    % 54 55
    checkCoeff = dspGetLeafWidgetBase('checkbox', 'Export filter coefficients to workspace', 'checkCoeff', this, 'checkCoeff');
    % 56 58
    % 57 58
    checkCoeff.DialogRefresh = 1.0;
    % 59 61
    % 60 61
    variableName = dspGetLeafWidgetBase('edit', 'Coefficient variable name:', 'variableName', this, 'variableName');
    % 62 63
    variableName.Entries = set(this, 'variableName');
    if this.checkCoeff
        variableName.Visible = 1.0;
    else
        variableName.Visible = 0.0;
    end % if
    % 69 70
    MWCOMMS_CENTER_LEFT = 4.0;
    % 71 77
    % 72 77
    % 73 77
    % 74 77
    % 75 77
    % 76 77
    fvtoolButton.Type = 'pushbutton';
    fvtoolButton.Name = 'Visualize filter with FVTool';
    fvtoolButton.Tag = 'fvtoolButton';
    % 80 81
    fvtoolButton.ToolTip = 'Launches fvtool to inspect the frequency response of the specified filter object.';
    % 82 83
    fvtoolButton.Alignment = MWCOMMS_CENTER_LEFT;
    fvtoolButton.ColSpan = [1.0 1.0];
    fvtoolButton.MatlabMethod = 'dspLinkFVTool2Mask';
    fvtoolButton.MatlabArgs = cellhorzcat(gcbh, 'create');
    % 87 88
    buttonPanel = dspGetContainerWidgetBase('panel', 'Buttons', 'buttonPanel');
    buttonPanel.LayoutGrid = [1.0 3.0];
    buttonPanel.Items = cellhorzcat(fvtoolButton);
    % 91 92
    dlgStruct = this.getRootSchemaStruct(cellhorzcat(filtType, D, R, sampMode, N, checkGain, filterGain, checkCoeff, ctranspose(variableName)));
    % 93 94
end % function
