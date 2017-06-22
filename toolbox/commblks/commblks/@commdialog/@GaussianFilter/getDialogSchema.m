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
    N = dspGetLeafWidgetBase('edit', 'Input samples per symbol (N):', 'N', this, 'N');
    % 17 18
    N.Entries = ctranspose(set(this, 'N'));
    % 19 21
    % 20 21
    BT = dspGetLeafWidgetBase('edit', 'BT product:', 'BT', this, 'BT');
    BT.Entries = ctranspose(set(this, 'BT'));
    % 23 25
    % 24 25
    D = dspGetLeafWidgetBase('edit', 'Group delay (number of symbols):', 'D', this, 'D');
    % 26 27
    D.Entries = ctranspose(set(this, 'D'));
    % 28 30
    % 29 30
    normMode = dspGetLeafWidgetBase('combobox', 'Filter coefficient normalization:', 'normMode', this, 'normMode');
    % 31 33
    % 32 33
    normMode.Entries = ctranspose(set(this, 'normMode'));
    % 34 36
    % 35 36
    filterGain = dspGetLeafWidgetBase('edit', 'Linear amplitude filter gain:', 'filterGain', this, 'filterGain');
    % 37 38
    filterGain.Entries = ctranspose(set(this, 'filterGain'));
    % 39 41
    % 40 41
    checkCoeff = dspGetLeafWidgetBase('checkbox', 'Export filter coefficients to workspace', 'checkCoeff', this, 'checkCoeff');
    % 42 44
    % 43 44
    checkCoeff.DialogRefresh = 1.0;
    % 45 47
    % 46 47
    variableName = dspGetLeafWidgetBase('edit', 'Coefficient variable name:', 'variableName', this, 'variableName');
    % 48 49
    variableName.Entries = set(this, 'variableName');
    if this.checkCoeff
        variableName.Visible = 1.0;
    else
        variableName.Visible = 0.0;
    end % if
    % 55 56
    MWCOMMS_CENTER_LEFT = 4.0;
    % 57 59
    % 58 59
    fvtoolButton.Type = 'pushbutton';
    fvtoolButton.Name = 'Visualize filter with FVTool';
    fvtoolButton.Tag = 'fvtoolButton';
    % 62 63
    fvtoolButton.ToolTip = 'Launches fvtool to inspect the frequency response of the specified filter object.';
    % 64 65
    fvtoolButton.Alignment = MWCOMMS_CENTER_LEFT;
    fvtoolButton.ColSpan = [1.0 1.0];
    fvtoolButton.MatlabMethod = 'dspLinkFVTool2Mask';
    fvtoolButton.MatlabArgs = cellhorzcat(gcbh, 'create');
    % 69 70
    buttonPanel = dspGetContainerWidgetBase('panel', 'Buttons', 'buttonPanel');
    buttonPanel.LayoutGrid = [1.0 3.0];
    buttonPanel.Items = cellhorzcat(fvtoolButton);
    % 73 74
    dlgStruct = this.getRootSchemaStruct(cellhorzcat(N, BT, D, normMode, filterGain, checkCoeff, variableName, buttonPanel));
end % function
