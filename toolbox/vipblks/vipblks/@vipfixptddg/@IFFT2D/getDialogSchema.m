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
    tableOpt = dspGetLeafWidgetBase('combobox', 'Optimize table for:', 'TableOpt', this, 'TableOpt');
    % 14 16
    tableOpt.Entries = ctranspose(set(this, 'TableOpt'));
    % 16 19
    % 17 19
    bitRevOutput = dspGetLeafWidgetBase('checkbox', 'Input is in bit-reversed order', 'BitRevOrder', this, 'BitRevOrder');
    % 19 23
    % 20 23
    % 21 23
    conjSymm = dspGetLeafWidgetBase('checkbox', 'Input is conjugate symmetric', 'cs_in', this, 'cs_in');
    % 23 27
    % 24 27
    % 25 27
    skipNorm = dspGetLeafWidgetBase('checkbox', 'Skip scaling', 'SkipNorm', this, 'SkipNorm');
    % 27 30
    % 28 30
    items = cellhorzcat(tableOpt, bitRevOutput, conjSymm, skipNorm);
    % 30 32
    dlgStruct = this.getRootSchemaStruct(items, 4.0);
    % 32 34
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{end}.Items{3.0}.Visible = 1.0;
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{end}.Items{11.0}.Visible = 1.0;
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{end}.Items{19.0}.Visible = 1.0;
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{end}.Items{27.0}.Visible = 1.0;
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{end}.Items{35.0}.Visible = 1.0;
    % 38 40
    dlgStruct.PreApplyCallback = 'dspDDGPreApplyWithFracLengthUpdate';
    dlgStruct.PreApplyArgs = cellhorzcat(this, '%dialog', {'firstCoeffFracLength'}, this.FixptDialog.DataTypeRows(4.0).BestPrecString);
    % 41 43
