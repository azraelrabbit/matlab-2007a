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
    dim = dspGetLeafWidgetBase('combobox', this.DimPrompt, 'Dim', this, 'Dim');
    dim.Entries = ctranspose(set(this, 'Dim'));
    % 16 17
    if strcmp(this.Block.MaskType, 'Matrix Product')
        dlgStruct = this.getRootSchemaStruct(cellhorzcat(dim), 2.0);
    else
        dlgStruct = this.getRootSchemaStruct(cellhorzcat(dim));
    end % if
end % function
