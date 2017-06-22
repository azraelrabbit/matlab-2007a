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
    outSize = dspGetLeafWidgetBase('combobox', 'Output size:', 'outSize', this, 'outSize');
    outSize.Entries = ctranspose(set(this, 'outSize'));
    % 16 17
    normalize = dspGetLeafWidgetBase('checkbox', 'Normalized output', 'normalize', this, 'normalize');
    % 18 19
    normalize.Entries = ctranspose(set(this, 'normalize'));
    dlgStruct = this.getRootSchemaStruct(cellhorzcat(outSize, normalize));
end % function
