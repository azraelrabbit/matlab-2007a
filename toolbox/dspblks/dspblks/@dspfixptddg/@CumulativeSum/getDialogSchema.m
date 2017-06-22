function dlgStruct = getDialogSchema(this, dummy)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    dim = dspGetLeafWidgetBase('combobox', 'Sum input along:', 'dim', this, 'dim');
    dim.Entries = ctranspose(set(this, 'dim'));
    dim.DialogRefresh = 1.0;
    % 13 15
    % 14 15
    reset = dspGetLeafWidgetBase('combobox', 'Reset port:', 'reset_popup', this, 'reset_popup');
    % 16 17
    reset.Entries = transpose(set(this, 'reset'));
    % 18 19
    if strcmp(this.dim, 'Channels (running sum)')
        reset.Visible = 1.0;
    else
        reset.Visible = 0.0;
    end % if
    items = cellhorzcat(dim, reset);
    % 25 26
    dlgStruct = this.getRootSchemaStruct(items);
end % function
