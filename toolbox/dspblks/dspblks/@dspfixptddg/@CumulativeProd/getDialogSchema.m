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
    dim = dspGetLeafWidgetBase('combobox', 'Multiply input along:', 'dim', this, 'dim');
    % 11 12
    dim.Entries = ctranspose(set(this, 'dim'));
    dim.DialogRefresh = 1.0;
    % 14 16
    % 15 16
    reset = dspGetLeafWidgetBase('combobox', 'Reset port:', 'reset_popup', this, 'reset_popup');
    % 17 18
    reset.Entries = transpose(set(this, 'reset'));
    % 19 20
    if strcmp(this.dim, 'Channels (running product)')
        reset.Visible = 1.0;
    else
        reset.Visible = 0.0;
    end % if
    items = cellhorzcat(dim, reset);
    % 26 27
    dlgStruct = this.getRootSchemaStruct(items);
end % function
