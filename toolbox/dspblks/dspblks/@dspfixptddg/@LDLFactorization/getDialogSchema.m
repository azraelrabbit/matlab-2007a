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
    errmode = dspGetLeafWidgetBase('combobox', 'Non-positive definite input:', 'errmode', this, 'errmode');
    % 15 16
    errmode.Entries = ctranspose(set(this, 'errmode'));
    errmode.Tunable = 0.0;
    errmode.Visible = 1.0;
    % 19 20
    dlgStruct = this.getRootSchemaStruct(cellhorzcat(errmode));
end % function
