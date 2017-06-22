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
    dim = dspGetLeafWidgetBase('combobox', 'Difference along:', 'dim', this, 'dim');
    dim.Entries = ctranspose(set(this, 'dim'));
    % 16 17
    dlgStruct = this.getRootSchemaStruct(cellhorzcat(dim));
end % function
