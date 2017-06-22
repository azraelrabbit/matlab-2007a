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
    fcn = dspGetLeafWidgetBase('combobox', 'Mode:', 'fcn', this, 'fcn');
    fcn.DialogRefresh = 1.0;
    fcn.Entries = transpose(set(this, 'fcn'));
    % 16 19
    % 17 19
    reset = dspGetLeafWidgetBase('combobox', 'Reset port:', 'reset', this, 'reset');
    reset.Entries = transpose(set(this, 'reset'));
    % 20 23
    % 21 23
    indexBase = dspGetLeafWidgetBase('combobox', 'Index base:', 'indexBase', this, 'indexBase');
    % 23 27
    % 24 27
    % 25 27
    indexBase.Entries = transpose(set(this, 'indexBase'));
    % 27 30
    % 28 30
    if strcmp(this.MaskType, 'Minimum')
        find = 'Find the minimum value of:';
    else
        find = 'Find the maximum value of:';
    end % if
    operateOver = dspGetLeafWidgetBase('combobox', find, 'operateOver', this, 'operateOver');
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    colComp = dspGetLeafWidgetBase('checkbox', 'Treat sample-based row input as a column', 'colComp', this, 'colComp');
    % 40 44
    % 41 44
    % 42 44
    colComp.DialogRefresh = 1.0;
    operateOver.DialogRefresh = 1.0;
    operateOver.Entries = transpose(set(this, 'operateOver'));
    % 46 48
    if strcmp(this.fcn, 'Running')
        reset.Visible = 1.0;
        operateOver.Visible = 0.0;
    else
        reset.Visible = 0.0;
        operateOver.Visible = 1.0;
    end % if
    % 54 56
    if strcmp(this.fcn, 'Value and Index')
        indexBase.Visible = 1.0;
    else
        if strcmp(this.fcn, 'Index')
            indexBase.Visible = 1.0;
        else
            indexBase.Visible = 0.0;
        end % if
    end % if
    if strcmp(this.operateOver, 'Each column')
        if strcmp(this.fcn, 'Running')
            colComp.Visible = 0.0;
        else
            colComp.Visible = 1.0;
        end % if
    else
        colComp.Visible = 0.0;
    end % if
    items = cellhorzcat(fcn, indexBase, reset, operateOver, colComp);
    % 74 76
    dlgStruct = this.getRootSchemaStruct(items, 3.0);
end % function
