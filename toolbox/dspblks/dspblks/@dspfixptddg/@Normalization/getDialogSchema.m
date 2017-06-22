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
    NormType = dspGetLeafWidgetBase('combobox', 'Norm:', 'NormType', this, 'NormType');
    NormType.Entries = ctranspose(set(this, 'NormType'));
    NormType.Tunable = 1.0;
    % 17 19
    % 18 19
    b_label = horzcat('Normalization bias:', char(9.0));
    Bias = dspGetLeafWidgetBase('edit', b_label, 'Bias', this, 'Bias');
    Bias.Tunable = 1.0;
    % 22 24
    % 23 24
    n_label = horzcat('Normalize over:', char(9.0), char(9.0));
    NormOver = dspGetLeafWidgetBase('combobox', n_label, 'NormOver', this, 'NormOver');
    NormOver.Entries = ctranspose(set(this, 'NormOver'));
    % 27 30
    % 28 30
    % 29 30
    ColComp = dspGetLeafWidgetBase('checkbox', 'Treat sample-based row input as a column', 'ColComp', this, 'ColComp');
    % 31 33
    % 32 33
    d_label = horzcat(char(9.0), 'Dimension:', char(9.0));
    Dimension = dspGetLeafWidgetBase('edit', d_label, 'Dimension', this, 'Dimension');
    % 35 37
    % 36 37
    if strcmp(this.NormOver, 'Each column')
        ColComp.Visible = 1.0;
    else
        ColComp.Visible = 0.0;
    end % if
    % 42 43
    if strcmp(this.NormOver, 'Specified dimension')
        Dimension.Visible = 1.0;
    else
        Dimension.Visible = 0.0;
    end % if
    % 48 49
    NormOver.DialogRefresh = 1.0;
    % 50 51
    dlgStruct = this.getRootSchemaStruct(cellhorzcat(NormType, Bias, NormOver, ColComp, Dimension));
end % function
