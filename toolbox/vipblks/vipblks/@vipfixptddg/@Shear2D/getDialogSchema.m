function dlgStruct = getDialogSchema(this, dummy)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    direction = dspGetLeafWidgetBase('combobox', 'Shear direction:', 'direction', this, 'direction');
    direction.Entries = ctranspose(set(this, 'direction'));
    specify.Visible = 1.0;
    % 16 17
    outSizeS = dspGetLeafWidgetBase('combobox', 'Output size after shear:', 'outSizeS', this, 'outSizeS');
    outSizeS.Entries = ctranspose(set(this, 'outSizeS'));
    specify.Visible = 1.0;
    % 20 21
    src_shear = dspGetLeafWidgetBase('combobox', 'Shear values source:', 'src_shear', this, 'src_shear');
    src_shear.Entries = ctranspose(set(this, 'src_shear'));
    src_shear.Visible = 1.0;
    src_shear.DialogRefresh = 1.0;
    % 25 26
    fillVal = dspGetLeafWidgetBase('edit', 'Background fill value:', 'fillVal', this, 'fillVal');
    % 27 28
    fillVal.Visible = 1.0;
    fillVal.Tunable = 1.0;
    fillVal.DialogRefresh = 0.0;
    % 31 32
    interpMethod = dspGetLeafWidgetBase('combobox', 'Interpolation method:', 'interpMethod', this, 'interpMethod');
    interpMethod.Entries = ctranspose(set(this, 'interpMethod'));
    interpMethod.DialogRefresh = 0.0;
    % 35 37
    % 36 37
    shear_values = dspGetLeafWidgetBase('edit', 'Row/column shear values [first last]: ', 'shear_values', this, 'shear_values');
    % 38 39
    shear_values.Entries = ctranspose(set(this, 'shear_values'));
    % 40 41
    maxShear = dspGetLeafWidgetBase('edit', 'Maximum shear value:', 'maxShear', this, 'maxShear');
    % 42 43
    maxShear.Entries = ctranspose(set(this, 'maxShear'));
    % 44 45
    if strcmp(this.src_shear, 'Specify via dialog')
        shear_values.Visible = 1.0;
        maxShear.Visible = 0.0;
        this.FixptDialog.DataTypeRows(4.0).Visible = 1.0;
    else
        shear_values.Visible = 0.0;
        maxShear.Visible = 1.0;
        this.FixptDialog.DataTypeRows(4.0).Visible = 0.0;
    end % if
    % 54 55
    if strcmp(this.interpMethod, 'Nearest neighbor')
        this.FixptDialog.DataTypeRows(1.0).Visible = 0.0;
    else
        this.FixptDialog.DataTypeRows(1.0).Visible = 1.0;
    end % if
    % 60 61
    dlgStruct = this.getRootSchemaStruct(cellhorzcat(direction, outSizeS, src_shear, shear_values, maxShear, fillVal, interpMethod));
    % 62 64
    % 63 64
    dlgStruct.PreApplyCallback = 'dspDDGPreApplyWithFracLengthUpdate';
    dlgStruct.PreApplyArgs = cellhorzcat(this, '%dialog', {'firstCoeffFracLength'}, this.FixptDialog.DataTypeRows(4.0).BestPrecString);
    % 66 67
end % function
