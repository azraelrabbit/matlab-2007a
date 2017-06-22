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
    umin = dspGetLeafWidgetBase('edit', 'Minimum value of input:', 'umin', this, 'umin');
    % 15 16
    umin.Tunable = 1.0;
    % 17 19
    % 18 19
    umax = dspGetLeafWidgetBase('edit', 'Maximum value of input:', 'umax', this, 'umax');
    % 20 21
    umax.Tunable = 1.0;
    % 22 24
    % 23 24
    nbins = dspGetLeafWidgetBase('edit', 'Number of bins:', 'nbins', this, 'nbins');
    % 25 27
    % 26 27
    norm = dspGetLeafWidgetBase('checkbox', 'Normalized', 'normalized', this, 'normalized');
    % 28 29
    norm.Tunable = 1.0;
    % 30 32
    % 31 32
    run = dspGetLeafWidgetBase('checkbox', 'Running histogram', 'run', this, 'run');
    run.DialogRefresh = 1.0;
    % 34 36
    % 35 36
    reset = dspGetLeafWidgetBase('checkbox', '', 'reset', this, 'reset');
    reset.Visible = 0.0;
    % 38 40
    % 39 40
    trigtype = dspGetLeafWidgetBase('combobox', 'Reset port:', 'trigtype', this, 'trigtype');
    % 41 42
    trigtype.Entries = transpose(set(this, 'trigtype'));
    % 43 44
    if this.run
        trigtype.Visible = 1.0;
    else
        trigtype.Visible = 0.0;
    end % if
    % 49 50
    items = cellhorzcat(umin, umax, nbins, norm, run, reset, trigtype);
    % 51 52
    dlgStruct = this.getRootSchemaStruct(items, 3.0);
end % function
