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
    CompMethod = dspGetLeafWidgetBase('combobox', 'Sine and cosine computation:', 'CompMethod', this, 'CompMethod');
    % 16 19
    % 17 19
    % 18 19
    CompMethod.Entries = ctranspose(set(this, 'CompMethod'));
    CompMethod.DialogRefresh = 1.0;
    % 21 22
    dlgStruct = this.getRootSchemaStruct(cellhorzcat(CompMethod));
    dlgStruct.PreApplyCallback = 'dspDDGPreApplyWithFracLengthUpdate';
    dlgStruct.PreApplyArgs = cellhorzcat(this, '%dialog', {'firstCoeffFracLength'}, this.FixptDialog.DataTypeRows(4.0).BestPrecString);
    % 25 26
end % function
