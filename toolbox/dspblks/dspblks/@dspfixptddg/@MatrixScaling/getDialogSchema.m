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
    mode = dspGetLeafWidgetBase('combobox', 'Mode:', 'mode', this, 'mode');
    mode.Entries = ctranspose(set(this, 'mode'));
    % 16 18
    % 17 18
    D_Source = dspGetLeafWidgetBase('combobox', 'Scaling vector (D) source:', 'D_Source', this, 'D_Source');
    % 19 20
    D_Source.Entries = ctranspose(set(this, 'D_Source'));
    D_Source.DialogRefresh = 1.0;
    % 22 24
    % 23 24
    D_VectFromMask = dspGetLeafWidgetBase('edit', 'Scaling vector (D):', 'D_VectFromMask', this, 'D_VectFromMask');
    % 25 26
    D_VectFromMask.Tunable = 1.0;
    % 27 28
    D_VectFromMask.DialogRefresh = 1.0;
    % 29 30
    if strcmp(this.D_Source, 'Input port')
        D_VectFromMask.Visible = 0.0;
    else
        D_VectFromMask.Visible = 1.0;
    end % if
    % 35 38
    % 36 38
    % 37 38
    this.FixptDialog.DataTypeRows(4.0).Visible = D_VectFromMask.Visible;
    % 39 40
    dlgStruct = this.getRootSchemaStruct(cellhorzcat(mode, D_Source, D_VectFromMask), 2.0);
    % 41 42
    dlgStruct.PreApplyCallback = 'dspDDGPreApplyWithFracLengthUpdate';
    dlgStruct.PreApplyArgs = cellhorzcat(this, '%dialog', {'firstCoeffFracLength'}, this.FixptDialog.DataTypeRows(4.0).BestPrecString);
    % 44 45
end % function
