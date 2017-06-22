function dlgStruct = getDialogSchema(this, dummy_arg)
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
    run = dspGetLeafWidgetBase('checkbox', 'Running mean', 'run', this, 'run');
    run.DialogRefresh = 1.0;
    % 16 18
    % 17 18
    reset = dspGetLeafWidgetBase('combobox', 'Reset port:', 'reset_popup', this, 'reset_popup');
    % 19 20
    reset.Entries = transpose(set(this, 'reset'));
    % 21 22
    if this.run
        reset.Visible = 1.0;
    else
        reset.Visible = 0.0;
    end % if
    items = cellhorzcat(run, reset);
    % 28 29
    dlgStruct = this.getRootSchemaStruct(items);
end % function
