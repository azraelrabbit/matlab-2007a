function dlgStruct = getDialogSchema(this, dummy)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    TableOpt = dspGetLeafWidgetBase('combobox', 'Optimize table for:', 'TableOpt', this, 'TableOpt');
    % 15 17
    TableOpt.Entries = ctranspose(set(this, 'TableOpt'));
    % 17 20
    % 18 20
    BitRevOrder = dspGetLeafWidgetBase('checkbox', 'Output in bit-reversed order', 'BitRevOrder', this, 'BitRevOrder');
    % 20 23
    % 21 23
    items = cellhorzcat(TableOpt, BitRevOrder);
    % 23 25
    dlgStruct = this.getRootSchemaStruct(items, 4.0);
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{end}.Items{3.0}.Visible = 1.0;
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{end}.Items{11.0}.Visible = 1.0;
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{end}.Items{19.0}.Visible = 1.0;
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{end}.Items{27.0}.Visible = 1.0;
    dlgStruct.Items{1.0}.Items{2.0}.Tabs{2.0}.Items{1.0}.Items{end}.Items{35.0}.Visible = 1.0;
    % 30 32
    dlgStruct.PreApplyCallback = 'dspDDGPreApplyWithFracLengthUpdate';
    dlgStruct.PreApplyArgs = cellhorzcat(this, '%dialog', {'firstCoeffFracLength'}, this.FixptDialog.DataTypeRows(4.0).BestPrecString);
    % 33 35
