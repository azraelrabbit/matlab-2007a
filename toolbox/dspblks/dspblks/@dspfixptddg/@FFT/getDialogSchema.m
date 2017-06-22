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
    CompMethod = dspGetLeafWidgetBase('combobox', 'Twiddle factor computation:', 'CompMethod', this, 'CompMethod');
    % 15 18
    % 16 18
    % 17 18
    CompMethod.Entries = ctranspose(set(this, 'CompMethod'));
    CompMethod.DialogRefresh = 1.0;
    % 20 22
    % 21 22
    TableOpt = dspGetLeafWidgetBase('combobox', 'Optimize table for:', 'TableOpt', this, 'TableOpt');
    % 23 24
    TableOpt.Entries = ctranspose(set(this, 'TableOpt'));
    if strcmp(this.CompMethod, 'Table lookup')
        TableOpt.Visible = 1.0;
    else
        TableOpt.Visible = 0.0;
    end % if
    % 30 32
    % 31 32
    BitRevOrder = dspGetLeafWidgetBase('checkbox', 'Output in bit-reversed order', 'BitRevOrder', this, 'BitRevOrder');
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    InheritFFTLength = dspGetLeafWidgetBase('checkbox', 'Inherit FFT length from input dimensions', 'InheritFFTLength', this, 'InheritFFTLength');
    % 39 42
    % 40 42
    % 41 42
    InheritFFTLength.Entries = ctranspose(set(this, 'InheritFFTLength'));
    InheritFFTLength.DialogRefresh = 1.0;
    % 44 45
    FFTLength = dspGetLeafWidgetBase('edit', 'FFT length:', 'FFTLength', this, 'FFTLength');
    % 46 48
    % 47 48
    if this.InheritFFTLength
        FFTLength.Visible = 0.0;
    else
        FFTLength.Visible = 1.0;
    end % if
    % 53 54
    items = cellhorzcat(CompMethod, TableOpt, BitRevOrder, InheritFFTLength, FFTLength);
    % 55 56
    dlgStruct = this.getRootSchemaStruct(items);
    % 57 58
    dlgStruct.PreApplyCallback = 'dspDDGPreApplyWithFracLengthUpdate';
    dlgStruct.PreApplyArgs = cellhorzcat(this, '%dialog', {'firstCoeffFracLength'}, this.FixptDialog.DataTypeRows(4.0).BestPrecString);
    % 60 61
end % function
