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
    VariableName = dspGetLeafWidgetBase('edit', 'Variable name:', 'VariableName', this, 'VariableName');
    % 15 16
    VariableName.Entries = ctranspose(set(this, 'VariableName'));
    % 17 19
    % 18 19
    NumInputs = dspGetLeafWidgetBase('edit', 'Number of inputs:', 'NumInputs', this, 'NumInputs');
    % 20 21
    NumInputs.Entries = ctranspose(set(this, 'NumInputs'));
    NumInputs.DialogRefresh = 1.0;
    % 23 24
    DataLimit = dspGetLeafWidgetBase('edit', 'Limit data points to last:', 'DataLimit', this, 'DataLimit');
    % 25 26
    DataLimit.Entries = ctranspose(set(this, 'DataLimit'));
    % 27 28
    DecimationFactor = dspGetLeafWidgetBase('edit', 'Decimation:', 'DecimationFactor', this, 'DecimationFactor');
    % 29 30
    DecimationFactor.Entries = ctranspose(set(this, 'DecimationFactor'));
    % 31 32
    InPortLabels = dspGetLeafWidgetBase('edit', 'Input port labels:', 'InPortLabels', this, 'InPortLabels');
    % 33 34
    InPortLabels.Entries = ctranspose(set(this, 'InPortLabels'));
    % 35 36
    if eq(str2num(this.NumInputs), 1.0)
        InPortLabels.Visible = 0.0;
    else
        InPortLabels.Visible = 1.0;
    end % if
    % 41 42
    LogFi = dspGetLeafWidgetBase('checkbox', 'Log fixed-point data as a fi object', 'LogFi', this, 'LogFi');
    % 43 47
    % 44 47
    % 45 47
    % 46 47
    parameterPane = dspGetContainerWidgetBase('group', 'Parameters', 'parameterPane');
    parameterPane.Items = dspTrimItemList(cellhorzcat(VariableName, NumInputs, DataLimit, DecimationFactor, LogFi, InPortLabels));
    % 49 50
    parameterPane.RowSpan = [2.0 2.0];
    parameterPane.ColSpan = [1.0 1.0];
    % 52 53
    dlgStruct = this.getBaseSchemaStruct(parameterPane);
end % function
