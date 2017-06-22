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
    % 15 16
    CompMethod.Entries = ctranspose(set(this, 'CompMethod'));
    CompMethod.DialogRefresh = 1.0;
    % 18 20
    % 19 20
    TableOpt = dspGetLeafWidgetBase('combobox', 'Optimize table for:', 'TableOpt', this, 'TableOpt');
    % 21 22
    TableOpt.Entries = ctranspose(set(this, 'TableOpt'));
    if strcmp(this.CompMethod, 'Table lookup')
        TableOpt.Visible = 1.0;
    else
        TableOpt.Visible = 0.0;
    end % if
    % 28 30
    % 29 30
    BitRevOrder = dspGetLeafWidgetBase('checkbox', 'Input is in bit-reversed order', 'BitRevOrder', this, 'BitRevOrder');
    % 31 33
    % 32 33
    BitRevOrder.Entries = ctranspose(set(this, 'BitRevOrder'));
    BitRevOrder.DialogRefresh = 1.0;
    % 35 37
    % 36 37
    cs_in = dspGetLeafWidgetBase('checkbox', 'Input is conjugate symmetric', 'cs_in', this, 'cs_in');
    % 38 39
    cs_in.Entries = ctranspose(set(this, 'BitRevOrder'));
    cs_in.DialogRefresh = 1.0;
    % 41 43
    % 42 43
    SkipNorm = dspGetLeafWidgetBase('checkbox', 'Skip scaling', 'SkipNorm', this, 'SkipNorm');
    % 44 47
    % 45 47
    % 46 47
    InheritFFTLength = dspGetLeafWidgetBase('checkbox', 'Inherit FFT length from input dimensions', 'InheritFFTLength', this, 'InheritFFTLength');
    % 48 51
    % 49 51
    % 50 51
    InheritFFTLength.Entries = ctranspose(set(this, 'InheritFFTLength'));
    InheritFFTLength.DialogRefresh = 1.0;
    % 53 54
    FFTLength = dspGetLeafWidgetBase('edit', 'FFT length:', 'FFTLength', this, 'FFTLength');
    % 55 57
    % 56 57
    if this.cs_in || this.BitRevOrder
        InheritFFTLength.Enabled = 0.0;
    else
        InheritFFTLength.Enabled = 1.0;
    end % if
    % 62 63
    if this.InheritFFTLength
        FFTLength.Visible = 0.0;
        BitRevOrder.Enabled = 1.0;
        cs_in.Enabled = 1.0;
    else
        FFTLength.Visible = 1.0;
        BitRevOrder.Enabled = 0.0;
        cs_in.Enabled = 0.0;
    end % if
    % 72 73
    items = cellhorzcat(CompMethod, TableOpt, BitRevOrder, cs_in, SkipNorm, InheritFFTLength, FFTLength);
    % 74 75
    dlgStruct = this.getRootSchemaStruct(items);
    % 76 77
    dlgStruct.PreApplyCallback = 'dspDDGPreApplyWithFracLengthUpdate';
    dlgStruct.PreApplyArgs = cellhorzcat(this, '%dialog', {'firstCoeffFracLength'}, this.FixptDialog.DataTypeRows(4.0).BestPrecString);
    % 79 80
end % function
