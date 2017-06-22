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
    P = dspGetLeafWidgetBase('edit', 'Probability of a zero:', 'P', this, 'P');
    P.Entries = ctranspose(set(this, 'P'));
    % 16 18
    % 17 18
    seed = dspGetLeafWidgetBase('edit', 'Initial seed:', 'seed', this, 'seed');
    seed.Entries = ctranspose(set(this, 'seed'));
    % 20 22
    % 21 22
    Ts = dspGetLeafWidgetBase('edit', 'Sample time:', 'Ts', this, 'Ts');
    Ts.Entries = ctranspose(set(this, 'Ts'));
    % 24 26
    % 25 26
    frameBased = dspGetLeafWidgetBase('checkbox', 'Frame-based outputs', 'frameBased', this, 'frameBased');
    % 27 28
    frameBased.DialogRefresh = 1.0;
    % 29 31
    % 30 31
    sampPerFrame = dspGetLeafWidgetBase('edit', 'Samples per frame:', 'sampPerFrame', this, 'sampPerFrame');
    % 32 33
    sampPerFrame.Entries = ctranspose(set(this, 'sampPerFrame'));
    % 34 36
    % 35 36
    orient = dspGetLeafWidgetBase('checkbox', 'Interpret vector parameters as 1-D', 'orient', this, 'orient');
    % 37 38
    orient.DialogRefresh = 1.0;
    % 39 41
    % 40 41
    outDataType = dspGetLeafWidgetBase('combobox', 'Output data type:', 'outDataType', this, 'outDataType');
    % 42 43
    outDataType.Entries = ctranspose(set(this, 'outDataType'));
    % 44 46
    % 45 46
    if this.frameBased
        sampPerFrame.Visible = 1.0;
        orient.Visible = 0.0;
    else
        sampPerFrame.Visible = 0.0;
        orient.Visible = 1.0;
    end % if
    % 53 54
    if this.orient
        frameBased.Visible = 0.0;
    else
        frameBased.Visible = 1.0;
    end % if
    % 59 63
    % 60 63
    % 61 63
    % 62 63
    paramsPanel = dspGetContainerWidgetBase('panel', 'Parameters', 'paramsPanel');
    % 64 65
    paramsPanel.Items = cellhorzcat(P, seed, Ts, frameBased, sampPerFrame, orient, outDataType);
    % 66 67
    parameterPane = dspGetContainerWidgetBase('group', 'Parameters', 'parameterPane');
    % 68 69
    parameterPane.Items = cellhorzcat(paramsPanel);
    parameterPane.RowSpan = [2.0 2.0];
    parameterPane.ColSpan = [1.0 1.0];
    % 72 73
    dlgStruct = this.getBaseSchemaStruct(parameterPane);
end % function
